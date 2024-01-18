unit CkSmp_ShtIm_VCL;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs,
  ComCtrls, Buttons, OleCtrls, ExtCtrls, StdCtrls, Mask, IniFiles,
  Grids,ToolWin,
  Vcl.Tabs,
  AxCtrls,VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Render, FlexCel.Preview,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, SVGIconVirtualImageList;

type
  TfmSheetImport = class(TForm)
    pControl: TPanel;
    sbSheet: TStatusBar;
    bbOpenSheet: TBitBtn;
    bbCancel: TBitBtn;
    pData: TPanel;
    pDefinitions: TPanel;
    Splitter1: TSplitter;
    gbDefineFields: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label20: TLabel;
    eX: TEdit;
    eY: TEdit;
    eYerr: TEdit;
    Panel3: TPanel;
    gbDefineTabSheet: TGroupBox;
    cbSheetName: TComboBox;
    gbDefineRows: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    sbFindLastRow: TSpeedButton;
    eFromRow: TEdit;
    eToRow: TEdit;
    bbImport: TBitBtn;
    SheetData: TStringGrid;
    Tabs: TTabSet;
    OpenDialogSprdSheet: TOpenDialog;
    SVGIconVirtualImageList1: TSVGIconVirtualImageList;
    procedure bbOpenSheetClick(Sender: TObject);
    procedure bbImportClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure sbFindLastRowClick(Sender: TObject);
    procedure cbSheetNameChange(Sender: TObject);
    procedure TabsClick(Sender: TObject);
  private
    { Private declarations }
    Xls : TXlsFile;
    function ConvertCol2Int(AnyString : string) : integer;
    procedure FillTabs;
    procedure ClearGrid;
    procedure FillGrid(const Formatted: boolean);
  public
    { Public declarations }
  end;

var
  fmSheetImport: TfmSheetImport;

implementation

uses Allsorts, TC_dm, tc_varb, mar_def, CkSmp_dm;

{$R *.DFM}

var
  iRec, iRecCount      : integer;

function TfmSheetImport.ConvertCol2Int(AnyString : string) : integer;
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

procedure TfmSheetImport.bbOpenSheetClick(Sender: TObject);
var
  tmpStr    : string;
  i         : integer;
begin
  //TabControl.Tabs.Clear;
  cbSheetname.Items.Clear;
  OpenDialogSprdSheet.InitialDir := DataPath;
  if OpenDialogSprdSheet.Execute then
  begin
    DataPath := ExtractFilePath(OpenDialogSprdSheet.FileName);
    //Open the Excel file.
    if Xls = nil then Xls := TXlsFile.Create(false);
    xls.Open(OpenDialogSprdSheet.FileName);
    FillTabs;
    Tabs.TabIndex := Xls.ActiveSheet - 1;
    //FlexCelImport1.OpenFile(OpenDialogSprdSheet.FileName);
    //for i := 1 to FlexCelImport1.SheetCount do
    //begin
    //  FlexCelImport1.ActiveSheet:=i;
    //  TabControl.Tabs.Add(FlexCelImport1.ActiveSheetName);
    //  cbSheetname.Items.Add(FlexCelImport1.ActiveSheetName);
    //end;
    //FlexCelImport1.ActiveSheet:=1;
    //TabControl.TabIndex:=FlexCelImport1.ActiveSheet-1;
    //cbSheetName.ItemIndex := FlexCelImport1.ActiveSheet-1;
    //Data.LoadSheet;
    //Data.Zoom := 70;
    FillGrid(true);
    pDefinitions.Visible := true;
    gbDefineFields.Visible := true;
    gbDefineRows.Visible := true;
    Splitter1.Visible := true;
    bbImport.Visible := true;
    bbImport.Enabled := true;
    //dblcbImportSpec.KeyValue := dmDVRD.ElemNamesImportSpecName.AsString;
    try
      sbFindLastRowClick(Sender);
    except
    end;
  end;
