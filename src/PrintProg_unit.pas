unit PrintProg_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ComCtrls, ExtCtrls;

type
  TDrucken = class(TForm)
    RichEdit1: TRichEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    PrinterSetupDialog1: TPrinterSetupDialog;
    SpeedButton3: TSpeedButton;
    //RxLabel1: TRxLabel;
    //RxLabel2: TRxLabel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    procedure SpeedButton3Click(Sender: TObject);
    procedure Lade_Druckdaten;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Drucken: TDrucken;

implementation

uses main;

{$R *.DFM}

procedure Tdrucken.Lade_Druckdaten;
begin
  label1.caption := form1.typ;
  label2.caption := form1.programm_name;
  richedit1.text := form1.edit.text;
end;

procedure TDrucken.SpeedButton3Click(Sender: TObject);
begin
  printersetupdialog1.execute;
end;

procedure TDrucken.SpeedButton2Click(Sender: TObject);
begin
  modalresult := mrcancel;
end;

procedure TDrucken.FormShow(Sender: TObject);
begin
  lade_druckdaten;
end;

procedure TDrucken.SpeedButton1Click(Sender: TObject);
var
  alter_text: string;
  a: integer;
begin
  drucken.visible := false;
  richedit1.font.size := 12;
  alter_text := richedit1.text;
  richedit1.text := #13 + #10
    + #13 + #10
    + #13 + #10
    + #13 + #10
    + label1.caption + #13 + #10
    + label2.caption + #13 + #10
    + 'Ausdruck vom ' + DateToStr(Date) + '  ' + TimeToStr(time) + #13 + #10
    + '----------------------------------' + #13 + #10
    + alter_text;
  for a := 0 to richedit1.lines.count do
    richedit1.lines[a] := '                                 ' +
      richedit1.lines[a];
  richedit1.Print('Ausdruck vom ' + DateToStr(Date) + '  ' + TimeToStr(time));
  modalresult := mrOk;
end;

end.
