unit ReciveData_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Led, Buttons, StdCtrls,
  ComCtrls;

type
  TRecive = class(TForm)
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    //RxLabel1: TRxLabel;
    rxLed: TLED;
    led_timer: TTimer;
    OpenLED: TLED;
    //RxLabel2: TRxLabel;
    //RxLabel3: TRxLabel;
    ereignis_led: TLED;
    //RxLabel4: TRxLabel;
    StatusBar1: TStatusBar;
    ereignis_timer: TTimer;
    Label1: TLabel;
    procedure led_timerTimer(Sender: TObject);
    procedure empfang;
    procedure Daten_In;
    procedure Daten_Uebernehmen;
    procedure Memo1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure RxSwitch1On(Sender: TObject);
    procedure RxSwitch1Off(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure Ereignis(art:string);
    procedure ereignis_timerTimer(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Recive: TRecive;

implementation

uses main;


{$R *.DFM}

procedure TRecive.Daten_In;
begin
speedbutton1.enabled:=true;
end;

procedure TRecive.Ereignis(art:string);
begin
statusbar1.panels[0].text:=art;
ereignis_led.state:=ledon;
ereignis_timer.enabled:=true;
end;

Procedure TRecive.Daten_Uebernehmen;
var a:integer;temp:string;
begin
temp:=memo1.text;
a:=pos('%MPF',temp);
if a=0 then
begin
delete(temp,1,pos('%',temp)+3);
delete(temp,pos('%',temp),length(temp));
end;
memo1.text:=temp;
speedbutton1.enabled:=false;
form1.loesche_edit;
Form1.Caption:=form1.FormCaption;
Form1.edit.text:=Memo1.Text;
end;

procedure TRecive.empfang;
begin
rxled.state:=ledon;
led_timer.enabled:=true;
end;

procedure TRecive.led_timerTimer(Sender: TObject);
begin
led_timer.enabled:=false;
rxled.state:=ledoff;
end;

procedure TRecive.Memo1Change(Sender: TObject);
begin
daten_in;
end;

procedure TRecive.SpeedButton1Click(Sender: TObject);
var a,b:integer;
begin
modalresult:=mrOK;
daten_Uebernehmen;
{b:=0;
delete(form1.inbuf,1,pos('O',form1.inbuf));
for a:=1 to length(form1.inbuf) do
    if ord(form1.inbuf[a])=0 then
       b:=b+1;
if b=10 then beep;}
end;

procedure TRecive.FormShow(Sender: TObject);
begin
form1.inbuf:='';
label1.caption:='0';
memo1.clear;
form1.schalte_an;
end;

procedure TRecive.SpeedButton2Click(Sender: TObject);
begin
Modalresult:=MrCancel;
end;

procedure TRecive.RxSwitch1On(Sender: TObject);
begin
form1.schalte_an;
end;

procedure TRecive.RxSwitch1Off(Sender: TObject);
begin
form1.schalte_aus;
end;

procedure TRecive.FormHide(Sender: TObject);
begin
form1.schalte_aus;
end;

procedure TRecive.ereignis_timerTimer(Sender: TObject);
begin
ereignis_led.state:=ledoff;
statusbar1.panels[0].text:='';
ereignis_timer.enabled:=false;
end;

end.
