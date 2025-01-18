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
  Fmx.Bind.Navigator, CkSmp_dm, CkSmp_dmStrat;

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
    procedure miExitClick(Sender: TObject);
    procedure miConnectClick(Sender: TObject);
    procedure miImportSpreadsheetClick(Sender: TObject);
    procedure miCheckClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure miExportSpreadsheetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure CheckReplace_ProblemCharacters(var ID : integer; var tmpStr : string);
  public
    { Public declarations }
    procedure GetIniFile;
    procedure SetIniFile;
  end;

var
  fmCkSmp_mn: TfmCkSmp_mn;

implementation

{$R *.fmx}

uses CkSmp_varb, CkSmp_ShtIm, Allsorts;

procedure TfmCkSmp_mn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetIniFile;
end;

procedure TfmCkSmp_mn.FormShow(Sender: TObject);
begin
  GetIniFile;
end;

procedure TfmCkSmp_mn.GetIniFile;
var
  AppIni   : TIniFile;
  tmpStr   : string;
  HomePath : string;
  DBMonitor : string;
begin
  tmpStr := '1';
  DBMonitor := 'Inactive';
  //HomePath := System.IOUtils.TPath.GetDocumentsPath + System.SysUtils.PathDelim;
  HomePath := System.IOUtils.TPath.GetHomePath + System.SysUtils.PathDelim;
  //HomePath := TPath.GetHomePath;
  CommonFilePath := IncludeTrailingPathDelimiter(HomePath) + 'EggSoft' + System.SysUtils.PathDelim;
  IniFilename := CommonFilePath + 'CkSmp.ini';
  AppIni := TIniFile.Create(IniFilename);
  try
    SeqNoColStr := AppIni.ReadString('DataColumns','SeqNoColStr','A');
    SampleIDColStr := AppIni.ReadString('DataColumns','SampleIDColStr','A');
    OriginalIDColStr := AppIni.ReadString('DataColumns','OriginalIDColStr','B');
    RegionIDColStr := AppIni.ReadString('DataColumns','RegionIDColStr','C');
    LongitudeColStr := AppIni.ReadString('DataColumns','LongitudeColStr','D');
    LatitudeColStr := AppIni.ReadString('DataColumns','LatitudeColStr','E');
    GlobalChosenStyle := AppIni.ReadString('Styles','Chosen style','Windows');
    if (GlobalChosenStyle = '') then GlobalChosenStyle := 'Windows';
    dmCkSmp.ChosenStyle := GlobalChosenStyle;
    DataPath := AppIni.ReadString('Paths','DataPath',CommonFilePath+'CkSmp\');
    DataPath := IncludeTrailingPathDelimiter(DataPath);
    FlexTemplatePath := AppIni.ReadString('Paths','TemplatePath',CommonFilePath+'CkSmp\');
    FlexTemplatePath := IncludeTrailingPathDelimiter(FlexTemplatePath);
    DBMonitor := AppIni.ReadString('Monitor','DBMonitor','Inactive');
    {
    if (DBMonitor = 'Active') then
    begin
      dmCkSmp.fdc_DV.Connected := false;
      //dmCkSmp.fdc_DV.Params.Add('MonitorBy'). := 'mbRemote';
      dmCkSmp.FDMoniRemoteClientLink1.Tracing := true;
      dmCkSmp.fdc_DV.ConnectionIntf.Tracing := true;
    end else
    begin
      dmCkSmp.fdc_DV.Connected := false;
      //dmCkSmp.fdc_DV.Params.MonitorBy := mbNone;
      dmCkSmp.FDMoniRemoteClientLink1.Tracing := false;
      dmCkSmp.fdc_DV.ConnectionIntf.Tracing := false;
    end;
    }
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
    AppIni.WriteString('DataColumns','SeqNoColStr',SeqNoColStr);
    AppIni.WriteString('DataColumns','SampleIDColStr',SampleIDColStr);
    AppIni.WriteString('DataColumns','OriginalIDColStr',OriginalIDColStr);
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
  tSeqNo : integer;
  tNewSampleNo, tExistSampleNo : string;
  tNewOriginalNo, tExistOriginalNo : string;
  tNewLatitude, tExistLatitude, tLatitudeDifference : double;
  tNewLongitude, tExistLongitude, tLongitudeDifference : double;
  iCode : integer;
  LatLonCutoff, GeogCutoff : double;
  i : integer;
  tGeogDifference, tLatDifference, tLonDifference : double;
begin
  LatLonCutoff := 0.00001;
  GeogCutoff := 0.10000;
  try
    dmCkSmp.fdmtNewSamples.First;
    i := 0;
    dmCkSmp.fdmtNewSamples.DisableControls;
    repeat
      i := i + 1;
      tLatDifference := 0.0;
      tLonDifference := 0.0;
      tGeogDifference := 0.0;
      try
        //Application.ProcessMessages;
        tSeqNo := dmCkSmp.fdmtNewSamplesSeqNo.AsInteger;
        tNewSampleNo := Trim(dmCkSmp.fdmtNewSamplesSampleNo.AsString);
        CheckReplace_ProblemCharacters(tSeqNo,tNewSampleNo);
        tNewRegionID := Trim(dmCkSmp.fdmtNewSamplesRegionID.AsString);
        tNewOriginalNo := Trim(dmCkSmp.fdmtNewSamplesOriginalNo.AsString);
        CheckReplace_ProblemCharacters(tSeqNo,tNewOriginalNo);
        Val(dmCkSmp.fdmtNewSamplesLatitude.AsString,tNewLatitude,iCode);
        if (iCode > 0) then tNewLatitude := 90.0;
        Val(dmCkSmp.fdmtNewSamplesLongitude.AsString,tNewLongitude,iCode);
        if (iCode > 0) then tNewLongitude := 0.0;
        //Sleep(10);
      except
        dmCkSmp.fdmtNewSamples.Edit;
        dmCkSmp.fdmtNewSamplesSampleStatus.AsString := 'SampleNo problem';
        dmCkSmp.fdmtNewSamplesSampleStatusID.AsInteger := 5;
      end;
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
      try
      dmCkSmp.fdqSamples.Close;
      dmCkSmp.fdqSamples.ParamByName('SAMPLEID').AsString := tNewSampleNo;
      dmCkSmp.fdqSamples.Open;
      if (dmCkSmp.fdqSamples.RecordCount > 0) then
      begin
        tExistSampleNo := Trim(dmCkSmp.fdqSamplesSampleNo.AsString);
        tExistOriginalNo := Trim(dmCkSmp.fdqSamplesORIGINALNO.AsString);
        tExistRegionID := Trim(dmCkSmp.fdqSamplesCountryAbr.AsString);
        tExistCOID := Trim(dmCkSmp.fdqSamplesContinentID.AsString);
        tExistLatitude := dmCkSmp.fdqSamplesLatitude.AsFloat;
        tExistLongitude := dmCkSmp.fdqSamplesLongitude.AsFloat;
        tLatitudeDifference := Abs(tExistLatitude-tNewLatitude);
        tLongitudeDifference := Abs(tExistLongitude-tNewLongitude);
        dmCkSmp.fdmtNewSamples.Edit;
        dmCkSmp.fdmtNewSamplesSampleStatus.AsString := 'SampleNo match';
        dmCkSmp.fdmtNewSamplesSampleStatusID.AsInteger := 2;
        dmCkSmp.fdmtNewSamplesExistingRegionID.AsString := tExistRegionID;
        tGeogDifference := sqrt(tLongitudeDifference*tLongitudeDifference + tLatitudeDifference*tLatitudeDifference);
        if (tGeogDifference <= GeogCutoff) then
        begin
          dmCkSmp.fdmtNewSamplesSampleStatusID.AsInteger := 1;
        end;
        if (tNewRegionID <> tExistRegionID) then
        begin
          dmCkSmp.fdmtNewSamplesSampleStatus.AsString := 'SampleNo match but different RegionID';
        dmCkSmp.fdmtNewSamplesSampleStatusID.AsInteger := 3;
        end;
        if (tNewSampleNo = 'nd') then
        begin
          dmCkSmp.fdmtNewSamplesSampleStatus.AsString := 'Not defined SampleNo';
        dmCkSmp.fdmtNewSamplesSampleStatusID.AsInteger := 4;
        end;
        if ((tLatitudeDifference < LatLonCutoff) and (tLongitudeDifference < LatLonCutoff)) then
        begin
          dmCkSmp.fdmtNewSamplesSampleStatus.AsString := 'Identical SampleNo';
          dmCkSmp.fdmtNewSamplesSampleStatusID.AsInteger := 0;
          if (tNewOriginalNo <> tExistOriginalNo) then
          begin
            dmCkSmp.fdmtNewSamplesSampleStatus.AsString := 'Identical SampleNo but different OriginalNo';
            dmCkSmp.fdmtNewSamplesSampleStatusID.AsInteger := 0;
          end;
          if (tNewSampleNo = 'nd') then
          begin
            dmCkSmp.fdmtNewSamplesSampleStatus.AsString := 'Not defined SampleNo';
            dmCkSmp.fdmtNewSamplesSampleStatusID.AsInteger := 4;
          end;
          dmCkSmp.fdmtNewSamplesLocationStatusLongitude.AsFloat := tLongitudeDifference;
          dmCkSmp.fdmtNewSamplesLocationStatusLatitude.AsFloat := tLatitudeDifference;
          tGeogDifference := sqrt(tLongitudeDifference*tLongitudeDifference + tLatitudeDifference*tLatitudeDifference);
        end else
        begin
          dmCkSmp.fdmtNewSamplesLocationStatusLongitude.AsFloat := tLongitudeDifference;
          dmCkSmp.fdmtNewSamplesLocationStatusLatitude.AsFloat := tLatitudeDifference;
        end;
      end else
      begin
        dmCkSmp.fdmtNewSamples.Edit;
        dmCkSmp.fdmtNewSamplesSampleStatus.AsString := 'No match';
        dmCkSmp.fdmtNewSamplesSampleStatusID.AsInteger := 4;
      end;
      except
        dmCkSmp.fdmtNewSamples.Edit;
        dmCkSmp.fdmtNewSamplesSampleStatus.AsString := 'SampleNo problem';
        dmCkSmp.fdmtNewSamplesSampleStatusID.AsInteger := 5;
      end;
      dmCkSmp.fdmtNewSamples.Post;
      dmCkSmp.fdmtNewSamples.Next;
    until dmCkSmp.fdmtNewSamples.Eof;
  except
    ShowMessage('Problem in process');
  end;
  lsbCount.Text := 'i = '+Int2Str(i);
  lsbSampleNo.Text := 'Completed checking';
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
  ShowMessage('1');
  dmStratCkSmp.fdc_Strat.Open;
  ShowMessage('2');
  dmStratCkSmp.FDqProblemCharacters.FetchOptions.RecsMax := 20;
  dmStratCkSmp.FDqProblemCharacters.FetchOptions.RecsSkip := 0;
  dmStratCkSmp.FDqProblemCharacters.Open;
  ShowMessage('3');
  lsbDatabase.Text := dmCkSmp.fdc_DV.ConnectionName;
  ShowMessage('4');
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
begin
  //ShowMessage('0');
  CkSmp_import.ShowModal;
  //ShowMessage('10');
  dmCkSmp.fdmtNewSamples.Refresh;
  //ShowMessage('11');
end;

procedure TfmCkSmp_mn.CheckReplace_ProblemCharacters(var ID : integer; var tmpStr : string);
var
  tmpStrExist, tmpStrReplace : string;
  tmpStrExistNum, tmpStrReplaceNum : integer;
  tNum, i, ii, iChng : integer;
begin
  //where sourcelist.sourcedescription like '%–%'
  //dmStrat.FDqProbCharWestern.Close;
  //dmStrat.FDqProbCharWestern.Open;
  ii := 0;
  //repeat
    //ii := ii + 1;
    iChng := 0;
    //Statusbar1.Panels[0].Text := IntToStr(ii);
    //Statusbar1.Panels[1].Text := IntToStr(ID);
    //if ((ii mod 100) = 0) then
    //begin
    //  Statusbar1.Refresh;
    //  Application.ProcessMessages;
    //end;
    for i:= 1 to tmpStr.Length do
    begin
      if (CharInSet(tmpStr[i],[#26,#34,#39,#63,#128..#255]) or (ord(tmpStr[i]) > 255)) then
      begin
        tNum := ID;
        tmpStr := Trim(tmpStr);
        //Memo2.Text := Trim(tmpStr);
        //Statusbar1.Panels[1].Text := IntToStr(tNum);
        //Statusbar1.Panels[2].Text := IntToStr(i);
        //Statusbar1.Refresh;
        //Application.ProcessMessages;
        tmpStrExistNum := 95;
        tmpStrReplaceNum := 32;
        if (ord(tmpStr[i]) < 256) then
        begin
          if dmStratCkSmp.FDqProblemCharacters.Locate('PROBLEMCHARNUM',ord(tmpStr[i]),[]) then
          begin
            tmpStrExistNum := ord(tmpStr[i]);
            tmpStrReplaceNum := dmStratCkSmp.FDqProblemCharactersREPLACEMENTSTRING.AsInteger;
          end;
        end else
        begin
          tmpStrExistNum := ord(tmpStr[i]);
          tmpStrReplaceNum := 95;
        end;
        if (tmpStrReplaceNum >= 32) then
        begin
          tmpStr[i] := Chr(tmpStrReplaceNum);
          //Memo2.Text := tmpStr;
          iChng := iChng + 1;
        end;
      end;
    end;
    {
    if (iChng > 0) then
    begin
      try
        dmDV.FDqIsorgrComment.Edit;
        dmDV.FDqIsorgrCommentCOMMENT.AsString := tmpStr;
        dmDV.FDqIsorgrComment.Post;
        dmDV.FDqIsorgrComment.ApplyUpdates(0);
      except
      end;
    end;
    }
    //dmDV.FDqIsorgrComment.Next;
    //Application.ProcessMessages;
  //until dmDV.FDqIsorgrComment.Eof;
  //dmDV.FDqIsorgrComment.Close;
  //ShowMessage('Completed replacements for DateView');
end;

end.
