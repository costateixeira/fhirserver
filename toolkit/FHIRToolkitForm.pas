unit FHIRToolkitForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Platform,
  FMX.Layouts, FMX.ListBox, FMX.TabControl, FMX.Controls.Presentation, FMX.DialogService,
  System.ImageList, FMX.ImgList, FMX.Menus, FMX.WebBrowser,
  IniFiles,
  SystemSupport, TextUtilities,
  FHIRBase, FHIRTypes, FHIRResources, FHIRClient, FHIRUtilities, FHIRIndexBase, FHIRIndexInformation, FHIRSupport,
  FHIRContext, FHIRProfileUtilities,
  ServerForm, CapabilityStatementEditor, BaseResourceFrame, BaseFrame, SourceViewer, ListSelector,
  ValueSetEditor, HelpContexts, ProcessForm, SettingsDialog, AboutDialog;

type

  TMasterToolsForm = class(TForm)
    tbMain: TTabControl;
    Label2: TLabel;
    TabItem1: TTabItem;
    pnlToolbar: TPanel;
    Panel1: TPanel;
    lbServers: TListBox;
    btnConnect: TButton;
    btnAddServer: TButton;
    btnRemoveServer: TButton;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Label1: TLabel;
    lbFiles: TListBox;
    btnReopen: TButton;
    btnRemoveFile: TButton;
    btnOpen: TButton;
    btnNew: TButton;
    ToolBar1: TToolBar;
    tbnNew: TButton;
    tbnOpen: TButton;
    tbnConnect: TButton;
    odFile: TOpenDialog;
    StyleBook1: TStyleBook;
    ToolbarImages: TImageList;
    tbnSave: TButton;
    tbnSaveAs: TButton;
    tbnClose: TButton;
    Timer1: TTimer;
    sdFile: TSaveDialog;
    MainMenu1: TMainMenu;
    mnuFile: TMenuItem;
    mnuFileNew: TMenuItem;
    mnuFileOpen: TMenuItem;
    mnuFileSave: TMenuItem;
    mnuFileSaveAs: TMenuItem;
    mnuFileClose: TMenuItem;
    MenuItem1: TMenuItem;
    mnuFileExit: TMenuItem;
    tbnSource: TButton;
    mnuFileSource: TMenuItem;
    pnlHelp: TPanel;
    webHelp: TWebBrowser;
    tbnHelpContext: TButton;
    mnuHelp: TMenuItem;
    mnuHelpContext: TMenuItem;
    splitHelp: TSplitter;
    btnSettings: TButton;
    MenuItem2: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem6: TMenuItem;
    mnuHelpAbout: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lbServersClick(Sender: TObject);
    procedure lbFilesClick(Sender: TObject);
    procedure btnRemoveServerClick(Sender: TObject);
    procedure btnAddServerClick(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure btnReopenClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure tbnSaveClick(Sender: TObject);
    procedure tbnSaveAsClick(Sender: TObject);
    procedure tbnCloseClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnRemoveFileClick(Sender: TObject);
    procedure tbnSourceClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure tbnHelpContextClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure mnuHelpAboutClick(Sender: TObject);
  private
    { Private declarations }
    FIni : TIniFile;
    FShowHelp : boolean;
    FFocus : TStyledControl;
    FIndexes : TFhirIndexList;
    FContext : TBaseWorkerContext;
    FIsStopped : boolean;

    procedure saveServers;
    procedure saveFiles;
    procedure openResourceFromFile(filename : String; res : TFHIRResource; format : TFHIRFormat; frameClass : TBaseResourceFrameClass);
    procedure OpenResourcefromClient(sender : TObject; client : TFHIRClient; format : TFHIRFormat; resource : TFHIRResource);
    procedure newResource(rClass : TFhirResourceClass; frameClass : TBaseResourceFrameClass);
    procedure addFileToList(filename : String);
    procedure addServerToList(url : String);
    function frameForResource(res : TFhirResource) : TBaseResourceFrameClass;
    function doSave : boolean;
    function doSaveAs : boolean;
    procedure updateHelpStatus;
    procedure updateHelpText;
    function processHelpContext(helpContext : String) : String;
    function searchDesc(s : String) : String;
    procedure fhirDefn(s : String; b : TStringBuilder);
    function GetStopped: boolean;
  public
    procedure dowork(Sender : TObject; opName : String; proc : TWorkProc);
    procedure threadMonitorProc(sender : TFhirClient; var stop : boolean);
  end;

var
  MasterToolsForm: TMasterToolsForm;

implementation

{$R *.fmx}

procedure TMasterToolsForm.addFileToList(filename: String);
var
  i : integer;
begin
  for i := lbFiles.Count - 1 downto 0 do
    if lbFiles.items[i] = filename then
      lbFiles.Items.Delete(i);
  lbFiles.Items.Insert(0, filename);
  saveFiles;
  lbFilesClick(nil);
end;

procedure TMasterToolsForm.addServerToList(url: String);
var
  i : integer;
begin
  for i := lbServers.Count - 1 downto 0 do
    if lbServers.items[i] = url then
      lbServers.Items.Delete(i);
  lbServers.Items.Insert(0, url);
  saveServers;
  lbServersClick(nil);
end;

procedure TMasterToolsForm.btnAddServerClick(Sender: TObject);
begin
  TDialogService.InputQuery('Server Address', ['URL'], [''],
    procedure(const AResult: TModalResult; const AValues: array of string)
    begin
      if (AResult = mrOK) and (aValues[0] <> '') then
        addServerToList(AValues[0]);
    end);
end;

procedure TMasterToolsForm.btnConnectClick(Sender: TObject);
var
  client : TFhirClient;
  tab : TTabItem;
  serverForm : TServerFrame;
  cs : TFhirCapabilityStatement;
begin
  client := TFhirThreadedClient.create(TFhirHTTPClient.Create(nil, lbServers.Items[lbServers.ItemIndex], false, FIni.ReadInteger('HTTP', 'timeout', 5) * 1000, FIni.ReadString('HTTP', 'proxy', '')), threadMonitorProc);
  try
    doWork(nil, 'Connect',
      procedure
      begin
        cs := client.conformance(false);
      end);
    try
      tab := tbMain.Add(TTabItem);
      tab.Text := lbServers.Items[lbServers.ItemIndex];
      tbMain.ActiveTab := tab;
      serverForm := TServerFrame.create(tab);
      serverForm.Parent := tab;
      tab.TagObject := serverForm;
      serverForm.OnWork := dowork;
      serverForm.TagObject := tab;
      serverForm.tabs := tbMain;
      serverForm.Ini := FIni;
      serverForm.Tab := tab;
      serverForm.Align := TAlignLayout.Client;
      serverForm.Client := client.link;
      serverForm.CapabilityStatement := cs.link;
      serverForm.OnOpenResource := OpenResourcefromClient;
      serverForm.OnWork :=  dowork;
      serverForm.load;
      addServerToList(client.address);
    finally
      cs.free;
    end;
  finally
    client.Free;
  end;
end;

procedure TMasterToolsForm.btnNewClick(Sender: TObject);
var
  form : TListSelectorForm;
begin
  form := TListSelectorForm.create(nil);
  try
    form.ListBox1.ShowCheckboxes := false;
    form.ListBox1.items.Add('CapabilityStatement');
    form.ListBox1.items.Add('ValueSet');
    form.caption := 'Create New File';
    if (form.ShowModal = mrOk) then
      case form.ListBox1.ItemIndex of
        0 : newResource(TFhirCapabilityStatement, TCapabilityStatementEditorFrame);
        1 : newResource(TFhirValueSet, TValueSetEditorFrame);
      end;
  finally
    form.Free;
  end;
end;

procedure TMasterToolsForm.btnOpenClick(Sender: TObject);
var
  res : TFhirResource;
  format : TFHIRFormat;
begin
  if odFile.Execute then
  begin
    try
      format := ffUnspecified;
      res := fileToResource(odFile.Filename, format);
      try
        if res is TFhirCapabilityStatement then
          openResourceFromFile(odFile.Filename, res, format, TCapabilityStatementEditorFrame)
        else if res is TFhirValueSet then
          openResourceFromFile(odFile.Filename, res, format, TValueSetEditorFrame)
        else
          MessageDlg('Unsupported Resource Type: '+res.fhirType, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
      finally
        res.free;
      end;
    except
      on e : Exception do
        MessageDlg('Error reading Resource: '+e.Message, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
    end;
  end;
end;

procedure TMasterToolsForm.btnRemoveFileClick(Sender: TObject);
var
  i : integer;
begin
  i := lbFiles.ItemIndex;
  lbFiles.items.Delete(i);
  if i = lbFiles.items.Count then
    dec(i);
  lbFiles.ItemIndex := i;
  saveFiles;
  lbFilesClick(nil);
end;

procedure TMasterToolsForm.btnRemoveServerClick(Sender: TObject);
var
  i : integer;
begin
  i := lbServers.ItemIndex;
  lbServers.items.Delete(i);
  if i = lbServers.items.Count then
    dec(i);
  lbServers.ItemIndex := i;
  saveServers;
  lbServersClick(nil);
end;

procedure TMasterToolsForm.btnReopenClick(Sender: TObject);
var
  res : TFhirResource;
  fn : String;
  format : TFHIRFormat;
begin
  fn := lbFiles.Items[lbFiles.ItemIndex];
  try
    format := ffUnspecified;
    res := fileToResource(fn, format);
    try
      openResourceFromFile(fn, res, format, frameForResource(res));
    finally
      res.free;
    end;
  except
    on e : Exception do
      MessageDlg('Error reading Resource: '+e.Message, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
  end;
end;

procedure TMasterToolsForm.btnSettingsClick(Sender: TObject);
var
  form : TSettingsForm;
begin
  form := TSettingsForm.create(self);
  try
    form.Ini := FIni;
    form.showmodal;
  finally
    form.free;
  end;
end;

procedure TMasterToolsForm.btnStopClick(Sender: TObject);
begin
  FIsStopped := true;
end;

procedure TMasterToolsForm.tbnSaveClick(Sender: TObject);
begin
  doSave;
end;

procedure TMasterToolsForm.tbnSourceClick(Sender: TObject);
var
  form : TSourceViewerForm;
  frame : TBaseFrame;
begin
  frame := tbMain.ActiveTab.TagObject as TBaseFrame;
  if (frame <> nil) and frame.hasResource then
  begin
    form := TSourceViewerForm.create(self);
    try
      form.current := frame.currentResource.Link;
      form.original := frame.originalResource.Link;
      form.ShowModal;
    finally
      form.Free;
    end;
  end;
end;

procedure TMasterToolsForm.threadMonitorProc(sender: TFhirClient; var stop: boolean);
begin
  Application.ProcessMessages;
  stop :=  FIsStopped;
end;

procedure TMasterToolsForm.tbnSaveAsClick(Sender: TObject);
begin
  doSaveAs;
end;

procedure TMasterToolsForm.tbnCloseClick(Sender: TObject);
var
  i : integer;
  frame : TBaseFrame;
  procedure closeit;
  begin
    i := tbMain.TabIndex;
    tbMain.ActiveTab.Free;
    if i > 0 then
      tbMain.TabIndex := i - 1
    else
      tbMain.TabIndex := 0;
  end;
begin
  frame := tbMain.ActiveTab.TagObject as TBaseFrame;
  if (frame <> nil) then
  begin
    if frame.isDirty then
    begin
      case MessageDlg(tbMain.ActiveTab.Text+' contains unsaved data. Save the data first?', TMsgDlgType.mtConfirmation, mbYesNoCancel, 0) of
        mrYes :
          if doSave then
            closeit;
        mrNo : closeit;
        mrCancel : exit;
      end;
    end
    else
      closeit;
    end;
end;

procedure TMasterToolsForm.tbnHelpContextClick(Sender: TObject);
begin
  FShowHelp := not FShowHelp;
  FIni.WriteBool('Help', 'context', FShowHelp);
  FFocus := nil;
  updateHelpStatus;
end;

procedure TMasterToolsForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

function TMasterToolsForm.GetStopped: boolean;
begin
  result := FIsStopped;
end;


function TMasterToolsForm.doSave: boolean;
var
  frame : TBaseFrame;
  ok : boolean;
begin
  result := false;
  frame := tbMain.ActiveTab.TagObject as TBaseFrame;

  if frame <> nil then
  begin
    if frame.canSave then
    begin
      ok := false;
      frame.OnStopped := GetStopped;
      frame.work('Save',
        procedure
        begin;
          ok := frame.save;
        end);
      result := ok;
    end
    else
      result := doSaveAs;
  end;
end;

function TMasterToolsForm.doSaveAs: boolean;
var
  frame : TBaseFrame;
  ok : boolean;
begin
  result := false;
  frame := tbMain.ActiveTab.TagObject as TBaseFrame;

  if frame <> nil then
  begin
    if sdFile.execute then
    begin
      if frame.canSaveAs then
      begin
        ok := false;
        frame.work('Save As',
          procedure
          begin
            if sdFile.FilterIndex = 0 then
              ok := frame.saveAs(sdFile.Filename, ffXml)
            else if sdFile.FilterIndex = 1 then
              ok := frame.saveAs(sdFile.Filename, ffJson)
            else if sdFile.FilterIndex = 2 then
              ok := frame.saveAs(sdFile.Filename, ffTurtle)
            else
              raise Exception.Create('Unknown format');
            addFileToList(sdFile.FileName);
          end);
        result := ok;
      end
      else
        raise Exception.create('Unable to save file');
    end;
  end;
end;

procedure TMasterToolsForm.dowork(Sender: TObject; opName : String; proc: TWorkProc);
var
  fcs : IFMXCursorService;
  form : TProcessingForm;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXCursorService) then
    fcs := TPlatformServices.Current.GetPlatformService(IFMXCursorService) as IFMXCursorService
  else
    fcs := nil;
  if Assigned(fcs) then
  begin
    Cursor := fcs.GetCursor;
    fcs.SetCursor(crHourGlass);
  end;
  try
    FIsStopped := false;
    if assigned(sender) and (sender is TBaseFrame) then
      TBaseFrame(sender).OnStopped := GetStopped;
    form := TProcessingForm.Create(self);
    try
      form.lblOperation.text := opName;
      form.Button1.OnClick := btnStopClick;
      form.Show;
      {$IFDEF MSWINDOWS}
      Application.ProcessMessages;
      {$ENDIF}
      proc;
    finally
      form.Free;
    end;
  finally
    if Assigned(fCS) then
      fcs.setCursor(Cursor);
  end;
end;

procedure TMasterToolsForm.fhirDefn(s: String; b : TStringBuilder);
var
  n : string;
  sd : TFhirStructureDefinition;
  ed : TFhirElementDefinition;
begin
  if s.Contains('.') then
    n := s.Substring(0, s.IndexOf('.'))
  else
    n := s;
  sd := FContext.fetchResource(frtStructureDefinition, 'http://hl7.org/fhir/StructureDefinition/'+n) as TFhirStructureDefinition;
  if sd = nil then
    b.Append('<p>uUnknown path:' +s+'</p>')
  else
  begin
    for ed in sd.snapshot.elementList do
    begin
      if ed.path = s then
      begin
        b.Append('<p><b>'+s+'</b></p>');
        b.Append('<p>Definition: '+ed.definition+'</p>');
        if ed.comment <> '' then
          b.Append('<p>Comments: '+ed.comment+'</p>');
        exit;
      end;
    end;
    b.Append('<p>Unknown path:' +s+'</p>')
  end;
end;

procedure TMasterToolsForm.FormActivate(Sender: TObject);
var
  form : TProcessingForm;
  fcs : IFMXCursorService;
begin
  if FContext = nil then
  begin
    if TPlatformServices.Current.SupportsPlatformService(IFMXCursorService) then
      fcs := TPlatformServices.Current.GetPlatformService(IFMXCursorService) as IFMXCursorService
    else
      fcs := nil;
    if Assigned(fcs) then
    begin
      Cursor := fcs.GetCursor;
      fcs.SetCursor(crHourGlass);
    end;
    try
      form := TProcessingForm.Create(self);
      try
        form.lblOperation.text := 'Loading Data';
        form.Button1.enabled := false;
        form.Show;
        {$IFDEF MSWINDOWS}
        Application.ProcessMessages;
        {$ENDIF}

        FContext := TBaseWorkerContext.Create;
        FContext.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)))+'profiles-types.xml');
        FContext.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)))+'profiles-resources.xml');
      finally
        form.Free;
      end;
    finally
      if Assigned(fCS) then
        fcs.setCursor(Cursor);
    end;
  end;
