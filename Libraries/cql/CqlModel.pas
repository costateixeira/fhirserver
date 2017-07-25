unit CqlModel;

interface

uses
  SysUtils, Classes,
  ParserSupport,
  AdvObjects, AdvGenerics,
  FHIRBase;

type
  TCqlContextType = (CqlContextPatient, CqlContextPopulation);
  TCqlAccessLevel = (CqlAccessDefault, CqlAccessPublic, CqlAccessPrivate);
  TCqlTypeKind = (CqlTypeSimple, CqlTypeList, CqlTypeInterval, CqlTypeTuple, CqlTypeChoice);
  TCqlOperationId = (copNull,
    copPower, copUnion, copIntersect, copExcept, copOf, copIncludes,
    copBetween, copConvert, copStart, copEnd, copWidth, copSuccessor,
    copPredecessor, copSingleton, copPoint, copMinimum, copMaximum, copDistinct,
    copCollapse, copFlatten, copFrom, copInterval, copUnnamedWhen);

  TCqlFunctionDefinitionId = (cfNull, cfCode, cfInterval, cfAgeInYears, cfAgeInYearsAt, cfToday, cfDateTime, cfLast, cfCount, cfConcept);
  TCqlModifier = (CqlModifierNull, CqlModifierNot{, CqlModifierSame, CqlModifierBefore, CqlModifierAfter, CqlModifierWithin, CqlModifierDuring});
  TCqlStructureType = (cstNull,
    cstPlaceHolder, // for operations that hae no left side
    cstRetrieve, // retrieve and/or query
    cstMultiRetrieve, // using 'from'....
    cstIf, // if statement
    cstCase, cstCaseItem,
    cstType,
    cstConvert, // convert X to...
    cstList, // list specifier
    cstTuple); // tuple specifier

  TCqlExpressionReturnType = (cqlReturnUnspecified, cqlReturnAll, cqlReturnDistinct);
  TCqlSortOrder = (cqlSortNotSpecified, cqlSortAscending, cqlSortDescending);

const
  CODES_AccessLevel : array [TCqlAccessLevel] of String = ('', 'public', 'private');
  CODES_CqlModifier : array [TCqlModifier] of string = ('', 'not' {, 'same', 'before', 'after', 'within', 'during'});
  CODES_CqlOperationId : array [TCqlOperationId] of string = ('',
     '^', 'union', 'intersect', 'except', 'of', 'includes',
     'between', 'convert', 'start', 'end', 'width', 'successor',
     'predecessor', 'singleton', 'point', 'minimum', 'maximum', 'distinct',
     'collapse', 'flatten', 'from', 'y-y', 'x-x');
  FOLLOWING_WORDS_CqlOperationId : array [TCqlOperationId] of String = ('',
    '', '', '', '', '', '',
    '', '', 'of', 'of', 'of', 'of',
    'of', 'from', 'from', '', '',
    '', '', '', '', '',  '');
  NAMES_CqlFunctions : array [TCqlFunctionDefinitionId] of string = ('', '.xx..', '.xx..', 'AgeInYears', 'AgeInYearsAt', 'Today', 'DateTime', 'Last', 'Count', 'Concept');

  NAMES_UNPREFIXED_OPERATORS : array of String = ['start', 'end', 'width', 'successor', 'predecessor', 'singleton', 'point', 'minimum', 'maximum', 'distinct', 'collapse', 'flatten', '-', '+'];

