program CNC_Loader;

uses
  Forms,
  main in 'main.pas' {Form1},
  ComSettings_unit in 'ComSettings_unit.pas' {ComSettings},
  ReciveData_unit in 'ReciveData_unit.pas' {Recive},
  SendData_unit in 'SendData_unit.pas' {Send},
  NewProg_unit in 'NewProg_unit.pas' {Neu},
  ProgList_unit in 'ProgList_unit.pas' {ProgVerzeichnisse},
  DirList_unit in 'DirList_unit.pas' {Directory},
  OpenProg_unit in 'OpenProg_unit.pas' {Open},
  PrintProg_unit in 'PrintProg_unit.pas' {Drucken},
  SaveProg_unit in 'SaveProg_unit.pas' {Speichern};

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
