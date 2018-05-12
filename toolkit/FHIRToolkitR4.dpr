{
Copyright (c) 2017+, Health Intersections Pty Ltd (http://www.healthintersections.com.au)
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
program FHIRToolkitR4;

uses
  FastMM4 in '..\Libraries\FMM\FastMM4.pas',
  System.StartUpCopy,
  FMX.Forms,
  FHIR.Tools.Client in '..\reference-platform\client\FHIR.Tools.Client.pas',
  FHIR.Support.Strings in '..\reference-platform\support\FHIR.Support.Strings.pas',
  FHIR.Support.Math in '..\reference-platform\support\FHIR.Support.Math.pas',
  FHIR.Support.Osx in '..\reference-platform\support\FHIR.Support.Osx.pas',
  FHIR.Support.Decimal in '..\reference-platform\support\FHIR.Support.Decimal.pas',
  FHIR.Support.DateTime in '..\reference-platform\support\FHIR.Support.DateTime.pas',
  FHIR.Support.Mime in '..\reference-platform\support\FHIR.Support.Mime.pas',
  FHIR.Support.Objects in '..\reference-platform\support\FHIR.Support.Objects.pas',
  FHIR.Support.Exceptions in '..\reference-platform\support\FHIR.Support.Exceptions.pas',
  FHIR.Support.Generics in '..\reference-platform\support\FHIR.Support.Generics.pas',
  FHIR.Support.Stream in '..\reference-platform\support\FHIR.Support.Stream.pas',
  FHIR.Support.Filers in '..\reference-platform\support\FHIR.Support.Filers.pas',
  FHIR.Support.Collections in '..\reference-platform\support\FHIR.Support.Collections.pas',
  FHIR.Support.Binary in '..\reference-platform\support\FHIR.Support.Binary.pas',
  FHIR.Support.System in '..\reference-platform\support\FHIR.Support.System.pas',
  FHIR.Support.Json in '..\reference-platform\support\FHIR.Support.Json.pas',
  FHIR.Tools.Parser in '..\reference-platform\tools\FHIR.Tools.Parser.pas',
  FHIR.R4.Xml in '..\reference-platform\r4\FHIR.R4.Xml.pas',
  FHIR.Base.Parser in '..\reference-platform\base\FHIR.Base.Parser.pas',
  FHIR.Support.MXml in '..\reference-platform\support\FHIR.Support.MXml.pas',
  FHIR.Support.Turtle in '..\reference-platform\support\FHIR.Support.Turtle.pas',
  FHIR.Base.Objects in '..\reference-platform\base\FHIR.Base.Objects.pas',
  FHIR.R4.Utilities in '..\reference-platform\r4\FHIR.R4.Utilities.pas',
  FHIR.Web.ParseMap in '..\reference-platform\support\FHIR.Web.ParseMap.pas',
  FHIR.Web.Fetcher in '..\reference-platform\support\FHIR.Web.Fetcher.pas',
  FHIR.R4.Context in '..\reference-platform\r4\FHIR.R4.Context.pas',
  FHIR.R4.Types in '..\reference-platform\r4\FHIR.R4.Types.pas',
  FHIR.R4.Resources in '..\reference-platform\r4\FHIR.R4.Resources.pas',
  FHIR.Tools.Session in '..\reference-platform\tools\FHIR.Tools.Session.pas',
  FHIR.Base.Scim in '..\reference-platform\base\FHIR.Base.Scim.pas',
  FHIR.R4.Constants in '..\reference-platform\r4\FHIR.R4.Constants.pas',
  FHIR.Tools.Security in '..\reference-platform\tools\FHIR.Tools.Security.pas',
  FHIR.R4.Tags in '..\reference-platform\r4\FHIR.R4.Tags.pas',
  FHIR.Base.Lang in '..\reference-platform\base\FHIR.Base.Lang.pas',
  FHIR.Base.Xhtml in '..\reference-platform\base\FHIR.Base.Xhtml.pas',
  FHIR.R4.Json in '..\reference-platform\r4\FHIR.R4.Json.pas',
  FHIR.R4.Turtle in '..\reference-platform\r4\FHIR.R4.Turtle.pas',
  FHIR.R4.ElementModel in '..\reference-platform\r4\FHIR.R4.ElementModel.pas',
  FHIR.R4.Profiles in '..\reference-platform\r4\FHIR.R4.Profiles.pas',
  FHIR.Support.Lock in '..\reference-platform\support\FHIR.Support.Lock.pas',
  FHIR.R4.PathEngine in '..\reference-platform\r4\FHIR.R4.PathEngine.pas',
  FHIR.Client.SmartUtilities in '..\reference-platform\client\FHIR.Client.SmartUtilities.pas',
  MarkdownProcessor in '..\..\markdown\source\MarkdownProcessor.pas',
  MarkdownDaringFireball in '..\..\markdown\source\MarkdownDaringFireball.pas',
  MarkdownCommonMark in '..\..\markdown\source\MarkdownCommonMark.pas',
  FHIR.CdsHooks.Utilities in '..\reference-platform\support\FHIR.CdsHooks.Utilities.pas',
  FastMM4Messages in '..\Libraries\FMM\FastMM4Messages.pas',
  OrganizationChooser in 'OrganizationChooser.pas' {OrganizationSelectionForm},
  FHIRToolkitForm in 'FHIRToolkitForm.pas' {MasterToolsForm},
  ServerForm in 'ServerForm.pas' {ServerFrameForm: TFrame},
  AppEndorserFrame in 'AppEndorserFrame.pas' {AppEndorsementFrame: TFrame},
  BaseFrame in 'BaseFrame.pas',
  ValueSetEditor in 'ValueSetEditor.pas' {ValueSetEditorFrame: TFrame},
  SearchParameterEditor in 'SearchParameterEditor.pas' {SearchParameterEditorForm},
  ListSelector in 'ListSelector.pas' {ListSelectorForm},
  FHIR.R4.IndexInfo in '..\reference-platform\r4\FHIR.R4.IndexInfo.pas',
  FHIR.Tools.Indexing in '..\reference-platform\tools\FHIR.Tools.Indexing.pas',
  AddRestResourceDialog in 'AddRestResourceDialog.pas' {AddRestResourceForm},
  SourceViewer in 'SourceViewer.pas' {SourceViewerForm},
  FHIR.Tools.DiffEngine in '..\reference-platform\tools\FHIR.Tools.DiffEngine.pas',
  BaseResourceFrame in 'BaseResourceFrame.pas',
  BaseServerFrame in 'BaseServerFrame.pas',
  CapabilityStatementEditor in 'CapabilityStatementEditor.pas' {CapabilityStatementEditorFrame: TFrame},
  ValuesetExpansion in 'ValuesetExpansion.pas' {ValuesetExpansionForm},
  HelpContexts in 'HelpContexts.pas',
  ProcessForm in 'ProcessForm.pas' {ProcessingForm},
  SettingsDialog in 'SettingsDialog.pas' {SettingsForm},
  AboutDialog in 'AboutDialog.pas' {AboutForm},
  FHIR.Ui.OSX in '..\Libraries\ui\FHIR.Ui.OSX.pas',
  ValuesetSelectDialog in 'ValuesetSelectDialog.pas' {ValuesetSelectForm},
  MemoEditorDialog in 'MemoEditorDialog.pas' {MemoEditorForm},
  FHIR.Client.Registry in '..\reference-platform\client\FHIR.Client.Registry.pas',
  FHIR.Client.ServerDialogFMX in '..\reference-platform\client\FHIR.Client.ServerDialogFMX.pas' {EditRegisteredServerForm},
  ToolkitSettings in 'ToolkitSettings.pas',
  CodeSystemEditor in 'CodeSystemEditor.pas' {CodeSystemEditorFrame: TFrame},
  CodeSystemConceptDialog in 'CodeSystemConceptDialog.pas' {CodeSystemConceptForm},
  ResourceEditingSupport in 'ResourceEditingSupport.pas',
  ToolKitUtilities in 'ToolKitUtilities.pas',
  UpgradeNeededDialog in 'UpgradeNeededDialog.pas' {UpgradeNeededForm},
  QuestionnaireEditor in 'QuestionnaireEditor.pas' {QuestionnaireEditorFrame: TFrame},
  FHIR.Web.HtmlGen in '..\reference-platform\Support\FHIR.Web.HtmlGen.pas',
  QuestionnaireItemDialog in 'QuestionnaireItemDialog.pas' {QuestionnaireItemForm},
  ProviderDirectoryForm in 'ProviderDirectoryForm.pas' {ProviderDirectoryFrame},
  FHIR.Client.ClientDialogFMX in '..\reference-platform\client\FHIR.Client.ClientDialogFMX.pas' {RegisterClientForm},
  QuestionnaireItemPanel in 'QuestionnaireItemPanel.pas',
  QuestionnairePanel in 'QuestionnairePanel.pas',
  VitalSignsGeneratorDialog in 'VitalSignsGeneratorDialog.pas' {VitalSignsGeneratorForm},
  TranslationsEditorDialog in 'TranslationsEditorDialog.pas' {TranslationsEditorForm},
  ResourceLanguageDialog in 'ResourceLanguageDialog.pas' {ResourceLanguageForm},
  AddRestOperationDialog in 'AddRestOperationDialog.pas' {AddRestOperationForm},
  RegistryForm in 'RegistryForm.pas' {RegistryFrame: TFrame},
  FHIR.Ui.ComboFMX in '..\reference-platform\client\FHIR.Ui.ComboFMX.pas',
  PatientHomeForm in 'PatientHomeForm.pas' {PatientHomeFrame: TFrame},
  FHIR.Support.Signatures in '..\reference-platform\support\FHIR.Support.Signatures.pas',
  DocumentGenerationForm in 'DocumentGenerationForm.pas' {DocumentGeneratorForm},
  LibraryEditor in 'LibraryEditor.pas' {LibraryEditorFrame: TFrame},
  FHIR.Ucum.IFace in '..\reference-platform\support\FHIR.Ucum.IFace.pas',
  FHIR.R4.PathNode in '..\reference-platform\r4\FHIR.R4.PathNode.pas',
  FHIR.Debug.Logging in '..\reference-platform\support\FHIR.Debug.Logging.pas',
  FHIR.R4.Questionnaire2 in '..\reference-platform\r4\FHIR.R4.Questionnaire2.pas',
  FHIR.R4.Base in '..\reference-platform\r4\FHIR.R4.Base.pas',
  FHIR.R4.ParserBase in '..\reference-platform\r4\FHIR.R4.ParserBase.pas',
  FHIR.Tools.XhtmlComp in '..\reference-platform\tools\FHIR.Tools.XhtmlComp.pas',
  FHIR.R4.Parser in '..\reference-platform\r4\FHIR.R4.Parser.pas',
  FHIR.Client.Base in '..\reference-platform\client\FHIR.Client.Base.pas',
  FHIR.Client.HTTP in '..\reference-platform\client\FHIR.Client.HTTP.pas',
  FHIR.Client.Threaded in '..\reference-platform\client\FHIR.Client.Threaded.pas',
  FHIR.R4.Client in '..\reference-platform\r4\FHIR.R4.Client.pas',
  FHIR.Support.Text in '..\reference-platform\support\FHIR.Support.Text.pas',
  FHIR.Support.Factory in '..\reference-platform\support\FHIR.Support.Factory.pas',
  FHIR.Support.Xml in '..\reference-platform\support\FHIR.Support.Xml.pas',
  FHIR.Support.Zip in '..\reference-platform\support\FHIR.Support.Zip.pas',
  FHIR.Support.WInInet in '..\reference-platform\support\FHIR.Support.WInInet.pas',
  FHIR.Support.Controllers in '..\reference-platform\support\FHIR.Support.Controllers.pas',
  FHIR.Support.Certs in '..\reference-platform\support\FHIR.Support.Certs.pas',
  FHIR.Misc.GraphQL in '..\reference-platform\support\FHIR.Misc.GraphQL.pas',
  BulkDataForm in 'BulkDataForm.pas' {BulkDataDialog},
  UsageContextForm in 'UsageContextForm.pas' {UsageContextDialog},
  FHIR.Base.Factory in '..\reference-platform\base\FHIR.Base.Factory.pas',
  FHIR.Base.Validator in '..\reference-platform\base\FHIR.Base.Validator.pas',
  FHIR.XVersion.Resources in '..\reference-platform\xversion\FHIR.XVersion.Resources.pas',
  FHIR.Base.Narrative in '..\reference-platform\base\FHIR.Base.Narrative.pas',
  FHIR.Base.PathEngine in '..\reference-platform\base\FHIR.Base.PathEngine.pas',
  FHIR.R4.Common in '..\reference-platform\r4\FHIR.R4.Common.pas',
  FHIR.R4.Factory in '..\reference-platform\r4\FHIR.R4.Factory.pas',
  FHIR.R4.Narrative in '..\reference-platform\r4\FHIR.R4.Narrative.pas',
  FHIR.R4.Validator in '..\reference-platform\r4\FHIR.R4.Validator.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMasterToolsForm, MasterToolsForm);
  Application.CreateForm(TBulkDataDialog, BulkDataDialog);
  Application.CreateForm(TUsageContextDialog, UsageContextDialog);
  Application.CreateForm(TBulkDataDialog, BulkDataDialog);
  Application.CreateForm(TUsageContextDialog, UsageContextDialog);
  Application.CreateForm(TUsageContextDialog, UsageContextDialog);
  Application.Run;
end.