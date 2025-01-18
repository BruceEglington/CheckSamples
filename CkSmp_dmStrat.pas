unit CkSmp_dmStrat;

interface

uses
  System.SysUtils, System.Classes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.FMXUI.Wait, FireDAC.Stan.Param,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, Datasnap.Provider,
  Datasnap.DBClient, FireDAC.Phys.IBBase, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.FMXUI.Login, FireDAC.Phys.TDataDef,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.TData, FireDAC.Comp.UI,
  FireDAC.Stan.StorageBin, FireDAC.DatS, FireDAC.Moni.Base,
  FireDAC.Moni.RemoteClient;

type
  TdmStratCkSmp = class(TDataModule)
    fdGUIxLoginDialog1: TFDGUIxLoginDialog;
    fdGUIxWaitCursor1: TFDGUIxWaitCursor;
    fdMoniRemoteClientLink1: TFDMoniRemoteClientLink;
    fdqProblemCharacters: TFDQuery;
    fdqProblemCharactersPROBLEMSTRING: TStringField;
    fdqProblemCharactersREPLACEMENTSTRING: TStringField;
    fdqProblemCharactersISPROBLEM: TStringField;
    fdqProblemCharactersPROBLEMCHARNUM: TIntegerField;
    fdqProblemCharactersREPLACEMENTCHARNUM: TIntegerField;
    fdc_Strat: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
  private
    { Private declarations }
  public
    { Public declarations }
    ChosenStyle : string;
  end;

var
  dmStratCkSmp: TdmStratCkSmp;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
