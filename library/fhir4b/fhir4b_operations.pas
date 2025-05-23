unit fhir4b_operations;

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
  
  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
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

{$I fhir.inc}
{$I fhir4b.inc}

interface

// Generated on Mon, Dec 27, 2021 21:46+1100 for FHIR v4.3.0



uses
  SysUtils, Classes, Generics.Collections, 
  fsl_base, fsl_utilities, fsl_stream, fsl_http,
  fhir4b_base, fhir4b_types, fhir4b_resources, fhir4b_opbase;

Type

  //Operation populate (Populate Questionnaire)
  TFHIRPopulateOpRequest = class (TFHIROperationRequest)
  private
    FSubject : TFhirReference;
    FLocal : TFhirReference;
    procedure SetSubject(value : TFhirReference);
    procedure SetLocal(value : TFhirReference);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property subject : TFhirReference read FSubject write SetSubject;
    property local : TFhirReference read FLocal write SetLocal;
  end;
  TFHIRPopulateOpResponse = class (TFHIROperationResponse)
  private
    FReturn : TFhirQuestionnaireResponse;
    procedure SetReturn(value : TFhirQuestionnaireResponse);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property return : TFhirQuestionnaireResponse read FReturn write SetReturn;
  end;
  //Operation apply (Apply)
  TFHIRApplyOpRequest = class (TFHIROperationRequest)
  private
    FActivityDefinition : TFhirActivityDefinition;
    FSubjectList : TStringList;
    FEncounter : String;
    FPractitioner : String;
    FOrganization : String;
    FUserType : TFhirCodeableConcept;
    FUserLanguage : TFhirCodeableConcept;
    FUserTaskContext : TFhirCodeableConcept;
    FSetting : TFhirCodeableConcept;
    FSettingContext : TFhirCodeableConcept;
    procedure SetActivityDefinition(value : TFhirActivityDefinition);
    procedure SetUserType(value : TFhirCodeableConcept);
    procedure SetUserLanguage(value : TFhirCodeableConcept);
    procedure SetUserTaskContext(value : TFhirCodeableConcept);
    procedure SetSetting(value : TFhirCodeableConcept);
    procedure SetSettingContext(value : TFhirCodeableConcept);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property activityDefinition : TFhirActivityDefinition read FActivityDefinition write SetActivityDefinition;
    property subjectList : TStringList read FSubjectList;
    property encounter : String read FEncounter write FEncounter;
    property practitioner : String read FPractitioner write FPractitioner;
    property organization : String read FOrganization write FOrganization;
    property userType : TFhirCodeableConcept read FUserType write SetUserType;
    property userLanguage : TFhirCodeableConcept read FUserLanguage write SetUserLanguage;
    property userTaskContext : TFhirCodeableConcept read FUserTaskContext write SetUserTaskContext;
    property setting : TFhirCodeableConcept read FSetting write SetSetting;
    property settingContext : TFhirCodeableConcept read FSettingContext write SetSettingContext;
  end;
  TFHIRApplyOpResponse = class (TFHIROperationResponse)
  private
    FReturn : TFhirResource;
    procedure SetReturn(value : TFhirResource);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property return : TFhirResource read FReturn write SetReturn;
  end;
  //Operation data-requirements (Data Requirements)
  TFHIRDataRequirementsOpRequest = class (TFHIROperationRequest)
  private
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
  end;
  TFHIRDataRequirementsOpResponse = class (TFHIROperationResponse)
  private
    FReturn : TFhirLibrary;
    procedure SetReturn(value : TFhirLibrary);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property return : TFhirLibrary read FReturn write SetReturn;
  end;
  //Operation conforms (Test if a server implements a client's required operations)
  TFHIRConformsOpRequest = class (TFHIROperationRequest)
  private
    FLeft : String;
    FRight : String;
    FMode : String;
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property left : String read FLeft write FLeft;
    property right : String read FRight write FRight;
    property mode : String read FMode write FMode;
  end;
  TFHIRConformsOpResponse = class (TFHIROperationResponse)
  private
    FIssues : TFhirOperationOutcome;
    FUnion : TFhirCapabilityStatement;
    FIntersection : TFhirCapabilityStatement;
    procedure SetIssues(value : TFhirOperationOutcome);
    procedure SetUnion(value : TFhirCapabilityStatement);
    procedure SetIntersection(value : TFhirCapabilityStatement);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property issues : TFhirOperationOutcome read FIssues write SetIssues;
    property union : TFhirCapabilityStatement read FUnion write SetUnion;
    property intersection : TFhirCapabilityStatement read FIntersection write SetIntersection;
  end;
  //Operation implements (Test if a server implements a client's required operations)
  TFHIRImplementsOpRequest = class (TFHIROperationRequest)
  private
    FServer : String;
    FClient : String;
    FResource : TFhirCapabilityStatement;
    procedure SetResource(value : TFhirCapabilityStatement);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property server : String read FServer write FServer;
    property client : String read FClient write FClient;
    property resource : TFhirCapabilityStatement read FResource write SetResource;
  end;
  TFHIRImplementsOpResponse = class (TFHIROperationResponse)
  private
    FReturn : TFhirOperationOutcome;
    procedure SetReturn(value : TFhirOperationOutcome);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property return : TFhirOperationOutcome read FReturn write SetReturn;
  end;
  //Operation subset (Fetch a subset of the CapabilityStatement resource)
  TFHIRSubsetOpRequest = class (TFHIROperationRequest)
  private
    FServer : String;
    FResourceList : TStringList;
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property server : String read FServer write FServer;
    property resourceList : TStringList read FResourceList;
  end;
  TFHIRSubsetOpResponse = class (TFHIROperationResponse)
  private
    FReturn : TFhirCapabilityStatement;
    procedure SetReturn(value : TFhirCapabilityStatement);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property return : TFhirCapabilityStatement read FReturn write SetReturn;
  end;
  //Operation versions (Discover what versions a server supports)
  TFHIRVersionsOpRequest = class (TFHIROperationRequest)
  private
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
  end;
  TFHIRVersionsOpResponse = class (TFHIROperationResponse)
  private
    FVersionList : TStringList;
    FDefault : String;
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property versionList : TStringList read FVersionList;
    property default : String read FDefault write FDefault;
  end;
  //Operation submit (Submit a Claim resource for adjudication)
  TFHIRSubmitOpRequest = class (TFHIROperationRequest)
  private
    FResource : TFhirResource;
    procedure SetResource(value : TFhirResource);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property resource : TFhirResource read FResource write SetResource;
  end;
  TFHIRSubmitOpResponse = class (TFHIROperationResponse)
  private
    FReturn : TFhirResource;
    procedure SetReturn(value : TFhirResource);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property return : TFhirResource read FReturn write SetReturn;
  end;
  //Operation find-matches (Finding codes based on supplied properties)
  TFHIRFindMatchesOpReqSubproperty = class (TFHIROperationObject)
  private
    FCode : String;
    FValue : TFhirDataType;
    procedure SetValue(value : TFhirDataType);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    constructor Create(params : TFhirParametersParameter); overload; override;
    destructor Destroy; override;
    function asParams(name : String) : TFHIRParametersParameter; override;
    property code : String read FCode write FCode;
    property value : TFhirDataType read FValue write SetValue;
  end;
  TFHIRFindMatchesOpReqProperty_ = class (TFHIROperationObject)
  private
    FCode : String;
    FValue : TFhirDataType;
    FSubpropertyList : TFslList<TFHIRFindMatchesOpReqSubproperty>;
    procedure SetValue(value : TFhirDataType);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    constructor Create(params : TFhirParametersParameter); overload; override;
    destructor Destroy; override;
    function asParams(name : String) : TFHIRParametersParameter; override;
    property code : String read FCode write FCode;
    property value : TFhirDataType read FValue write SetValue;
    property subpropertyList : TFslList<TFHIRFindMatchesOpReqSubproperty> read FSubpropertyList;
  end;
  TFHIRFindMatchesOpRequest = class (TFHIROperationRequest)
  private
    FSystem : String;
    FVersion : String;
    FProperty_List : TFslList<TFHIRFindMatchesOpReqProperty_>;
    FExact : Boolean;
    FCompositional : Boolean;
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property system : String read FSystem write FSystem;
    property version : String read FVersion write FVersion;
    property property_List : TFslList<TFHIRFindMatchesOpReqProperty_> read FProperty_List;
    property exact : Boolean read FExact write FExact;
    property compositional : Boolean read FCompositional write FCompositional;
  end;
  TFHIRFindMatchesOpRespProperty_ = class (TFHIROperationObject)
  private
    FCode : String;
    FValue : TFhirDataType;
    procedure SetValue(value : TFhirDataType);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    constructor Create(params : TFhirParametersParameter); overload; override;
    destructor Destroy; override;
    function asParams(name : String) : TFHIRParametersParameter; override;
    property code : String read FCode write FCode;
    property value : TFhirDataType read FValue write SetValue;
  end;
  TFHIRFindMatchesOpRespUnmatched = class (TFHIROperationObject)
  private
    FCode : String;
    FValue : TFhirDataType;
    FProperty_List : TFslList<TFHIRFindMatchesOpRespProperty_>;
    procedure SetValue(value : TFhirDataType);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    constructor Create(params : TFhirParametersParameter); overload; override;
    destructor Destroy; override;
    function asParams(name : String) : TFHIRParametersParameter; override;
    property code : String read FCode write FCode;
    property value : TFhirDataType read FValue write SetValue;
    property property_List : TFslList<TFHIRFindMatchesOpRespProperty_> read FProperty_List;
  end;
  TFHIRFindMatchesOpRespMatch = class (TFHIROperationObject)
  private
    FCode : TFhirCoding;
    FUnmatchedList : TFslList<TFHIRFindMatchesOpRespUnmatched>;
    FComment : String;
    procedure SetCode(value : TFhirCoding);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    constructor Create(params : TFhirParametersParameter); overload; override;
    destructor Destroy; override;
    function asParams(name : String) : TFHIRParametersParameter; override;
    property code : TFhirCoding read FCode write SetCode;
    property unmatchedList : TFslList<TFHIRFindMatchesOpRespUnmatched> read FUnmatchedList;
    property comment : String read FComment write FComment;
  end;
  TFHIRFindMatchesOpResponse = class (TFHIROperationResponse)
  private
    FMatchList : TFslList<TFHIRFindMatchesOpRespMatch>;
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property matchList : TFslList<TFHIRFindMatchesOpRespMatch> read FMatchList;
  end;
  //Operation lookup (Concept Look Up & Decomposition)
  TFHIRLookupOpRequest = class (TFHIROperationRequest)
  private
    FCode : String;
    FSystem : String;
    FVersion : String;
    FCoding : TFhirCoding;
    FDate : TFslDateTime;
    FDisplayLanguage : String;
    FProperty_List : TStringList;
    procedure SetCoding(value : TFhirCoding);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property code : String read FCode write FCode;
    property system : String read FSystem write FSystem;
    property version : String read FVersion write FVersion;
    property coding : TFhirCoding read FCoding write SetCoding;
    property date : TFslDateTime read FDate write FDate;
    property displayLanguage : String read FDisplayLanguage write FDisplayLanguage;
    property property_List : TStringList read FProperty_List;
  end;
  TFHIRLookupOpRespDesignation = class (TFHIROperationObject)
  private
    FLanguage : String;
    FUse : TFhirCoding;
    FValue : String;
    procedure SetUse(value : TFhirCoding);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    constructor Create(params : TFhirParametersParameter); overload; override;
    destructor Destroy; override;
    function asParams(name : String) : TFHIRParametersParameter; override;
    property language : String read FLanguage write FLanguage;
    property use : TFhirCoding read FUse write SetUse;
    property value : String read FValue write FValue;
  end;
  TFHIRLookupOpRespSubproperty = class (TFHIROperationObject)
  private
    FCode : String;
    FValue : TFhirDataType;
    FDescription : String;
    procedure SetValue(value : TFhirDataType);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    constructor Create(params : TFhirParametersParameter); overload; override;
    destructor Destroy; override;
    function asParams(name : String) : TFHIRParametersParameter; override;
    property code : String read FCode write FCode;
    property value : TFhirDataType read FValue write SetValue;
    property description : String read FDescription write FDescription;
  end;
  TFHIRLookupOpRespProperty_ = class (TFHIROperationObject)
  private
    FCode : String;
    FValue : TFhirDataType;
    FDescription : String;
    FSubpropertyList : TFslList<TFHIRLookupOpRespSubproperty>;
    procedure SetValue(value : TFhirDataType);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    constructor Create(params : TFhirParametersParameter); overload; override;
    destructor Destroy; override;
    function asParams(name : String) : TFHIRParametersParameter; override;
    property code : String read FCode write FCode;
    property value : TFhirDataType read FValue write SetValue;
    property description : String read FDescription write FDescription;
    property subpropertyList : TFslList<TFHIRLookupOpRespSubproperty> read FSubpropertyList;
  end;
  TFHIRLookupOpResponse = class (TFHIROperationResponse)
  private
    FName : String;
    FCode : String;
    FSystem : String;
    FVersion : String;
    FDisplay : String;                           
    FAbstract : Boolean;
    FDesignationList : TFslList<TFHIRLookupOpRespDesignation>;
    FProperty_List : TFslList<TFHIRLookupOpRespProperty_>;
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property name : String read FName write FName;
    property code : String read FCode write FCode;
    property systemUri : String read FSystem write FSystem;
    property version : String read FVersion write FVersion;
    property display : String read FDisplay write FDisplay;     
    property abstract : Boolean read FAbstract write FAbstract;
    property designationList : TFslList<TFHIRLookupOpRespDesignation> read FDesignationList;
    property property_List : TFslList<TFHIRLookupOpRespProperty_> read FProperty_List;
  end;
  //Operation subsumes (Subsumption Testing)
  TFHIRSubsumesOpRequest = class (TFHIROperationRequest)
  private
    FCodeA : String;
    FCodeB : String;
    FSystem : String;
    FVersion : String;
    FCodingA : TFhirCoding;
    FCodingB : TFhirCoding;
    procedure SetCodingA(value : TFhirCoding);
    procedure SetCodingB(value : TFhirCoding);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property codeA : String read FCodeA write FCodeA;
    property codeB : String read FCodeB write FCodeB;
    property system : String read FSystem write FSystem;
    property version : String read FVersion write FVersion;
    property codingA : TFhirCoding read FCodingA write SetCodingA;
    property codingB : TFhirCoding read FCodingB write SetCodingB;
  end;
  TFHIRSubsumesOpResponse = class (TFHIROperationResponse)
  private
    FOutcome : String;
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property outcome : String read FOutcome write FOutcome;
  end;
  //Operation validate-code (Code System based Validation)
  TFHIRValidateCodeOpRequest = class (TFHIROperationRequest)
  private
    FUrl : String;
    FCodeSystem : TFhirCodeSystem;
    FCode : String;
    FVersion : String;
    FDisplay : String;
    FCoding : TFhirCoding;
    FCodeableConcept : TFhirCodeableConcept;
    FDate : TFslDateTime;
    FAbstract : Boolean;
    FDisplayLanguage : String;
    procedure SetCodeSystem(value : TFhirCodeSystem);
    procedure SetCoding(value : TFhirCoding);
    procedure SetCodeableConcept(value : TFhirCodeableConcept);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property url : String read FUrl write FUrl;
    property codeSystem : TFhirCodeSystem read FCodeSystem write SetCodeSystem;
    property code : String read FCode write FCode;
    property version : String read FVersion write FVersion;
    property display : String read FDisplay write FDisplay;
    property coding : TFhirCoding read FCoding write SetCoding;
    property codeableConcept : TFhirCodeableConcept read FCodeableConcept write SetCodeableConcept;
    property date : TFslDateTime read FDate write FDate;
    property abstract : Boolean read FAbstract write FAbstract;
    property displayLanguage : String read FDisplayLanguage write FDisplayLanguage;
  end;
  TFHIRValidateCodeOpResponse = class (TFHIROperationResponse)
  private
    FResult : Boolean;
    FMessage : String;
    FDisplay : String;
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property result : Boolean read FResult write FResult;
    property message : String read FMessage write FMessage;
    property display : String read FDisplay write FDisplay;
  end;
  //Operation document (Generate a Document)
  TFHIRDocumentOpRequest = class (TFHIROperationRequest)
  private
    FId : String;
    FPersist : Boolean;
    FGraph : String;
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property id : String read FId write FId;
    property persist : Boolean read FPersist write FPersist;
    property graph : String read FGraph write FGraph;
  end;
  TFHIRDocumentOpResponse = class (TFHIROperationResponse)
  private
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
  end;
  //Operation closure (Closure Table Maintenance)
  TFHIRClosureOpRequest = class (TFHIROperationRequest)
  private
    FName : String;
    FConceptList : TFslList<TFhirCoding>;
    FVersion : String;
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property name : String read FName write FName;
    property conceptList : TFslList<TFhirCoding> read FConceptList;
    property version : String read FVersion write FVersion;
  end;
  TFHIRClosureOpResponse = class (TFHIROperationResponse)
  private
    FReturn : TFhirConceptMap;
    procedure SetReturn(value : TFhirConceptMap);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property return : TFhirConceptMap read FReturn write SetReturn;
  end;
  //Operation translate (Concept Translation)
  TFHIRTranslateOpReqDependency = class (TFHIROperationObject)
  private
    FElement : String;
    FConcept : TFhirCodeableConcept;
    procedure SetConcept(value : TFhirCodeableConcept);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    constructor Create(params : TFhirParametersParameter); overload; override;
    destructor Destroy; override;
    function asParams(name : String) : TFHIRParametersParameter; override;
    property element : String read FElement write FElement;
    property concept : TFhirCodeableConcept read FConcept write SetConcept;
  end;
  TFHIRTranslateOpRequest = class (TFHIROperationRequest)
  private
    FUrl : String;
    FConceptMap : TFhirConceptMap;
    FConceptMapVersion : String;
    FCode : String;
    FSystem : String;
    FVersion : String;
    FSource : String;
    FCoding : TFhirCoding;
    FCodeableConcept : TFhirCodeableConcept;
    FTarget : String;
    FTargetsystem : String;
    FDependencyList : TFslList<TFHIRTranslateOpReqDependency>;
    FReverse : Boolean;
    procedure SetConceptMap(value : TFhirConceptMap);
    procedure SetCoding(value : TFhirCoding);
    procedure SetCodeableConcept(value : TFhirCodeableConcept);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property url : String read FUrl write FUrl;
    property conceptMap : TFhirConceptMap read FConceptMap write SetConceptMap;
    property conceptMapVersion : String read FConceptMapVersion write FConceptMapVersion;
    property code : String read FCode write FCode;
    property system : String read FSystem write FSystem;
    property version : String read FVersion write FVersion;
    property source : String read FSource write FSource;
    property coding : TFhirCoding read FCoding write SetCoding;
    property codeableConcept : TFhirCodeableConcept read FCodeableConcept write SetCodeableConcept;
    property target : String read FTarget write FTarget;
    property targetsystem : String read FTargetsystem write FTargetsystem;
    property dependencyList : TFslList<TFHIRTranslateOpReqDependency> read FDependencyList;
    property reverse : Boolean read FReverse write FReverse;
  end;
  TFHIRTranslateOpRespProduct = class (TFHIROperationObject)
  private
    FElement : String;
    FConcept : TFhirCoding;
    procedure SetConcept(value : TFhirCoding);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    constructor Create(params : TFhirParametersParameter); overload; override;
    destructor Destroy; override;
    function asParams(name : String) : TFHIRParametersParameter; override;
    property element : String read FElement write FElement;
    property concept : TFhirCoding read FConcept write SetConcept;
  end;
  TFHIRTranslateOpRespMatch = class (TFHIROperationObject)
  private
    FEquivalence : String;
    FConcept : TFhirCoding;
    FProductList : TFslList<TFHIRTranslateOpRespProduct>;
    FSource : String;
    procedure SetConcept(value : TFhirCoding);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    constructor Create(params : TFhirParametersParameter); overload; override;
    destructor Destroy; override;
    function asParams(name : String) : TFHIRParametersParameter; override;
    property equivalence : String read FEquivalence write FEquivalence;
    property concept : TFhirCoding read FConcept write SetConcept;
    property productList : TFslList<TFHIRTranslateOpRespProduct> read FProductList;
    property source : String read FSource write FSource;
  end;
  TFHIRTranslateOpResponse = class (TFHIROperationResponse)
  private
    FResult : Boolean;
    FMessage : String;
    FMatchList : TFslList<TFHIRTranslateOpRespMatch>;
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property result : Boolean read FResult write FResult;
    property message : String read FMessage write FMessage;
    property matchList : TFslList<TFHIRTranslateOpRespMatch> read FMatchList;
  end;
  //Operation everything (Fetch Encounter Record)
  TFHIREverythingOpRequest = class (TFHIROperationRequest)
  private
    FSince : TFslDateTime;
    FTypeList : TStringList;
    FCount : String;
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property Since : TFslDateTime read FSince write FSince;
    property TypeList : TStringList read FTypeList;
    property Count : String read FCount write FCount;
  end;
  TFHIREverythingOpResponse = class (TFHIROperationResponse)
  private
    FReturn : TFhirBundle;
    procedure SetReturn(value : TFhirBundle);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property return : TFhirBundle read FReturn write SetReturn;
  end;
  //Operation find (Find a functional list)
  TFHIRFindOpRequest = class (TFHIROperationRequest)
  private
    FPatient : String;
    FName : String;
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property patient : String read FPatient write FPatient;
    property name : String read FName write FName;
  end;
  TFHIRFindOpResponse = class (TFHIROperationResponse)
  private
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
  end;
  //Operation care-gaps (Care Gaps)
  TFHIRCareGapsOpRequest = class (TFHIROperationRequest)
  private
    FPeriodStart : TFslDateTime;
    FPeriodEnd : TFslDateTime;
    FTopic : String;
    FSubject : String;
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property periodStart : TFslDateTime read FPeriodStart write FPeriodStart;
    property periodEnd : TFslDateTime read FPeriodEnd write FPeriodEnd;
    property topic : String read FTopic write FTopic;
    property subject : String read FSubject write FSubject;
  end;
  TFHIRCareGapsOpResponse = class (TFHIROperationResponse)
  private
    FReturn : TFhirBundle;
    procedure SetReturn(value : TFhirBundle);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property return : TFhirBundle read FReturn write SetReturn;
  end;
  //Operation collect-data (Collect Data)
  TFHIRCollectDataOpRequest = class (TFHIROperationRequest)
  private
    FPeriodStart : TFslDateTime;
    FPeriodEnd : TFslDateTime;
    FMeasure : String;
    FSubject : String;
    FPractitioner : String;
    FLastReceivedOn : TFslDateTime;
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property periodStart : TFslDateTime read FPeriodStart write FPeriodStart;
    property periodEnd : TFslDateTime read FPeriodEnd write FPeriodEnd;
    property measure : String read FMeasure write FMeasure;
    property subject : String read FSubject write FSubject;
    property practitioner : String read FPractitioner write FPractitioner;
    property lastReceivedOn : TFslDateTime read FLastReceivedOn write FLastReceivedOn;
  end;
  TFHIRCollectDataOpResponse = class (TFHIROperationResponse)
  private
    FMeasureReport : TFhirMeasureReport;
    FResourceList : TFslList<TFhirResource>;
    procedure SetMeasureReport(value : TFhirMeasureReport);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property measureReport : TFhirMeasureReport read FMeasureReport write SetMeasureReport;
    property resourceList : TFslList<TFhirResource> read FResourceList;
  end;
  //Operation evaluate-measure (Evaluate Measure)
  TFHIREvaluateMeasureOpRequest = class (TFHIROperationRequest)
  private
    FPeriodStart : TFslDateTime;
    FPeriodEnd : TFslDateTime;
    FMeasure : String;
    FReportType : String;
    FSubject : String;
    FPractitioner : String;
    FLastReceivedOn : TFslDateTime;
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property periodStart : TFslDateTime read FPeriodStart write FPeriodStart;
    property periodEnd : TFslDateTime read FPeriodEnd write FPeriodEnd;
    property measure : String read FMeasure write FMeasure;
    property reportType : String read FReportType write FReportType;
    property subject : String read FSubject write FSubject;
    property practitioner : String read FPractitioner write FPractitioner;
    property lastReceivedOn : TFslDateTime read FLastReceivedOn write FLastReceivedOn;
  end;
  TFHIREvaluateMeasureOpResponse = class (TFHIROperationResponse)
  private
    FReturn : TFhirMeasureReport;
    procedure SetReturn(value : TFhirMeasureReport);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property return : TFhirMeasureReport read FReturn write SetReturn;
  end;
  //Operation submit-data (Submit Data)
  TFHIRSubmitDataOpRequest = class (TFHIROperationRequest)
  private
    FMeasureReport : TFhirMeasureReport;
    FResourceList : TFslList<TFhirResource>;
    procedure SetMeasureReport(value : TFhirMeasureReport);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property measureReport : TFhirMeasureReport read FMeasureReport write SetMeasureReport;
    property resourceList : TFslList<TFhirResource> read FResourceList;
  end;
  TFHIRSubmitDataOpResponse = class (TFHIROperationResponse)
  private
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
  end;
  //Operation process-message (Process Message)
  TFHIRProcessMessageOpRequest = class (TFHIROperationRequest)
  private
    FContent : TFhirBundle;
    FAsync : Boolean;
    FResponseUrl : String;
    procedure SetContent(value : TFhirBundle);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property content : TFhirBundle read FContent write SetContent;
    property async : Boolean read FAsync write FAsync;
    property responseUrl : String read FResponseUrl write FResponseUrl;
  end;
  TFHIRProcessMessageOpResponse = class (TFHIROperationResponse)
  private
    FReturn : TFhirBundle;
    procedure SetReturn(value : TFhirBundle);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property return : TFhirBundle read FReturn write SetReturn;
  end;
  //Operation preferred-id (Fetch Preferred it)
  TFHIRPreferredIdOpRequest = class (TFHIROperationRequest)
  private
    FId : String;
    FType_ : String;
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property id : String read FId write FId;
    property type_ : String read FType_ write FType_;
  end;
  TFHIRPreferredIdOpResponse = class (TFHIROperationResponse)
  private
    FResult : String;
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property result : String read FResult write FResult;
  end;
  //Operation lastn (Last N Observations Query)
  TFHIRLastnOpRequest = class (TFHIROperationRequest)
  private
    FMax : String;
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property max : String read FMax write FMax;
  end;
  TFHIRLastnOpResponse = class (TFHIROperationResponse)
  private
    FReturn : TFhirBundle;
    procedure SetReturn(value : TFhirBundle);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property return : TFhirBundle read FReturn write SetReturn;
  end;
  //Operation stats (Observation Statistics)
  TFHIRStatsOpRequest = class (TFHIROperationRequest)
  private
    FSubject : String;
    FCodeList : TStringList;
    FSystem : String;
    FCodingList : TFslList<TFhirCoding>;
    FDuration : String;
    FPeriod : TFhirPeriod;
    FStatisticList : TStringList;
    FInclude : Boolean;
    FLimit : String;
    procedure SetPeriod(value : TFhirPeriod);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property subject : String read FSubject write FSubject;
    property codeList : TStringList read FCodeList;
    property system : String read FSystem write FSystem;
    property codingList : TFslList<TFhirCoding> read FCodingList;
    property duration : String read FDuration write FDuration;
    property period : TFhirPeriod read FPeriod write SetPeriod;
    property statisticList : TStringList read FStatisticList;
    property include : Boolean read FInclude write FInclude;
    property limit : String read FLimit write FLimit;
  end;
  TFHIRStatsOpResponse = class (TFHIROperationResponse)
  private
    FStatisticsList : TFslList<TFhirObservation>;
    FSourceList : TFslList<TFhirObservation>;
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property statisticsList : TFslList<TFhirObservation> read FStatisticsList;
    property sourceList : TFslList<TFhirObservation> read FSourceList;
  end;
  //Operation match (Find patient matches using MPI based logic)
  TFHIRMatchOpRequest = class (TFHIROperationRequest)
  private
    FResource : TFhirResource;
    FOnlyCertainMatches : Boolean;
    FCount : String;
    procedure SetResource(value : TFhirResource);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property resource : TFhirResource read FResource write SetResource;
    property onlyCertainMatches : Boolean read FOnlyCertainMatches write FOnlyCertainMatches;
    property count : String read FCount write FCount;
  end;
  TFHIRMatchOpResponse = class (TFHIROperationResponse)
  private
    FReturn : TFhirBundle;
    procedure SetReturn(value : TFhirBundle);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property return : TFhirBundle read FReturn write SetReturn;
  end;
  //Operation convert (Convert from one form to another)
  TFHIRConvertOpRequest = class (TFHIROperationRequest)
  private
    FInput : TFhirResource;
    procedure SetInput(value : TFhirResource);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property input : TFhirResource read FInput write SetInput;
  end;
  TFHIRConvertOpResponse = class (TFHIROperationResponse)
  private
    FOutput : TFhirResource;
    procedure SetOutput(value : TFhirResource);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property output : TFhirResource read FOutput write SetOutput;
  end;
  //Operation graph (Return a graph of resources)
  TFHIRGraphOpRequest = class (TFHIROperationRequest)
  private
    FGraph : String;
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property graph : String read FGraph write FGraph;
  end;
  TFHIRGraphOpResponse = class (TFHIROperationResponse)
  private
    FResult : TFhirBundle;
    procedure SetResult(value : TFhirBundle);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property result : TFhirBundle read FResult write SetResult;
  end;
  //Operation graphql (Execute a graphql statement)
  TFHIRGraphqlOpRequest = class (TFHIROperationRequest)
  private
    FQuery : String;
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property query : String read FQuery write FQuery;
  end;
  TFHIRGraphqlOpResponse = class (TFHIROperationResponse)
  private
    FResult : TFhirBinary;
    procedure SetResult(value : TFhirBinary);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property result : TFhirBinary read FResult write SetResult;
  end;
  //Operation meta (Access a list of profiles, tags, and security labels)
  TFHIRMetaOpRequest = class (TFHIROperationRequest)
  private
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
  end;
  TFHIRMetaOpResponse = class (TFHIROperationResponse)
  private
    FReturn : TFhirMeta;
    procedure SetReturn(value : TFhirMeta);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property return : TFhirMeta read FReturn write SetReturn;
  end;
  //Operation meta-add (Add profiles, tags, and security labels to a resource)
  TFHIRMetaAddOpRequest = class (TFHIROperationRequest)
  private
    FMeta : TFhirMeta;
    procedure SetMeta(value : TFhirMeta);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property meta : TFhirMeta read FMeta write SetMeta;
  end;
  TFHIRMetaAddOpResponse = class (TFHIROperationResponse)
  private
    FReturn : TFhirMeta;
    procedure SetReturn(value : TFhirMeta);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property return : TFhirMeta read FReturn write SetReturn;
  end;
  //Operation meta-delete (Delete profiles, tags, and security labels for a resource)
  TFHIRMetaDeleteOpRequest = class (TFHIROperationRequest)
  private
    FMeta : TFhirMeta;
    procedure SetMeta(value : TFhirMeta);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property meta : TFhirMeta read FMeta write SetMeta;
  end;
  TFHIRMetaDeleteOpResponse = class (TFHIROperationResponse)
  private
    FReturn : TFhirMeta;
    procedure SetReturn(value : TFhirMeta);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property return : TFhirMeta read FReturn write SetReturn;
  end;
  //Operation validate (Validate a resource)
  TFHIRValidateOpRequest = class (TFHIROperationRequest)
  private
    FResource : TFhirResource;
    FMode : String;
    FProfile : String;
    procedure SetResource(value : TFhirResource);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property resource : TFhirResource read FResource write SetResource;
    property mode : String read FMode write FMode;
    property profile : String read FProfile write FProfile;
  end;
  TFHIRValidateOpResponse = class (TFHIROperationResponse)
  private
    FReturn : TFhirOperationOutcome;
    procedure SetReturn(value : TFhirOperationOutcome);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property return : TFhirOperationOutcome read FReturn write SetReturn;
  end;
  //Operation questionnaire (Build Questionnaire)
  TFHIRQuestionnaireOpRequest = class (TFHIROperationRequest)
  private
    FIdentifier : String;
    FProfile : String;
    FUrl : String;
    FSupportedOnly : Boolean;
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property identifier : String read FIdentifier write FIdentifier;
    property profile : String read FProfile write FProfile;
    property url : String read FUrl write FUrl;
    property supportedOnly : Boolean read FSupportedOnly write FSupportedOnly;
  end;
  TFHIRQuestionnaireOpResponse = class (TFHIROperationResponse)
  private
    FReturn : TFhirQuestionnaire;
    procedure SetReturn(value : TFhirQuestionnaire);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property return : TFhirQuestionnaire read FReturn write SetReturn;
  end;
  //Operation snapshot (Generate Snapshot)
  TFHIRSnapshotOpRequest = class (TFHIROperationRequest)
  private
    FDefinition : TFhirStructureDefinition;
    FUrl : String;
    procedure SetDefinition(value : TFhirStructureDefinition);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property definition : TFhirStructureDefinition read FDefinition write SetDefinition;
    property url : String read FUrl write FUrl;
  end;
  TFHIRSnapshotOpResponse = class (TFHIROperationResponse)
  private
    FReturn : TFhirStructureDefinition;
    procedure SetReturn(value : TFhirStructureDefinition);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property return : TFhirStructureDefinition read FReturn write SetReturn;
  end;
  //Operation transform (Model Instance Transformation)
  TFHIRTransformOpRequest = class (TFHIROperationRequest)
  private
    FSource : String;
    FContent : TFhirResource;
    procedure SetContent(value : TFhirResource);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property source : String read FSource write FSource;
    property content : TFhirResource read FContent write SetContent;
  end;
  TFHIRTransformOpResponse = class (TFHIROperationResponse)
  private
    FReturn : TFhirResource;
    procedure SetReturn(value : TFhirResource);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property return : TFhirResource read FReturn write SetReturn;
  end;
  //Operation expand (Value Set Expansion)
  TFHIRExpandOpRequest = class (TFHIROperationRequest)
  private
    FUrl : String;
    FValueSet : TFhirValueSet;
    FValueSetVersion : String;
    FContext : String;
    FContextDirection : String;
    FFilter : String;
    FDate : TFslDateTime;
    FOffset : String;
    FCount : String;
    FIncludeDesignations : Boolean;
    FDesignationList : TStringList;
    FIncludeDefinition : Boolean;
    FActiveOnly : Boolean;
    FExcludeNested : Boolean;
    FExcludeNotForUI : Boolean;
    FExcludePostCoordinated : Boolean;
    FDisplayLanguage : String;
    FExcludeSystemList : TStringList;
    FSystemVersionList : TStringList;
    FCheckSystemVersionList : TStringList;
    FForceSystemVersionList : TStringList;
    procedure SetValueSet(value : TFhirValueSet);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property url : String read FUrl write FUrl;
    property valueSet : TFhirValueSet read FValueSet write SetValueSet;
    property valueSetVersion : String read FValueSetVersion write FValueSetVersion;
    property context : String read FContext write FContext;
    property contextDirection : String read FContextDirection write FContextDirection;
    property filter : String read FFilter write FFilter;
    property date : TFslDateTime read FDate write FDate;
    property offset : String read FOffset write FOffset;
    property count : String read FCount write FCount;
    property includeDesignations : Boolean read FIncludeDesignations write FIncludeDesignations;
    property designationList : TStringList read FDesignationList;
    property includeDefinition : Boolean read FIncludeDefinition write FIncludeDefinition;
    property activeOnly : Boolean read FActiveOnly write FActiveOnly;
    property excludeNested : Boolean read FExcludeNested write FExcludeNested;
    property excludeNotForUI : Boolean read FExcludeNotForUI write FExcludeNotForUI;
    property excludePostCoordinated : Boolean read FExcludePostCoordinated write FExcludePostCoordinated;
    property displayLanguage : String read FDisplayLanguage write FDisplayLanguage;
    property excludeSystemList : TStringList read FExcludeSystemList;
    property systemVersionList : TStringList read FSystemVersionList;
    property checkSystemVersionList : TStringList read FCheckSystemVersionList;
    property forceSystemVersionList : TStringList read FForceSystemVersionList;
  end;
  TFHIRExpandOpResponse = class (TFHIROperationResponse)
  private
    FReturn : TFhirValueSet;
    procedure SetReturn(value : TFhirValueSet);
  protected
    function isKnownName(name : String) : boolean; override;
    function sizeInBytesV(magic : integer) : cardinal; override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure load(params : TFHIRParameters); overload; override;
    procedure load(params : THTTPParameters); overload; override;
    function asParams : TFHIRParameters; override;
    property return : TFhirValueSet read FReturn write SetReturn;
  end;