end;

procedure TMasterToolsForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  dirty : boolean;
  i : integer;
  obj : TBaseFrame;
  form : TListSelectorForm;
begin
  dirty := false;
  form := TListSelectorForm.Create(self);
  try
    form.Caption := 'Unsaved Content found. Which files do you want to save?';
    form.okWithNoneSelected := true;
    form.button1.Text := 'Close';
    for i := 1 to tbMain.TabCount - 1 do
    begin
      obj := tbMain.Tabs[i].TagObject as TBaseFrame;
      if (obj.isDirty) then
      begin
        dirty := true;
        form.ListBox1.Items.AddObject(obj.nameForSaveDialog, obj)
      end;
    end;
    if not dirty then
      CanClose := true
    else
      CanClose := form.ShowModal = mrOk;
      for i := 0 to form.ListBox1.Items.Count - 1 do
        if form.ListBox1.ListItems[i].IsChecked then
          if not TBaseFrame(form.ListBox1.Items.Objects[i]).save then
          begin
            CanClose := false;
            exit;
          end;
  finally
    form.Free;
  end;
end;

procedure TMasterToolsForm.FormCreate(Sender: TObject);
begin
  FIni := TIniFile.Create(IncludeTrailingPathDelimiter(SystemTemp) + 'settings.ini');
  FIni.ReadSection('Servers', lbServers.Items);
  if lbServers.Items.count = 0 then
    lbServers.Items.add('http://test.fhir.org/r3');
  lbServers.ItemIndex := 0;
  lbServersClick(self);
  FIni.ReadSection('Files', lbFiles.Items);
  if lbFiles.Items.count > 0 then
    lbFiles.ItemIndex := 0;
  lbFilesClick(self);
  Left := FIni.ReadInteger('Window', 'left', left);
  Top := FIni.ReadInteger('Window', 'top', top);
  Width := FIni.ReadInteger('Window', 'width', width);
  Height := FIni.ReadInteger('Window', 'height', height);
  FShowHelp := FIni.ReadBool('Help', 'context', false);
  updateHelpStatus;
