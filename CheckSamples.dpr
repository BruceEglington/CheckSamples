program CheckSamples;

uses
  System.StartUpCopy,
  FMX.Forms,
  CkSmp_mn in 'CkSmp_mn.pas' {fmCkSmp_mn},
  CkSmp_varb in 'CkSmp_varb.pas',
  CkSmp_ShtIm in 'CkSmp_ShtIm.pas' {CkSmp_import},
  Allsorts in '..\Eglington Delphi common code items\Allsorts.pas',
  CkSmp_dm in 'CkSmp_dm.pas' {dmCkSmp: TDataModule},
  CkSmp_dmStrat in 'CkSmp_dmStrat.pas' {dmStratCkSmp: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmCkSmp_mn, fmCkSmp_mn);
  Application.CreateForm(TCkSmp_import, CkSmp_import);
  Application.CreateForm(TdmCkSmp, dmCkSmp);
  Application.Run;
end.