implementation

uses
  fhir4b_utilities;

procedure TFHIRPopulateOpRequest.SetSubject(value : TFhirReference);
begin
  FSubject.free;
  FSubject := value;
end;
procedure TFHIRPopulateOpRequest.SetLocal(value : TFhirReference);
begin
  FLocal.free;
  FLocal := value;
end;
constructor TFHIRPopulateOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRPopulateOpRequest.load(params : TFHIRParameters);
begin
  if params.param['subject'] <> nil then
    FSubject := (params.param['subject'].value as TFhirReference).Link;
  if params.param['local'] <> nil then
    FLocal := (params.param['local'].value as TFhirReference).Link;
  loadExtensions(params);
end;
procedure TFHIRPopulateOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRPopulateOpRequest.Destroy;
begin
  FSubject.free;
  FLocal.free;
  inherited;
end;
function TFHIRPopulateOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FSubject <> nil) then
      result.addParameter('subject', FSubject.Link);
    if (FLocal <> nil) then
      result.addParameter('local', FLocal.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRPopulateOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['subject', 'local'], name);
end;

function TFHIRPopulateOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FSubject.sizeInBytes(magic));
  inc(result, FLocal.sizeInBytes(magic));
end;

procedure TFHIRPopulateOpResponse.SetReturn(value : TFhirQuestionnaireResponse);
begin
  FReturn.free;
  FReturn := value;
