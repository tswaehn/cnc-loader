unit CNC1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, VaClasses, VaComm, Menus, Inifiles, RXSwitch, ExtCtrls, StdCtrls,
  Led, ComCtrls,
   VaSystem,VaConst, VaTypes;

type
  TForm1 = class(TForm)
    VaComm1: TVaComm;
    MainMenu1: TMainMenu;
    Exit1: TMenuItem;
    Commsettings1: TMenuItem;
    TND1: TMenuItem;
    TNS3042D1: TMenuItem;
    MIYNO1: TMenuItem;
    INDEXABC1: TMenuItem;
    STARRNC16B1: TMenuItem;
    STARSR161: TMenuItem;
    STARTSV321: TMenuItem;
    STARSW71: TMenuItem;
    OKUMALB91: TMenuItem;
    OKUMALT10M1: TMenuItem;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Bevel1: TBevel;
    edit: TMemo;
    SaveDialog1: TSaveDialog;
    Funktion1: TMenuItem;
    Dateiffnen1: TMenuItem;
    neueDatei1: TMenuItem;
    inDateispeichern1: TMenuItem;
    N1: TMenuItem;
    Programmempfangen1: TMenuItem;
    Programsenden1: TMenuItem;
    About1: TMenuItem;
    OpenDialog1: TOpenDialog;
    StatusBar1: TStatusBar;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    Optionen1: TMenuItem;
    Verzeichnisse1: TMenuItem;
    N2: TMenuItem;
    Timer1: TTimer;
    N3: TMenuItem;
    Drucken1: TMenuItem;
    RadioButton7: TRadioButton;
    STARSR20R1: TMenuItem;
    Image1: TImage;
    Bevel2: TBevel;
    procedure Set_Port_parameter;
    procedure TND1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Init;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TNS3042D1Click(Sender: TObject);
    procedure MIYNO1Click(Sender: TObject);
    procedure INDEXABC1Click(Sender: TObject);
    procedure STARRNC16B1Click(Sender: TObject);
    procedure STARSR161Click(Sender: TObject);
    procedure STARTSV321Click(Sender: TObject);
    procedure STARSW71Click(Sender: TObject);
    procedure OKUMALB91Click(Sender: TObject);
    procedure OKUMALT10M1Click(Sender: TObject);
    procedure Set_Port_var;
    function StrToBaud(Baud:string):TVABaudrate;
    function StrToDataBit(Bit:string):TVADataBits;
    function StrToDtr(Dtr:String):TVadtrControl;
    function StrToFlow(Flow:string):TVaFlowControl;
    function StrToParity(Parity:string):TVaParity;
    function StrToRts(Rts:string):TVaRTSControl;
    function StrToStop(stop:string):TVaStopbits;
    procedure RxSwitch1On(Sender: TObject);
    procedure Schalte_an;
    procedure Schalte_aus;
    procedure Commsettings1Click(Sender: TObject);
    procedure RxSwitch1Off(Sender: TObject);
    procedure VaComm1RxChar(Sender: TObject; Count: Integer);
    procedure VaComm1Close(Sender: TObject);
    procedure VaComm1Open(Sender: TObject);
    procedure Check_char(ch:char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Save(Dateiname:string);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Sende_alles;
    procedure Dateiffnen1Click(Sender: TObject);
    procedure lade(dateiname:string);
    function UpStr(Str:string):String;
    procedure inDateispeichern1Click(Sender: TObject);
    procedure neues_programm;
    procedure neueDatei1Click(Sender: TObject);
    procedure Programmempfangen1Click(Sender: TObject);
    procedure Prog_Change(Wert:boolean);
    procedure Speichern_DLG;
    procedure loesche_edit;
    procedure ask_save;
    procedure editChange(Sender: TObject);
    procedure Programsenden1Click(Sender: TObject);
    procedure HandleException(Sender: TObject; E: Exception);
    procedure Verzeichnisse1Click(Sender: TObject);
    procedure VaComm1Event1(Sender: TObject);
    procedure VaComm1Event2(Sender: TObject);
    procedure VaComm1Error(Sender: TObject; Errors: Integer);
    procedure VaComm1TxEmpty(Sender: TObject);
    procedure VaComm1Rx80Full(Sender: TObject);
    procedure VaComm1Ring(Sender: TObject);
    procedure VaComm1Rlsd(Sender: TObject);
    procedure VaComm1Cts(Sender: TObject);
    procedure VaComm1Break(Sender: TObject);
    procedure VaComm1Dsr(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Drucken1Click(Sender: TObject);
    procedure STARSR20R1Click(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure mark(button:TRadioButton);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure RadioButton8Click(Sender: TObject);
    procedure RadioButton9Click(Sender: TObject);
    procedure RadioButton10Click(Sender: TObject);
    procedure RadioButton11Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
 {f�r Einstellungen}
  com_open:boolean;
  inbuf:string;
  Inifile:Tinifile;
  InifileName:String;
  Pfad:string;
  FormCaption:String;

 {allgemein}
  changed:boolean;
  typ_index:integer;
  Programm_name,
  typ:string;            //Maschinentyp

 {f�r Schnittstelle}
  Settings_For:string;
  Port:Integer;
  Baudrate:TvaBaudrate;
  DataBits:TVaDatabits;
  DTRControl:TVadtrControl;
  FlowControl:TVaFlowControl;
  Parity:TVaParity;
  RtsControl:TVaRTSControl;
  StopBits:TVaStopbits;
  end;

var
  Form1: TForm1;

implementation

uses CNC2, CNC3, CNC4, CNC5, CNC6, CNC8, CNC9, CNC10;

{$R *.DFM}

procedure TForm1.Mark(button:TRadioButton);
begin
radiobutton1.font.color:=clblack;
radiobutton2.font.color:=clblack;
radiobutton3.font.color:=clblack;
radiobutton4.font.color:=clblack;
radiobutton5.font.color:=clblack;
radiobutton6.font.color:=clblack;
radiobutton7.font.color:=clblack;
radiobutton8.font.color:=clblack;
radiobutton9.font.color:=clblack;
radiobutton10.font.color:=clblack;
radiobutton11.font.color:=clblack;
button.font.color:=clRed;
end;

procedure TForm1.HandleException(Sender: TObject; E: Exception);
begin
  if E is EVaCommError then
{    with E as EVaCommError do
      ShowMessage(Message);} messagedlg('Kann ausgew�hlte Schnittstelle nicht benutzen.',mterror,[mbok],0)
         else messagedlg('Error',mterror,[mbok],0);
      beep;
end;


procedure TForm1.Prog_Change(Wert:boolean);
begin
if wert=true then begin
                  statusbar1.panels[0].text:='ge�ndert';
                  changed:=true;
                  end else begin
                  statusbar1.panels[0].text:='unver�ndert';
                  changed:=false;
                  end;
end;

procedure TForm1.Ask_Save;
var a:integer;
begin
if edit.text<> '' then
  a:=messagedlg('Sie haben das Programm '+edit.lines[0] +' noch nicht gespeichert. M�chten Sie dies jetzt tun ?',mtinformation,[mbyes,mbno],0);
if a=mryes then speichern_DLG;
end;

procedure TForm1.loesche_edit;
begin
if changed=true then ask_save;
edit.clear;
end;

procedure TForm1.Speichern_DLG;
begin
speichern.showmodal;
if speichern.modalresult=mrok then save(speichern.FileName);
end;

procedure TForm1.Neues_Programm;
begin
loesche_edit;
Form1.Caption:=FormCaption;
neu.showmodal;
edit.text:='O'+neu.edit1.text+'('+upstr(neu.edit2.text)+')'+#13+#10;
programm_name:='unbenannt';
end;

function TForm1.UpStr(Str:string):string;
var a:integer;temp:string;
begin
temp:=str;
if length(temp)= 0 then exit;
for a:=1 to length(Str) do temp[a]:=upcase(temp[a]);
UpStr:=Temp;
end;

procedure TForm1.Lade(Dateiname:string);
var Text:Textfile;zeile:string;
begin
dateiname:=UpStr(dateiname);
loesche_edit;
if (length(Dateiname)<=0) then exit;
assignfile(Text,Dateiname);
{$I-}
reset(text);
{$I+}
if ioresult <> 0 then begin
                      Messagedlg('Kann Datei nicht �ffnen.',mterror,[mbok],0);
                      exit;
                      end;
while not eof(text) do
      begin
      readln(text,zeile);
      edit.lines.add(zeile);
      end;
closefile(text);
while pos('\',Dateiname)<>0 do
   delete(Dateiname,1,pos('\',Dateiname));
Prog_Change(false);
end;

procedure TForm1.Sende_alles;
begin
send.showmodal;
end;

procedure TForm1.Save(Dateiname:string);
var text:textfile;temp:string;a:integer;
begin
Dateiname:=UpStr(Dateiname);
if (length(Dateiname)=0) then begin
                              messagedlg('Fehler beim Schreiben der Datei.',mterror,[mbok],0);
                              exit;
                              end;
assignfile(text,Dateiname);
rewrite(text);
temp:=edit.Text;
for a:=1 to length(temp) do write(text,temp[a]);
closefile(text);
while pos('\',Dateiname)<>0 do
   delete(Dateiname,1,pos('\',Dateiname));
programm_name:=Dateiname;
Prog_Change(false);
end;

procedure TForm1.Check_char(ch:char);
begin
case ch of
    #0:
    else
    begin
    case ch of
     #10:recive.memo1.text:=recive.memo1.text+#13+#10;
     //':':recive.memo1.text:=recive.memo1.text+'O';
     #13:
     else begin
          recive.rxlabel3.caption:=  inttostr(strtoint(recive.rxlabel3.caption)+1);
          recive.memo1.text:=recive.memo1.text+(ch);
          end;

    end;
     end; //memo1.text:=memo1.text+ch;
   end; //CASE

// edit.text:=edit.text+ch;
end;

procedure TForm1.Schalte_an;
begin
ComSettings.load_defaults(typ);
set_port_var;
set_port_parameter;
vacomm1.open;
end;

procedure TForm1.Schalte_aus;
begin
vacomm1.close;
end;

function TForm1.StrToBaud(baud:string):TVaBaudrate;
begin
if baud='110' then StrToBaud:=br110;
if baud='300' then StrToBaud:=br300;
if baud='600' then StrToBaud:=br600;
if baud='1200' then StrToBaud:=br1200;
if baud='2400' then StrToBaud:=br2400;
if baud='4800' then StrToBaud:=br4800;
if baud='9600' then StrToBaud:=br9600;
if baud='14400' then StrToBaud:=br14400;
end;

function TForm1.StrToDataBit(Bit:string):TVADataBits;
begin
if Bit='4' then StrToDataBit:=db4;
if Bit='5' then StrToDataBit:=db5;
if Bit='6' then StrToDataBit:=db6;
if Bit='7' then StrToDataBit:=db7;
if Bit='8' then StrToDataBit:=db8;
end;

function TForm1.StrToDtr(Dtr:String):TVadtrControl;
begin
if DTR='Enable' then StrToDtr:=dtrenable;
if DTR='Disable' then StrToDtr:=dtrdisable;
if DTR='Handshake' then StrToDtr:=dtrHandshake;
end;

function TForm1.StrToFlow(Flow:string):TVaFlowControl;
begin
if flow='DtrDsr' then StrToFlow:=FCDtrDsr;
if flow='unbenannt' then StrToFlow:=FCnone;
if flow='RtsCts' then StrToFlow:=FCRtsCts;
if flow='XonXoff' then StrToFlow:=FCXonXoff;
end;

function TForm1.StrToParity(Parity:string):TVaParity;
begin
if parity='Even' then StrToParity:=paEven;
if parity='Mark' then StrToParity:=paMark;
if parity='unbenannt' then StrToParity:=panone;
if parity='Odd' then StrToParity:=paodd;
if parity='Space' then StrToParity:=paSpace;
end;

function TForm1.StrToRts(Rts:string):TVaRtsControl;
begin
if rts='Enable' then StrToRts:=rtsEnable;
if rts='Disable' then StrToRts:=rtsDisable;
if rts='Handshake' then StrToRts:=rtsHandshake;
if rts='Toggle' then StrToRts:=rtsToggle;
end;

function TForm1.StrToStop(stop:string):TVaStopbits;
begin
if stop='1' then StrToStop:=sb1;
if stop='1.5' then StrToStop:=sb15;
if stop='2' then StrToStop:=sb2;
end;

procedure TForm1.Set_port_var;
begin
Port:=ComSettings.Combobox1.Itemindex+1;
Baudrate:=StrToBaud(ComSettings.Combobox2.Text);
DataBits:=StrToDataBit(ComSettings.Combobox3.Text);
DTRControl:=StrToDTR(ComSettings.Combobox4.Text);
FlowControl:=StrToFlow(ComSettings.Combobox5.Text);
Parity:=StrToParity(ComSettings.Combobox6.Text);
RtsControl:=StrToRts(ComSettings.Combobox7.Text);
StopBits:=StrToStop(ComSettings.Combobox8.Text);
end;

procedure TForm1.Init;
begin
com_open:=false;
settings_for:='-unbenannt-';
IniFileName:='CNC_LOADER.INI';
GetDir(0,Pfad);
if length(Pfad)>3 then Pfad:=pfad+'\';
inifile:=TInifile.create(Pfad+Inifilename);
FormCaption:='CNC Loader    ';
Programm_Name:='unbenannt';
prog_change(false);
end;

procedure TForm1.Set_Port_parameter;
begin
vacomm1.portNum:=port;
vacomm1.baudrate:=baudrate;
vacomm1.Databits:=databits;
vacomm1.DTRControl:=DtrControl;
vacomm1.FlowControl:=FlowControl;
vacomm1.Parity:=Parity;
vacomm1.RTSControl:=RTSControl;
vacomm1.Stopbits:=Stopbits;
end;


procedure TForm1.TND1Click(Sender: TObject);
begin
Settings_for:='TND200';
ComSettings.ShowModal;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
loesche_edit;
Application.Terminate;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
form1.top:=0;
form1.left:=0;
init;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if com_open then messagedlg('Schnittstelle ist noch offen.',mterror,[mbok],0);
end;

procedure TForm1.TNS3042D1Click(Sender: TObject);
begin
Settings_for:='TNS3042D';
ComSettings.ShowModal;

end;

procedure TForm1.MIYNO1Click(Sender: TObject);
begin
Settings_for:='MIYANO BNE51S';
ComSettings.ShowModal;

end;

procedure TForm1.INDEXABC1Click(Sender: TObject);
begin
Settings_for:='INDEX ABC';
ComSettings.ShowModal;

end;

procedure TForm1.STARRNC16B1Click(Sender: TObject);
begin
Settings_for:='STAR RNC16B';
ComSettings.ShowModal;

end;

procedure TForm1.STARSR161Click(Sender: TObject);
begin
Settings_for:='STAR SR16';
ComSettings.ShowModal;
end;

procedure TForm1.STARTSV321Click(Sender: TObject);
begin
Settings_for:='STAR SV32';
ComSettings.ShowModal;
end;

procedure TForm1.STARSW71Click(Sender: TObject);
begin
Settings_for:='STAR SW7';
ComSettings.ShowModal;
end;

procedure TForm1.OKUMALB91Click(Sender: TObject);
begin
Settings_for:='OKUMA LB9';
ComSettings.ShowModal;
end;

procedure TForm1.OKUMALT10M1Click(Sender: TObject);
begin
Settings_for:='OKUMA LT10M';
ComSettings.ShowModal;
end;

procedure TForm1.RxSwitch1On(Sender: TObject);
begin
schalte_an;
end;

procedure TForm1.Commsettings1Click(Sender: TObject);
begin
schalte_aus;
end;

procedure TForm1.RxSwitch1Off(Sender: TObject);
begin
schalte_aus;
end;

procedure TForm1.VaComm1RxChar(Sender: TObject; Count: Integer);
var instr:string;a:integer;
begin
instr:=vacomm1.ReadText;
inbuf:=inbuf+instr;
for a:=1 to count do check_char(instr[a]);
recive.empfang;
end;

procedure TForm1.VaComm1Close(Sender: TObject);
begin
Recive.OpenLed.state:=LEDOff;
Send.OpenLed.state:=LEDOff;
com_open:=false;
end;

procedure TForm1.VaComm1Open(Sender: TObject);
begin
Application.OnException := HandleException;
Recive.OpenLED.state:=LEDOn;
Send.OpenLED.state:=LEDOn;
com_open:=true;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
edit.clear;
schalte_an;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
schalte_an;
sende_alles;
end;

procedure TForm1.Dateiffnen1Click(Sender: TObject);
begin
open.showmodal;
lade(open.filename);
end;

procedure TForm1.inDateispeichern1Click(Sender: TObject);
begin
Speichern_DLG;
end;

procedure TForm1.neueDatei1Click(Sender: TObject);
begin
neues_programm;
end;

procedure TForm1.Programmempfangen1Click(Sender: TObject);
begin
//schalte_an;
recive.showmodal;
//schalte_aus;
end;

procedure TForm1.editChange(Sender: TObject);
begin
Prog_Change(true);
end;

procedure TForm1.Programsenden1Click(Sender: TObject);
begin

sende_alles;
end;

procedure TForm1.Verzeichnisse1Click(Sender: TObject);
begin
progverzeichnisse.showmodal;
end;

procedure TForm1.VaComm1Event1(Sender: TObject);
begin
recive.ereignis('OnEvent1');
end;

procedure TForm1.VaComm1Event2(Sender: TObject);
begin
recive.ereignis('OnEvent2');
end;

procedure TForm1.VaComm1Error(Sender: TObject; Errors: Integer);
begin
recive.ereignis('OnError');
end;

procedure TForm1.VaComm1TxEmpty(Sender: TObject);
var a:word;
begin
if send.gauge1.Progress>0 then
 begin
 a:=messagedlg('Programm �bertragen.',mtinformation,[mbok],0);
 send.modalresult:=mrOk;
 end;
end;

procedure TForm1.VaComm1Rx80Full(Sender: TObject);
begin
recive.ereignis('OnBufrerFull');
end;

procedure TForm1.VaComm1Ring(Sender: TObject);
begin
recive.ereignis('OnRing');
end;

procedure TForm1.VaComm1Rlsd(Sender: TObject);
begin
recive.ereignis('OnRlsd');
end;

procedure TForm1.VaComm1Cts(Sender: TObject);
begin
recive.ereignis('OnCTS');
end;

procedure TForm1.VaComm1Break(Sender: TObject);
begin
recive.ereignis('OnBreak');
end;

procedure TForm1.VaComm1Dsr(Sender: TObject);
begin
recive.ereignis('OnDSR');
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
Form1.Caption:=FormCaption+'- '+Programm_Name;
if radiobutton1.checked=true then begin typ:=radiobutton1.caption;typ_index:=1;end;
if radiobutton2.checked=true then begin typ:=radiobutton2.caption;typ_index:=2;end;
if radiobutton3.checked=true then begin typ:=radiobutton3.caption;typ_index:=3;end;
if radiobutton4.checked=true then begin typ:=radiobutton4.caption;typ_index:=4;end;
if radiobutton5.checked=true then begin typ:=radiobutton5.caption;typ_index:=5;end;
if radiobutton6.checked=true then begin typ:=radiobutton6.caption;typ_index:=6;end;
if radiobutton7.checked=true then begin typ:=radiobutton7.caption;typ_index:=7;end;
if radiobutton8.checked=true then begin typ:=radiobutton8.caption;typ_index:=8;end;
if radiobutton9.checked=true then begin typ:=radiobutton9.caption;typ_index:=9;end;
if radiobutton10.checked=true then begin typ:=radiobutton10.caption;typ_index:=10;end;
if radiobutton11.checked=true then begin typ:=radiobutton11.caption;typ_index:=11;end;
end;

procedure TForm1.Drucken1Click(Sender: TObject);
begin
drucken.showmodal;
end;

procedure TForm1.STARSR20R1Click(Sender: TObject);
begin
Settings_for:='STAR SR20 R';
ComSettings.ShowModal;
end;

procedure TForm1.FormHide(Sender: TObject);
begin
inifile.free;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
mark(radiobutton1);
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
mark(radiobutton2);
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
mark(radiobutton3);
end;

procedure TForm1.RadioButton4Click(Sender: TObject);
begin
mark(radiobutton4);
end;

procedure TForm1.RadioButton5Click(Sender: TObject);
begin
mark(radiobutton5);
end;

procedure TForm1.RadioButton6Click(Sender: TObject);
begin
mark(radiobutton6);
end;

procedure TForm1.RadioButton7Click(Sender: TObject);
begin
mark(radiobutton7);
end;

procedure TForm1.RadioButton8Click(Sender: TObject);
begin
mark(radiobutton8);
end;

procedure TForm1.RadioButton9Click(Sender: TObject);
begin
mark(radiobutton9);
end;

procedure TForm1.RadioButton10Click(Sender: TObject);
begin
mark(radiobutton10);
end;

procedure TForm1.RadioButton11Click(Sender: TObject);
begin
mark(radiobutton11);
end;

end.