type
  { Foundation Stuff }

  TCqlElement = {abstract} class (TAdvObject)
  private
    FStartPosition : TSourceLocation;
    FEndPosition : TSourceLocation;
  public
    property StartPosition : TSourceLocation read FStartPosition write FStartPosition;
    property EndPosition : TSourceLocation read FEndPosition write FEndPosition;
  end;

  TCqlScopedIdReference = class (TCqlElement)
  private
    FLibraryName : String;
    FId : String;
  public
    function Link : TCqlScopedIdReference; overload;
    property LibraryName : String read FLibraryName write FLibraryName;
    property Id : String read FId write FId;
  end;

  TCqlTypeSpecifier = class (TCqlElement)
  private
    FKind: TCqlTypeKind;
    FId: String;
    FLibraryName: String;
    FParameters: TAdvList<TCqlTypeSpecifier>;
    FElements: TAdvMap<TCqlTypeSpecifier>;

  public
    Constructor Create; override;
    Destructor Destroy; override;
    function Link : TCqlTypeSpecifier; overload;

    property Kind : TCqlTypeKind read FKind write FKind;
    property LibraryName : String read FLibraryName write FLibraryName;
    property Id : String read FId write FId;
    Property Parameters : TAdvList<TCqlTypeSpecifier> read FParameters;
    Property Elements : TAdvMap<TCqlTypeSpecifier> read FElements;
  end;


  TCqlIntervalOperation = (CqlIntervalNull, CqlIntervalSame, CqlIntervalIncludes, CqlIntervalDuring, CqlIntervalIncludedIn, CqlIntervalMeets, CqlIntervalOverlaps, CqlIntervalStarts, CqlIntervalEnds, CqlIntervalWithin, CqlIntervalBefore, CqlIntervalAfter);
  TCqlIntervalPrecision = (CqqlPrecsionYear, CqqlPrecsionMonth, CqqlPrecsionWeek, CqqlPrecsionDay, CqqlPrecsionHour, CqqlPrecsionMinute, CqqlPrecsionSecond, CqqlPrecsionMillisecnd);
  TCqlIntervalLeftQualifier = (CqlLeftNull, CqlLeftStarts, CqlLeftEnds, CqlLeftOccurs);
  TCqlIntervalRelativeness = (CqlRelativeNull, CqlRelativeBefore, CqlRelativeAfter, CqlRelativeLessThan, CqlRelativeOrLess, CqlRelativeMoreThan, CqlRelativeOrMore);
  TCqlIntervalRightQualifier = (CqlRightNull, CqlRightStart, CqlRightEnd);

  TCqlIntervalOperationDetails = record
    leftQualfier : TCqlIntervalLeftQualifier;
    properly : boolean;
    onOr : boolean;
    operation : TCqlIntervalOperation;
    relativeness : TCqlIntervalRelativeness;
    rightQualifier : TCqlIntervalRightQualifier;
    value : String;
    Units : String;
    precision : TCqlIntervalPrecision;
    procedure clear;
  end;

  // expressions - build un underlying FHIR Path library
  TCqlExpressionNode = class (TFHIRExpressionNode)
  private
    FCqlFunctionId: TCqlFunctionDefinitionId;
    FCqlOperation: TCqlOperationId;
    FModifier: TCqlModifier;
    FStructureType: TCqlStructureType; // not name.... for Cql usage
    FUnits: String;
    FCodePath: String;
    FTerminology: String;
    FAlias: string;
    FWithStmt: TCqlExpressionNode;
    FSuchThat: TCqlExpressionNode;
    FWhere: TCqlExpressionNode;
    FElements : TAdvMap<TCqlExpressionNode>;
    FItems : TAdvList<TCqlExpressionNode>;
    FLibraryName: String;
    FReturnType: TCqlExpressionReturnType;
    FReturn: TCqlExpressionNode;
    FThenStmt: TCqlExpressionNode;
    FIfTest: TCqlExpressionNode;
    FElseStmt: TCqlExpressionNode;
    FSort: TAdvList<TCqlExpressionNode>;
    FTypeInfo: TCqlTypeSpecifier;
    FSortOrder: TCqlSortOrder;
    FIntervalOpDetails : TCqlIntervalOperationDetails;
    procedure SetWithStmt(const Value: TCqlExpressionNode);
    procedure SetSuchThat(const Value: TCqlExpressionNode);
    procedure SetWhere(const Value: TCqlExpressionNode);
    function getElements: TAdvMap<TCqlExpressionNode>;
    procedure SetReturn(const Value: TCqlExpressionNode);
    procedure SetElseStmt(const Value: TCqlExpressionNode);
    procedure SetIfTest(const Value: TCqlExpressionNode);
    procedure SetThenStmt(const Value: TCqlExpressionNode);
    function getItems: TAdvList<TCqlExpressionNode>;
    procedure SetTypeInfo(const Value: TCqlTypeSpecifier);
    function GetSort: TAdvList<TCqlExpressionNode>;
  public
    Destructor Destroy; override;
    function Link : TCqlExpressionNode; overload;

    Property CqlFunctionId : TCqlFunctionDefinitionId read FCqlFunctionId write FCqlFunctionId;
    Property CqlOperation : TCqlOperationId read FCqlOperation write FCqlOperation;
    property Modifier : TCqlModifier read FModifier write FModifier;
    property StructureType : TCqlStructureType read FStructureType write FStructureType;
    Property LibraryName : String read FLibraryName write FLibraryName;
    property units : String read FUnits write FUnits;

    // query/retrieve:
    property codePath : String read FCodePath write FCodePath;
    property terminology : String read FTerminology write FTerminology;
    property alias : string read FAlias write FAlias;
    property withStmt : TCqlExpressionNode read FWithStmt write SetWithStmt;
    property suchThat : TCqlExpressionNode read FSuchThat write SetSuchThat;
    property where : TCqlExpressionNode read FWhere write SetWhere;
    property returnType : TCqlExpressionReturnType read FReturnType write FReturnType;
    property return : TCqlExpressionNode read FReturn write SetReturn;
    property sort : TAdvList<TCqlExpressionNode> read GetSort;
    property sortOrder : TCqlSortOrder read FSortOrder write FSortOrder;

    // if
    property ifTest : TCqlExpressionNode read FIfTest write SetIfTest;
    property thenStmt : TCqlExpressionNode read FThenStmt write SetThenStmt;
    property elseStmt : TCqlExpressionNode read FElseStmt write SetElseStmt;

    property elements : TAdvMap<TCqlExpressionNode> read getElements; // tuple
    property items : TAdvList<TCqlExpressionNode> read getItems; // list

    property TypeInfo : TCqlTypeSpecifier read FTypeInfo write SetTypeInfo;
    property IntervalOpDetails : TCqlIntervalOperationDetails read FIntervalOpDetails write FIntervalOpDetails;
  end;

  { Definition Stuff }

  TCqlNamed = {abstract} class (TCqlElement)
  private
    FName : String;
    FAccessLevel: TCqlAccessLevel;
  public
    property AccessLevel : TCqlAccessLevel read FAccessLevel write FAccessLevel;
    property Name : String read FName write FName;
  end;

  TCqlStatement = {abstract} class (TCqlNamed)
  private
    FContext : TCqlContextType;
  public
    Constructor Create; override;
    Destructor Destroy; override;
    function Link : TCqlStatement; overload;

    property Context : TCqlContextType read FContext write FContext;
  end;

  TCqlVersioned = {abstract} class (TCqlNamed)
  private
    FVersion : String;
  public
    property Version : String read FVersion write FVersion;
  end;

  TCqlTerminologyReference = class (TCqlVersioned)
  private
    FURL : String;
  public
    function Link : TCqlTerminologyReference; overload;

    property URL : String read FURL write FURL;
  end;

  TCqlCodeSystemReference = class (TCqlTerminologyReference)
  public
    function Link : TCqlCodeSystemReference; overload;
  end;

  TCqlValueSetReference = class (TCqlTerminologyReference)
  private
    FCodeSystems : TAdvList<TCqlScopedIdReference>;
    function GetCodeSystems: TAdvList<TCqlScopedIdReference>;
  public
    Constructor Create; override;
    Destructor Destroy; override;
    function Link : TCqlValueSetReference; overload;

    property CodeSystems : TAdvList<TCqlScopedIdReference> read GetCodeSystems;
  end;

  TCqlCodeDefinition = class (TCqlNamed)
  private
    FDisplay: String;
    FCode: String;
    FSystem: TCqlScopedIdReference;
  public
    Constructor Create; override;
    Destructor Destroy; override;
    function Link : TCqlCodeDefinition; overload;

    property code : String read FCode write FCode;
    property system : TCqlScopedIdReference read FSystem;
    property display : String read FDisplay write FDisplay;
  end;

  TCqlConceptDefinition = class (TCqlNamed)
  private
    FDisplay: String;
    FCodes : TAdvList<TCqlScopedIdReference>;
  public
    Constructor Create; override;
    Destructor Destroy; override;
    function Link : TCqlConceptDefinition; overload;

    property display : String read FDisplay write FDisplay;
    property Codes : TAdvList<TCqlScopedIdReference> read FCodes;
  end;


  TCqlExpressionDefinition = class (TCqlStatement)
  private
    FExpression: TCqlExpressionNode;
    procedure SetExpression(const Value: TCqlExpressionNode);
  public
    Constructor Create; override;
    Destructor Destroy; override;
    function Link : TCqlExpressionDefinition; overload;

    property expression : TCqlExpressionNode read FExpression write SetExpression;
  end;

  TCqlFunctionParameterDefinition = class (TCqlElement)
  private
    FName: String;
    FTypeDetails: TCqlTypeSpecifier;
    procedure SetTypeDetails(const Value: TCqlTypeSpecifier);
  public
    Constructor Create; override;
    Destructor Destroy; override;
    function Link : TCqlFunctionParameterDefinition; overload;

    property name : String read FName write FName;
    property typeDetails : TCqlTypeSpecifier read FTypeDetails write SetTypeDetails;
  end;

  TCqlFunctionDefinition = class (TCqlStatement)
  private
    FParameters: TAdvList<TCqlFunctionParameterDefinition>;
    FBody: TCqlExpressionNode;
    FTypeInfo: TCqlTypeSpecifier;
    procedure SetBody(const Value: TCqlExpressionNode);
    procedure SetTypeInfo(const Value: TCqlTypeSpecifier);
  public
    Constructor Create; override;
    Destructor Destroy; override;
    function Link : TCqlFunctionDefinition; overload;

    property parameters : TAdvList<TCqlFunctionParameterDefinition> read FParameters;
    property typeInfo : TCqlTypeSpecifier read FTypeInfo write SetTypeInfo;
    property body : TCqlExpressionNode read FBody write SetBody;
  end;

  TCqlParameterDefinition = class (TCqlNamed)
  private
    FTypeDetails : TCqlTypeSpecifier;
    FDefaultValue: TCqlExpressionNode;
    procedure SetDefaultValue(const Value: TCqlExpressionNode);
    procedure SetTypeDetails(const Value: TCqlTypeSpecifier);
  public
    Constructor Create; override;
    Destructor Destroy; override;
    function Link : TCqlParameterDefinition; overload;

    property TypeDetails : TCqlTypeSpecifier read FTypeDetails write SetTypeDetails;
    property DefaultValue : TCqlExpressionNode read FDefaultValue write SetDefaultValue;
  end;

  TCqlInclude = class (TCqlVersioned)
  private
    FAlias : String;
  public
    Constructor Create; override;
    Destructor Destroy; override;
    function Link : TCqlInclude; overload;

    property Alias : String read FAlias write FAlias;
  end;

  TCqlUsing = class (TCqlVersioned)
  private
  public
    function Link : TCqlUsing; overload;
  end;

  TCqlLibrary = class (TCqlVersioned)
  private
    FVersion : String;
    FUsing : TAdvList<TCqlUsing>;
    FIncludes : TAdvList<TCqlInclude>;
    FParameters : TAdvList<TCqlParameterDefinition>;
    FCodeSystems : TAdvList<TCqlCodeSystemReference>;
    FValueSets : TAdvList<TCqlValueSetReference>;
    FCodes : TAdvList<TCqlCodeDefinition>;
    FConcepts : TAdvList<TCqlConceptDefinition>;
    FDefinitions : TAdvList<TCqlExpressionDefinition>;
    FFunctions: TAdvList<TCqlFunctionDefinition>;
  public
    Constructor Create; override;
    Destructor Destroy; override;
    function Link : TCqlLibrary; overload;

    property Version : String read FVersion write FVersion;
    property Using : TAdvList<TCqlUsing> read FUsing;
    property Includes : TAdvList<TCqlInclude> read FIncludes;
    property Parameters : TAdvList<TCqlParameterDefinition> read FParameters;
    property CodeSystems : TAdvList<TCqlCodeSystemReference> read FCodeSystems;
    property ValueSets : TAdvList<TCqlValueSetReference> read FValueSets;
    property Codes : TAdvList<TCqlCodeDefinition> read FCodes;
    property Concepts : TAdvList<TCqlConceptDefinition> read FConcepts;
    property Definitions : TAdvList<TCqlExpressionDefinition> read FDefinitions;
    property Functions : TAdvList<TCqlFunctionDefinition> read FFunctions;
  end;