end;
constructor TFHIRPopulateOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRPopulateOpResponse.load(params : TFHIRParameters);
begin
  FReturn := (params.res['return'] as TFhirQuestionnaireResponse).Link;
  loadExtensions(params);
end;
procedure TFHIRPopulateOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRPopulateOpResponse.Destroy;
begin
  FReturn.free;
  inherited;
end;
function TFHIRPopulateOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FReturn <> nil) then
      result.addParameter('return', FReturn.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRPopulateOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['return'], name);
end;

function TFHIRPopulateOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FReturn.sizeInBytes(magic));
end;

procedure TFHIRApplyOpRequest.SetActivityDefinition(value : TFhirActivityDefinition);
begin
  FActivityDefinition.free;
  FActivityDefinition := value;
end;
procedure TFHIRApplyOpRequest.SetUserType(value : TFhirCodeableConcept);
begin
  FUserType.free;
  FUserType := value;
end;
procedure TFHIRApplyOpRequest.SetUserLanguage(value : TFhirCodeableConcept);
begin
  FUserLanguage.free;
  FUserLanguage := value;
end;
procedure TFHIRApplyOpRequest.SetUserTaskContext(value : TFhirCodeableConcept);
begin
  FUserTaskContext.free;
  FUserTaskContext := value;
end;
procedure TFHIRApplyOpRequest.SetSetting(value : TFhirCodeableConcept);
begin
  FSetting.free;
  FSetting := value;
end;
procedure TFHIRApplyOpRequest.SetSettingContext(value : TFhirCodeableConcept);
begin
  FSettingContext.free;
  FSettingContext := value;
end;
constructor TFHIRApplyOpRequest.Create;
begin
  inherited Create();
  FSubjectList := TStringList.Create;
end;
procedure TFHIRApplyOpRequest.load(params : TFHIRParameters);
var
  p : TFhirParametersParameter;
begin
  FActivityDefinition := (params.res['activityDefinition'] as TFhirActivityDefinition).Link;
  for p in params.parameterList do
    if p.name = 'subject' then
      FSubjectList.Add((p.value as TFhirString).value);
  if params.param['encounter'] <> nil then
    FEncounter := (params.param['encounter'].value as TFHIRString).Value; 
  if params.param['practitioner'] <> nil then
    FPractitioner := (params.param['practitioner'].value as TFHIRString).Value; 
  if params.param['organization'] <> nil then
    FOrganization := (params.param['organization'].value as TFHIRString).Value; 
  if params.param['userType'] <> nil then
    FUserType := (params.param['userType'].value as TFhirCodeableConcept).Link;
  if params.param['userLanguage'] <> nil then
    FUserLanguage := (params.param['userLanguage'].value as TFhirCodeableConcept).Link;
  if params.param['userTaskContext'] <> nil then
    FUserTaskContext := (params.param['userTaskContext'].value as TFhirCodeableConcept).Link;
  if params.param['setting'] <> nil then
    FSetting := (params.param['setting'].value as TFhirCodeableConcept).Link;
  if params.param['settingContext'] <> nil then
    FSettingContext := (params.param['settingContext'].value as TFhirCodeableConcept).Link;
  loadExtensions(params);
end;
procedure TFHIRApplyOpRequest.load(params : THTTPParameters);
var
  s : String;
begin
  for s in params['subject'].Split([';']) do
    FSubjectList.add(s); 
  loadExtensions(params);
end;
destructor TFHIRApplyOpRequest.Destroy;
begin
  FActivityDefinition.free;
  FSubjectList.free;
  FUserType.free;
  FUserLanguage.free;
  FUserTaskContext.free;
  FSetting.free;
  FSettingContext.free;
  inherited;
end;
function TFHIRApplyOpRequest.asParams : TFhirParameters;var  v1 : String;begin
  result := TFHIRParameters.Create;
  try
    if (FActivityDefinition <> nil) then
      result.addParameter('activityDefinition', FActivityDefinition.Link);
    for v1 in FSubjectList do
      result.AddParameter('subject', TFhirString.Create(v1));
    if (FEncounter <> '') then
      result.addParameter('encounter', TFHIRString.Create(FEncounter));
    if (FPractitioner <> '') then
      result.addParameter('practitioner', TFHIRString.Create(FPractitioner));
    if (FOrganization <> '') then
      result.addParameter('organization', TFHIRString.Create(FOrganization));
    if (FUserType <> nil) then
      result.addParameter('userType', FUserType.Link);
    if (FUserLanguage <> nil) then
      result.addParameter('userLanguage', FUserLanguage.Link);
    if (FUserTaskContext <> nil) then
      result.addParameter('userTaskContext', FUserTaskContext.Link);
    if (FSetting <> nil) then
      result.addParameter('setting', FSetting.Link);
    if (FSettingContext <> nil) then
      result.addParameter('settingContext', FSettingContext.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRApplyOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['activityDefinition', 'subject', 'encounter', 'practitioner', 'organization', 'userType', 'userLanguage', 'userTaskContext', 'setting', 'settingContext'], name);
end;

function TFHIRApplyOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FActivityDefinition.sizeInBytes(magic));
  inc(result, FSubjectList.sizeInBytes(magic));
  inc(result, (FEncounter.length * sizeof(char))+12);
  inc(result, (FPractitioner.length * sizeof(char))+12);
  inc(result, (FOrganization.length * sizeof(char))+12);
  inc(result, FUserType.sizeInBytes(magic));
  inc(result, FUserLanguage.sizeInBytes(magic));
  inc(result, FUserTaskContext.sizeInBytes(magic));
  inc(result, FSetting.sizeInBytes(magic));
  inc(result, FSettingContext.sizeInBytes(magic));
end;

procedure TFHIRApplyOpResponse.SetReturn(value : TFhirResource);
begin
  FReturn.free;
  FReturn := value;
end;
constructor TFHIRApplyOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRApplyOpResponse.load(params : TFHIRParameters);
begin
  FReturn := (params.res['return'] as TFhirResource).Link;
  loadExtensions(params);
end;
procedure TFHIRApplyOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRApplyOpResponse.Destroy;
begin
  FReturn.free;
  inherited;
end;
function TFHIRApplyOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FReturn <> nil) then
      result.addParameter('return', FReturn.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRApplyOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['return'], name);
end;

function TFHIRApplyOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FReturn.sizeInBytes(magic));
end;

constructor TFHIRDataRequirementsOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRDataRequirementsOpRequest.load(params : TFHIRParameters);
begin
  loadExtensions(params);
end;
procedure TFHIRDataRequirementsOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRDataRequirementsOpRequest.Destroy;
begin
  inherited;
end;
function TFHIRDataRequirementsOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRDataRequirementsOpRequest.isKnownName(name : String) : boolean;begin
  result := false;
end;

function TFHIRDataRequirementsOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
end;

procedure TFHIRDataRequirementsOpResponse.SetReturn(value : TFhirLibrary);
begin
  FReturn.free;
  FReturn := value;
end;
constructor TFHIRDataRequirementsOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRDataRequirementsOpResponse.load(params : TFHIRParameters);
begin
  FReturn := (params.res['return'] as TFhirLibrary).Link;
  loadExtensions(params);
end;
procedure TFHIRDataRequirementsOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRDataRequirementsOpResponse.Destroy;
begin
  FReturn.free;
  inherited;
end;
function TFHIRDataRequirementsOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FReturn <> nil) then
      result.addParameter('return', FReturn.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRDataRequirementsOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['return'], name);
end;

function TFHIRDataRequirementsOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FReturn.sizeInBytes(magic));
end;

constructor TFHIRConformsOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRConformsOpRequest.load(params : TFHIRParameters);
begin
  if params.param['left'] <> nil then
    FLeft := (params.param['left'].value as TFHIRCanonical).Value; 
  if params.param['right'] <> nil then
    FRight := (params.param['right'].value as TFHIRCanonical).Value; 
  if params.param['mode'] <> nil then
    FMode := (params.param['mode'].value as TFHIRCode).Value; 
  loadExtensions(params);
end;
procedure TFHIRConformsOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRConformsOpRequest.Destroy;
begin
  inherited;
end;
function TFHIRConformsOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FLeft <> '') then
      result.addParameter('left', TFHIRCanonical.Create(FLeft));
    if (FRight <> '') then
      result.addParameter('right', TFHIRCanonical.Create(FRight));
    if (FMode <> '') then
      result.addParameter('mode', TFHIRCode.Create(FMode));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRConformsOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['left', 'right', 'mode'], name);
end;

function TFHIRConformsOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FLeft.length * sizeof(char))+12);
  inc(result, (FRight.length * sizeof(char))+12);
  inc(result, (FMode.length * sizeof(char))+12);
end;

procedure TFHIRConformsOpResponse.SetIssues(value : TFhirOperationOutcome);
begin
  FIssues.free;
  FIssues := value;
end;
procedure TFHIRConformsOpResponse.SetUnion(value : TFhirCapabilityStatement);
begin
  FUnion.free;
  FUnion := value;
end;
procedure TFHIRConformsOpResponse.SetIntersection(value : TFhirCapabilityStatement);
begin
  FIntersection.free;
  FIntersection := value;
end;
constructor TFHIRConformsOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRConformsOpResponse.load(params : TFHIRParameters);
begin
  FIssues := (params.res['issues'] as TFhirOperationOutcome).Link;
  FUnion := (params.res['union'] as TFhirCapabilityStatement).Link;
  FIntersection := (params.res['intersection'] as TFhirCapabilityStatement).Link;
  loadExtensions(params);
end;
procedure TFHIRConformsOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRConformsOpResponse.Destroy;
begin
  FIssues.free;
  FUnion.free;
  FIntersection.free;
  inherited;
end;
function TFHIRConformsOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FIssues <> nil) then
      result.addParameter('issues', FIssues.Link);
    if (FUnion <> nil) then
      result.addParameter('union', FUnion.Link);
    if (FIntersection <> nil) then
      result.addParameter('intersection', FIntersection.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRConformsOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['issues', 'union', 'intersection'], name);
end;

function TFHIRConformsOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FIssues.sizeInBytes(magic));
  inc(result, FUnion.sizeInBytes(magic));
  inc(result, FIntersection.sizeInBytes(magic));
end;

procedure TFHIRImplementsOpRequest.SetResource(value : TFhirCapabilityStatement);
begin
  FResource.free;
  FResource := value;
end;
constructor TFHIRImplementsOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRImplementsOpRequest.load(params : TFHIRParameters);
begin
  if params.param['server'] <> nil then
    FServer := (params.param['server'].value as TFHIRCanonical).Value; 
  if params.param['client'] <> nil then
    FClient := (params.param['client'].value as TFHIRCanonical).Value; 
  FResource := (params.res['resource'] as TFhirCapabilityStatement).Link;
  loadExtensions(params);
end;
procedure TFHIRImplementsOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRImplementsOpRequest.Destroy;
begin
  FResource.free;
  inherited;
end;
function TFHIRImplementsOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FServer <> '') then
      result.addParameter('server', TFHIRCanonical.Create(FServer));
    if (FClient <> '') then
      result.addParameter('client', TFHIRCanonical.Create(FClient));
    if (FResource <> nil) then
      result.addParameter('resource', FResource.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRImplementsOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['server', 'client', 'resource'], name);
end;

function TFHIRImplementsOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FServer.length * sizeof(char))+12);
  inc(result, (FClient.length * sizeof(char))+12);
  inc(result, FResource.sizeInBytes(magic));
end;

procedure TFHIRImplementsOpResponse.SetReturn(value : TFhirOperationOutcome);
begin
  FReturn.free;
  FReturn := value;
end;
constructor TFHIRImplementsOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRImplementsOpResponse.load(params : TFHIRParameters);
begin
  FReturn := (params.res['return'] as TFhirOperationOutcome).Link;
  loadExtensions(params);
end;
procedure TFHIRImplementsOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRImplementsOpResponse.Destroy;
begin
  FReturn.free;
  inherited;
end;
function TFHIRImplementsOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FReturn <> nil) then
      result.addParameter('return', FReturn.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRImplementsOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['return'], name);
end;

function TFHIRImplementsOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FReturn.sizeInBytes(magic));
end;

constructor TFHIRSubsetOpRequest.Create;
begin
  inherited Create();
  FResourceList := TStringList.Create;
end;
procedure TFHIRSubsetOpRequest.load(params : TFHIRParameters);
var
  p : TFhirParametersParameter;
begin
  if params.param['server'] <> nil then
    FServer := (params.param['server'].value as TFHIRUri).Value; 
  for p in params.parameterList do
    if p.name = 'resource' then
      FResourceList.Add((p.value as TFhirCode).value);
  loadExtensions(params);
end;
procedure TFHIRSubsetOpRequest.load(params : THTTPParameters);
var
  s : String;
begin
  for s in params['resource'].Split([';']) do
    FResourceList.add(s); 
  loadExtensions(params);
end;
destructor TFHIRSubsetOpRequest.Destroy;
begin
  FResourceList.free;
  inherited;
end;
function TFHIRSubsetOpRequest.asParams : TFhirParameters;var  v1 : String;begin
  result := TFHIRParameters.Create;
  try
    if (FServer <> '') then
      result.addParameter('server', TFHIRUri.Create(FServer));
    for v1 in FResourceList do
      result.AddParameter('resource', TFhirCode.Create(v1));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRSubsetOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['server', 'resource'], name);
end;

function TFHIRSubsetOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FServer.length * sizeof(char))+12);
  inc(result, FResourceList.sizeInBytes(magic));
end;

procedure TFHIRSubsetOpResponse.SetReturn(value : TFhirCapabilityStatement);
begin
  FReturn.free;
  FReturn := value;
end;
constructor TFHIRSubsetOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRSubsetOpResponse.load(params : TFHIRParameters);
begin
  FReturn := (params.res['return'] as TFhirCapabilityStatement).Link;
  loadExtensions(params);
end;
procedure TFHIRSubsetOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRSubsetOpResponse.Destroy;
begin
  FReturn.free;
  inherited;
end;
function TFHIRSubsetOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FReturn <> nil) then
      result.addParameter('return', FReturn.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRSubsetOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['return'], name);
end;

function TFHIRSubsetOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FReturn.sizeInBytes(magic));
end;

constructor TFHIRVersionsOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRVersionsOpRequest.load(params : TFHIRParameters);
begin
  loadExtensions(params);
end;
procedure TFHIRVersionsOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRVersionsOpRequest.Destroy;
begin
  inherited;
end;
function TFHIRVersionsOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRVersionsOpRequest.isKnownName(name : String) : boolean;begin
  result := false;
end;

function TFHIRVersionsOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
end;

constructor TFHIRVersionsOpResponse.Create;
begin
  inherited Create();
  FVersionList := TStringList.Create;
end;
procedure TFHIRVersionsOpResponse.load(params : TFHIRParameters);
var
  p : TFhirParametersParameter;
begin
  for p in params.parameterList do
    if p.name = 'version' then
      FVersionList.Add((p.value as TFhirCode).value);
  if params.param['default'] <> nil then
    FDefault := (params.param['default'].value as TFHIRCode).Value; 
  loadExtensions(params);
end;
procedure TFHIRVersionsOpResponse.load(params : THTTPParameters);
var
  s : String;
begin
  for s in params['version'].Split([';']) do
    FVersionList.add(s); 
  loadExtensions(params);
end;
destructor TFHIRVersionsOpResponse.Destroy;
begin
  FVersionList.free;
  inherited;
end;
function TFHIRVersionsOpResponse.asParams : TFhirParameters;var  v1 : String;begin
  result := TFHIRParameters.Create;
  try
    for v1 in FVersionList do
      result.AddParameter('version', TFhirCode.Create(v1));
    if (FDefault <> '') then
      result.addParameter('default', TFHIRCode.Create(FDefault));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRVersionsOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['version', 'default'], name);
end;

function TFHIRVersionsOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FVersionList.sizeInBytes(magic));
  inc(result, (FDefault.length * sizeof(char))+12);
end;

procedure TFHIRSubmitOpRequest.SetResource(value : TFhirResource);
begin
  FResource.free;
  FResource := value;
end;
constructor TFHIRSubmitOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRSubmitOpRequest.load(params : TFHIRParameters);
begin
  FResource := (params.res['resource'] as TFhirResource).Link;
  loadExtensions(params);
end;
procedure TFHIRSubmitOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRSubmitOpRequest.Destroy;
begin
  FResource.free;
  inherited;
end;
function TFHIRSubmitOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FResource <> nil) then
      result.addParameter('resource', FResource.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRSubmitOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['resource'], name);
end;

function TFHIRSubmitOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FResource.sizeInBytes(magic));
end;

procedure TFHIRSubmitOpResponse.SetReturn(value : TFhirResource);
begin
  FReturn.free;
  FReturn := value;
end;
constructor TFHIRSubmitOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRSubmitOpResponse.load(params : TFHIRParameters);
begin
  FReturn := (params.res['return'] as TFhirResource).Link;
  loadExtensions(params);
end;
procedure TFHIRSubmitOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRSubmitOpResponse.Destroy;
begin
  FReturn.free;
  inherited;
end;
function TFHIRSubmitOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FReturn <> nil) then
      result.addParameter('return', FReturn.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRSubmitOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['return'], name);
end;

function TFHIRSubmitOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FReturn.sizeInBytes(magic));
end;

procedure TFHIRFindMatchesOpReqProperty_.SetValue(value : TFhirDataType);
begin
  FValue.free;
  FValue := value;
end;
procedure TFHIRFindMatchesOpReqSubproperty.SetValue(value : TFhirDataType);
begin
  FValue.free;
  FValue := value;
end;
constructor TFHIRFindMatchesOpReqSubproperty.Create;
begin
  inherited Create();
end;
constructor TFHIRFindMatchesOpReqSubproperty.Create(params : TFhirParametersParameter);
begin
  inherited Create();
  if params.param['code'] <> nil then
    FCode := (params.param['code'].value as TFHIRCode).Value; 
  if params.param['value'] <> nil then
    FValue := (params.param['value'].value as TFhirDataType).Link;
  loadExtensions(params);
end;
destructor TFHIRFindMatchesOpReqSubproperty.Destroy;
begin
  FValue.free;
  inherited;
end;
function TFHIRFindMatchesOpReqSubproperty.asParams(name : String) : TFhirParametersParameter;begin
  result := TFHIRParametersParameter.Create;
  try
    result.name := name;
    if (FCode <> '') then
      result.addParameter('code', TFHIRCode.Create(FCode));
    if (FValue <> nil) then
      result.addParameter('value', FValue.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRFindMatchesOpReqSubproperty.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['code', 'value'], name);
