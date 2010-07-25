unit ComSettings_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls;

type
  TComSettings = class(TForm)
    cbPort: TComboBox;
    cbBaud: TComboBox;
    cbDatabits: TComboBox;
    cbDTR: TComboBox;
    cbRTS: TComboBox;
    cbParity: TComboBox;
    cbFlowControl: TComboBox;
    cbStopBits: TComboBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    //RxLabel9: TRxLabel;
    //RxLabel10: TRxLabel;
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

uses main;



{$R *.DFM}

procedure TComSettings.Load_Defaults(Typ:string);
begin
if length(typ)<= 0 then typ:='Standard';
label1.Caption:=typ;
cbPort.itemindex:=Form1.Inifile.Readinteger(Typ,'Port',0);
cbBaud.itemindex:=Form1.Inifile.Readinteger(Typ,'Baudrate',0);
cbDatabits.itemindex:=Form1.Inifile.Readinteger(Typ,'Databits',0);
cbDTR.itemindex:=Form1.Inifile.Readinteger(Typ,'Dtr',0);
cbRTS.itemindex:=Form1.Inifile.Readinteger(Typ,'Rts',0);
cbParity.itemindex:=Form1.Inifile.Readinteger(Typ,'Parity',0);
cbFlowControl.itemindex:=Form1.Inifile.Readinteger(Typ,'FlowControl',0);
cbStopBits.itemindex:=Form1.Inifile.Readinteger(Typ,'StopBits',0);
end;

procedure TComSettings.Save_Defaults(Typ:string);
begin
if length(typ)<= 0 then typ:='Standard';
Form1.Inifile.writeinteger(Typ,'Port',cbPort.Itemindex);
Form1.Inifile.writeinteger(Typ,'Baudrate',cbBaud.Itemindex);
Form1.Inifile.writeinteger(Typ,'Databits',cbDatabits.Itemindex);
Form1.Inifile.writeinteger(Typ,'Dtr',cbDTR.Itemindex);
Form1.Inifile.writeinteger(Typ,'Rts',cbRTS.Itemindex);
Form1.Inifile.writeinteger(Typ,'Parity',cbParity.Itemindex);
Form1.Inifile.writeinteger(Typ,'FlowControl',cbFlowControl.Itemindex);
Form1.Inifile.writeinteger(Typ,'StopBits',cbStopBits.Itemindex);
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
