unit CkSmp_varb;

interface

uses
  SysUtils;

const
  CkSmpVersionStr = 'CheckSamples (2013-2023)';
  CkSmpVersion = '2.6.0';
  zero         = 0;
  zerofloat    = 0.0;
  DefaultZeroLimit = 1.0e-14;
  NoDataValue = -999.99;

var
  Filename    : string[8];
  Title       : string[40];
  tempstr     : string[10];
  NPts        : integer;
  GlobalChosenStyle : string;

var
   done                  : boolean;
   AnyKey                : char;
   FullFileName         : string;
   IniFileName,
   IniFilePath,
   CommonFilePath,
   ProgramFilePath,
   FlexTemplatePath,
   ExportPath,
   DataPath   : string;
   TotalRecs                   : Integer;
   AssocCol,
   ImportSheetNumber,
   SampleNoCol, OriginalNoCol,
   RegionIDCol,
   LatitudeCol, LongitudeCol : integer;
   SampleNoColStr,OriginalNoColStr,
   RegionIDColStr,
   LatitudeColStr, LongitudeColStr : string;
   FromRowValueString, ToRowValueString : string;
   FromRow, ToRow : integer;
   ShowOnly50Rows : boolean;
   Formatted : boolean;

function ConvertCol2Int(AnyString : string) : integer;

implementation


function ConvertCol2Int(AnyString : string) : integer;
var
  itmp    : integer;
  tmpStr  : string;
  tmpANSIstr : ANSIstring;
  tmpANSIChar : ANSIchar;
begin
    AnyString := UpperCase(AnyString);
    tmpStr := AnyString;
    Trim(tmpStr);
    //ClearNull(tmpStr);
    tmpANSIstr := ANSIstring(tmpStr);
    if (length(tmpANSIstr) = 2) then
    begin
      tmpANSIChar := tmpANSIstr[1];
      itmp := (ord(tmpANSIChar)-64)*26;
      tmpANSIChar := tmpANSIstr[2];
      Result := itmp+(ord(tmpANSIChar)-64);
    end else
    begin
      tmpANSIChar := tmpANSIstr[1];
      Result := (ord(tmpANSIChar)-64);
    end;
end;

end.