end;

function TFHIRFindMatchesOpReqSubproperty.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FCode.length * sizeof(char))+12);
  inc(result, FValue.sizeInBytes(magic));
end;

constructor TFHIRFindMatchesOpReqProperty_.Create;
begin
  inherited Create();
  FSubpropertyList := TFslList<TFHIRFindMatchesOpReqSubproperty>.Create;
end;
constructor TFHIRFindMatchesOpReqProperty_.Create(params : TFhirParametersParameter);
var
  p : TFhirParametersParameter;
begin
  inherited Create();
  FSubpropertyList := TFslList<TFHIRFindMatchesOpReqSubproperty>.Create;
  if params.param['code'] <> nil then
    FCode := (params.param['code'].value as TFHIRCode).Value; 
  if params.param['value'] <> nil then
    FValue := (params.param['value'].value as TFhirDataType).Link;
  for p in params.partList do
    if p.name = 'subproperty' then
      FSubpropertyList.Add(TFHIRFindMatchesOpReqSubproperty.Create(p));
  loadExtensions(params);
end;
destructor TFHIRFindMatchesOpReqProperty_.Destroy;
begin
  FValue.free;
  FSubpropertyList.free;
  inherited;
end;
function TFHIRFindMatchesOpReqProperty_.asParams(name : String) : TFhirParametersParameter;var  v1 : TFHIRFindMatchesOpReqSubproperty;begin
  result := TFHIRParametersParameter.Create;
  try
    result.name := name;
    if (FCode <> '') then
      result.addParameter('code', TFHIRCode.Create(FCode));
    if (FValue <> nil) then
      result.addParameter('value', FValue.Link);
    for v1 in FSubpropertyList do
      result.AddParameter(v1.asParams('subproperty'));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRFindMatchesOpReqProperty_.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['code', 'value', 'subproperty'], name);
end;

function TFHIRFindMatchesOpReqProperty_.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FCode.length * sizeof(char))+12);
  inc(result, FValue.sizeInBytes(magic));
  inc(result, FSubpropertyList.sizeInBytes(magic));
end;

constructor TFHIRFindMatchesOpRequest.Create;
begin
  inherited Create();
  FProperty_List := TFslList<TFHIRFindMatchesOpReqProperty_>.Create;
end;
procedure TFHIRFindMatchesOpRequest.load(params : TFHIRParameters);
var
  p : TFhirParametersParameter;
begin
  if params.param['system'] <> nil then
    FSystem := (params.param['system'].value as TFHIRUri).Value; 
  if params.param['version'] <> nil then
    FVersion := (params.param['version'].value as TFHIRString).Value; 
  for p in params.parameterList do
    if p.name = 'property' then
      FProperty_List.Add(TFHIRFindMatchesOpReqProperty_.Create(p));
  if params.param['exact'] <> nil then
    FExact := (params.param['exact'].value as TFHIRBoolean).Value; 
  if params.param['compositional'] <> nil then
    FCompositional := (params.param['compositional'].value as TFHIRBoolean).Value; 
  loadExtensions(params);
end;
procedure TFHIRFindMatchesOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRFindMatchesOpRequest.Destroy;
begin
  FProperty_List.free;
  inherited;
end;
function TFHIRFindMatchesOpRequest.asParams : TFhirParameters;var  v1 : TFHIRFindMatchesOpReqProperty_;begin
  result := TFHIRParameters.Create;
  try
    if (FSystem <> '') then
      result.addParameter('system', TFHIRUri.Create(FSystem));
    if (FVersion <> '') then
      result.addParameter('version', TFHIRString.Create(FVersion));
    for v1 in FProperty_List do
      result.AddParameter(v1.asParams('property'));
      result.addParameter('exact', TFHIRBoolean.Create(FExact));
      result.addParameter('compositional', TFHIRBoolean.Create(FCompositional));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRFindMatchesOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['system', 'version', 'property', 'exact', 'compositional'], name);
end;

function TFHIRFindMatchesOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FSystem.length * sizeof(char))+12);
  inc(result, (FVersion.length * sizeof(char))+12);
  inc(result, FProperty_List.sizeInBytes(magic));
end;

procedure TFHIRFindMatchesOpRespMatch.SetCode(value : TFhirCoding);
begin
  FCode.free;
  FCode := value;
end;
procedure TFHIRFindMatchesOpRespUnmatched.SetValue(value : TFhirDataType);
begin
  FValue.free;
  FValue := value;
end;
procedure TFHIRFindMatchesOpRespProperty_.SetValue(value : TFhirDataType);
begin
  FValue.free;
  FValue := value;
end;
constructor TFHIRFindMatchesOpRespProperty_.Create;
begin
  inherited Create();
end;
constructor TFHIRFindMatchesOpRespProperty_.Create(params : TFhirParametersParameter);
begin
  inherited Create();
  if params.param['code'] <> nil then
    FCode := (params.param['code'].value as TFHIRCode).Value; 
  if params.param['value'] <> nil then
    FValue := (params.param['value'].value as TFhirDataType).Link;
  loadExtensions(params);
end;
destructor TFHIRFindMatchesOpRespProperty_.Destroy;
begin
  FValue.free;
  inherited;
end;
function TFHIRFindMatchesOpRespProperty_.asParams(name : String) : TFhirParametersParameter;begin
  result := TFHIRParametersParameter.Create;
  try
    result.name := name;
    if (FCode <> '') then
      result.addParameter('code', TFHIRCode.Create(FCode));
    if (FValue <> nil) then
      result.addParameter('value', FValue.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRFindMatchesOpRespProperty_.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['code', 'value'], name);
end;

function TFHIRFindMatchesOpRespProperty_.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FCode.length * sizeof(char))+12);
  inc(result, FValue.sizeInBytes(magic));
end;

constructor TFHIRFindMatchesOpRespUnmatched.Create;
begin
  inherited Create();
  FProperty_List := TFslList<TFHIRFindMatchesOpRespProperty_>.Create;
end;
constructor TFHIRFindMatchesOpRespUnmatched.Create(params : TFhirParametersParameter);
var
  p : TFhirParametersParameter;
begin
  inherited Create();
  FProperty_List := TFslList<TFHIRFindMatchesOpRespProperty_>.Create;
  if params.param['code'] <> nil then
    FCode := (params.param['code'].value as TFHIRCode).Value; 
  if params.param['value'] <> nil then
    FValue := (params.param['value'].value as TFhirDataType).Link;
  for p in params.partList do
    if p.name = 'property' then
      FProperty_List.Add(TFHIRFindMatchesOpRespProperty_.Create(p));
  loadExtensions(params);
end;
destructor TFHIRFindMatchesOpRespUnmatched.Destroy;
begin
  FValue.free;
  FProperty_List.free;
  inherited;
end;
function TFHIRFindMatchesOpRespUnmatched.asParams(name : String) : TFhirParametersParameter;var  v1 : TFHIRFindMatchesOpRespProperty_;begin
  result := TFHIRParametersParameter.Create;
  try
    result.name := name;
    if (FCode <> '') then
      result.addParameter('code', TFHIRCode.Create(FCode));
    if (FValue <> nil) then
      result.addParameter('value', FValue.Link);
    for v1 in FProperty_List do
      result.AddParameter(v1.asParams('property'));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRFindMatchesOpRespUnmatched.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['code', 'value', 'property'], name);
end;

function TFHIRFindMatchesOpRespUnmatched.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FCode.length * sizeof(char))+12);
  inc(result, FValue.sizeInBytes(magic));
  inc(result, FProperty_List.sizeInBytes(magic));
end;

constructor TFHIRFindMatchesOpRespMatch.Create;
begin
  inherited Create();
  FUnmatchedList := TFslList<TFHIRFindMatchesOpRespUnmatched>.Create;
end;
constructor TFHIRFindMatchesOpRespMatch.Create(params : TFhirParametersParameter);
var
  p : TFhirParametersParameter;
begin
  inherited Create();
  FUnmatchedList := TFslList<TFHIRFindMatchesOpRespUnmatched>.Create;
  if params.param['code'] <> nil then
    FCode := (params.param['code'].value as TFhirCoding).Link;
  for p in params.partList do
    if p.name = 'unmatched' then
      FUnmatchedList.Add(TFHIRFindMatchesOpRespUnmatched.Create(p));
  if params.param['comment'] <> nil then
    FComment := (params.param['comment'].value as TFHIRString).Value; 
  loadExtensions(params);
end;
destructor TFHIRFindMatchesOpRespMatch.Destroy;
begin
  FCode.free;
  FUnmatchedList.free;
  inherited;
end;
function TFHIRFindMatchesOpRespMatch.asParams(name : String) : TFhirParametersParameter;var  v1 : TFHIRFindMatchesOpRespUnmatched;begin
  result := TFHIRParametersParameter.Create;
  try
    result.name := name;
    if (FCode <> nil) then
      result.addParameter('code', FCode.Link);
    for v1 in FUnmatchedList do
      result.AddParameter(v1.asParams('unmatched'));
    if (FComment <> '') then
      result.addParameter('comment', TFHIRString.Create(FComment));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRFindMatchesOpRespMatch.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['code', 'unmatched', 'comment'], name);
end;

function TFHIRFindMatchesOpRespMatch.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FCode.sizeInBytes(magic));
  inc(result, FUnmatchedList.sizeInBytes(magic));
  inc(result, (FComment.length * sizeof(char))+12);
end;

constructor TFHIRFindMatchesOpResponse.Create;
begin
  inherited Create();
  FMatchList := TFslList<TFHIRFindMatchesOpRespMatch>.Create;
end;
procedure TFHIRFindMatchesOpResponse.load(params : TFHIRParameters);
var
  p : TFhirParametersParameter;
begin
  for p in params.parameterList do
    if p.name = 'match' then
      FMatchList.Add(TFHIRFindMatchesOpRespMatch.Create(p));
  loadExtensions(params);
end;
procedure TFHIRFindMatchesOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRFindMatchesOpResponse.Destroy;
begin
  FMatchList.free;
  inherited;
end;
function TFHIRFindMatchesOpResponse.asParams : TFhirParameters;var  v1 : TFHIRFindMatchesOpRespMatch;begin
  result := TFHIRParameters.Create;
  try
    for v1 in FMatchList do
      result.AddParameter(v1.asParams('match'));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRFindMatchesOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['match'], name);
end;

function TFHIRFindMatchesOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FMatchList.sizeInBytes(magic));
end;

procedure TFHIRLookupOpRequest.SetCoding(value : TFhirCoding);
begin
  FCoding.free;
  FCoding := value;
end;
constructor TFHIRLookupOpRequest.Create;
begin
  inherited Create();
  FProperty_List := TStringList.Create;
end;
procedure TFHIRLookupOpRequest.load(params : TFHIRParameters);
var
  p : TFhirParametersParameter;
begin
  if params.param['code'] <> nil then
    FCode := (params.param['code'].value as TFHIRCode).Value; 
  if params.param['system'] <> nil then
    FSystem := (params.param['system'].value as TFHIRUri).Value; 
  if params.param['version'] <> nil then
    FVersion := (params.param['version'].value as TFHIRString).Value; 
  if params.param['coding'] <> nil then
    FCoding := (params.param['coding'].value as TFhirCoding).Link;
  if params.param['date'] <> nil then
    FDate := (params.param['date'].value as TFHIRDateTime).Value; 
  if params.param['displayLanguage'] <> nil then
    FDisplayLanguage := (params.param['displayLanguage'].value as TFHIRCode).Value; 
  for p in params.parameterList do
    if p.name = 'property' then
      FProperty_List.Add((p.value as TFhirCode).value);
  loadExtensions(params);
end;
procedure TFHIRLookupOpRequest.load(params : THTTPParameters);
var
  s : String;
begin
  for s in params['property'].Split([';']) do
    FProperty_List.add(s); 
  loadExtensions(params);
end;
destructor TFHIRLookupOpRequest.Destroy;
begin
  FCoding.free;
  FProperty_List.free;
  inherited;
end;
function TFHIRLookupOpRequest.asParams : TFhirParameters;var  v1 : String;begin
  result := TFHIRParameters.Create;
  try
    if (FCode <> '') then
      result.addParameter('code', TFHIRCode.Create(FCode));
    if (FSystem <> '') then
      result.addParameter('system', TFHIRUri.Create(FSystem));
    if (FVersion <> '') then
      result.addParameter('version', TFHIRString.Create(FVersion));
    if (FCoding <> nil) then
      result.addParameter('coding', FCoding.Link);
    if (FDate.notNull) then
      result.addParameter('date', TFHIRDateTime.Create(FDate));
    if (FDisplayLanguage <> '') then
      result.addParameter('displayLanguage', TFHIRCode.Create(FDisplayLanguage));
    for v1 in FProperty_List do
      result.AddParameter('property', TFhirCode.Create(v1));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRLookupOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['code', 'system', 'version', 'coding', 'date', 'displayLanguage', 'property'], name);
end;

function TFHIRLookupOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FCode.length * sizeof(char))+12);
  inc(result, (FSystem.length * sizeof(char))+12);
  inc(result, (FVersion.length * sizeof(char))+12);
  inc(result, FCoding.sizeInBytes(magic));
  inc(result, (FDisplayLanguage.length * sizeof(char))+12);
  inc(result, FProperty_List.sizeInBytes(magic));
end;

procedure TFHIRLookupOpRespDesignation.SetUse(value : TFhirCoding);
begin
  FUse.free;
  FUse := value;
end;
constructor TFHIRLookupOpRespDesignation.Create;
begin
  inherited Create();
end;
constructor TFHIRLookupOpRespDesignation.Create(params : TFhirParametersParameter);
begin
  inherited Create();
  if params.param['language'] <> nil then
    FLanguage := (params.param['language'].value as TFHIRCode).Value; 
  if params.param['use'] <> nil then
    FUse := (params.param['use'].value as TFhirCoding).Link;
  if params.param['value'] <> nil then
    FValue := (params.param['value'].value as TFHIRString).Value; 
  loadExtensions(params);
end;
destructor TFHIRLookupOpRespDesignation.Destroy;
begin
  FUse.free;
  inherited;
end;
function TFHIRLookupOpRespDesignation.asParams(name : String) : TFhirParametersParameter;begin
  result := TFHIRParametersParameter.Create;
  try
    result.name := name;
    if (FLanguage <> '') then
      result.addParameter('language', TFHIRCode.Create(FLanguage));
    if (FUse <> nil) then
      result.addParameter('use', FUse.Link);
    if (FValue <> '') then
      result.addParameter('value', TFHIRString.Create(FValue));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRLookupOpRespDesignation.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['language', 'use', 'value'], name);
end;

function TFHIRLookupOpRespDesignation.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FLanguage.length * sizeof(char))+12);
  inc(result, FUse.sizeInBytes(magic));
  inc(result, (FValue.length * sizeof(char))+12);
end;

procedure TFHIRLookupOpRespProperty_.SetValue(value : TFhirDataType);
begin
  FValue.free;
  FValue := value;
end;
procedure TFHIRLookupOpRespSubproperty.SetValue(value : TFhirDataType);
begin
  FValue.free;
  FValue := value;
end;
constructor TFHIRLookupOpRespSubproperty.Create;
begin
  inherited Create();
end;
constructor TFHIRLookupOpRespSubproperty.Create(params : TFhirParametersParameter);
begin
  inherited Create();
  if params.param['code'] <> nil then
    FCode := (params.param['code'].value as TFHIRCode).Value; 
  if params.param['value'] <> nil then
    FValue := (params.param['value'].value as TFhirDataType).Link;
  if params.param['description'] <> nil then
    FDescription := (params.param['description'].value as TFHIRString).Value; 
  loadExtensions(params);
end;
destructor TFHIRLookupOpRespSubproperty.Destroy;
begin
  FValue.free;
  inherited;
end;
function TFHIRLookupOpRespSubproperty.asParams(name : String) : TFhirParametersParameter;begin
  result := TFHIRParametersParameter.Create;
  try
    result.name := name;
    if (FCode <> '') then
      result.addParameter('code', TFHIRCode.Create(FCode));
    if (FValue <> nil) then
      result.addParameter('value', FValue.Link);
    if (FDescription <> '') then
      result.addParameter('description', TFHIRString.Create(FDescription));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRLookupOpRespSubproperty.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['code', 'value', 'description'], name);
end;

function TFHIRLookupOpRespSubproperty.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FCode.length * sizeof(char))+12);
  inc(result, FValue.sizeInBytes(magic));
  inc(result, (FDescription.length * sizeof(char))+12);
end;

constructor TFHIRLookupOpRespProperty_.Create;
begin
  inherited Create();
  FSubpropertyList := TFslList<TFHIRLookupOpRespSubproperty>.Create;
end;
constructor TFHIRLookupOpRespProperty_.Create(params : TFhirParametersParameter);
var
  p : TFhirParametersParameter;
begin
  inherited Create();
  FSubpropertyList := TFslList<TFHIRLookupOpRespSubproperty>.Create;
  if params.param['code'] <> nil then
    FCode := (params.param['code'].value as TFHIRCode).Value; 
  if params.param['value'] <> nil then
    FValue := (params.param['value'].value as TFhirDataType).Link;
  if params.param['description'] <> nil then
    FDescription := (params.param['description'].value as TFHIRString).Value; 
  for p in params.partList do
    if p.name = 'subproperty' then
      FSubpropertyList.Add(TFHIRLookupOpRespSubproperty.Create(p));
  loadExtensions(params);
end;
destructor TFHIRLookupOpRespProperty_.Destroy;
begin
  FValue.free;
  FSubpropertyList.free;
  inherited;
end;
function TFHIRLookupOpRespProperty_.asParams(name : String) : TFhirParametersParameter;var  v1 : TFHIRLookupOpRespSubproperty;begin
  result := TFHIRParametersParameter.Create;
  try
    result.name := name;
    if (FCode <> '') then
      result.addParameter('code', TFHIRCode.Create(FCode));
    if (FValue <> nil) then
      result.addParameter('value', FValue.Link);
    if (FDescription <> '') then
      result.addParameter('description', TFHIRString.Create(FDescription));
    for v1 in FSubpropertyList do
      result.AddParameter(v1.asParams('subproperty'));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRLookupOpRespProperty_.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['code', 'value', 'description', 'subproperty'], name);
end;

function TFHIRLookupOpRespProperty_.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FCode.length * sizeof(char))+12);
  inc(result, FValue.sizeInBytes(magic));
  inc(result, (FDescription.length * sizeof(char))+12);
  inc(result, FSubpropertyList.sizeInBytes(magic));
end;

constructor TFHIRLookupOpResponse.Create;
begin
  inherited Create();
  FDesignationList := TFslList<TFHIRLookupOpRespDesignation>.Create;
  FProperty_List := TFslList<TFHIRLookupOpRespProperty_>.Create;
end;
procedure TFHIRLookupOpResponse.load(params : TFHIRParameters);
var
  p : TFhirParametersParameter;
