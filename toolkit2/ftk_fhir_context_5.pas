unit ftk_fhir_context_5;

{
Copyright (c) 2011+, HL7 and Health Intersections Pty Ltd (http://www.healthintersections.com.au)
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.
 * Neither the name of HL7 nor the names of its contributors may be used to
   endorse or promote products derived from this software without specific
   prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
}

{$i fhir.inc}


interface

uses
  Classes, SysUtils,
  fsl_utilities, fsl_base, fsl_lang, fsl_npm_cache,
  fhir_objects, fhir_factory, fhir_client, fhir_common,
  ftx_service,
  fhir5_enums, fhir5_types, fhir5_resources, fhir5_resources_base, fhir5_context, fhir5_profiles, fhir5_client,
  fhir_tx, fhir_valuesets;

Type

  { TToolkitValidatorContextR5 }

  TToolkitValidatorContextR5 = class (TBaseWorkerContextR5)
  private
    FLanguages : TIETFLanguageDefinitions;
    FUrl : String;
    FServer : TFhirClient5;
    FCapabilityStatement : TFHIRCapabilityStatement;
    FValueSets : TFHIRMetadataResourceManager<TFHIRValueSet>;
    FCodeSystems : TFHIRMetadataResourceManager<TFHIRCodeSystem>;
    procedure checkClient;
    function findCode(list : TFhirCodeSystemConceptList; code : String; caseSensitive : boolean) : TFhirCodeSystemConcept;
    function validateInternally(system, version, code: String; vs: TFHIRValueSet; var res : TValidationResult) : boolean;
    function doGetVs(sender : TObject; url, version : String) : TFHIRValueSetW;
    function doGetCs(sender : TObject; url, version : String; params : TFHIRTxOperationParams; nullOk : boolean) : TCodeSystemProvider;
    procedure doGetList(sender : TObject; url : String; list : TStringList);
  protected
    procedure SeeResourceProxy(r : TFhirResourceProxy); override;
  public
    constructor Create(factory : TFHIRFactory; languages : TIETFLanguageDefinitions; TerminologyServer : String; pcm : TFHIRPackageManager); virtual;
    destructor Destroy; Override;

    Function Link : TToolkitValidatorContextR5; overload;
    procedure Unload; override;

    function fetchResource(t : TFhirResourceType; url, version : String) : TFhirResource; override;

    function expand(vs : TFhirValueSet; options : TExpansionOperationOptionSet = []) : TFHIRValueSet; override;
    function supportsSystem(system, version : string) : boolean; override;
    function validateCode(system, version, code, display : String) : TValidationResult; override;
    function validateCode(system, version, code : String; vs : TFHIRValueSet) : TValidationResult; override;
    function validateCode(code : TFHIRCoding; vs : TFhirValueSet) : TValidationResult; override;
    function validateCode(code : TFHIRCodeableConcept; vs : TFhirValueSet) : TValidationResult; override;
    function getSearchParameter(resourceType, name : String) : TFHIRResourceV; override;
  end;

implementation

uses
  fhir_codesystem_service,
  fhir5_constants, fhir5_utilities;

{ TToolkitValidatorContextR5 }

procedure TToolkitValidatorContextR5.checkClient;
begin
  if (FServer = nil) or (FCapabilityStatement = nil) then
  begin
    if FServer <> nil then
      FServer.free;
    FServer := Factory.makeClient(self.link, FUrl, fctWinInet, ffJson, 5000) as TFhirClient5;
    FCapabilityStatement := FServer.conformance(true);
    if FCapabilityStatement.fhirVersion <> FHIR_ENUM_VERSIONS[factory.version] then
      raise EFHIRException.Create('Terminology Server / Plug-in Version mismatch ('+CODES_TFhirFHIRVersionEnum[FCapabilityStatement.fhirVersion]+' / '+CODES_TFHIRVersion[factory.version]+')');
  end;
end;

constructor TToolkitValidatorContextR5.Create(factory : TFHIRFactory; languages : TIETFLanguageDefinitions; TerminologyServer : String; pcm : TFHIRPackageManager);
begin
  inherited Create(languages, factory, pcm);
  FLanguages := languages.link;
  FValueSets := TFHIRMetadataResourceManager<TFHIRValueSet>.Create();
  FCodeSystems := TFHIRMetadataResourceManager<TFHIRCodeSystem>.Create();
  FUrl := TerminologyServer;
end;

destructor TToolkitValidatorContextR5.Destroy;
begin
  FValueSets.free;
  FServer.free;
  FCapabilityStatement.free;
  FCodeSystems.free;
  FLanguages.free;
  inherited;
end;

function TToolkitValidatorContextR5.doGetCs(sender: TObject; url, version: String; params: TFHIRTxOperationParams; nullOk : boolean): TCodeSystemProvider;
var
  cs : TFHIRCodeSystem;
begin
  cs := FCodeSystems.get(url);
  if cs = nil then
    raise ETerminologyError.Create('Unable to resolve code system '+url);
  result := TFhirCodeSystemProvider.Create(FLanguages.link, nil, Factory.link, TFHIRCodeSystemEntry.Create(Factory.wrapCodeSystem(cs.link)));
end;

procedure TToolkitValidatorContextR5.doGetList(sender: TObject; url: String;
  list: TStringList);
begin
  // todo
end;

function TToolkitValidatorContextR5.doGetVs(sender: TObject; url, version: String): TFHIRValueSetW;
var
  vs : TFhirValueSet;
begin
  vs := FValueSets.get(url);
  if vs = nil then
    raise ETerminologyError.Create('Unable to resolve value set '+url);
  result := Factory.wrapValueSet(vs.link);
end;

function TToolkitValidatorContextR5.expand(vs: TFhirValueSet; options : TExpansionOperationOptionSet = []): TFHIRValueSet;
var
  pIn : TFhirParameters;
begin
  CheckClient;
  pIn := TFhirParameters.Create;
  try
    pIn.AddParameter('valueSet', vs.Link);
    pIn.AddParameter('_incomplete', true);
    pIn.AddParameter('_limit', '10');
    result := FServer.operation(frtValueSet, 'expand', pIn) as TFhirValueSet;
  finally
    pIn.free;
  end;

end;

function TToolkitValidatorContextR5.fetchResource(t: TFhirResourceType; url, version: String): TFhirResource;
begin
  if (t = frtValueSet) then
    result := FValueSets.get(url).link
  else
    result := inherited fetchResource(t, url, version);
end;

function TToolkitValidatorContextR5.findCode(list: TFhirCodeSystemConceptList; code: String; caseSensitive : boolean): TFhirCodeSystemConcept;
var
  d, d1 : TFhirCodeSystemConcept;
begin
  result := nil;
  for d in list do
  begin
    if (caseSensitive and (d.code = code)) then
    begin
      result := d;
      exit;
    end;
    if (not caseSensitive and (d.code.ToLower = code.ToLower)) then
    begin
      result := d;
      exit;
    end;
    result := findCode(d.conceptList, code, caseSensitive);
    if (result <> nil) then
      exit;
  end;
end;

function TToolkitValidatorContextR5.getSearchParameter(resourceType, name: String): TFHIRResourceV;
begin
  result := nil;
end;

function TToolkitValidatorContextR5.Link: TToolkitValidatorContextR5;
begin
  result := TToolkitValidatorContextR5(inherited Link);
end;

procedure TToolkitValidatorContextR5.Unload;
begin
  inherited Unload;
end;

procedure TToolkitValidatorContextR5.SeeResourceProxy(r: TFhirResourceProxy);
var
  vs : TFhirValueset;
begin
  if (r.resource.ResourceType = frtValueSet) then
  begin
    vs := (r.resource as TFHIRValueSet);
    FValueSets.see(vs);
  end
  else if (r.resource.ResourceType = frtCodeSystem) then
    FCodeSystems.see(TFHIRCodeSystem(r.resource))
  else
    inherited;
end;

function TToolkitValidatorContextR5.supportsSystem(system, version: string): boolean;
var
  ex : TFhirExtension;
begin
  CheckClient;
  result := FCodeSystems.has(system);
  if (not result) then
    for ex in FCapabilityStatement.extensionList do
      if (ex.url = 'http://hl7.org/fhir/StructureDefinition/conformance-common-supported-system') and (ex.value is TFHIRString) and (TFHIRString(ex.value).value = system) then
        result := true;
end;

function TToolkitValidatorContextR5.validateCode(system, version, code, display: String): TValidationResult;
var
  pIn, pOut : TFhirParameters;
  cs : TFHIRCodeSystem;
  def : TFhirCodeSystemConcept;
begin
  if FCodeSystems.has(system) then
  begin
    cs := FCodeSystems.get(system);
    def := FindCode(cs.conceptList, code, cs.caseSensitive);
    if (def = nil) then
      result := TValidationResult.Create(isError, 'Unknown code ' +code)
    else
      result := TValidationResult.Create(def.display);
  end
  else
  begin
    checkClient;
    pIn := TFhirParameters.Create;
    try
      pIn.AddParameter('system', system);
      pIn.AddParameter('code', code);
      pIn.AddParameter('display', display);
      pOut := FServer.operation(frtValueSet, 'validate-code', pIn) as TFhirParameters;
      try
        if pOut.bool['result'] then
          result := TValidationResult.Create(isInformation, pOut.str['message'])
        else
          result := TValidationResult.Create(isError, pOut.str['message']);
      finally
        pOut.free;
      end;
    finally
      pIn.free;
    end;
  end;
end;

function TToolkitValidatorContextR5.validateCode(system, version, code: String; vs: TFHIRValueSet): TValidationResult;
var
  pIn, pOut : TFhirParameters;
  def : TFhirCodeSystemConcept;
begin
  if validateInternally(system, version, code, vs, result) then
    exit;

  checkClient;
  pIn := TFhirParameters.Create;
  try
    pIn.AddParameter('system', system);
    pIn.AddParameter('code', code);
    pIn.AddParameter('version', version);
    pIn.AddParameter('valueSet', vs.Link);
    pOut := FServer.operation(frtValueSet, 'validate-code', pIn) as TFhirParameters;
    try
      if pOut.bool['result'] then
        result := TValidationResult.Create(isInformation, pOut.str['message'])
      else
        result := TValidationResult.Create(isError, pOut.str['message']);
    finally
      pOut.free;
    end;
  finally
    pIn.free;
  end;
end;

function TToolkitValidatorContextR5.validateCode(code: TFHIRCodeableConcept; vs: TFhirValueSet): TValidationResult;
var
  pIn, pOut : TFhirParameters;
begin
  checkClient;
  pIn := TFhirParameters.Create;
  try
    pIn.AddParameter('codeableConcept', code.Link);
    pIn.AddParameter('valueSet', vs.Link);
    pOut := FServer.operation(frtValueSet, 'validate-code', pIn) as TFhirParameters;
    try
      if pOut.bool['result'] then
        result := TValidationResult.Create(isInformation, pOut.str['message'])
      else
        result := TValidationResult.Create(isError, pOut.str['message']);
    finally
      pOut.free;
    end;
  finally
    pIn.free;
  end;
end;

function TToolkitValidatorContextR5.validateInternally(system, version, code: String; vs: TFHIRValueSet; var res: TValidationResult): boolean;
var
  vsw : TFhirValueSetW;
  validator : TValueSetChecker;
  p : TFHIRParametersW;
  params : TFHIRTxOperationParams;
begin
  try
    vsw := Factory.wrapValueSet(vs.Link);
    try
      validator := TValueSetChecker.Create(Factory.link, nil, doGetVs, doGetCs, doGetList, nil, nil, FLanguages.link, '', nil);
      try
        params := TFHIRTxOperationParams.Create;
        try
          validator.prepare(vsw, params, nil);
          p := validator.check('code', system, version, code, false);
          try
            res := TValidationResult.Create;
            if p.bool('result') then
              res.Severity := isInformation
            else
            begin
              res.Severity := isError;
              res.Message := p.str('message');
            end;
          finally
            p.free;
          end;
        finally
          params.free;
        end;
      finally
        validator.free;
      end;
    finally
      vsw.free;
    end;
    result := true;
  except
    result := false;
  end;
end;

function TToolkitValidatorContextR5.validateCode(code: TFHIRCoding; vs: TFhirValueSet): TValidationResult;
var
  pIn, pOut : TFhirParameters;
begin
  checkClient;
  pIn := TFhirParameters.Create;
  try
    pIn.AddParameter('coding', code.Link);
    pIn.AddParameter('valueSet', vs.Link);
    pOut := FServer.operation(frtValueSet, 'validate-code', pIn) as TFhirParameters;
    try
      if pOut.bool['result'] then
        result := TValidationResult.Create(isInformation, pOut.str['message'])
      else
        result := TValidationResult.Create(isError, pOut.str['message']);
    finally
      pOut.free;
    end;
  finally
    pIn.free;
  end;
end;

end.