end;

procedure TMasterToolsForm.FormDestroy(Sender: TObject);
begin
  saveServers;
  saveFiles;
  try
    FIni.WriteInteger('Window', 'left', left);
    FIni.WriteInteger('Window', 'top', top);
    FIni.WriteInteger('Window', 'width', width);
    FIni.WriteInteger('Window', 'height', height);
  except
  end;
  FIni.Free;
  FIndexes.Free;
  FContext.Free;
end;

function TMasterToolsForm.frameForResource(res: TFhirResource): TBaseResourceFrameClass;
begin
  if res is TFhirCapabilityStatement then
    result := TCapabilityStatementEditorFrame
  else if res is TFhirValueSet then
    result := TValueSetEditorFrame
  else
    MessageDlg('Unsupported Resource Type: '+res.fhirType, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
end;

procedure TMasterToolsForm.lbFilesClick(Sender: TObject);
begin
  btnReopen.Enabled := lbFiles.ItemIndex >= 0;
  btnRemoveFile.Enabled := lbFiles.ItemIndex >= 0;
end;

procedure TMasterToolsForm.lbServersClick(Sender: TObject);
begin
  btnConnect.Enabled := lbServers.ItemIndex >= 0;
  btnRemoveServer.Enabled := lbServers.ItemIndex >= 0;
end;

procedure TMasterToolsForm.mnuHelpAboutClick(Sender: TObject);
var
  form : TAboutForm;
begin
  form := TAboutForm.Create(self);
  try
    form.ShowModal;
  finally
    form.Free;
  end;
end;

procedure TMasterToolsForm.newResource(rClass : TFhirResourceClass; frameClass : TBaseResourceFrameClass);
var
  tab : TTabItem;
  frame : TFrame;
  fcs : IFMXCursorService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXCursorService) then
    fcs := TPlatformServices.Current.GetPlatformService(IFMXCursorService) as IFMXCursorService
  else
    fcs := nil;
  if Assigned(fcs) then
  begin
    Cursor := fcs.GetCursor;
    fcs.SetCursor(crHourGlass);
  end;
  try
    tab := tbMain.Add(TTabItem);
    tbMain.ActiveTab := tab;
    tab.Text := 'New '+rClass.ClassName.Substring(5);
    tab.Hint := tab.Text;
    tab.ShowHint := true;
    frame := frameClass.create(tab);
    tab.TagObject := frame;
    frame.TagObject := tab;
    frame.Parent := tab;
    frame.tabs := tbMain;
    frame.OnWork := dowork;
    frame.Ini := FIni;
    frame.Tab := tab;
    frame.Align := TAlignLayout.Client;
    frame.Filename := '';
    frame.resource := rClass.Create;
    frame.load;
  finally
    if Assigned(fCS) then
      fcs.setCursor(Cursor);
  end;
