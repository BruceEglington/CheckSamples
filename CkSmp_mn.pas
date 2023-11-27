unit CkSmp_mn;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Menus, FMX.Controls.Presentation, System.ImageList, FMX.ImgList,
  FMX.SVGIconImageList, System.Rtti, FMX.Grid.Style, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.DBScope, Data.Bind.Grid, FMX.Grid,
  FireDAC.Stan.Param, midaslib,
  FMX.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  FMX.ScrollBox,System.IOUtils,IniFiles, Data.Bind.Controls, FMX.Layouts,
  Fmx.Bind.Navigator;

type
  TfmCkSmp_mn = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    MainMenu1: TMainMenu;
    StatusBar1: TStatusBar;
    mi_File: TMenuItem;
    miStyles: TMenuItem;
    miHelp: TMenuItem;
    miCheck: TMenuItem;
    miExit: TMenuItem;
    miConnect: TMenuItem;
    miImportSpreadsheet: TMenuItem;
    miDivider2: TMenuItem;
    miAbout: TMenuItem;
    SVGIconImageList1: TSVGIconImageList;
    StyleBook1: TStyleBook;
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    gNewSamples: TGrid;
    miExportSpreadsheet: TMenuItem;
    miDivider1: TMenuItem;
    ToolBar1: TToolBar;
    bCheck: TButton;
    bConnect: TButton;
    bExit: TButton;
    bExport: TButton;
    bImport: TButton;
    ToolBar2: TToolBar;
    bnNewSamples: TBindNavigator;
    lsbCount: TLabel;
    lsbSampleNo: TLabel;
    lsbDatabase: TLabel;
    gExistSampleNo: TGrid;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    SaveDialogSprdSheet: TSaveDialog;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Button1: TButton;
    procedure miExitClick(Sender: TObject);
    procedure miConnectClick(Sender: TObject);
    procedure miImportSpreadsheetClick(Sender: TObject);
    procedure miCheckClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure miExportSpreadsheetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetIniFile;
    procedure SetIniFile;
  end;

var
  fmCkSmp_mn: TfmCkSmp_mn;

implementation

{$R *.fmx}

uses CkSmp_dm, CkSmp_varb, CkSmp_ShtIm, Allsorts;

procedure TfmCkSmp_mn.Button1Click(Sender: TObject);
var
  tNewRegionID, tExistRegionID : string;
  tExistCOID : string;
  tNewSampleNo, tExistSampleNo : string;
  tNewLatitude, tExistLatitude, tLatitudeDifference : double;
  tNewLongitude, tExistLongitude, tLongitudeDifference : double;
  iCode : integer;
  LatLonCutoff : double;
begin
  LatLonCutoff := 0.00001;
      tNewRegionID := Trim(dmCkSmp.fdmtNewSamplesRegionID.AsString);
      tNewSampleNo := Trim(dmCkSmp.fdmtNewSamplesSampleNo.AsString);
      lsbSampleNo.Text := tNewSampleNo;
      Val(dmCkSmp.fdmtNewSamplesLatitude.AsString,tNewLatitude,iCode);
      if (iCode > 0) then tNewLatitude := 90.0;
      Val(dmCkSmp.fdmtNewSamplesLongitude.AsString,tNewLongitude,iCode);
      if (iCode > 0) then tNewLongitude := 0.0;
      dmCkSmp.fdqSamples.Close;
      dmCkSmp.fdqSamples.ParamByName('SAMPLEID').AsString := tNewSampleNo;
      dmCkSmp.fdqSamples.Open;
      if (dmCkSmp.fdqSamples.RecordCount > 0) then
      begin
        tExistSampleNo := Trim(dmCkSmp.fdqSamplesSampleNo.AsString);
        tExistCOID := Trim(dmCkSmp.fdqSamplesContinentID.AsString);
        tExistRegionID := Trim(dmCkSmp.fdqSamplesCountryAbr.AsString);
        tExistLatitude := dmCkSmp.fdqSamplesLatitude.AsFloat;
        tExistLongitude := dmCkSmp.fdqSamplesLongitude.AsFloat;
        tLatitudeDifference := Abs(tExistLatitude-tNewLatitude);
        tLongitudeDifference := Abs(tExistLongitude-tNewLongitude);
        dmCkSmp.fdmtNewSamples.Edit;
        dmCkSmp.fdmtNewSamplesSampleStatus.AsString := 'SampleNo match';
        dmCkSmp.fdmtNewSamplesExistingRegionID.AsString := tExistRegionID;
        if ((tLatitudeDifference < LatLonCutoff) and (tLongitudeDifference < LatLonCutoff)) then
        begin
          dmCkSmp.fdmtNewSamplesSampleStatus.AsString := 'Identical SampleNo';
          dmCkSmp.fdmtNewSamplesLocationStatusLongitude.AsFloat := tLongitudeDifference;
          dmCkSmp.fdmtNewSamplesLocationStatusLatitude.AsFloat := tLatitudeDifference;
        end else
        begin
          dmCkSmp.fdmtNewSamplesLocationStatusLongitude.AsFloat := tLongitudeDifference;
          dmCkSmp.fdmtNewSamplesLocationStatusLatitude.AsFloat := tLatitudeDifference;
        end;
        dmCkSmp.fdmtNewSamples.Post;
      end else
      begin
        dmCkSmp.fdmtNewSamples.Edit;
        dmCkSmp.fdmtNewSamplesSampleStatus.AsString := 'No match';
        dmCkSmp.fdmtNewSamples.Post;
      end;