implementation


{ TCqlStatement }

constructor TCqlStatement.Create;
begin
  inherited;

end;

destructor TCqlStatement.Destroy;
begin

  inherited;
end;

function TCqlStatement.Link: TCqlStatement;
begin
  result := TCqlStatement(inherited Link);
end;

{ TCqlValueSetReference }

constructor TCqlValueSetReference.Create;
begin
  inherited;

end;

destructor TCqlValueSetReference.Destroy;
begin
  FCodeSystems.Free;
  inherited;
end;

function TCqlValueSetReference.GetCodeSystems: TAdvList<TCqlScopedIdReference>;
begin
  if FCodeSystems = nil then
    FCodeSystems := TAdvList<TCqlScopedIdReference>.create;
  result := FCodeSystems;
end;

function TCqlValueSetReference.Link: TCqlValueSetReference;
begin
  result := TCqlValueSetReference(inherited Link);
end;

{ TCqlParameterDefinition }

constructor TCqlParameterDefinition.Create;
begin
  inherited;
end;

destructor TCqlParameterDefinition.Destroy;
begin
  FTypeDetails.Free;
  FDefaultValue.Free;
  inherited;
end;

function TCqlParameterDefinition.Link: TCqlParameterDefinition;
begin
  result := TCqlParameterDefinition(inherited Link);