end;

procedure TMasterToolsForm.openResourceFromFile(filename: String; res: TFHIRResource; format : TFHIRFormat; frameClass: TBaseResourceFrameClass);
var
  tab : TTabItem;
  frame : TFrame;
  fcs : IFMXCursorService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXCursorService) then
    fcs := TPlatformServices.Current.GetPlatformService(IFMXCursorService) as IFMXCursorService
  else
    fcs := nil;
  if Assigned(fcs) then
  begin
    Cursor := fcs.GetCursor;
    fcs.SetCursor(crHourGlass);
  end;
  try
    tab := tbMain.Add(TTabItem);
    tbMain.ActiveTab := tab;
    tab.Text := ExtractFileName(filename);
    tab.Hint := filename;
    tab.ShowHint := true;
    frame := frameClass.create(tab);
    tab.TagObject := frame;
    frame.TagObject := tab;
    frame.Parent := tab;
    frame.tabs := tbMain;
    frame.OnWork := dowork;
    frame.Ini := FIni;
    frame.Tab := tab;
    frame.Align := TAlignLayout.Client;
    frame.Filename := filename;
    frame.resource := res.link;
    frame.format := format;
    frame.load;
    addFileToList(filename);
  finally
    if Assigned(fCS) then
      fcs.setCursor(Cursor);
  end;