begin
  FAbstract := params.bool['abstract'];
  if params.param['name'] <> nil then
    FName := (params.param['name'].value as TFHIRString).Value; 
  if params.param['version'] <> nil then
    FVersion := (params.param['version'].value as TFHIRString).Value; 
  if params.param['display'] <> nil then
    FDisplay := (params.param['display'].value as TFHIRString).Value; 
  for p in params.parameterList do
    if p.name = 'designation' then
      FDesignationList.Add(TFHIRLookupOpRespDesignation.Create(p));
  for p in params.parameterList do
    if p.name = 'property' then
      FProperty_List.Add(TFHIRLookupOpRespProperty_.Create(p));
  loadExtensions(params);
end;
procedure TFHIRLookupOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);  
  FAbstract := StrToBoolDef(params['abstract'], false);
end;
destructor TFHIRLookupOpResponse.Destroy;
begin
  FDesignationList.free;
  FProperty_List.free;
  inherited;
end;
function TFHIRLookupOpResponse.asParams : TFhirParameters;var  v1 : TFHIRLookupOpRespDesignation;  v2 : TFHIRLookupOpRespProperty_;
begin
  result := TFHIRParameters.Create;
  try
    if (FName <> '') then
      result.addParameter('name', TFHIRString.Create(FName));
    if (FCode <> '') then
      result.addParameter('code', TFHIRCode.Create(FCode));
    if (FSystem <> '') then
      result.addParameter('system', TFHIRUri.Create(FSystem));
    if (FVersion <> '') then
      result.addParameter('version', TFHIRString.Create(FVersion));
    if (FDisplay <> '') then
      result.addParameter('display', TFHIRString.Create(FDisplay));
    for v1 in FDesignationList do
      result.AddParameter(v1.asParams('designation'));
    for v2 in FProperty_List do
      result.AddParameter(v2.asParams('property'));
    result.addParameter('abstract', TFHIRBoolean.Create(FAbstract));{oz.5f}
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRLookupOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['name', 'version', 'display', 'designation', 'property'], name);
end;

function TFHIRLookupOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FName.length * sizeof(char))+12);
  inc(result, (FVersion.length * sizeof(char))+12);
  inc(result, (FDisplay.length * sizeof(char))+12);
  inc(result, FDesignationList.sizeInBytes(magic));
  inc(result, FProperty_List.sizeInBytes(magic));
end;

procedure TFHIRSubsumesOpRequest.SetCodingA(value : TFhirCoding);
begin
  FCodingA.free;
  FCodingA := value;
end;
procedure TFHIRSubsumesOpRequest.SetCodingB(value : TFhirCoding);
begin
  FCodingB.free;
  FCodingB := value;
end;
constructor TFHIRSubsumesOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRSubsumesOpRequest.load(params : TFHIRParameters);
begin
  if params.param['codeA'] <> nil then
    FCodeA := (params.param['codeA'].value as TFHIRCode).Value; 
  if params.param['codeB'] <> nil then
    FCodeB := (params.param['codeB'].value as TFHIRCode).Value; 
  if params.param['system'] <> nil then
    FSystem := (params.param['system'].value as TFHIRUri).Value; 
  if params.param['version'] <> nil then
    FVersion := (params.param['version'].value as TFHIRString).Value; 
  if params.param['codingA'] <> nil then
    FCodingA := (params.param['codingA'].value as TFhirCoding).Link;
  if params.param['codingB'] <> nil then
    FCodingB := (params.param['codingB'].value as TFhirCoding).Link;
  loadExtensions(params);
end;
procedure TFHIRSubsumesOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRSubsumesOpRequest.Destroy;
begin
  FCodingA.free;
  FCodingB.free;
  inherited;
end;
function TFHIRSubsumesOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FCodeA <> '') then
      result.addParameter('codeA', TFHIRCode.Create(FCodeA));
    if (FCodeB <> '') then
      result.addParameter('codeB', TFHIRCode.Create(FCodeB));
    if (FSystem <> '') then
      result.addParameter('system', TFHIRUri.Create(FSystem));
    if (FVersion <> '') then
      result.addParameter('version', TFHIRString.Create(FVersion));
    if (FCodingA <> nil) then
      result.addParameter('codingA', FCodingA.Link);
    if (FCodingB <> nil) then
      result.addParameter('codingB', FCodingB.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRSubsumesOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['codeA', 'codeB', 'system', 'version', 'codingA', 'codingB'], name);
end;

function TFHIRSubsumesOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FCodeA.length * sizeof(char))+12);
  inc(result, (FCodeB.length * sizeof(char))+12);
  inc(result, (FSystem.length * sizeof(char))+12);
  inc(result, (FVersion.length * sizeof(char))+12);
  inc(result, FCodingA.sizeInBytes(magic));
  inc(result, FCodingB.sizeInBytes(magic));
end;

constructor TFHIRSubsumesOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRSubsumesOpResponse.load(params : TFHIRParameters);
begin
  if params.param['outcome'] <> nil then
    FOutcome := (params.param['outcome'].value as TFHIRCode).Value; 
  loadExtensions(params);
end;
procedure TFHIRSubsumesOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRSubsumesOpResponse.Destroy;
begin
  inherited;
end;
function TFHIRSubsumesOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FOutcome <> '') then
      result.addParameter('outcome', TFHIRCode.Create(FOutcome));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRSubsumesOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['outcome'], name);
end;

function TFHIRSubsumesOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FOutcome.length * sizeof(char))+12);
end;

procedure TFHIRValidateCodeOpRequest.SetCodeSystem(value : TFhirCodeSystem);
begin
  FCodeSystem.free;
  FCodeSystem := value;
end;
procedure TFHIRValidateCodeOpRequest.SetCoding(value : TFhirCoding);
begin
  FCoding.free;
  FCoding := value;
end;
procedure TFHIRValidateCodeOpRequest.SetCodeableConcept(value : TFhirCodeableConcept);
begin
  FCodeableConcept.free;
  FCodeableConcept := value;
end;
constructor TFHIRValidateCodeOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRValidateCodeOpRequest.load(params : TFHIRParameters);
begin
  if params.param['url'] <> nil then
    FUrl := (params.param['url'].value as TFHIRUri).Value; 
  FCodeSystem := (params.res['codeSystem'] as TFhirCodeSystem).Link;
  if params.param['code'] <> nil then
    FCode := (params.param['code'].value as TFHIRCode).Value; 
  if params.param['version'] <> nil then
    FVersion := (params.param['version'].value as TFHIRString).Value; 
  if params.param['display'] <> nil then
    FDisplay := (params.param['display'].value as TFHIRString).Value; 
  if params.param['coding'] <> nil then
    FCoding := (params.param['coding'].value as TFhirCoding).Link;
  if params.param['codeableConcept'] <> nil then
    FCodeableConcept := (params.param['codeableConcept'].value as TFhirCodeableConcept).Link;
  if params.param['date'] <> nil then
    FDate := (params.param['date'].value as TFHIRDateTime).Value; 
  if params.param['abstract'] <> nil then
    FAbstract := (params.param['abstract'].value as TFHIRBoolean).Value; 
  if params.param['displayLanguage'] <> nil then
    FDisplayLanguage := (params.param['displayLanguage'].value as TFHIRCode).Value; 
  loadExtensions(params);
end;
procedure TFHIRValidateCodeOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRValidateCodeOpRequest.Destroy;
begin
  FCodeSystem.free;
  FCoding.free;
  FCodeableConcept.free;
  inherited;
end;
function TFHIRValidateCodeOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FUrl <> '') then
      result.addParameter('url', TFHIRUri.Create(FUrl));
    if (FCodeSystem <> nil) then
      result.addParameter('codeSystem', FCodeSystem.Link);
    if (FCode <> '') then
      result.addParameter('code', TFHIRCode.Create(FCode));
    if (FVersion <> '') then
      result.addParameter('version', TFHIRString.Create(FVersion));
    if (FDisplay <> '') then
      result.addParameter('display', TFHIRString.Create(FDisplay));
    if (FCoding <> nil) then
      result.addParameter('coding', FCoding.Link);
    if (FCodeableConcept <> nil) then
      result.addParameter('codeableConcept', FCodeableConcept.Link);
    if (FDate.notNull) then
      result.addParameter('date', TFHIRDateTime.Create(FDate));
      result.addParameter('abstract', TFHIRBoolean.Create(FAbstract));
    if (FDisplayLanguage <> '') then
      result.addParameter('displayLanguage', TFHIRCode.Create(FDisplayLanguage));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRValidateCodeOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['url', 'codeSystem', 'code', 'version', 'display', 'coding', 'codeableConcept', 'date', 'abstract', 'displayLanguage'], name);
end;

function TFHIRValidateCodeOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FUrl.length * sizeof(char))+12);
  inc(result, FCodeSystem.sizeInBytes(magic));
  inc(result, (FCode.length * sizeof(char))+12);
  inc(result, (FVersion.length * sizeof(char))+12);
  inc(result, (FDisplay.length * sizeof(char))+12);
  inc(result, FCoding.sizeInBytes(magic));
  inc(result, FCodeableConcept.sizeInBytes(magic));
  inc(result, (FDisplayLanguage.length * sizeof(char))+12);
end;

constructor TFHIRValidateCodeOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRValidateCodeOpResponse.load(params : TFHIRParameters);
begin
  if params.param['result'] <> nil then
    FResult := (params.param['result'].value as TFHIRBoolean).Value; 
  if params.param['message'] <> nil then
    FMessage := (params.param['message'].value as TFHIRString).Value; 
  if params.param['display'] <> nil then
    FDisplay := (params.param['display'].value as TFHIRString).Value; 
  loadExtensions(params);
end;
procedure TFHIRValidateCodeOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRValidateCodeOpResponse.Destroy;
begin
  inherited;
end;
function TFHIRValidateCodeOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
      result.addParameter('result', TFHIRBoolean.Create(FResult));
    if (FMessage <> '') then
      result.addParameter('message', TFHIRString.Create(FMessage));
    if (FDisplay <> '') then
      result.addParameter('display', TFHIRString.Create(FDisplay));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRValidateCodeOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['result', 'message', 'display'], name);
end;

function TFHIRValidateCodeOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FMessage.length * sizeof(char))+12);
  inc(result, (FDisplay.length * sizeof(char))+12);
end;

constructor TFHIRDocumentOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRDocumentOpRequest.load(params : TFHIRParameters);
begin
  if params.param['id'] <> nil then
    FId := (params.param['id'].value as TFHIRUri).Value; 
  if params.param['persist'] <> nil then
    FPersist := (params.param['persist'].value as TFHIRBoolean).Value; 
  if params.param['graph'] <> nil then
    FGraph := (params.param['graph'].value as TFHIRUri).Value; 
  loadExtensions(params);
end;
procedure TFHIRDocumentOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRDocumentOpRequest.Destroy;
begin
  inherited;
end;
function TFHIRDocumentOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FId <> '') then
      result.addParameter('id', TFHIRUri.Create(FId));
      result.addParameter('persist', TFHIRBoolean.Create(FPersist));
    if (FGraph <> '') then
      result.addParameter('graph', TFHIRUri.Create(FGraph));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRDocumentOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['id', 'persist', 'graph'], name);
end;

function TFHIRDocumentOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FId.length * sizeof(char))+12);
  inc(result, (FGraph.length * sizeof(char))+12);
end;

constructor TFHIRDocumentOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRDocumentOpResponse.load(params : TFHIRParameters);
begin
  loadExtensions(params);
end;
procedure TFHIRDocumentOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRDocumentOpResponse.Destroy;
begin
  inherited;
end;
function TFHIRDocumentOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRDocumentOpResponse.isKnownName(name : String) : boolean;begin
  result := false;
end;

function TFHIRDocumentOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
end;

constructor TFHIRClosureOpRequest.Create;
begin
  inherited Create();
  FConceptList := TFslList<TFhirCoding>.Create;
end;
procedure TFHIRClosureOpRequest.load(params : TFHIRParameters);
var
  p : TFhirParametersParameter;
begin
  if params.param['name'] <> nil then
    FName := (params.param['name'].value as TFHIRString).Value; 
  for p in params.parameterList do
    if p.name = 'concept' then
      FConceptList.Add((p.value as TFhirCoding).Link);
  if params.param['version'] <> nil then
    FVersion := (params.param['version'].value as TFHIRString).Value; 
  loadExtensions(params);
end;
procedure TFHIRClosureOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRClosureOpRequest.Destroy;
begin
  FConceptList.free;
  inherited;
end;
function TFHIRClosureOpRequest.asParams : TFhirParameters;var  v1 : TFhirCoding;begin
  result := TFHIRParameters.Create;
  try
    if (FName <> '') then
      result.addParameter('name', TFHIRString.Create(FName));
    for v1 in FConceptList do
      result.AddParameter('concept', v1.Link);
    if (FVersion <> '') then
      result.addParameter('version', TFHIRString.Create(FVersion));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRClosureOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['name', 'concept', 'version'], name);
end;

function TFHIRClosureOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FName.length * sizeof(char))+12);
  inc(result, FConceptList.sizeInBytes(magic));
  inc(result, (FVersion.length * sizeof(char))+12);
end;

procedure TFHIRClosureOpResponse.SetReturn(value : TFhirConceptMap);
begin
  FReturn.free;
  FReturn := value;
end;
constructor TFHIRClosureOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRClosureOpResponse.load(params : TFHIRParameters);
begin
  FReturn := (params.res['return'] as TFhirConceptMap).Link;
  loadExtensions(params);
end;
procedure TFHIRClosureOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRClosureOpResponse.Destroy;
begin
  FReturn.free;
  inherited;
end;
function TFHIRClosureOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FReturn <> nil) then
      result.addParameter('return', FReturn.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRClosureOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['return'], name);
end;

function TFHIRClosureOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FReturn.sizeInBytes(magic));
end;

procedure TFHIRTranslateOpRequest.SetConceptMap(value : TFhirConceptMap);
begin
  FConceptMap.free;
  FConceptMap := value;
end;
procedure TFHIRTranslateOpRequest.SetCoding(value : TFhirCoding);
begin
  FCoding.free;
  FCoding := value;
end;
procedure TFHIRTranslateOpRequest.SetCodeableConcept(value : TFhirCodeableConcept);
begin
  FCodeableConcept.free;
  FCodeableConcept := value;
end;
procedure TFHIRTranslateOpReqDependency.SetConcept(value : TFhirCodeableConcept);
begin
  FConcept.free;
  FConcept := value;
end;
constructor TFHIRTranslateOpReqDependency.Create;
begin
  inherited Create();
end;
constructor TFHIRTranslateOpReqDependency.Create(params : TFhirParametersParameter);
begin
  inherited Create();
  if params.param['element'] <> nil then
    FElement := (params.param['element'].value as TFHIRUri).Value; 
  if params.param['concept'] <> nil then
    FConcept := (params.param['concept'].value as TFhirCodeableConcept).Link;
  loadExtensions(params);
end;
destructor TFHIRTranslateOpReqDependency.Destroy;
begin
  FConcept.free;
  inherited;
end;
function TFHIRTranslateOpReqDependency.asParams(name : String) : TFhirParametersParameter;begin
  result := TFHIRParametersParameter.Create;
  try
    result.name := name;
    if (FElement <> '') then
      result.addParameter('element', TFHIRUri.Create(FElement));
    if (FConcept <> nil) then
      result.addParameter('concept', FConcept.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRTranslateOpReqDependency.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['element', 'concept'], name);
end;

function TFHIRTranslateOpReqDependency.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FElement.length * sizeof(char))+12);
  inc(result, FConcept.sizeInBytes(magic));
end;

constructor TFHIRTranslateOpRequest.Create;
begin
  inherited Create();
  FDependencyList := TFslList<TFHIRTranslateOpReqDependency>.Create;
end;
procedure TFHIRTranslateOpRequest.load(params : TFHIRParameters);
var
  p : TFhirParametersParameter;
begin
  if params.param['url'] <> nil then
    FUrl := (params.param['url'].value as TFHIRUri).Value; 
  FConceptMap := (params.res['conceptMap'] as TFhirConceptMap).Link;
  if params.param['conceptMapVersion'] <> nil then
    FConceptMapVersion := (params.param['conceptMapVersion'].value as TFHIRString).Value; 
  if params.param['code'] <> nil then
    FCode := (params.param['code'].value as TFHIRCode).Value; 
  if params.param['system'] <> nil then
    FSystem := (params.param['system'].value as TFHIRUri).Value; 
  if params.param['version'] <> nil then
    FVersion := (params.param['version'].value as TFHIRString).Value; 
  if params.param['source'] <> nil then
    FSource := (params.param['source'].value as TFHIRUri).Value; 
  if params.param['coding'] <> nil then
    FCoding := (params.param['coding'].value as TFhirCoding).Link;
  if params.param['codeableConcept'] <> nil then
    FCodeableConcept := (params.param['codeableConcept'].value as TFhirCodeableConcept).Link;
  if params.param['target'] <> nil then
    FTarget := (params.param['target'].value as TFHIRUri).Value; 
  if params.param['targetsystem'] <> nil then
    FTargetsystem := (params.param['targetsystem'].value as TFHIRUri).Value; 
  for p in params.parameterList do
    if p.name = 'dependency' then
      FDependencyList.Add(TFHIRTranslateOpReqDependency.Create(p));
  if params.param['reverse'] <> nil then
    FReverse := (params.param['reverse'].value as TFHIRBoolean).Value; 
  loadExtensions(params);
end;
procedure TFHIRTranslateOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRTranslateOpRequest.Destroy;
begin
  FConceptMap.free;
  FCoding.free;
  FCodeableConcept.free;
  FDependencyList.free;
  inherited;
end;
function TFHIRTranslateOpRequest.asParams : TFhirParameters;var  v1 : TFHIRTranslateOpReqDependency;begin
  result := TFHIRParameters.Create;
  try
    if (FUrl <> '') then
      result.addParameter('url', TFHIRUri.Create(FUrl));
    if (FConceptMap <> nil) then
      result.addParameter('conceptMap', FConceptMap.Link);
    if (FConceptMapVersion <> '') then
      result.addParameter('conceptMapVersion', TFHIRString.Create(FConceptMapVersion));
    if (FCode <> '') then
      result.addParameter('code', TFHIRCode.Create(FCode));
    if (FSystem <> '') then
      result.addParameter('system', TFHIRUri.Create(FSystem));
    if (FVersion <> '') then
      result.addParameter('version', TFHIRString.Create(FVersion));
    if (FSource <> '') then
      result.addParameter('source', TFHIRUri.Create(FSource));
    if (FCoding <> nil) then
      result.addParameter('coding', FCoding.Link);
    if (FCodeableConcept <> nil) then
      result.addParameter('codeableConcept', FCodeableConcept.Link);
    if (FTarget <> '') then
      result.addParameter('target', TFHIRUri.Create(FTarget));
    if (FTargetsystem <> '') then
      result.addParameter('targetsystem', TFHIRUri.Create(FTargetsystem));
    for v1 in FDependencyList do
      result.AddParameter(v1.asParams('dependency'));
      result.addParameter('reverse', TFHIRBoolean.Create(FReverse));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRTranslateOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['url', 'conceptMap', 'conceptMapVersion', 'code', 'system', 'version', 'source', 'coding', 'codeableConcept', 'target', 'targetsystem', 'dependency', 'reverse'], name);
