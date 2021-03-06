unit ReciveData_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Led, Buttons, StdCtrls,
  ComCtrls, CPortCtl;

type
  TRecive = class(TForm)
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    //RxLabel1: TRxLabel;
    rxLed: TLED;
    led_timer: TTimer;
    OpenLED: TLED;
    //RxLabel4: TRxLabel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure led_timerTimer(Sender: TObject);
    procedure empfang();
    procedure Daten_In;
    procedure Daten_Uebernehmen;
    procedure Memo1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure RxSwitch1On(Sender: TObject);
    procedure RxSwitch1Off(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure Ereignis(art: string);

    function charCount( text: string ): integer;

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
  speedbutton1.enabled := true;
end;

procedure TRecive.Ereignis(art: string);
begin
  statusbar1.panels[0].text := art;
end;

procedure TRecive.Daten_Uebernehmen;
var
  a: integer;
  temp: string;
begin
  temp := memo1.text;
  a := pos('%MPF', temp);
  if a = 0 then
  begin
    delete(temp, 1, pos('%', temp) + 3);
    delete(temp, pos('%', temp), length(temp));
  end;
  memo1.text := temp;
  speedbutton1.enabled := false;
  form1.loesche_edit;
  Form1.Caption := form1.FormCaption;
  Form1.edit.text := Memo1.Text;
end;

function TRecive.charCount( text: string ): integer;
var i:integer;
    len :integer;
    count:integer;
    ch : char;
begin
    count := 0;
    len := length( text );
    for i := 1 to len do begin
    ch := text[i];

    case ch of
      'a'..'z',
        'A'..'Z',
        '0'..'9',
        '[', ']',
        '(', ')',
        '$', '%',
        '=',
        #32,
        '.': count := count + 1;
    end;

    end;
    charCount := count;
end;

procedure TRecive.empfang();
begin
  memo1.Text:= form1.inbuf;
  label1.Caption := IntToStr( charCount( form1.inbuf ) );
  rxled.state := ledon;
  led_timer.enabled := true;
end;

procedure TRecive.led_timerTimer(Sender: TObject);
begin
  led_timer.enabled := false;
  rxled.state := ledoff;
end;

procedure TRecive.Memo1Change(Sender: TObject);
begin
  daten_in;
end;

procedure TRecive.SpeedButton1Click(Sender: TObject);
var
  a, b: integer;
begin
  modalresult := mrOK;
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
  form1.inbuf := '';
  label1.caption := '0';
  memo1.clear;
  form1.schalte_an;
end;

procedure TRecive.SpeedButton2Click(Sender: TObject);
begin
  Modalresult := MrCancel;
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

end.
