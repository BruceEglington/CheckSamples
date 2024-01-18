unit CkSmp_ShtIm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Menus, System.Rtti,
  FMX.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Render, FlexCel.Preview,
  FMX.Grid.Style, FMX.TabControl, FMX.ScrollBox, FMX.Grid, FMX.ListBox, FMX.Edit;

type
  TCkSmp_import = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    pDefinitions: TPanel;
    sbSheet: TStatusBar;
    Splitter1: TSplitter;
    OpenDialogSprdSheet: TOpenDialog;
    Tabs: TTabControl;
    bCancel: TButton;
    bOpen: TButton;
    pDefineFields: TPanel;
    Panel5: TPanel;
    pDefineRows: TPanel;
    lRowsToImport: TLabel;
    lFromRow: TLabel;
    lToRow: TLabel;
    eToRow: TEdit;
    eFromRow: TEdit;
    bImport: TButton;
    lSeqNo: TLabel;
    eSeqNoColStr: TEdit;
    lDataColumns: TLabel;
    eOriginalIDColStr: TEdit;
    lOriginalID: TLabel;
    lLongitude: TLabel;
    lLatitude: TLabel;
    eLongitudeColStr: TEdit;
    eLatitudeColStr: TEdit;
    SheetData: TGrid;
    bFormatValues: TButton;
    bFindLast: TButton;
    lRegionID: TLabel;
    eRegionIDColStr: TEdit;
    Label1: TLabel;
    eSampleIDColStr: TEdit;
    procedure bCancelClick(Sender: TObject);
    procedure bOpenClick(Sender: TObject);
    procedure bImportClick(Sender: TObject);
    procedure SheetDataDrawColumnCell(Sender: TObject; const Canvas: TCanvas;
      const Column: TColumn; const Bounds: TRectF; const Row: Integer;
      const Value: TValue; const State: TGridDrawStates);
    procedure SheetDataGetValue(Sender: TObject; const ACol, ARow: Integer;
      var Value: TValue);
    procedure bFormatValuesClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bFindLastClick(Sender: TObject);
  private
    { Private declarations }
    Xls : TXlsFile;
    function ConvertCol2Int(AnyString : string) : integer;
    procedure FillTabs;
    procedure ClearGrid;
    procedure SetupGrid;
    procedure SheetChanged(Sender: TObject);
  public
    { Public declarations }
  end;

var
  CkSmp_import: TCkSmp_import;

implementation

{$R *.fmx}

uses Allsorts, CkSmp_varb, CkSmp_dm;

function TCkSmp_import.ConvertCol2Int(AnyString : string) : integer;
var
  itmp    : integer;
  tmpStr  : string;
  tmpChar : char;
begin
    AnyString := UpperCase(AnyString);
    tmpStr := AnyString;
    ClearNull(tmpStr);
    Result := 0;
    if (length(tmpStr) = 2) then
    begin
      tmpChar := tmpStr[1];
      itmp := (ord(tmpChar)-64)*26;
      tmpChar := tmpStr[2];
      Result := itmp+(ord(tmpChar)-64);
    end else
    begin
      tmpChar := tmpStr[1];
      Result := (ord(tmpChar)-64);
    end;
end;

procedure TCkSmp_import.bCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TCkSmp_import.bFindLastClick(Sender: TObject);
var
  iCode : integer;
  tmpStr : string;
  i,j : integer;
begin
  eToRow.Text := '';
  ToRow := 0;
  iCode := 1;
  repeat
    tmpStr := eFromRow.Text;
    Val(tmpStr, FromRow, iCode);
    if (iCode = 0) then
    begin
    end else
    begin
      ShowMessage('Incorrect value entered for From row');
      Exit;
    end;
  until (iCode = 0);
  try
    i := FromRow;
    j := ConvertCol2Int(eSeqNoColStr.Text);
    ToRow := 0;
    repeat
      i := i + 1;
      try
        tmpStr := Xls.GetStringFromCell(i,j);
      except
        tmpStr := '0.0';
      end;
    until (tmpStr = '');
  except
    //MessageDlg('Error reading data in column '+IntToStr(Data.Col),mtwarning,[mbOK],0);
  end;
  if (i > ToRow) then ToRow := i-1;
  eToRow.Text := IntToStr(ToRow);
  //Data.Row := 1;
end;

procedure TCkSmp_import.bFormatValuesClick(Sender: TObject);
begin
  SheetData.Repaint; //when repainting, we will read the new value of this button.
end;

procedure TCkSmp_import.bImportClick(Sender: TObject);
var
  j     : integer;
  iCode : integer;
  i : integer;
  tmpStr : string;