end;

function TFHIRTranslateOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FUrl.length * sizeof(char))+12);
  inc(result, FConceptMap.sizeInBytes(magic));
  inc(result, (FConceptMapVersion.length * sizeof(char))+12);
  inc(result, (FCode.length * sizeof(char))+12);
  inc(result, (FSystem.length * sizeof(char))+12);
  inc(result, (FVersion.length * sizeof(char))+12);
  inc(result, (FSource.length * sizeof(char))+12);
  inc(result, FCoding.sizeInBytes(magic));
  inc(result, FCodeableConcept.sizeInBytes(magic));
  inc(result, (FTarget.length * sizeof(char))+12);
  inc(result, (FTargetsystem.length * sizeof(char))+12);
  inc(result, FDependencyList.sizeInBytes(magic));
end;

procedure TFHIRTranslateOpRespMatch.SetConcept(value : TFhirCoding);
begin
  FConcept.free;
  FConcept := value;
end;
procedure TFHIRTranslateOpRespProduct.SetConcept(value : TFhirCoding);
begin
  FConcept.free;
  FConcept := value;
end;
constructor TFHIRTranslateOpRespProduct.Create;
begin
  inherited Create();
end;
constructor TFHIRTranslateOpRespProduct.Create(params : TFhirParametersParameter);
begin
  inherited Create();
  if params.param['element'] <> nil then
    FElement := (params.param['element'].value as TFHIRUri).Value; 
  if params.param['concept'] <> nil then
    FConcept := (params.param['concept'].value as TFhirCoding).Link;
  loadExtensions(params);
end;
destructor TFHIRTranslateOpRespProduct.Destroy;
begin
  FConcept.free;
  inherited;
end;
function TFHIRTranslateOpRespProduct.asParams(name : String) : TFhirParametersParameter;begin
  result := TFHIRParametersParameter.Create;
  try
    result.name := name;
    if (FElement <> '') then
      result.addParameter('element', TFHIRUri.Create(FElement));
    if (FConcept <> nil) then
      result.addParameter('concept', FConcept.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRTranslateOpRespProduct.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['element', 'concept'], name);
end;

function TFHIRTranslateOpRespProduct.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FElement.length * sizeof(char))+12);
  inc(result, FConcept.sizeInBytes(magic));
end;

constructor TFHIRTranslateOpRespMatch.Create;
begin
  inherited Create();
  FProductList := TFslList<TFHIRTranslateOpRespProduct>.Create;
end;
constructor TFHIRTranslateOpRespMatch.Create(params : TFhirParametersParameter);
var
  p : TFhirParametersParameter;
begin
  inherited Create();
  FProductList := TFslList<TFHIRTranslateOpRespProduct>.Create;
  if params.param['equivalence'] <> nil then
    FEquivalence := (params.param['equivalence'].value as TFHIRCode).Value; 
  if params.param['concept'] <> nil then
    FConcept := (params.param['concept'].value as TFhirCoding).Link;
  for p in params.partList do
    if p.name = 'product' then
      FProductList.Add(TFHIRTranslateOpRespProduct.Create(p));
  if params.param['source'] <> nil then
    FSource := (params.param['source'].value as TFHIRUri).Value; 
  loadExtensions(params);
end;
destructor TFHIRTranslateOpRespMatch.Destroy;
begin
  FConcept.free;
  FProductList.free;
  inherited;
end;
function TFHIRTranslateOpRespMatch.asParams(name : String) : TFhirParametersParameter;var  v1 : TFHIRTranslateOpRespProduct;begin
  result := TFHIRParametersParameter.Create;
  try
    result.name := name;
    if (FEquivalence <> '') then
      result.addParameter('equivalence', TFHIRCode.Create(FEquivalence));
    if (FConcept <> nil) then
      result.addParameter('concept', FConcept.Link);
    for v1 in FProductList do
      result.AddParameter(v1.asParams('product'));
    if (FSource <> '') then
      result.addParameter('source', TFHIRUri.Create(FSource));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRTranslateOpRespMatch.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['equivalence', 'concept', 'product', 'source'], name);
end;

function TFHIRTranslateOpRespMatch.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FEquivalence.length * sizeof(char))+12);
  inc(result, FConcept.sizeInBytes(magic));
  inc(result, FProductList.sizeInBytes(magic));
  inc(result, (FSource.length * sizeof(char))+12);
end;

constructor TFHIRTranslateOpResponse.Create;
begin
  inherited Create();
  FMatchList := TFslList<TFHIRTranslateOpRespMatch>.Create;
end;
procedure TFHIRTranslateOpResponse.load(params : TFHIRParameters);
var
  p : TFhirParametersParameter;
begin
  if params.param['result'] <> nil then
    FResult := (params.param['result'].value as TFHIRBoolean).Value; 
  if params.param['message'] <> nil then
    FMessage := (params.param['message'].value as TFHIRString).Value; 
  for p in params.parameterList do
    if p.name = 'match' then
      FMatchList.Add(TFHIRTranslateOpRespMatch.Create(p));
  loadExtensions(params);
end;
procedure TFHIRTranslateOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRTranslateOpResponse.Destroy;
begin
  FMatchList.free;
  inherited;
end;
function TFHIRTranslateOpResponse.asParams : TFhirParameters;var  v1 : TFHIRTranslateOpRespMatch;begin
  result := TFHIRParameters.Create;
  try
      result.addParameter('result', TFHIRBoolean.Create(FResult));
    if (FMessage <> '') then
      result.addParameter('message', TFHIRString.Create(FMessage));
    for v1 in FMatchList do
      result.AddParameter(v1.asParams('match'));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRTranslateOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['result', 'message', 'match'], name);
end;

function TFHIRTranslateOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FMessage.length * sizeof(char))+12);
  inc(result, FMatchList.sizeInBytes(magic));
end;

constructor TFHIREverythingOpRequest.Create;
begin
  inherited Create();
  FTypeList := TStringList.Create;
end;
procedure TFHIREverythingOpRequest.load(params : TFHIRParameters);
var
  p : TFhirParametersParameter;
begin
  if params.param['_since'] <> nil then
    FSince := (params.param['_since'].value as TFHIRDateTime).Value; 
  for p in params.parameterList do
    if p.name = '_type' then
      FTypeList.Add((p.value as TFhirCode).value);
  if params.param['_count'] <> nil then
    FCount := (params.param['_count'].value as TFHIRInteger).Value; 
  loadExtensions(params);
end;
procedure TFHIREverythingOpRequest.load(params : THTTPParameters);
var
  s : String;
begin
  for s in params['_type'].Split([';']) do
    FTypeList.add(s); 
  loadExtensions(params);
end;
destructor TFHIREverythingOpRequest.Destroy;
begin
  FTypeList.free;
  inherited;
end;
function TFHIREverythingOpRequest.asParams : TFhirParameters;var  v1 : String;begin
  result := TFHIRParameters.Create;
  try
    if (FSince.notNull) then
      result.addParameter('_since', TFHIRInstant.Create(FSince));
    for v1 in FTypeList do
      result.AddParameter('_type', TFhirCode.Create(v1));
    if (FCount <> '') then
      result.addParameter('_count', TFHIRInteger.Create(FCount));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIREverythingOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['_since', '_type', '_count'], name);
end;

function TFHIREverythingOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FTypeList.sizeInBytes(magic));
  inc(result, (FCount.length * sizeof(char))+12);
end;

procedure TFHIREverythingOpResponse.SetReturn(value : TFhirBundle);
begin
  FReturn.free;
  FReturn := value;
end;
constructor TFHIREverythingOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIREverythingOpResponse.load(params : TFHIRParameters);
begin
  FReturn := (params.res['return'] as TFhirBundle).Link;
  loadExtensions(params);
end;
procedure TFHIREverythingOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIREverythingOpResponse.Destroy;
begin
  FReturn.free;
  inherited;
end;
function TFHIREverythingOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FReturn <> nil) then
      result.addParameter('return', FReturn.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIREverythingOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['return'], name);
end;

function TFHIREverythingOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FReturn.sizeInBytes(magic));
end;

constructor TFHIRFindOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRFindOpRequest.load(params : TFHIRParameters);
begin
  if params.param['patient'] <> nil then
    FPatient := (params.param['patient'].value as TFHIRId).Value; 
  if params.param['name'] <> nil then
    FName := (params.param['name'].value as TFHIRCode).Value; 
  loadExtensions(params);
end;
procedure TFHIRFindOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRFindOpRequest.Destroy;
begin
  inherited;
end;
function TFHIRFindOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FPatient <> '') then
      result.addParameter('patient', TFHIRId.Create(FPatient));
    if (FName <> '') then
      result.addParameter('name', TFHIRCode.Create(FName));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRFindOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['patient', 'name'], name);
end;

function TFHIRFindOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FPatient.length * sizeof(char))+12);
  inc(result, (FName.length * sizeof(char))+12);
end;

constructor TFHIRFindOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRFindOpResponse.load(params : TFHIRParameters);
begin
  loadExtensions(params);
end;
procedure TFHIRFindOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRFindOpResponse.Destroy;
begin
  inherited;
end;
function TFHIRFindOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRFindOpResponse.isKnownName(name : String) : boolean;begin
  result := false;
end;

function TFHIRFindOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
end;

constructor TFHIRCareGapsOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRCareGapsOpRequest.load(params : TFHIRParameters);
begin
  if params.param['periodStart'] <> nil then
    FPeriodStart := (params.param['periodStart'].value as TFHIRDateTime).Value; 
  if params.param['periodEnd'] <> nil then
    FPeriodEnd := (params.param['periodEnd'].value as TFHIRDateTime).Value; 
  if params.param['topic'] <> nil then
    FTopic := (params.param['topic'].value as TFHIRString).Value; 
  if params.param['subject'] <> nil then
    FSubject := (params.param['subject'].value as TFHIRString).Value; 
  loadExtensions(params);
end;
procedure TFHIRCareGapsOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRCareGapsOpRequest.Destroy;
begin
  inherited;
end;
function TFHIRCareGapsOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FPeriodStart.notNull) then
      result.addParameter('periodStart', TFHIRDate.Create(FPeriodStart));
    if (FPeriodEnd.notNull) then
      result.addParameter('periodEnd', TFHIRDate.Create(FPeriodEnd));
    if (FTopic <> '') then
      result.addParameter('topic', TFHIRString.Create(FTopic));
    if (FSubject <> '') then
      result.addParameter('subject', TFHIRString.Create(FSubject));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRCareGapsOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['periodStart', 'periodEnd', 'topic', 'subject'], name);
end;

function TFHIRCareGapsOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FTopic.length * sizeof(char))+12);
  inc(result, (FSubject.length * sizeof(char))+12);
end;

procedure TFHIRCareGapsOpResponse.SetReturn(value : TFhirBundle);
begin
  FReturn.free;
  FReturn := value;
end;
constructor TFHIRCareGapsOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRCareGapsOpResponse.load(params : TFHIRParameters);
begin
  FReturn := (params.res['return'] as TFhirBundle).Link;
  loadExtensions(params);
end;
procedure TFHIRCareGapsOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRCareGapsOpResponse.Destroy;
begin
  FReturn.free;
  inherited;
end;
function TFHIRCareGapsOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FReturn <> nil) then
      result.addParameter('return', FReturn.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRCareGapsOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['return'], name);
end;

function TFHIRCareGapsOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FReturn.sizeInBytes(magic));
end;

constructor TFHIRCollectDataOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRCollectDataOpRequest.load(params : TFHIRParameters);
begin
  if params.param['periodStart'] <> nil then
    FPeriodStart := (params.param['periodStart'].value as TFHIRDateTime).Value; 
  if params.param['periodEnd'] <> nil then
    FPeriodEnd := (params.param['periodEnd'].value as TFHIRDateTime).Value; 
  if params.param['measure'] <> nil then
    FMeasure := (params.param['measure'].value as TFHIRString).Value; 
  if params.param['subject'] <> nil then
    FSubject := (params.param['subject'].value as TFHIRString).Value; 
  if params.param['practitioner'] <> nil then
    FPractitioner := (params.param['practitioner'].value as TFHIRString).Value; 
  if params.param['lastReceivedOn'] <> nil then
    FLastReceivedOn := (params.param['lastReceivedOn'].value as TFHIRDateTime).Value; 
  loadExtensions(params);
end;
procedure TFHIRCollectDataOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRCollectDataOpRequest.Destroy;
begin
  inherited;
end;
function TFHIRCollectDataOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FPeriodStart.notNull) then
      result.addParameter('periodStart', TFHIRDate.Create(FPeriodStart));
    if (FPeriodEnd.notNull) then
      result.addParameter('periodEnd', TFHIRDate.Create(FPeriodEnd));
    if (FMeasure <> '') then
      result.addParameter('measure', TFHIRString.Create(FMeasure));
    if (FSubject <> '') then
      result.addParameter('subject', TFHIRString.Create(FSubject));
    if (FPractitioner <> '') then
      result.addParameter('practitioner', TFHIRString.Create(FPractitioner));
    if (FLastReceivedOn.notNull) then
      result.addParameter('lastReceivedOn', TFHIRDateTime.Create(FLastReceivedOn));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRCollectDataOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['periodStart', 'periodEnd', 'measure', 'subject', 'practitioner', 'lastReceivedOn'], name);
end;

function TFHIRCollectDataOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FMeasure.length * sizeof(char))+12);
  inc(result, (FSubject.length * sizeof(char))+12);
  inc(result, (FPractitioner.length * sizeof(char))+12);
end;

procedure TFHIRCollectDataOpResponse.SetMeasureReport(value : TFhirMeasureReport);
begin
  FMeasureReport.free;
  FMeasureReport := value;
end;
constructor TFHIRCollectDataOpResponse.Create;
begin
  inherited Create();
  FResourceList := TFslList<TFhirResource>.Create;
end;
procedure TFHIRCollectDataOpResponse.load(params : TFHIRParameters);
var
  p : TFhirParametersParameter;
begin
  FMeasureReport := (params.res['measureReport'] as TFhirMeasureReport).Link;
  for p in params.parameterList do
    if p.name = 'resource' then
      FResourceList.Add((p.resource as TFhirResource).Link);
  loadExtensions(params);
end;
procedure TFHIRCollectDataOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRCollectDataOpResponse.Destroy;
begin
  FMeasureReport.free;
  FResourceList.free;
  inherited;
end;
function TFHIRCollectDataOpResponse.asParams : TFhirParameters;var  v1 : TFhirResource;begin
  result := TFHIRParameters.Create;
  try
    if (FMeasureReport <> nil) then
      result.addParameter('measureReport', FMeasureReport.Link);
    for v1 in FResourceList do
      result.AddParameter('resource', v1.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRCollectDataOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['measureReport', 'resource'], name);
end;

function TFHIRCollectDataOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FMeasureReport.sizeInBytes(magic));
  inc(result, FResourceList.sizeInBytes(magic));
end;

constructor TFHIREvaluateMeasureOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIREvaluateMeasureOpRequest.load(params : TFHIRParameters);
begin
  if params.param['periodStart'] <> nil then
    FPeriodStart := (params.param['periodStart'].value as TFHIRDateTime).Value; 
  if params.param['periodEnd'] <> nil then
    FPeriodEnd := (params.param['periodEnd'].value as TFHIRDateTime).Value; 
  if params.param['measure'] <> nil then
    FMeasure := (params.param['measure'].value as TFHIRString).Value; 
  if params.param['reportType'] <> nil then
    FReportType := (params.param['reportType'].value as TFHIRCode).Value; 
  if params.param['subject'] <> nil then
    FSubject := (params.param['subject'].value as TFHIRString).Value; 
  if params.param['practitioner'] <> nil then
    FPractitioner := (params.param['practitioner'].value as TFHIRString).Value; 
  if params.param['lastReceivedOn'] <> nil then
    FLastReceivedOn := (params.param['lastReceivedOn'].value as TFHIRDateTime).Value; 
  loadExtensions(params);
end;
procedure TFHIREvaluateMeasureOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIREvaluateMeasureOpRequest.Destroy;
begin
  inherited;
end;
function TFHIREvaluateMeasureOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FPeriodStart.notNull) then
      result.addParameter('periodStart', TFHIRDate.Create(FPeriodStart));
    if (FPeriodEnd.notNull) then
      result.addParameter('periodEnd', TFHIRDate.Create(FPeriodEnd));
    if (FMeasure <> '') then
      result.addParameter('measure', TFHIRString.Create(FMeasure));
    if (FReportType <> '') then
      result.addParameter('reportType', TFHIRCode.Create(FReportType));
    if (FSubject <> '') then
      result.addParameter('subject', TFHIRString.Create(FSubject));
    if (FPractitioner <> '') then
      result.addParameter('practitioner', TFHIRString.Create(FPractitioner));
    if (FLastReceivedOn.notNull) then
      result.addParameter('lastReceivedOn', TFHIRDateTime.Create(FLastReceivedOn));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIREvaluateMeasureOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['periodStart', 'periodEnd', 'measure', 'reportType', 'subject', 'practitioner', 'lastReceivedOn'], name);
end;

function TFHIREvaluateMeasureOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FMeasure.length * sizeof(char))+12);
  inc(result, (FReportType.length * sizeof(char))+12);
  inc(result, (FSubject.length * sizeof(char))+12);
  inc(result, (FPractitioner.length * sizeof(char))+12);
end;

procedure TFHIREvaluateMeasureOpResponse.SetReturn(value : TFhirMeasureReport);
begin
  FReturn.free;
  FReturn := value;
end;
constructor TFHIREvaluateMeasureOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIREvaluateMeasureOpResponse.load(params : TFHIRParameters);
begin
  FReturn := (params.res['return'] as TFhirMeasureReport).Link;
  loadExtensions(params);
end;
procedure TFHIREvaluateMeasureOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIREvaluateMeasureOpResponse.Destroy;
begin
  FReturn.free;
  inherited;
end;
function TFHIREvaluateMeasureOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FReturn <> nil) then
      result.addParameter('return', FReturn.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIREvaluateMeasureOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['return'], name);
end;

function TFHIREvaluateMeasureOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FReturn.sizeInBytes(magic));
end;

procedure TFHIRSubmitDataOpRequest.SetMeasureReport(value : TFhirMeasureReport);
begin
  FMeasureReport.free;
  FMeasureReport := value;
end;
constructor TFHIRSubmitDataOpRequest.Create;
begin
  inherited Create();
  FResourceList := TFslList<TFhirResource>.Create;
end;
procedure TFHIRSubmitDataOpRequest.load(params : TFHIRParameters);
var
  p : TFhirParametersParameter;
