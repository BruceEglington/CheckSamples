unit CkSmp_dm;

interface

uses
  System.SysUtils, System.Classes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.FMXUI.Wait, FireDAC.Stan.Param,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, Datasnap.Provider,
  midaslib,
  Datasnap.DBClient, FireDAC.Phys.IBBase, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.FMXUI.Login, FireDAC.Phys.TDataDef,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.TData, FireDAC.Comp.UI,
  FireDAC.Stan.StorageBin, FireDAC.DatS;

type
  TdmCkSmp = class(TDataModule)
    fdc_DV: TFDConnection;
    fdqSamples: TFDQuery;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDTransaction1: TFDTransaction;
    FDGUIxLoginDialog1: TFDGUIxLoginDialog;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    fdqSamplesSAMPLENO: TStringField;
    fdqSamplesORIGINALNO: TStringField;
    fdqSamplesLONGITUDE: TFloatField;
    fdqSamplesLATITUDE: TFloatField;
    fdmtNewSamples: TFDMemTable;
    fdmtNewSamplesSampleNo: TStringField;
    fdmtNewSamplesOriginalNo: TStringField;
    fdmtNewSamplesLongitude: TFloatField;
    fdmtNewSamplesLatitude: TFloatField;
    fdmtNewSamplesSampleStatus: TStringField;
    fdmtNewSamplesLocationStatusLongitude: TFloatField;
    fdmtNewSamplesLocationStatusLatitude: TFloatField;
    fdqSamplesContinentID: TStringField;
    fdqSamplesCountryAbr: TStringField;
    fdmtNewSamplesRegionID: TStringField;
    fdmtNewSamplesExistingRegionID: TStringField;
    fdmtNewSamplesSeqNo: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
    ChosenStyle : string;
  end;

var
  dmCkSmp: TdmCkSmp;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
