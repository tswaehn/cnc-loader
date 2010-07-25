program CNC_Loader;

uses
  Forms,
  CNC1 in 'CNC1.pas' {Form1},
  CNC2 in 'CNC2.pas' {ComSettings},
  CNC3 in 'CNC3.pas' {Recive},
  CNC4 in 'CNC4.pas' {Send},
  CNC5 in 'CNC5.pas' {Neu},
  CNC6 in 'CNC6.pas' {ProgVerzeichnisse},
  CNC7 in 'CNC7.pas' {Directory},
  CNC8 in 'CNC8.pas' {Open},
  CNC9 in 'CNC9.pas' {Drucken},
  CNC10 in 'CNC10.pas' {Speichern};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TComSettings, ComSettings);
  Application.CreateForm(TRecive, Recive);
  Application.CreateForm(TSend, Send);
  Application.CreateForm(TNeu, Neu);
  Application.CreateForm(TProgVerzeichnisse, ProgVerzeichnisse);
  Application.CreateForm(TDirectory, Directory);
  Application.CreateForm(TOpen, Open);
  Application.CreateForm(TDrucken, Drucken);
  Application.CreateForm(TSpeichern, Speichern);
  Application.Run;
end.