begin
  FMeasureReport := (params.res['measureReport'] as TFhirMeasureReport).Link;
  for p in params.parameterList do
    if p.name = 'resource' then
      FResourceList.Add((p.resource as TFhirResource).Link);
  loadExtensions(params);
end;
procedure TFHIRSubmitDataOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRSubmitDataOpRequest.Destroy;
begin
  FMeasureReport.free;
  FResourceList.free;
  inherited;
end;
function TFHIRSubmitDataOpRequest.asParams : TFhirParameters;var  v1 : TFhirResource;begin
  result := TFHIRParameters.Create;
  try
    if (FMeasureReport <> nil) then
      result.addParameter('measureReport', FMeasureReport.Link);
    for v1 in FResourceList do
      result.AddParameter('resource', v1.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRSubmitDataOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['measureReport', 'resource'], name);
end;

function TFHIRSubmitDataOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FMeasureReport.sizeInBytes(magic));
  inc(result, FResourceList.sizeInBytes(magic));
end;

constructor TFHIRSubmitDataOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRSubmitDataOpResponse.load(params : TFHIRParameters);
begin
  loadExtensions(params);
end;
procedure TFHIRSubmitDataOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRSubmitDataOpResponse.Destroy;
begin
  inherited;
end;
function TFHIRSubmitDataOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRSubmitDataOpResponse.isKnownName(name : String) : boolean;begin
  result := false;
end;

function TFHIRSubmitDataOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
end;

procedure TFHIRProcessMessageOpRequest.SetContent(value : TFhirBundle);
begin
  FContent.free;
  FContent := value;
end;
constructor TFHIRProcessMessageOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRProcessMessageOpRequest.load(params : TFHIRParameters);
begin
  FContent := (params.res['content'] as TFhirBundle).Link;
  if params.param['async'] <> nil then
    FAsync := (params.param['async'].value as TFHIRBoolean).Value; 
  if params.param['response-url'] <> nil then
    FResponseUrl := (params.param['response-url'].value as TFHIRUrl).Value; 
  loadExtensions(params);
end;
procedure TFHIRProcessMessageOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRProcessMessageOpRequest.Destroy;
begin
  FContent.free;
  inherited;
end;
function TFHIRProcessMessageOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FContent <> nil) then
      result.addParameter('content', FContent.Link);
      result.addParameter('async', TFHIRBoolean.Create(FAsync));
    if (FResponseUrl <> '') then
      result.addParameter('response-url', TFHIRUrl.Create(FResponseUrl));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRProcessMessageOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['content', 'async', 'response-url'], name);
end;

function TFHIRProcessMessageOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FContent.sizeInBytes(magic));
  inc(result, (FResponseUrl.length * sizeof(char))+12);
end;

procedure TFHIRProcessMessageOpResponse.SetReturn(value : TFhirBundle);
begin
  FReturn.free;
  FReturn := value;
end;
constructor TFHIRProcessMessageOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRProcessMessageOpResponse.load(params : TFHIRParameters);
begin
  FReturn := (params.res['return'] as TFhirBundle).Link;
  loadExtensions(params);
end;
procedure TFHIRProcessMessageOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRProcessMessageOpResponse.Destroy;
begin
  FReturn.free;
  inherited;
end;
function TFHIRProcessMessageOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FReturn <> nil) then
      result.addParameter('return', FReturn.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRProcessMessageOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['return'], name);
end;

function TFHIRProcessMessageOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FReturn.sizeInBytes(magic));
end;

constructor TFHIRPreferredIdOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRPreferredIdOpRequest.load(params : TFHIRParameters);
begin
  if params.param['id'] <> nil then
    FId := (params.param['id'].value as TFHIRString).Value; 
  if params.param['type'] <> nil then
    FType_ := (params.param['type'].value as TFHIRCode).Value; 
  loadExtensions(params);
end;
procedure TFHIRPreferredIdOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRPreferredIdOpRequest.Destroy;
begin
  inherited;
end;
function TFHIRPreferredIdOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FId <> '') then
      result.addParameter('id', TFHIRString.Create(FId));
    if (FType_ <> '') then
      result.addParameter('type', TFHIRCode.Create(FType_));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRPreferredIdOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['id', 'type'], name);
end;

function TFHIRPreferredIdOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FId.length * sizeof(char))+12);
  inc(result, (FType_.length * sizeof(char))+12);
end;

constructor TFHIRPreferredIdOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRPreferredIdOpResponse.load(params : TFHIRParameters);
begin
  if params.param['result'] <> nil then
    FResult := (params.param['result'].value as TFHIRString).Value; 
  loadExtensions(params);
end;
procedure TFHIRPreferredIdOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRPreferredIdOpResponse.Destroy;
begin
  inherited;
end;
function TFHIRPreferredIdOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FResult <> '') then
      result.addParameter('result', TFHIRString.Create(FResult));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRPreferredIdOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['result'], name);
end;

function TFHIRPreferredIdOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FResult.length * sizeof(char))+12);
end;

constructor TFHIRLastnOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRLastnOpRequest.load(params : TFHIRParameters);
begin
  if params.param['max'] <> nil then
    FMax := (params.param['max'].value as TFHIRPositiveInt).Value; 
  loadExtensions(params);
end;
procedure TFHIRLastnOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRLastnOpRequest.Destroy;
begin
  inherited;
end;
function TFHIRLastnOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FMax <> '') then
      result.addParameter('max', TFHIRPositiveInt.Create(FMax));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRLastnOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['max'], name);
end;

function TFHIRLastnOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FMax.length * sizeof(char))+12);
end;

procedure TFHIRLastnOpResponse.SetReturn(value : TFhirBundle);
begin
  FReturn.free;
  FReturn := value;
end;
constructor TFHIRLastnOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRLastnOpResponse.load(params : TFHIRParameters);
begin
  FReturn := (params.res['return'] as TFhirBundle).Link;
  loadExtensions(params);
end;
procedure TFHIRLastnOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRLastnOpResponse.Destroy;
begin
  FReturn.free;
  inherited;
end;
function TFHIRLastnOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FReturn <> nil) then
      result.addParameter('return', FReturn.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRLastnOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['return'], name);
end;

function TFHIRLastnOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FReturn.sizeInBytes(magic));
end;

procedure TFHIRStatsOpRequest.SetPeriod(value : TFhirPeriod);
begin
  FPeriod.free;
  FPeriod := value;
end;
constructor TFHIRStatsOpRequest.Create;
begin
  inherited Create();
  FCodeList := TStringList.Create;
  FCodingList := TFslList<TFhirCoding>.Create;
  FStatisticList := TStringList.Create;
end;
procedure TFHIRStatsOpRequest.load(params : TFHIRParameters);
var
  p : TFhirParametersParameter;
begin
  if params.param['subject'] <> nil then
    FSubject := (params.param['subject'].value as TFHIRUri).Value; 
  for p in params.parameterList do
    if p.name = 'code' then
      FCodeList.Add((p.value as TFhirString).value);
  if params.param['system'] <> nil then
    FSystem := (params.param['system'].value as TFHIRUri).Value; 
  for p in params.parameterList do
    if p.name = 'coding' then
      FCodingList.Add((p.value as TFhirCoding).Link);
  if params.param['duration'] <> nil then
    FDuration := (params.param['duration'].value as TFHIRDecimal).Value; 
  if params.param['period'] <> nil then
    FPeriod := (params.param['period'].value as TFhirPeriod).Link;
  for p in params.parameterList do
    if p.name = 'statistic' then
      FStatisticList.Add((p.value as TFhirCode).value);
  if params.param['include'] <> nil then
    FInclude := (params.param['include'].value as TFHIRBoolean).Value; 
  if params.param['limit'] <> nil then
    FLimit := (params.param['limit'].value as TFHIRPositiveInt).Value; 
  loadExtensions(params);
end;
procedure TFHIRStatsOpRequest.load(params : THTTPParameters);
var
  s : String;
begin
  for s in params['code'].Split([';']) do
    FCodeList.add(s); 
  for s in params['statistic'].Split([';']) do
    FStatisticList.add(s); 
  loadExtensions(params);
end;
destructor TFHIRStatsOpRequest.Destroy;
begin
  FCodeList.free;
  FCodingList.free;
  FPeriod.free;
  FStatisticList.free;
  inherited;
end;
function TFHIRStatsOpRequest.asParams : TFhirParameters;var  v1 : String;  v2 : TFhirCoding;  v3 : String;begin
  result := TFHIRParameters.Create;
  try
    if (FSubject <> '') then
      result.addParameter('subject', TFHIRUri.Create(FSubject));
    for v1 in FCodeList do
      result.AddParameter('code', TFhirString.Create(v1));
    if (FSystem <> '') then
      result.addParameter('system', TFHIRUri.Create(FSystem));
    for v2 in FCodingList do
      result.AddParameter('coding', v2.Link);
    if (FDuration <> '') then
      result.addParameter('duration', TFHIRDecimal.Create(FDuration));
    if (FPeriod <> nil) then
      result.addParameter('period', FPeriod.Link);
    for v3 in FStatisticList do
      result.AddParameter('statistic', TFhirCode.Create(v3));
      result.addParameter('include', TFHIRBoolean.Create(FInclude));
    if (FLimit <> '') then
      result.addParameter('limit', TFHIRPositiveInt.Create(FLimit));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRStatsOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['subject', 'code', 'system', 'coding', 'duration', 'period', 'statistic', 'include', 'limit'], name);
end;

function TFHIRStatsOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FSubject.length * sizeof(char))+12);
  inc(result, FCodeList.sizeInBytes(magic));
  inc(result, (FSystem.length * sizeof(char))+12);
  inc(result, FCodingList.sizeInBytes(magic));
  inc(result, (FDuration.length * sizeof(char))+12);
  inc(result, FPeriod.sizeInBytes(magic));
  inc(result, FStatisticList.sizeInBytes(magic));
  inc(result, (FLimit.length * sizeof(char))+12);
end;

constructor TFHIRStatsOpResponse.Create;
begin
  inherited Create();
  FStatisticsList := TFslList<TFhirObservation>.Create;
  FSourceList := TFslList<TFhirObservation>.Create;
end;
procedure TFHIRStatsOpResponse.load(params : TFHIRParameters);
var
  p : TFhirParametersParameter;
begin
  for p in params.parameterList do
    if p.name = 'statistics' then
      FStatisticsList.Add((p.resource as TFhirObservation).Link);
  for p in params.parameterList do
    if p.name = 'source' then
      FSourceList.Add((p.resource as TFhirObservation).Link);
  loadExtensions(params);
end;
procedure TFHIRStatsOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRStatsOpResponse.Destroy;
begin
  FStatisticsList.free;
  FSourceList.free;
  inherited;
end;
function TFHIRStatsOpResponse.asParams : TFhirParameters;var  v1 : TFhirObservation;  v2 : TFhirObservation;begin
  result := TFHIRParameters.Create;
  try
    for v1 in FStatisticsList do
      result.AddParameter('statistics', v1.Link);
    for v2 in FSourceList do
      result.AddParameter('source', v2.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRStatsOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['statistics', 'source'], name);
end;

function TFHIRStatsOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FStatisticsList.sizeInBytes(magic));
  inc(result, FSourceList.sizeInBytes(magic));
end;

procedure TFHIRMatchOpRequest.SetResource(value : TFhirResource);
begin
  FResource.free;
  FResource := value;
end;
constructor TFHIRMatchOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRMatchOpRequest.load(params : TFHIRParameters);
begin
  FResource := (params.res['resource'] as TFhirResource).Link;
  if params.param['onlyCertainMatches'] <> nil then
    FOnlyCertainMatches := (params.param['onlyCertainMatches'].value as TFHIRBoolean).Value; 
  if params.param['count'] <> nil then
    FCount := (params.param['count'].value as TFHIRInteger).Value; 
  loadExtensions(params);
end;
procedure TFHIRMatchOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRMatchOpRequest.Destroy;
begin
  FResource.free;
  inherited;
end;
function TFHIRMatchOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FResource <> nil) then
      result.addParameter('resource', FResource.Link);
      result.addParameter('onlyCertainMatches', TFHIRBoolean.Create(FOnlyCertainMatches));
    if (FCount <> '') then
      result.addParameter('count', TFHIRInteger.Create(FCount));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRMatchOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['resource', 'onlyCertainMatches', 'count'], name);
end;

function TFHIRMatchOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FResource.sizeInBytes(magic));
  inc(result, (FCount.length * sizeof(char))+12);
end;

procedure TFHIRMatchOpResponse.SetReturn(value : TFhirBundle);
begin
  FReturn.free;
  FReturn := value;
end;
constructor TFHIRMatchOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRMatchOpResponse.load(params : TFHIRParameters);
begin
  FReturn := (params.res['return'] as TFhirBundle).Link;
  loadExtensions(params);
end;
procedure TFHIRMatchOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRMatchOpResponse.Destroy;
begin
  FReturn.free;
  inherited;
end;
function TFHIRMatchOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FReturn <> nil) then
      result.addParameter('return', FReturn.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRMatchOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['return'], name);
end;

function TFHIRMatchOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FReturn.sizeInBytes(magic));
end;

procedure TFHIRConvertOpRequest.SetInput(value : TFhirResource);
begin
  FInput.free;
  FInput := value;
end;
constructor TFHIRConvertOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRConvertOpRequest.load(params : TFHIRParameters);
begin
  FInput := (params.res['input'] as TFhirResource).Link;
  loadExtensions(params);
end;
procedure TFHIRConvertOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRConvertOpRequest.Destroy;
begin
  FInput.free;
  inherited;
end;
function TFHIRConvertOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FInput <> nil) then
      result.addParameter('input', FInput.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRConvertOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['input'], name);
end;

function TFHIRConvertOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FInput.sizeInBytes(magic));
end;

procedure TFHIRConvertOpResponse.SetOutput(value : TFhirResource);
begin
  FOutput.free;
  FOutput := value;
end;
constructor TFHIRConvertOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRConvertOpResponse.load(params : TFHIRParameters);
begin
  FOutput := (params.res['output'] as TFhirResource).Link;
  loadExtensions(params);
end;
procedure TFHIRConvertOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRConvertOpResponse.Destroy;
begin
  FOutput.free;
  inherited;
end;
function TFHIRConvertOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FOutput <> nil) then
      result.addParameter('output', FOutput.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRConvertOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['output'], name);
end;

function TFHIRConvertOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FOutput.sizeInBytes(magic));
end;

constructor TFHIRGraphOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRGraphOpRequest.load(params : TFHIRParameters);
begin
  if params.param['graph'] <> nil then
    FGraph := (params.param['graph'].value as TFHIRUri).Value; 
  loadExtensions(params);
end;
procedure TFHIRGraphOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRGraphOpRequest.Destroy;
begin
  inherited;
end;
function TFHIRGraphOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FGraph <> '') then
      result.addParameter('graph', TFHIRUri.Create(FGraph));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRGraphOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['graph'], name);
end;

function TFHIRGraphOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FGraph.length * sizeof(char))+12);
end;

procedure TFHIRGraphOpResponse.SetResult(value : TFhirBundle);
begin
  FResult.free;
  FResult := value;
end;
constructor TFHIRGraphOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRGraphOpResponse.load(params : TFHIRParameters);
begin
  FResult := (params.res['result'] as TFhirBundle).Link;
  loadExtensions(params);
end;
procedure TFHIRGraphOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRGraphOpResponse.Destroy;
begin
  FResult.free;
  inherited;
end;
function TFHIRGraphOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FResult <> nil) then
      result.addParameter('result', FResult.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRGraphOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['result'], name);
end;

function TFHIRGraphOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FResult.sizeInBytes(magic));
end;

constructor TFHIRGraphqlOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRGraphqlOpRequest.load(params : TFHIRParameters);
begin
  if params.param['query'] <> nil then
    FQuery := (params.param['query'].value as TFHIRString).Value; 
  loadExtensions(params);
end;
procedure TFHIRGraphqlOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRGraphqlOpRequest.Destroy;
begin
  inherited;
end;
function TFHIRGraphqlOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FQuery <> '') then
      result.addParameter('query', TFHIRString.Create(FQuery));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRGraphqlOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['query'], name);
end;

function TFHIRGraphqlOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FQuery.length * sizeof(char))+12);
end;

procedure TFHIRGraphqlOpResponse.SetResult(value : TFhirBinary);
begin
  FResult.free;
  FResult := value;
end;
constructor TFHIRGraphqlOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRGraphqlOpResponse.load(params : TFHIRParameters);
begin
  FResult := (params.res['result'] as TFhirBinary).Link;
  loadExtensions(params);
end;
procedure TFHIRGraphqlOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRGraphqlOpResponse.Destroy;
begin
  FResult.free;
  inherited;
end;
function TFHIRGraphqlOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FResult <> nil) then
      result.addParameter('result', FResult.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRGraphqlOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['result'], name);
end;

function TFHIRGraphqlOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FResult.sizeInBytes(magic));
end;

constructor TFHIRMetaOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRMetaOpRequest.load(params : TFHIRParameters);
begin
  loadExtensions(params);
end;
procedure TFHIRMetaOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRMetaOpRequest.Destroy;
begin
  inherited;
end;
function TFHIRMetaOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRMetaOpRequest.isKnownName(name : String) : boolean;begin
  result := false;
end;

function TFHIRMetaOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
end;

procedure TFHIRMetaOpResponse.SetReturn(value : TFhirMeta);
begin
  FReturn.free;
  FReturn := value;
end;
constructor TFHIRMetaOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRMetaOpResponse.load(params : TFHIRParameters);
begin
  if params.param['return'] <> nil then
    FReturn := (params.param['return'].value as TFhirMeta).Link;
  loadExtensions(params);
end;
procedure TFHIRMetaOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRMetaOpResponse.Destroy;
begin
  FReturn.free;
  inherited;
end;
function TFHIRMetaOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FReturn <> nil) then
      result.addParameter('return', FReturn.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRMetaOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['return'], name);
end;

function TFHIRMetaOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FReturn.sizeInBytes(magic));
end;

procedure TFHIRMetaAddOpRequest.SetMeta(value : TFhirMeta);
begin
  FMeta.free;
  FMeta := value;
end;
constructor TFHIRMetaAddOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRMetaAddOpRequest.load(params : TFHIRParameters);
begin
  if params.param['meta'] <> nil then
    FMeta := (params.param['meta'].value as TFhirMeta).Link;
  loadExtensions(params);
end;
procedure TFHIRMetaAddOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRMetaAddOpRequest.Destroy;
begin
  FMeta.free;
  inherited;
end;
function TFHIRMetaAddOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FMeta <> nil) then
      result.addParameter('meta', FMeta.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRMetaAddOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['meta'], name);
end;

function TFHIRMetaAddOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FMeta.sizeInBytes(magic));
end;

procedure TFHIRMetaAddOpResponse.SetReturn(value : TFhirMeta);
begin
  FReturn.free;
  FReturn := value;
end;
constructor TFHIRMetaAddOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRMetaAddOpResponse.load(params : TFHIRParameters);
begin
  if params.param['return'] <> nil then
    FReturn := (params.param['return'].value as TFhirMeta).Link;
  loadExtensions(params);