end;


procedure TfmCkSmp_mn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetIniFile;
end;

procedure TfmCkSmp_mn.FormShow(Sender: TObject);
begin
  GetIniFile;
  Button1.Visible := false;   // button to test at individual record level. Set invisible for normal use
end;

procedure TfmCkSmp_mn.GetIniFile;
var
  AppIni   : TIniFile;
  tmpStr   : string;
  HomePath : string;
begin
  tmpStr := '1';
  //HomePath := System.IOUtils.TPath.GetDocumentsPath + System.SysUtils.PathDelim;
  HomePath := System.IOUtils.TPath.GetHomePath + System.SysUtils.PathDelim;
  //HomePath := TPath.GetHomePath;
  CommonFilePath := IncludeTrailingPathDelimiter(HomePath) + 'EggSoft' + System.SysUtils.PathDelim;
  IniFilename := CommonFilePath + 'CkSmp.ini';
  AppIni := TIniFile.Create(IniFilename);
  try
    SampleNoColStr := AppIni.ReadString('DataColumns','SampleNoColStr','A');
    OriginalNoColStr := AppIni.ReadString('DataColumns','OriginalNoColStr','B');
    RegionIDColStr := AppIni.ReadString('DataColumns','RegionIDColStr','C');
    LongitudeColStr := AppIni.ReadString('DataColumns','LongitudeColStr','D');
    LatitudeColStr := AppIni.ReadString('DataColumns','LatitudeColStr','E');
    GlobalChosenStyle := AppIni.ReadString('Styles','Chosen style','Windows');
    if (GlobalChosenStyle = '') then GlobalChosenStyle := 'Windows';
    dmCkSmp.ChosenStyle := GlobalChosenStyle;
    DataPath := AppIni.ReadString('Paths','DataPath',CommonFilePath+'CkSmp\');
    FlexTemplatePath := AppIni.ReadString('Paths','TemplatePath',CommonFilePath+'CkSmp\');
  finally
    AppIni.Free;
  end;
end;

procedure TfmCkSmp_mn.SetIniFile;
var
  AppIni   : TIniFile;
  HomePath : string;
begin
  HomePath := System.IOUtils.TPath.GetHomePath + System.SysUtils.PathDelim;
  //HomePath := TPath.GetHomePath;
  CommonFilePath := IncludeTrailingPathDelimiter(HomePath) + 'EggSoft' + System.SysUtils.PathDelim;
  IniFilename := CommonFilePath + 'CkSmp.ini';
  AppIni := TIniFile.Create(IniFilename);
  try
    AppIni.WriteString('DataColumns','SampleNoColStr',SampleNoColStr);
    AppIni.WriteString('DataColumns','OriginalNoColStr',OriginalNoColStr);
    AppIni.WriteString('DataColumns','RegionIDColStr',RegionIDColStr);
    AppIni.WriteString('DataColumns','LongitudeColStr',LongitudeColStr);
    AppIni.WriteString('DataColumns','LatitudeColStr',LatitudeColStr);
    AppIni.WriteString('Styles','Chosen style',GlobalChosenStyle);
    AppIni.WriteString('Paths','DataPath',DataPath);
    AppIni.WriteString('Paths','TemplatePath',FlexTemplatePath);
  finally
    AppIni.Free;
  end;
end;

{
procedure TfmPDFMain.StyleClick(Sender: TObject);
var
  StyleName : String;
  i : integer;
begin
  //get style name
  StyleName := TMenuItem(Sender).Caption;
  StyleName := StringReplace(StyleName, '&', '',
    [rfReplaceAll,rfIgnoreCase]);
  GlobalChosenStyle := StyleName;
  dmPDF.ChosenStyle := GlobalChosenStyle;
  //set active style
  Application.HandleMessage;
  TStyleManager.SetStyle(GlobalChosenStyle);
  dmPDF.ChosenStyle := GlobalChosenStyle;
  Application.HandleMessage;
  //check the currently selected menu item
  (Sender as TMenuItem).Checked := true;
  //uncheck all other style menu items
  for i := 0 to Styles1.Count-1 do
  begin
    if not Styles1.Items[i].Equals(Sender) then
      Styles1.Items[i].Checked := false;
  end;
  for i := 0 to Styles1.Count-1 do
  begin
    if Styles1.Items[i].Checked then GlobalChosenStyle := StringReplace(Styles1.Items[i].Caption, '&', '',
    [rfReplaceAll,rfIgnoreCase]);
  end;
  TStyleManager.SetStyle(GlobalChosenStyle);
  try
    dmPDF.ChosenStyle := GlobalChosenStyle;
  finally
    dmPDF.ChosenStyle := GlobalChosenStyle;
  end;
  ApplySelectedThemeToCharts(StyleName);
end;
}

procedure TfmCkSmp_mn.miAboutClick(Sender: TObject);
begin
  //
end;

procedure TfmCkSmp_mn.miCheckClick(Sender: TObject);
var
  tNewRegionID, tExistRegionID : string;
  tExistCOID : string;
  tNewSampleNo, tExistSampleNo : string;
  tNewLatitude, tExistLatitude, tLatitudeDifference : double;
  tNewLongitude, tExistLongitude, tLongitudeDifference : double;
  iCode : integer;
  LatLonCutoff : double;
  i : integer;
begin
  LatLonCutoff := 0.00001;
  try
    dmCkSmp.fdmtNewSamples.First;
    i := 0;
    dmCkSmp.fdmtNewSamples.DisableControls;
    repeat
      i := i + 1;
      //Application.ProcessMessages;
      tNewSampleNo := Trim(dmCkSmp.fdmtNewSamplesSampleNo.AsString);
      tNewRegionID := Trim(dmCkSmp.fdmtNewSamplesRegionID.AsString);
      Val(dmCkSmp.fdmtNewSamplesLatitude.AsString,tNewLatitude,iCode);
      if (iCode > 0) then tNewLatitude := 90.0;
      Val(dmCkSmp.fdmtNewSamplesLongitude.AsString,tNewLongitude,iCode);
      if (iCode > 0) then tNewLongitude := 0.0;
      //Sleep(10);
      if ((i mod 100) = 0) then
      begin
        lsbCount.Text := 'i = '+Int2Str(i);
        lsbSampleNo.Text := tNewSampleNo;
        Application.ProcessMessages;
      end;
      //if (i < 6) then
      //begin
      //  ShowMessage(lsbCount.Text+'   '+lsbSampleNo.Text);
      //end;
      dmCkSmp.fdqSamples.Close;
      dmCkSmp.fdqSamples.ParamByName('SAMPLEID').AsString := tNewSampleNo;
      dmCkSmp.fdqSamples.Open;
      if (dmCkSmp.fdqSamples.RecordCount > 0) then
      begin
        tExistSampleNo := Trim(dmCkSmp.fdqSamplesSampleNo.AsString);
        tExistRegionID := Trim(dmCkSmp.fdqSamplesCountryAbr.AsString);
        tExistCOID := Trim(dmCkSmp.fdqSamplesContinentID.AsString);
        tExistLatitude := dmCkSmp.fdqSamplesLatitude.AsFloat;
        tExistLongitude := dmCkSmp.fdqSamplesLongitude.AsFloat;
        tLatitudeDifference := Abs(tExistLatitude-tNewLatitude);
        tLongitudeDifference := Abs(tExistLongitude-tNewLongitude);
        dmCkSmp.fdmtNewSamples.Edit;
        dmCkSmp.fdmtNewSamplesSampleStatus.AsString := 'SampleNo match';
        dmCkSmp.fdmtNewSamplesExistingRegionID.AsString := tExistRegionID;
        if ((tLatitudeDifference < LatLonCutoff) and (tLongitudeDifference < LatLonCutoff)) then
        begin
          dmCkSmp.fdmtNewSamplesSampleStatus.AsString := 'Identical SampleNo';
          dmCkSmp.fdmtNewSamplesLocationStatusLongitude.AsFloat := tLongitudeDifference;
          dmCkSmp.fdmtNewSamplesLocationStatusLatitude.AsFloat := tLatitudeDifference;
        end else
        begin
          dmCkSmp.fdmtNewSamplesLocationStatusLongitude.AsFloat := tLongitudeDifference;
          dmCkSmp.fdmtNewSamplesLocationStatusLatitude.AsFloat := tLatitudeDifference;
        end;
      end else
      begin
        dmCkSmp.fdmtNewSamples.Edit;
        dmCkSmp.fdmtNewSamplesSampleStatus.AsString := 'No match';
      end;
      dmCkSmp.fdmtNewSamples.Post;
      dmCkSmp.fdmtNewSamples.Next;
    until dmCkSmp.fdmtNewSamples.Eof;
  except
    ShowMessage('Problem in process');
  end;
  lsbCount.Text := 'i = '+Int2Str(i);
  lsbSampleNo.Text := tNewSampleNo;
  Application.ProcessMessages;
  dmCkSmp.fdmtNewSamples.EnableControls;
  dmCkSmp.fdmtNewSamples.First;
end;

procedure TfmCkSmp_mn.miConnectClick(Sender: TObject);
begin
  dmCkSmp.fdc_DV.Open;
  dmCkSmp.fdqSamples.FetchOptions.RecsMax := 20;
  dmCkSmp.fdqSamples.FetchOptions.RecsSkip := 0;
  dmCkSmp.fdqSamples.Open;
  //LinkGridToDataSourceBindSourceDB1.Active := False;
  //LinkGridToDataSourceBindSourceDB1.Active := True;
  lsbDatabase.Text := dmCkSmp.fdc_DV.ConnectionName;
end;

procedure TfmCkSmp_mn.miExitClick(Sender: TObject);
begin
  try
    dmCkSmp.fdmtNewSamples.Close;
  finally
    dmCkSmp.fdc_DV.Close;
    Close;
  end;
end;

procedure TfmCkSmp_mn.miExportSpreadsheetClick(Sender: TObject);
var
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  frTemplateStr := FlexTemplatePath+'CkSmp_checks.xlsx';
  //ShowMessage(frTemplateStr);
  SaveDialogSprdSheet.InitialDir := ExportPath;
  SaveDialogSprdSheet.FileName := 'SampleNo pre-import check';
  if SaveDialogSprdSheet.Execute then
  begin
    frFileNameStr := SaveDialogSprdSheet.FileName;
    ExportPath := ExtractFilePath(SaveDialogSprdSheet.FileName);
    fr := TFlexCelReport.Create(true);
    try
      fr.AddTable('fdmtNewSamples',dmCkSmp.fdmtNewSamples);
      fr.Run(frTemplateStr,frFileNameStr);
    finally
      fr.Free;
    end;
  end;
end;

procedure TfmCkSmp_mn.miImportSpreadsheetClick(Sender: TObject);
var
  ImportForm : TCkSmp_import;
begin
  {
  ImportForm := TCkSmp_import.Create(self);
  try
    ImportForm.ShowModal;
  finally
    ImportForm.Free;
  end;
  }
  CkSmp_import.ShowModal;
  dmCkSmp.fdmtNewSamples.Refresh;
end;

end.
