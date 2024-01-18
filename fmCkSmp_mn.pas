unit fmCkSmp_mn;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Menus, FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
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
    miOpenSpreadsheet: TMenuItem;
    miDivider1: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.
