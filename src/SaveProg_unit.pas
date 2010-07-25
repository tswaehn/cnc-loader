unit SaveProg_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, StdCtrls;

type
  TSpeichern = class(TForm)
    //RxLabel1: TRxLabel;
    //RxLabel2: TRxLabel;
    Label1: TLabel;
    Label2: TLabel;
    ListBox1: TListBox;
    Edit1: TEdit;
    //RxLabel3: TRxLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure lade_daten;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    filename: string;
  end;

var
  Speichern: TSpeichern;

implementation

uses main, OpenProg_unit;

{$R *.DFM}

procedure TSpeichern.lade_daten;
var
  sr: TSearchRec;
  result: word;
begin
  listbox1.clear;
  label1.caption := form1.typ;
  label2.caption := form1.inifile.readstring('Verzeichnisse', 'Verzeichnis' +
    inttostr(form1.typ_index), 'c:\');
  label3.caption := form1.inifile.readstring('Verzeichnisse', 'Extension' +
    inttostr(form1.typ_index), '*.LOG');
  if label2.caption = '' then
    label2.caption := 'C:\';
  if label3.caption = '' then
    label3.caption := '*.LOG';
  result := FindFirst(label2.caption + label3.caption, faAnyFile, sr);
  while result = 0 do
  begin
    listbox1.items.add(Open.UPStr(sr.Name));
    result := findnext(sr);
  end;
  edit1.text := '';
end;

procedure TSpeichern.SpeedButton2Click(Sender: TObject);
begin
  modalresult := mrcancel;
end;

procedure TSpeichern.FormShow(Sender: TObject);
begin
  lade_daten;
end;

procedure TSpeichern.SpeedButton1Click(Sender: TObject);
var
  endung: string;
  punkt_pos: integer;
begin
  endung := label3.caption;
  punkt_pos := pos('.', endung);
  delete(endung, 1, punkt_pos - 1);
  filename := label2.caption + edit1.text + endung;
  modalresult := mrok;
end;

end.