begin
  try
    dmCkSmp.fdmtNewSamples.Open;
    dmCkSmp.fdmtNewSamples.EmptyDataSet;
  except
  end;
  FromRowValueString := UpperCase(eFromRow.Text);
  ToRowValueString := UpperCase(eToRow.Text);
  SeqNoColStr := UpperCase(eSeqNoColStr.Text);
  SampleIDColStr := UpperCase(eSampleIDColStr.Text);
  OriginalIDColStr := UpperCase(eOriginalIDColStr.Text);
  RegionIDColStr := UpperCase(eRegionIDColStr.Text);
  LongitudeColStr := UpperCase(eLongitudeColStr.Text);
  LatitudeColStr := UpperCase(eLatitudeColStr.Text);
  {check row variables}
  iCode := 1;
  repeat
    {From Row}
    tmpStr := eFromRow.Text;
    Val(tmpStr, FromRow, iCode);
    {To Row}
    if (iCode = 0) then
    begin
      tmpStr := eToRow.Text;
      Val(tmpStr, ToRow, iCode);
    end else
    begin
      ShowMessage('Incorrect value entered for From row');
      Exit;
    end;
    if (iCode = 0) then
    begin
      if (ToRow >= FromRow) then iCode := 0
                            else iCode := -1;
    end else
    begin
      ShowMessage('Incorrect value entered for To row');
      Exit;
    end;
    if (iCode <> 0)
      then begin
        ShowMessage('Incorrect values entered for rows to import');
        Exit;
      end;
  until (iCode = 0);
  {convert input columns for variables to numeric}
  SeqNoCol := ConvertCol2Int(eSeqNoColStr.Text);
  //ShowMessage('SeqNoCol = '+Int2Str(SeqNoCol));
  SampleIDCol := ConvertCol2Int(eSampleIDColStr.Text);
  OriginalIDCol := ConvertCol2Int(eOriginalIDColStr.Text);
  RegionIDCol := ConvertCol2Int(eRegionIDColStr.Text);
  LongitudeCol := ConvertCol2Int(eLongitudeColStr.Text);
  LatitudeCol := ConvertCol2Int(eLatitudeColStr.Text);
  //ShowMessage('3');
  if (iCode = 0) then
  begin
    ModalResult := mrOK;
    dmCkSmp.fdmtNewSamples.Open;
    try
      dmCkSmp.fdmtNewSamples.Edit;
      dmCkSmp.fdmtNewSamples.EmptyDataSet;
    except
    end;
    //ShowMessage('4');
    Application.ProcessMessages;
    //dmCkSmp.fdmtNewSamples.Open;
    dmCkSmp.fdmtNewSamples.DisableControls;
    try
      for i := FromRow to ToRow do
      begin
        try
          //if (i<3) then ShowMessage('5a');
          dmCkSmp.fdmtNewSamples.Append;
          tmpStr := Xls.GetStringFromCell(i,SeqNoCol);
          dmCkSmp.fdmtNewSamplesSeqNo.AsInteger := StrToInt(tmpStr);
          //if (i<3) then ShowMessage('5b');
          tmpStr := Xls.GetStringFromCell(i,SampleIDCol);
          dmCkSmp.fdmtNewSamplesSampleNo.AsString := tmpStr;
          //if (i<3) then ShowMessage('5c');
          tmpStr := Xls.GetStringFromCell(i,OriginalIDCol);
          dmCkSmp.fdmtNewSamplesOriginalNo.AsString := tmpStr;
          tmpStr := Xls.GetStringFromCell(i,RegionIDCol);
          dmCkSmp.fdmtNewSamplesRegionID.AsString := tmpStr;
          tmpStr := Xls.GetStringFromCell(i,LongitudeCol);
          dmCkSmp.fdmtNewSamplesLongitude.AsString := tmpStr;
          tmpStr := Xls.GetStringFromCell(i,LatitudeCol);
          dmCkSmp.fdmtNewSamplesLatitude.AsString := tmpStr;
          dmCkSmp.fdmtNewSamplesSampleStatus.AsString := '';
          dmCkSmp.fdmtNewSamplesLocationStatusLongitude.AsString := '';
          dmCkSmp.fdmtNewSamplesLocationStatusLatitude.AsString := '';
          dmCkSmp.fdmtNewSamples.Post;
          if ((dmCkSmp.fdmtNewSamplesSampleNo.AsString = ''))
            then dmCkSmp.fdmtNewSamples.Delete;
        except
        end;
      end;
    finally
      //ShowMessage('6a');
      dmCkSmp.fdmtNewSamples.First;
      dmCkSmp.fdmtNewSamples.EnableControls;
    end;
    //ShowMessage('6b');
    Application.ProcessMessages;
  end else
  begin
    ModalResult := mrNone;
  end;
end;

procedure TCkSmp_import.bOpenClick(Sender: TObject);
begin
  OpenDialogSprdSheet.InitialDir := DataPath;
  if OpenDialogSprdSheet.Execute then
  begin
    DataPath := ExtractFilePath(OpenDialogSprdSheet.FileName);
    //Open the Excel file.
    if Xls = nil then Xls := TXlsFile.Create(false);
    xls.Open(OpenDialogSprdSheet.FileName);
    FillTabs;
    SetupGrid;
    pDefinitions.Visible := true;
    pDefineFields.Visible := true;
    pDefineRows.Visible := true;
    Splitter1.Visible := true;
    bImport.Visible := true;
    bImport.Enabled := true;
    bFormatValues.Visible := true;
    bFormatValues.Enabled := true;
    try
      bFindLastClick(Sender);
    except
    end;
  end;