end;

procedure TCqlParameterDefinition.SetDefaultValue(const Value: TCqlExpressionNode);
begin
  FDefaultValue.Free;
  FDefaultValue := Value;
end;

procedure TCqlParameterDefinition.SetTypeDetails(const Value: TCqlTypeSpecifier);
begin
  FTypeDetails.Free;
  FTypeDetails := Value;
end;

{ TCqlInclude }

constructor TCqlInclude.Create;
begin
  inherited;
end;

destructor TCqlInclude.Destroy;
begin
  inherited;
end;

function TCqlInclude.Link: TCqlInclude;
begin
  result := TCqlInclude(inherited Link);
end;

{ TCqlLibrary }

constructor TCqlLibrary.Create;
begin
  inherited;
  FUsing := TAdvList<TCqlUsing>.Create;
  FIncludes := TAdvList<TCqlInclude>.create;
  FParameters := TAdvList<TCqlParameterDefinition>.create;
  FCodeSystems := TAdvList<TCqlCodeSystemReference>.create;
  FValueSets := TAdvList<TCqlValueSetReference>.create;
  FCodes := TAdvList<TCqlCodeDefinition>.create;
  FConcepts := TAdvList<TCqlConceptDefinition>.create;
  FDefinitions := TAdvList<TCqlExpressionDefinition>.create;
  FFunctions := TAdvList<TCqlFunctionDefinition>.create;