end;

procedure TMasterToolsForm.OpenResourceFromClient(sender : TObject; client : TFHIRClient; format : TFHIRFormat; resource : TFHIRResource);
var
  tab : TTabItem;
  frame : TFrame;
  fcs : IFMXCursorService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXCursorService) then
    fcs := TPlatformServices.Current.GetPlatformService(IFMXCursorService) as IFMXCursorService
  else
    fcs := nil;
  if Assigned(fcs) then
  begin
    Cursor := fcs.GetCursor;
    fcs.SetCursor(crHourGlass);
  end;
  try
    tab := tbMain.Add(TTabItem);
    tbMain.ActiveTab := tab;
    tab.Text := resource.fhirType+'/'+resource.id;
    tab.Hint := client.address+'/'+resource.fhirType+'/'+resource.id;
    tab.ShowHint := true;
    frame := frameForResource(resource).create(tab);
    tab.TagObject := frame;
    frame.TagObject := tab;
    frame.Parent := tab;
    frame.tabs := tbMain;
    frame.OnWork := dowork;
    frame.Ini := FIni;
    frame.Tab := tab;
    frame.Align := TAlignLayout.Client;
    frame.Client := client.link;
    frame.Filename := '$$';
    frame.resource := resource.clone;
    frame.format := format;
    frame.load;
  finally
    if Assigned(fCS) then
      fcs.setCursor(Cursor);
  end;