end;

procedure TfmSheetImport.FillTabs;
var
  s: integer;
begin
  Tabs.Tabs.Clear;
  cbSheetname.Items.Clear;
  for s := 1 to Xls.SheetCount do
  begin
    Tabs.Tabs.Add(Xls.GetSheetName(s));
    cbSheetname.Items.Add(Xls.GetSheetName(s));
  end;
end;

procedure TfmSheetImport.ClearGrid;
var
  r: integer;
begin
  for r := 1 to SheetData.RowCount do SheetData.Rows[r].Clear;
end;

procedure TfmSheetImport.FillGrid(const Formatted: boolean);
var
  r, c, cIndex: Integer;
  v: TCellValue;
begin
  if Xls = nil then exit;
  if (Tabs.TabIndex + 1 <= Xls.SheetCount) and (Tabs.TabIndex >= 0) then Xls.ActiveSheet := Tabs.TabIndex + 1 else Xls.ActiveSheet := 1;
  //Clear data in previous grid
  ClearGrid;
  SheetData.RowCount := 1;
  SheetData.ColCount := 1;
  //FmtBox.Text := '';
  SheetData.RowCount := Xls.RowCount + 1; //Include fixed row
  SheetData.ColCount := Xls.ColCount + 1; //Include fixed col. NOTE THAT COLCOUNT IS SLOW. We use it here because we really need it. See the Performance.pdf doc.
  if (SheetData.ColCount > 1) then SheetData.FixedCols := 1; //it is deleted when we set the width to 1.
  if (SheetData.RowCount > 1) then SheetData.FixedRows := 1;

  for r := 1 to Xls.RowCount do
  begin
    //Instead of looping in all the columns, we will just loop in the ones that have data. This is much faster.
    for cIndex := 1 to Xls.ColCountInRow(r) do
    begin
      c := Xls.ColFromIndex(r, cIndex); //The real column.
      if Formatted then
      begin
        SheetData.Cells[c, r] := Xls.GetStringFromCell(r, c);
      end
      else
      begin
        v := Xls.GetCellValue(r, c);
        SheetData.Cells[c, r] := v.ToString;
      end;
    end;
  end;
  //Fill the row headers
  for r := 1 to SheetData.RowCount - 1 do
  begin
    SheetData.Cells[0, r] := IntToStr(r);
    SheetData.RowHeights[r] := Round(Xls.GetRowHeight(r) / TExcelMetrics.RowMultDisplay(Xls));
  end;
  //Fill the column headers
  for c := 1 to SheetData.ColCount - 1 do
  begin
    SheetData.Cells[c, 0] := TCellAddress.EncodeColumn(c);
    SheetData.ColWidths[c] := Round(Xls.GetColWidth(c) / TExcelMetrics.ColMult(Xls));
  end;
  //SelectedCell(1,1);
end;


procedure TfmSheetImport.bbImportClick(Sender: TObject);
var
  j     : integer;
  iCode : integer;
  i : integer;
  tmpStr : string;
  x1,x2,
  y1, y2 : double;