end;

destructor TCqlLibrary.Destroy;
begin
  FFunctions.Free;
  FDefinitions.Free;
  FConcepts.Free;
  FCodes.Free;
  FValueSets.Free;
  FCodeSystems.Free;
  FParameters.Free;
  FIncludes.Free;
  FUsing.Free;
  inherited;
end;

function TCqlLibrary.Link: TCqlLibrary;
begin
  result := TCqlLibrary(inherited Link);
end;

{ TCqlTerminologyReference }

function TCqlTerminologyReference.Link: TCqlTerminologyReference;
begin
  result := TCqlTerminologyReference(inherited Link);
end;

{ TCqlCodeSystemReference }

function TCqlCodeSystemReference.Link: TCqlCodeSystemReference;
begin
  result := TCqlCodeSystemReference(inherited Link);
end;

{ TCqlScopedIdReference }

function TCqlScopedIdReference.Link: TCqlScopedIdReference;
begin
  result := TCqlScopedIdReference(inherited Link);
end;

{ TCqlUsing }

function TCqlUsing.Link: TCqlUsing;
begin
  result := TCqlUsing(inherited Link);
end;

{ TCqlCodeDefinition }

constructor TCqlCodeDefinition.Create;
begin
  inherited;
  FSystem := TCqlScopedIdReference.create;
