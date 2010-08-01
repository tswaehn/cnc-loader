unit CNC5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, RXCtrls, StdCtrls;

type
  TNeu = class(TForm)
    Edit1: TEdit;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Neu: TNeu;

implementation

{$R *.DFM}

procedure TNeu.SpeedButton1Click(Sender: TObject);
var zahl,code:integer;
begin
val(edit1.text,zahl,code);
if code = 0 then modalresult:=mrok else Messagedlg('Für Programmnummer sind nur Ziffern erlaubt.',mterror,[mbok],0);
end;

procedure TNeu.FormShow(Sender: TObject);
begin
edit1.text:='0000';
edit2.text:='Unbenannt';
end;

end.