begin
  ImportSheetNumber := cbSheetName.ItemIndex + 1;
  FromRowValueString := UpperCase(eFromRow.Text);
  ToRowValueString := UpperCase(eToRow.Text);
  XColStr := UpperCase(eX.Text);
  YColStr := UpperCase(eY.Text);
  YerrColStr := UpperCase(eYerr.Text);
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
  XCol := ConvertCol2Int(eX.Text);
  YCol := ConvertCol2Int(eY.Text);
  YerrCol := ConvertCol2Int(eYerr.Text);
  if (iCode = 0) then
  begin
    ModalResult := mrOK;
    dmSea.cdsSeaRaw.DisableControls;
    try
      dmSea.cdsSeaRaw.EmptyDataSet;
      dmSea.cdsSeaRaw.Last;
      repeat
        dmSea.cdsSeaRaw.Delete;
      until dmSea.cdsSeaRaw.Bof;
    except
    end;
    Application.ProcessMessages;
    dmSea.cdsSeaRaw.DisableControls;
    try
      for i := FromRow to ToRow do
      begin
        sbSheet.Panels[0].Text := IntToStr(i);
        sbSheet.Refresh;
        try
          dmSea.cdsSeaRaw.Append;
          tmpStr := Xls.GetStringFromCell(i,XCol);
          dmSea.cdsSeaRawAge.AsString := tmpStr;
          tmpStr := Xls.GetStringFromCell(i,YCol);
          dmSea.cdsSeaRawRatio.AsString := tmpStr;
          tmpStr := Xls.GetStringFromCell(i,YerrCol);
          dmSea.cdsSeaRawError.AsString := tmpStr;
          dmSea.cdsSeaRaw.Post;
          if ((dmSea.cdsSeaRawAge.AsString = '') or (dmSea.cdsSeaRawRatio.AsString = ''))
            then dmSea.cdsSeaRaw.Delete;
        except
          dmSea.cdsSeaRaw.Delete;
        end;
      end;
    finally
      dmSea.cdsSeaRaw.EnableControls;
    end;
    Application.ProcessMessages;
    sbSheet.Panels[0].Text := '';
    dmSea.cdsSeaRaw.First;
    dmSea.cdsSeaRaw.SaveToFile(cdsPath+'SeaRaw.cds');
    dmSea.cdsSeaRaw.First;
    try
      dmSea.cdsDeltaT.EmptyDataSet;
      dmSea.cdsDeltaT.Last;
      repeat
        dmSea.cdsDeltaT.Delete;
      until dmSea.cdsDeltaT.Bof;
    except
    end;
    x1 := dmSea.cdsSeaRawAge.AsFloat;
    y1 := dmSea.cdsSeaRawRatio.AsFloat;
    repeat
      dmSea.cdsSeaRaw.Next;
      x2 := dmSea.cdsSeaRawAge.AsFloat;
      y2 := dmSea.cdsSeaRawRatio.AsFloat;
      try
        dmSea.cdsDeltaT.Append;
        dmSea.cdsDeltaTAge.AsFloat := x2;
        dmSea.cdsDeltaTDeltaT.AsFloat := x2-x1;
        dmSea.cdsDeltaT.Post;
        x1 := x2;
      except
      end;
    until dmSea.cdsSeaRaw.Eof;
    dmSea.cdsDeltaT.SaveToFile(cdsPath+'DeltaT.cds');
  end else
  begin
    ModalResult := mrNone;
  end;
end;

procedure TfmSheetImport.FormShow(Sender: TObject);
var
  i, j : integer;
begin
  Splitter1.Visible := false;
  pDefinitions.Visible := false;
  bbImport.Visible := false;
  gbDefineFields.Visible := false;
  gbDefineRows.Visible := false;
  eFromRow.Text := FromRowValueString;
  eFromRow.Text := '1';
  eToRow.Text := ToRowValueString;
  eX.Text := XColStr;
  eY.Text := YColStr;
  eYerr.Text := YerrColStr;
  bbImport.Enabled := true;
  bbOpenSheetClick(Sender);
end;


procedure TfmSheetImport.bbCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;


procedure TfmSheetImport.sbFindLastRowClick(Sender: TObject);
var
  iCode : integer;
  tmpStr : string;
  i,j : integer;
begin
  ImportSheetNumber := cbSheetName.ItemIndex+1;
  XColStr := UpperCase(eX.Text);
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
    j := ConvertCol2Int(XColStr);
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


procedure TfmSheetImport.cbSheetNameChange(Sender: TObject);
begin
  Tabs.TabIndex := cbSheetname.ItemIndex;
  sbFindLastRowClick(Sender);
end;

procedure TfmSheetImport.TabsClick(Sender: TObject);
begin
  FillGrid(true);
end;

end.