end;

procedure TMasterToolsForm.saveFiles;
var
  s : String;
begin
  try
    FIni.EraseSection('Files');
    for s in lbFiles.Items do
      FIni.WriteString('Files', s, '');
  except
    // nothing we can do
  end;
end;

procedure TMasterToolsForm.saveServers;
var
  s : String;
begin
  try
    FIni.EraseSection('Servers');
    for s in lbServers.Items do
      FIni.WriteString('Servers', s, '');
  except
    // nothing we can do
  end;
end;

function TMasterToolsForm.searchDesc(s: String): String;
var
  builder : TFHIRIndexBuilder;
  comps : TFHIRCompartmentList;
  index : TFHIRIndex;
  parts : TArray<string>;
begin
  if FIndexes = nil then
  begin
    FIndexes := TFhirIndexList.Create;
    comps := TFHIRCompartmentList.Create;
    builder := TFHIRIndexBuilder.Create;
    try
      builder.registerIndexes(Findexes, comps);
    finally
      builder.Free;
      comps.free;
    end;
  end;
  result := '';
  parts := s.Split(['.']);
  index := FIndexes.getByName(parts[0], parts[1]);
  if index <> nil then
    result := '<p>'+FormatTextToHTML(index.Description)+'</p>'+'<p>'+index.Name+' : '+CODES_TFhirSearchParamTypeEnum[index.SearchType]+'</p>';
