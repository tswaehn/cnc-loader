unit ComSettings_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, RXCtrls, ExtCtrls;

type
  TComSettings = class(TForm)
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel8: TRxLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Bevel1: TBevel;
    RxLabel9: TRxLabel;
    RxLabel10: TRxLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Load_defaults(Typ:string);
    procedure Save_defaults(Typ:string);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  ComSettings: TComSettings;

implementation

uses CNC1;

{$R *.DFM}

procedure TComSettings.Load_Defaults(Typ:string);
begin
if length(typ)<= 0 then typ:='Standard';
RxLabel9.Caption:=typ;
ComboBox1.itemindex:=Form1.Inifile.Readinteger(Typ,'Port',0);
ComboBox2.itemindex:=Form1.Inifile.Readinteger(Typ,'Baudrate',0);
ComboBox3.itemindex:=Form1.Inifile.Readinteger(Typ,'Databits',0);
ComboBox4.itemindex:=Form1.Inifile.Readinteger(Typ,'Dtr',0);
ComboBox5.itemindex:=Form1.Inifile.Readinteger(Typ,'Rts',0);
ComboBox6.itemindex:=Form1.Inifile.Readinteger(Typ,'Parity',0);
ComboBox7.itemindex:=Form1.Inifile.Readinteger(Typ,'FlowControl',0);
ComboBox8.itemindex:=Form1.Inifile.Readinteger(Typ,'StopBits',0);
end;

procedure TComSettings.Save_Defaults(Typ:string);
begin
if length(typ)<= 0 then typ:='Standard';
Form1.Inifile.writeinteger(Typ,'Port',ComboBox1.Itemindex);
Form1.Inifile.writeinteger(Typ,'Baudrate',ComboBox2.Itemindex);
Form1.Inifile.writeinteger(Typ,'Databits',ComboBox3.Itemindex);
Form1.Inifile.writeinteger(Typ,'Dtr',ComboBox4.Itemindex);
Form1.Inifile.writeinteger(Typ,'Rts',ComboBox5.Itemindex);
Form1.Inifile.writeinteger(Typ,'Parity',ComboBox6.Itemindex);
Form1.Inifile.writeinteger(Typ,'FlowControl',ComboBox7.Itemindex);
Form1.Inifile.writeinteger(Typ,'StopBits',ComboBox8.Itemindex);
end;

procedure TComSettings.SpeedButton1Click(Sender: TObject);
begin
save_defaults(Form1.Settings_for);
Modalresult:=MrOK;
end;

procedure TComSettings.SpeedButton2Click(Sender: TObject);
begin
Modalresult:=MrCancel;
end;

procedure TComSettings.FormShow(Sender: TObject);
begin
load_defaults(Form1.Settings_For);
end;

end.