end;

destructor TCqlCodeDefinition.Destroy;
begin
  FSystem.Free;
  inherited;
end;

function TCqlCodeDefinition.Link: TCqlCodeDefinition;
begin
  result := TCqlCodeDefinition(inherited Link);
end;

{ TCqlConceptDefinition }

constructor TCqlConceptDefinition.Create;
begin
  inherited;
  FCodes := TAdvList<TCqlScopedIdReference>.create;
end;

destructor TCqlConceptDefinition.Destroy;
begin
  FCodes.Free;
  inherited;
end;

function TCqlConceptDefinition.Link: TCqlConceptDefinition;
begin
  result := TCqlConceptDefinition(inherited Link);
end;

{ TCqlTypeSpecifier }

constructor TCqlTypeSpecifier.Create;
begin
  inherited;
  FParameters := TAdvList<TCqlTypeSpecifier>.create;
  FElements := TAdvMap<TCqlTypeSpecifier>.create;
end;

destructor TCqlTypeSpecifier.Destroy;
begin
  FParameters.free;
  FElements.free;
  inherited;
end;

function TCqlTypeSpecifier.Link: TCqlTypeSpecifier;
begin
  result := TCqlTypeSpecifier(inherited Link);
end;

{ TCqlExpressionDefinition }

constructor TCqlExpressionDefinition.Create;
begin
  inherited;

end;

destructor TCqlExpressionDefinition.Destroy;
begin
  FExpression.Free;
  inherited;
end;

function TCqlExpressionDefinition.Link: TCqlExpressionDefinition;
begin
  result := TCqlExpressionDefinition(inherited Link);
end;

procedure TCqlExpressionDefinition.SetExpression(const Value: TCqlExpressionNode);
begin
  FExpression.Free;
  FExpression := Value;
end;

{ TCqlFunctionDefinition }

constructor TCqlFunctionDefinition.Create;
begin
  inherited;
  FParameters := TAdvList<TCqlFunctionParameterDefinition>.create;
end;

destructor TCqlFunctionDefinition.Destroy;
begin
  FTypeInfo.Free;
  FParameters.Free;
  FBody.Free;
  inherited;
end;

function TCqlFunctionDefinition.Link: TCqlFunctionDefinition;
begin
  result := TCqlFunctionDefinition(inherited Link);
end;