end;

procedure TMasterToolsForm.Timer1Timer(Sender: TObject);
var
  frame : TBaseFrame;
begin
  frame := tbMain.ActiveTab.TagObject as TBaseFrame;
  tbnSave.Enabled := false;
  tbnSaveAs.Enabled := false;
  tbnClose.Enabled := false;
  tbnSource.Enabled := false;
  if (frame <> nil) then
  begin
    tbnClose.Enabled := true;
    tbnSave.Enabled := frame.canSave;
    tbnSaveAs.Enabled := frame.canSaveAs;
    tbnSource.Enabled := frame.hasResource;
  end;
  updateHelpText;
end;

function template(fragment : String) : String;
begin
result :=
'<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">'+#13#10+
'<head>'+#13#10+
'  <meta charset="utf-8" http-equiv="X-UA-Compatible" content="IE=edge" />'+#13#10+
' <style>'+#13#10+
'  body { background-color: rgb(255, 254, 245);'+#13#10+
'	margin: 0px;'+#13#10+
'	padding: 0px;'+#13#10+
'	height: 100%;'+#13#10+
'	font-size: 10px;'+#13#10+
'	font-family: verdana;'+#13#10+
'}'+#13#10+
' </style>'+#13#10+
'</head>'+#13#10+
fragment+#13#10+
'<body>'+#13#10+
''+#13#10+
'</body>'+#13#10+
'</html>'+#13#10;
end;

procedure TMasterToolsForm.updateHelpStatus;
begin
  if FShowHelp then
  begin
    pnlHelp.visible := FShowHelp;
    splitHelp.visible := FShowHelp;
  end
  else
  begin
    splitHelp.visible := FShowHelp;
    pnlHelp.visible := FShowHelp;
  end;

  if (pnlHelp.visible) then
    webHelp.LoadFromStrings(template(''), 'my.html');
end;

procedure TMasterToolsForm.updateHelpText;
var
  focus : IControl;
  obj : TStyledControl;
  s : String;
begin
  if FShowHelp then
  begin
    obj := nil;
    focus := Focused;
    if (focus <> nil) and (focus.GetObject is TStyledControl) then
      obj := focus.GetObject as TStyledControl;
    if (focus <> nil) and (focus.GetObject = webHelp) then
      exit;

    if obj <> FFocus then
    begin
      FFocus := obj;
      if (obj = nil) or (obj.HelpContext = 0) then
        webHelp.LoadFromStrings(template(''), 'my.html')
      else
      begin
        s := Help_Strings[obj.HelpContext];
        if s <> '' then
          webHelp.LoadFromStrings(template(processHelpContext(s)), 'my.html')
        else
          webHelp.LoadFromStrings(template(''), 'my.html');
      end;
    end;
  end;
end;

function TMasterToolsForm.processHelpContext(helpContext: String): String;
var
  b : TStringBuilder;
  parts : TArray<String>;
  s : String;
begin
  b := TStringBuilder.Create;
  try
    parts := helpContext.Split([',']);
    for s in parts do
      if s.StartsWith('ui:') then
        b.Append('<p>'+FormatTextToHTML(s.Substring(3).trim)+'</p>')
      else if s.StartsWith('search:') then
        b.Append(searchDesc(s.Substring(7)))
      else if s.StartsWith('fhir:') then
        fhirDefn(s.Substring(5), b)
      else
        b.Append('<p>Unknown context '+s+'</p>');
    result := b.ToString;
  finally
    b.Free;
  end;
end;


end.