end;
procedure TFHIRMetaAddOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRMetaAddOpResponse.Destroy;
begin
  FReturn.free;
  inherited;
end;
function TFHIRMetaAddOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FReturn <> nil) then
      result.addParameter('return', FReturn.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRMetaAddOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['return'], name);
end;

function TFHIRMetaAddOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FReturn.sizeInBytes(magic));
end;

procedure TFHIRMetaDeleteOpRequest.SetMeta(value : TFhirMeta);
begin
  FMeta.free;
  FMeta := value;
end;
constructor TFHIRMetaDeleteOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRMetaDeleteOpRequest.load(params : TFHIRParameters);
begin
  if params.param['meta'] <> nil then
    FMeta := (params.param['meta'].value as TFhirMeta).Link;
  loadExtensions(params);
end;
procedure TFHIRMetaDeleteOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRMetaDeleteOpRequest.Destroy;
begin
  FMeta.free;
  inherited;
end;
function TFHIRMetaDeleteOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FMeta <> nil) then
      result.addParameter('meta', FMeta.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRMetaDeleteOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['meta'], name);
end;

function TFHIRMetaDeleteOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FMeta.sizeInBytes(magic));
end;

procedure TFHIRMetaDeleteOpResponse.SetReturn(value : TFhirMeta);
begin
  FReturn.free;
  FReturn := value;
end;
constructor TFHIRMetaDeleteOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRMetaDeleteOpResponse.load(params : TFHIRParameters);
begin
  if params.param['return'] <> nil then
    FReturn := (params.param['return'].value as TFhirMeta).Link;
  loadExtensions(params);
end;
procedure TFHIRMetaDeleteOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRMetaDeleteOpResponse.Destroy;
begin
  FReturn.free;
  inherited;
end;
function TFHIRMetaDeleteOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FReturn <> nil) then
      result.addParameter('return', FReturn.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRMetaDeleteOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['return'], name);
end;

function TFHIRMetaDeleteOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FReturn.sizeInBytes(magic));
end;

procedure TFHIRValidateOpRequest.SetResource(value : TFhirResource);
begin
  FResource.free;
  FResource := value;
end;
constructor TFHIRValidateOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRValidateOpRequest.load(params : TFHIRParameters);
begin
  FResource := (params.res['resource'] as TFhirResource).Link;
  if params.param['mode'] <> nil then
    FMode := (params.param['mode'].value as TFHIRCode).Value; 
  if params.param['profile'] <> nil then
    FProfile := (params.param['profile'].value as TFHIRCanonical).Value; 
  loadExtensions(params);
end;
procedure TFHIRValidateOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRValidateOpRequest.Destroy;
begin
  FResource.free;
  inherited;
end;
function TFHIRValidateOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FResource <> nil) then
      result.addParameter('resource', FResource.Link);
    if (FMode <> '') then
      result.addParameter('mode', TFHIRCode.Create(FMode));
    if (FProfile <> '') then
      result.addParameter('profile', TFHIRCanonical.Create(FProfile));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRValidateOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['resource', 'mode', 'profile'], name);
end;

function TFHIRValidateOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FResource.sizeInBytes(magic));
  inc(result, (FMode.length * sizeof(char))+12);
  inc(result, (FProfile.length * sizeof(char))+12);
end;

procedure TFHIRValidateOpResponse.SetReturn(value : TFhirOperationOutcome);
begin
  FReturn.free;
  FReturn := value;
end;
constructor TFHIRValidateOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRValidateOpResponse.load(params : TFHIRParameters);
begin
  FReturn := (params.res['return'] as TFhirOperationOutcome).Link;
  loadExtensions(params);
end;
procedure TFHIRValidateOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRValidateOpResponse.Destroy;
begin
  FReturn.free;
  inherited;
end;
function TFHIRValidateOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FReturn <> nil) then
      result.addParameter('return', FReturn.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRValidateOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['return'], name);
end;

function TFHIRValidateOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FReturn.sizeInBytes(magic));
end;

constructor TFHIRQuestionnaireOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRQuestionnaireOpRequest.load(params : TFHIRParameters);
begin
  if params.param['identifier'] <> nil then
    FIdentifier := (params.param['identifier'].value as TFHIRCanonical).Value; 
  if params.param['profile'] <> nil then
    FProfile := (params.param['profile'].value as TFHIRString).Value; 
  if params.param['url'] <> nil then
    FUrl := (params.param['url'].value as TFHIRCanonical).Value; 
  if params.param['supportedOnly'] <> nil then
    FSupportedOnly := (params.param['supportedOnly'].value as TFHIRBoolean).Value; 
  loadExtensions(params);
end;
procedure TFHIRQuestionnaireOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRQuestionnaireOpRequest.Destroy;
begin
  inherited;
end;
function TFHIRQuestionnaireOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FIdentifier <> '') then
      result.addParameter('identifier', TFHIRCanonical.Create(FIdentifier));
    if (FProfile <> '') then
      result.addParameter('profile', TFHIRString.Create(FProfile));
    if (FUrl <> '') then
      result.addParameter('url', TFHIRCanonical.Create(FUrl));
      result.addParameter('supportedOnly', TFHIRBoolean.Create(FSupportedOnly));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRQuestionnaireOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['identifier', 'profile', 'url', 'supportedOnly'], name);
end;

function TFHIRQuestionnaireOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FIdentifier.length * sizeof(char))+12);
  inc(result, (FProfile.length * sizeof(char))+12);
  inc(result, (FUrl.length * sizeof(char))+12);
end;

procedure TFHIRQuestionnaireOpResponse.SetReturn(value : TFhirQuestionnaire);
begin
  FReturn.free;
  FReturn := value;
end;
constructor TFHIRQuestionnaireOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRQuestionnaireOpResponse.load(params : TFHIRParameters);
begin
  FReturn := (params.res['return'] as TFhirQuestionnaire).Link;
  loadExtensions(params);
end;
procedure TFHIRQuestionnaireOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRQuestionnaireOpResponse.Destroy;
begin
  FReturn.free;
  inherited;
end;
function TFHIRQuestionnaireOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FReturn <> nil) then
      result.addParameter('return', FReturn.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRQuestionnaireOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['return'], name);
end;

function TFHIRQuestionnaireOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FReturn.sizeInBytes(magic));
end;

procedure TFHIRSnapshotOpRequest.SetDefinition(value : TFhirStructureDefinition);
begin
  FDefinition.free;
  FDefinition := value;
end;
constructor TFHIRSnapshotOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRSnapshotOpRequest.load(params : TFHIRParameters);
begin
  FDefinition := (params.res['definition'] as TFhirStructureDefinition).Link;
  if params.param['url'] <> nil then
    FUrl := (params.param['url'].value as TFHIRString).Value; 
  loadExtensions(params);
end;
procedure TFHIRSnapshotOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRSnapshotOpRequest.Destroy;
begin
  FDefinition.free;
  inherited;
end;
function TFHIRSnapshotOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FDefinition <> nil) then
      result.addParameter('definition', FDefinition.Link);
    if (FUrl <> '') then
      result.addParameter('url', TFHIRString.Create(FUrl));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRSnapshotOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['definition', 'url'], name);
end;

function TFHIRSnapshotOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FDefinition.sizeInBytes(magic));
  inc(result, (FUrl.length * sizeof(char))+12);
end;

procedure TFHIRSnapshotOpResponse.SetReturn(value : TFhirStructureDefinition);
begin
  FReturn.free;
  FReturn := value;
end;
constructor TFHIRSnapshotOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRSnapshotOpResponse.load(params : TFHIRParameters);
begin
  FReturn := (params.res['return'] as TFhirStructureDefinition).Link;
  loadExtensions(params);
end;
procedure TFHIRSnapshotOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRSnapshotOpResponse.Destroy;
begin
  FReturn.free;
  inherited;
end;
function TFHIRSnapshotOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FReturn <> nil) then
      result.addParameter('return', FReturn.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRSnapshotOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['return'], name);
end;

function TFHIRSnapshotOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FReturn.sizeInBytes(magic));
end;

procedure TFHIRTransformOpRequest.SetContent(value : TFhirResource);
begin
  FContent.free;
  FContent := value;
end;
constructor TFHIRTransformOpRequest.Create;
begin
  inherited Create();
end;
procedure TFHIRTransformOpRequest.load(params : TFHIRParameters);
begin
  if params.param['source'] <> nil then
    FSource := (params.param['source'].value as TFHIRUri).Value; 
  FContent := (params.res['content'] as TFhirResource).Link;
  loadExtensions(params);
end;
procedure TFHIRTransformOpRequest.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRTransformOpRequest.Destroy;
begin
  FContent.free;
  inherited;
end;
function TFHIRTransformOpRequest.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FSource <> '') then
      result.addParameter('source', TFHIRUri.Create(FSource));
    if (FContent <> nil) then
      result.addParameter('content', FContent.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRTransformOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['source', 'content'], name);
end;

function TFHIRTransformOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FSource.length * sizeof(char))+12);
  inc(result, FContent.sizeInBytes(magic));
end;

procedure TFHIRTransformOpResponse.SetReturn(value : TFhirResource);
begin
  FReturn.free;
  FReturn := value;
end;
constructor TFHIRTransformOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRTransformOpResponse.load(params : TFHIRParameters);
begin
  FReturn := (params.res['return'] as TFhirResource).Link;
  loadExtensions(params);
end;
procedure TFHIRTransformOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRTransformOpResponse.Destroy;
begin
  FReturn.free;
  inherited;
end;
function TFHIRTransformOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FReturn <> nil) then
      result.addParameter('return', FReturn.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRTransformOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['return'], name);
end;

function TFHIRTransformOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FReturn.sizeInBytes(magic));
end;

procedure TFHIRExpandOpRequest.SetValueSet(value : TFhirValueSet);
begin
  FValueSet.free;
  FValueSet := value;
end;
constructor TFHIRExpandOpRequest.Create;
begin
  inherited Create();
  FDesignationList := TStringList.Create;
  FExcludeSystemList := TStringList.Create;
  FSystemVersionList := TStringList.Create;
  FCheckSystemVersionList := TStringList.Create;
  FForceSystemVersionList := TStringList.Create;
end;
procedure TFHIRExpandOpRequest.load(params : TFHIRParameters);
var
  p : TFhirParametersParameter;
begin
  if params.param['url'] <> nil then
    FUrl := (params.param['url'].value as TFHIRUri).Value; 
  FValueSet := (params.res['valueSet'] as TFhirValueSet).Link;
  if params.param['valueSetVersion'] <> nil then
    FValueSetVersion := (params.param['valueSetVersion'].value as TFHIRString).Value; 
  if params.param['context'] <> nil then
    FContext := (params.param['context'].value as TFHIRUri).Value; 
  if params.param['contextDirection'] <> nil then
    FContextDirection := (params.param['contextDirection'].value as TFHIRCode).Value; 
  if params.param['filter'] <> nil then
    FFilter := (params.param['filter'].value as TFHIRString).Value; 
  if params.param['date'] <> nil then
    FDate := (params.param['date'].value as TFHIRDateTime).Value; 
  if params.param['offset'] <> nil then
    FOffset := (params.param['offset'].value as TFHIRInteger).Value; 
  if params.param['count'] <> nil then
    FCount := (params.param['count'].value as TFHIRInteger).Value; 
  if params.param['includeDesignations'] <> nil then
    FIncludeDesignations := (params.param['includeDesignations'].value as TFHIRBoolean).Value; 
  for p in params.parameterList do
    if p.name = 'designation' then
      FDesignationList.Add((p.value as TFhirString).value);
  if params.param['includeDefinition'] <> nil then
    FIncludeDefinition := (params.param['includeDefinition'].value as TFHIRBoolean).Value; 
  if params.param['activeOnly'] <> nil then
    FActiveOnly := (params.param['activeOnly'].value as TFHIRBoolean).Value; 
  if params.param['excludeNested'] <> nil then
    FExcludeNested := (params.param['excludeNested'].value as TFHIRBoolean).Value; 
  if params.param['excludeNotForUI'] <> nil then
    FExcludeNotForUI := (params.param['excludeNotForUI'].value as TFHIRBoolean).Value; 
  if params.param['excludePostCoordinated'] <> nil then
    FExcludePostCoordinated := (params.param['excludePostCoordinated'].value as TFHIRBoolean).Value; 
  if params.param['displayLanguage'] <> nil then
    FDisplayLanguage := (params.param['displayLanguage'].value as TFHIRCode).Value; 
  for p in params.parameterList do
    if p.name = 'exclude-system' then
      FExcludeSystemList.Add((p.value as TFhirCanonical).value);
  for p in params.parameterList do
    if p.name = 'system-version' then
      FSystemVersionList.Add((p.value as TFhirCanonical).value);
  for p in params.parameterList do
    if p.name = 'check-system-version' then
      FCheckSystemVersionList.Add((p.value as TFhirCanonical).value);
  for p in params.parameterList do
    if p.name = 'force-system-version' then
      FForceSystemVersionList.Add((p.value as TFhirCanonical).value);
  loadExtensions(params);
end;
procedure TFHIRExpandOpRequest.load(params : THTTPParameters);
var
  s : String;
begin
  for s in params['designation'].Split([';']) do
    FDesignationList.add(s); 
  for s in params['exclude-system'].Split([';']) do
    FExcludeSystemList.add(s); 
  for s in params['system-version'].Split([';']) do
    FSystemVersionList.add(s); 
  for s in params['check-system-version'].Split([';']) do
    FCheckSystemVersionList.add(s); 
  for s in params['force-system-version'].Split([';']) do
    FForceSystemVersionList.add(s); 
  loadExtensions(params);
end;
destructor TFHIRExpandOpRequest.Destroy;
begin
  FValueSet.free;
  FDesignationList.free;
  FExcludeSystemList.free;
  FSystemVersionList.free;
  FCheckSystemVersionList.free;
  FForceSystemVersionList.free;
  inherited;
end;
function TFHIRExpandOpRequest.asParams : TFhirParameters;var  v1 : String;  v2 : String;  v3 : String;  v4 : String;  v5 : String;begin
  result := TFHIRParameters.Create;
  try
    if (FUrl <> '') then
      result.addParameter('url', TFHIRUri.Create(FUrl));
    if (FValueSet <> nil) then
      result.addParameter('valueSet', FValueSet.Link);
    if (FValueSetVersion <> '') then
      result.addParameter('valueSetVersion', TFHIRString.Create(FValueSetVersion));
    if (FContext <> '') then
      result.addParameter('context', TFHIRUri.Create(FContext));
    if (FContextDirection <> '') then
      result.addParameter('contextDirection', TFHIRCode.Create(FContextDirection));
    if (FFilter <> '') then
      result.addParameter('filter', TFHIRString.Create(FFilter));
    if (FDate.notNull) then
      result.addParameter('date', TFHIRDateTime.Create(FDate));
    if (FOffset <> '') then
      result.addParameter('offset', TFHIRInteger.Create(FOffset));
    if (FCount <> '') then
      result.addParameter('count', TFHIRInteger.Create(FCount));
      result.addParameter('includeDesignations', TFHIRBoolean.Create(FIncludeDesignations));
    for v1 in FDesignationList do
      result.AddParameter('designation', TFhirString.Create(v1));
      result.addParameter('includeDefinition', TFHIRBoolean.Create(FIncludeDefinition));
      result.addParameter('activeOnly', TFHIRBoolean.Create(FActiveOnly));
      result.addParameter('excludeNested', TFHIRBoolean.Create(FExcludeNested));
      result.addParameter('excludeNotForUI', TFHIRBoolean.Create(FExcludeNotForUI));
      result.addParameter('excludePostCoordinated', TFHIRBoolean.Create(FExcludePostCoordinated));
    if (FDisplayLanguage <> '') then
      result.addParameter('displayLanguage', TFHIRCode.Create(FDisplayLanguage));
    for v2 in FExcludeSystemList do
      result.AddParameter('exclude-system', TFhirCanonical.Create(v2));
    for v3 in FSystemVersionList do
      result.AddParameter('system-version', TFhirCanonical.Create(v3));
    for v4 in FCheckSystemVersionList do
      result.AddParameter('check-system-version', TFhirCanonical.Create(v4));
    for v5 in FForceSystemVersionList do
      result.AddParameter('force-system-version', TFhirCanonical.Create(v5));
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRExpandOpRequest.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['url', 'valueSet', 'valueSetVersion', 'context', 'contextDirection', 'filter', 'date', 'offset', 'count', 'includeDesignations', 'designation', 'includeDefinition', 'activeOnly', 'excludeNested', 'excludeNotForUI', 'excludePostCoordinated', 'displayLanguage', 'exclude-system', 'system-version', 'check-system-version', 'force-system-version'], name);
end;

function TFHIRExpandOpRequest.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, (FUrl.length * sizeof(char))+12);
  inc(result, FValueSet.sizeInBytes(magic));
  inc(result, (FValueSetVersion.length * sizeof(char))+12);
  inc(result, (FContext.length * sizeof(char))+12);
  inc(result, (FContextDirection.length * sizeof(char))+12);
  inc(result, (FFilter.length * sizeof(char))+12);
  inc(result, (FOffset.length * sizeof(char))+12);
  inc(result, (FCount.length * sizeof(char))+12);
  inc(result, FDesignationList.sizeInBytes(magic));
  inc(result, (FDisplayLanguage.length * sizeof(char))+12);
  inc(result, FExcludeSystemList.sizeInBytes(magic));
  inc(result, FSystemVersionList.sizeInBytes(magic));
  inc(result, FCheckSystemVersionList.sizeInBytes(magic));
  inc(result, FForceSystemVersionList.sizeInBytes(magic));
end;

procedure TFHIRExpandOpResponse.SetReturn(value : TFhirValueSet);
begin
  FReturn.free;
  FReturn := value;
end;
constructor TFHIRExpandOpResponse.Create;
begin
  inherited Create();
end;
procedure TFHIRExpandOpResponse.load(params : TFHIRParameters);
begin
  FReturn := (params.res['return'] as TFhirValueSet).Link;
  loadExtensions(params);
end;
procedure TFHIRExpandOpResponse.load(params : THTTPParameters);
begin
  loadExtensions(params);
end;
destructor TFHIRExpandOpResponse.Destroy;
begin
  FReturn.free;
  inherited;
end;
function TFHIRExpandOpResponse.asParams : TFhirParameters;begin
  result := TFHIRParameters.Create;
  try
    if (FReturn <> nil) then
      result.addParameter('return', FReturn.Link);
    writeExtensions(result);
    result.link;
  finally
    result.free;
  end;
end;
function TFHIRExpandOpResponse.isKnownName(name : String) : boolean;begin
  result := StringArrayExists(['return'], name);
end;

function TFHIRExpandOpResponse.sizeInBytesV(magic : integer) : cardinal;
begin
  result := inherited sizeInBytesV(magic);
  inc(result, FReturn.sizeInBytes(magic));
end;



end.