procedure TCqlFunctionDefinition.SetBody(const Value: TCqlExpressionNode);
begin
  FBody.Free;
  FBody := Value;
end;

procedure TCqlFunctionDefinition.SetTypeInfo(const Value: TCqlTypeSpecifier);
begin
  FTypeInfo.Free;
  FTypeInfo := Value;
end;

{ TCqlExpressionNode }

destructor TCqlExpressionNode.Destroy;
begin
  FTypeInfo.Free;
  FItems.Free;
  FSort.Free;
  FThenStmt.Free;
  FIfTest.Free;
  FElseStmt.Free;
  FReturn.Free;
  FElements.free;
  FWhere.Free;
  FSuchThat.Free;
  FWithStmt.Free;
  inherited;
end;

function TCqlExpressionNode.getElements: TAdvMap<TCqlExpressionNode>;
begin
  if FElements = nil then
    FElements := TAdvMap<TCqlExpressionNode>.create;
  result := FElements;
end;

function TCqlExpressionNode.getItems: TAdvList<TCqlExpressionNode>;
begin
  if FItems = nil then
    FItems := TAdvList<TCqlExpressionNode>.create;
  result := FItems;
end;

function TCqlExpressionNode.GetSort: TAdvList<TCqlExpressionNode>;
begin
  if FSort = nil then
    FSort := TAdvList<TCqlExpressionNode>.create;
  result := FSort;
end;

function TCqlExpressionNode.Link: TCqlExpressionNode;
begin
  result := TCqlExpressionNode(inherited Link);
end;

procedure TCqlExpressionNode.SetElseStmt(const Value: TCqlExpressionNode);
begin
  FElseStmt.Free;
  FElseStmt := Value;
end;

procedure TCqlExpressionNode.SetIfTest(const Value: TCqlExpressionNode);
begin
  FIfTest.Free;
  FIfTest := Value;
end;

procedure TCqlExpressionNode.SetReturn(const Value: TCqlExpressionNode);
begin
  FReturn.Free;
  FReturn := Value;
end;

procedure TCqlExpressionNode.SetSuchThat(const Value: TCqlExpressionNode);
begin
  FSuchThat.Free;
  FSuchThat := Value;
end;

procedure TCqlExpressionNode.SetThenStmt(const Value: TCqlExpressionNode);
begin
  FThenStmt.Free;
  FThenStmt := Value;
end;

procedure TCqlExpressionNode.SetTypeInfo(const Value: TCqlTypeSpecifier);
begin
  FTypeInfo.Free;
  FTypeInfo := Value;
end;

procedure TCqlExpressionNode.SetWhere(const Value: TCqlExpressionNode);
begin
  FWhere.Free;
  FWhere := Value;
end;

procedure TCqlExpressionNode.SetWithStmt(const Value: TCqlExpressionNode);
begin
  FWithStmt.Free;
  FWithStmt := Value;
end;

{ TCqlFunctionParameterDefinition }

constructor TCqlFunctionParameterDefinition.Create;
begin
  inherited;
end;

destructor TCqlFunctionParameterDefinition.Destroy;
begin
  FTypeDetails.Free;
  inherited;
end;

function TCqlFunctionParameterDefinition.Link: TCqlFunctionParameterDefinition;
begin
  result := TCqlFunctionParameterDefinition(inherited Link);
end;

procedure TCqlFunctionParameterDefinition.SetTypeDetails(const Value: TCqlTypeSpecifier);
begin
  FTypeDetails.Free;
  FTypeDetails := Value;
end;

{ TCqlIntervalOperationDetails }

procedure TCqlIntervalOperationDetails.clear;
begin
  leftQualfier := CqlLeftNull;
  properly := false;
  operation := CqlIntervalNull;
  relativeness := TCqlIntervalRelativeness.CqlRelativeNull;;
  rightQualifier := CqlRightNull;
  onOr := false;
  value := '';
  Units := '';
end;

end.