end;

procedure TCkSmp_import.SheetDataDrawColumnCell(Sender: TObject;
  const Canvas: TCanvas; const Column: TColumn; const Bounds: TRectF;
  const Row: Integer; const Value: TValue; const State: TGridDrawStates);
var
  fmt: TFlxFormat;
  FillBrush: TBrush;
  BoundsExt: TRectF;
begin
   //Here we will show how to do colors
   if Xls = nil then exit;
   BoundsExt := Bounds;
   BoundsExt.Inflate(4, 4);
   fmt := Xls.GetCellVisibleFormatDef(Row + 1, Column.Index + 1);
   if (fmt.FillPattern.Pattern = TFlxPatternStyle.Solid) then
   begin
      FillBrush := TBrush.Create(TBrushKind.Solid, fmt.FillPattern.FgColor.ToColor(xls));
      try
        Canvas.FillRect(BoundsExt, 0, 0, [], 1, FillBrush);
      finally
        FillBrush.Free;
      end;
      Canvas.Font.Size := fmt.Font.Size20 / 20.0 * 96.0/ 72.0;  //Firemonkey's Font.size is smaller than in VCL. So we multiply by 96/72.
      Canvas.Font.Family := fmt.Font.Name;
      //You could assign the font style here too.
      Canvas.Fill.Color := fmt.Font.Color.ToColor(xls);
      Canvas.FillText(Bounds, Xls.GetStringFromCell(Row + 1, Column.Index + 1).ToString,
         fmt.WrapText, 1, [], TTextAlign.Leading);
   end;
end;

procedure TCkSmp_import.SheetChanged(Sender: TObject);
begin
  Xls.ActiveSheet := (Sender as TComponent).Tag;
  SetupGrid;
end;

procedure TCkSmp_import.SheetDataGetValue(Sender: TObject; const ACol,
  ARow: Integer; var Value: TValue);
begin
  if Xls = nil then
  begin
    Value := '';
    exit;
  end;
  if bFormatValues.IsPressed then
  begin
    value := Xls.GetStringFromCell(ARow + 1, ACol + 1).ToString;
  end
  else
  begin
    value := Xls.GetCellValue(ARow + 1, ACol + 1);
  end;
end;

procedure TCkSmp_import.FillTabs;
var
  s, i: integer;
  btn: TTabItem;
begin
  for i := Tabs.TabCount - 1 downto 0 do Tabs.Tabs[i].Free;
  for s := 1 to Xls.SheetCount do
  begin
    btn := TTabItem.Create(Tabs);
    btn.Text := Xls.GetSheetName(s);
    btn.Tag := s;
    btn.OnClick := SheetChanged;
    Tabs.AddObject(btn);
  end;
end;

procedure TCkSmp_import.FormCreate(Sender: TObject);
begin
  FromRowValueString := '2';
  ToRowValueString := '10';
end;

procedure TCkSmp_import.FormDestroy(Sender: TObject);
begin
  Xls.Free;
end;

procedure TCkSmp_import.FormShow(Sender: TObject);
begin
  eFromRow.Text := FromRowValueString;
  eToRow.Text := ToRowValueString;
  eSeqNoColStr.Text := SeqNoColStr;
  eSampleIDColStr.Text := SampleIDColStr;
  eOriginalIDColStr.Text := OriginalIDColStr;
  eRegionIDColStr.Text := RegionIDColStr;
  eLongitudeColStr.Text := LongitudeColStr;
  eLatitudeColStr.Text := LatitudeColStr;
  pDefinitions.Visible := false;
  pDefineFields.Visible := false;
  pDefineRows.Visible := false;
  Splitter1.Visible := true;
  bImport.Visible := false;
  bImport.Enabled := false;
  bFormatValues.Visible := false;
  bFormatValues.Enabled := false;
end;

procedure TCkSmp_import.ClearGrid;
var
  i: integer;
begin
  SheetData.RowCount := 0;
  for i := SheetData.ColumnCount - 1 downto 0 do SheetData.Columns[i].Free;
end;

procedure TCkSmp_import.SetupGrid;
var
  ColCount: integer;
  Column: TColumn;
  c: Integer;
begin
  SheetData.BeginUpdate;
  try
    ClearGrid;
    SheetData.RowCount := Xls.RowCount;
    ColCount := Xls.ColCount; // NOTE THAT COLCOUNT IS SLOW. We use it here because we really need it. See the Performance.pdf doc.
    //Create the columns
    for c := 1 to ColCount do
    begin
      Column := TColumn.Create(SheetData);
      Column.Width := Xls.GetColWidth(c) / TExcelMetrics.ColMult(Xls);
      Column.Header := TCellAddress.EncodeColumn(c);
      Column.Parent := SheetData;
    end;
  finally
    SheetData.EndUpdate;
  end;
  SheetData.Repaint;
end;

end.
