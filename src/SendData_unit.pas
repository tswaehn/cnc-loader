unit SendData_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Gauges, Led, StdCtrls, ExtCtrls;

type
  TSend = class(TForm)
    Gauge1: TGauge;
    SpeedButton1: TSpeedButton;
    OpenLED: TLED;
    //RxLabel1: TRxLabel;
    SpeedButton2: TSpeedButton;
    //RxLabel2: TRxLabel;
    Label1: TLabel;
    //RxLabel3: TRxLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    //RxLabel4: TRxLabel;
    //RxLabel5: TRxLabel;
    procedure FormShow(Sender: TObject);
    procedure sende;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    function transform(outstr, typ: string): string;
    function TransFormTND200_(OutStr: string): string;
    function TransFormTND200(OutStr: string): string;
    function TransFormIndex(OutStr: string): string;
    function TransFormMIYANO(OutStr: string): string;
    function TransFormStandard(OutStr: string): string;
  private
    { Private-Deklarationen }
    senden_aktiv: boolean;
  public
    { Public-Deklarationen }
  end;

var
  Send: TSend;

implementation

uses main;

{$R *.DFM}

const
  msg_abgebrochen: string = 'Senden abgebrochen';

function TSend.TransFormStandard(OutStr: string): string;
begin
  outstr := '%' + #13 + #10 + outstr + '%' + #13 + #10;
  TransFormStandard := OutStr;
end;

function TSend.TransFormTND200_(OutStr: string): string;
var
  a, ende1: Integer;
  text, kopf, fuss: string;
  i:integer;
begin
  // dec 165 == '?' ==   1010 0101
  // dec 37  == '%' ==   0010 0101

  // dec    'G' =       0110 1011

  kopf:='';

  kopf := kopf + '%';

  for i := 1 to 40 do
    kopf:= kopf + #0;

  kopf := kopf + #13+#10;
  kopf := kopf + 'O1000(WARMLAUFEXX      )(WOLFI     )(              )(03.01.00)'+#13+#10;

  kopf := kopf + #0;

//  kopf := kopf + '([1]1]A16540]1000]) '+ #13 + #10;

  fuss := '';

  for i := 1 to 40 do
    fuss:= fuss + #0;

  fuss := fuss + '%' + #13+#10;

  text := kopf + outstr + fuss;

  {
  outstr:='%'+#13+#10+outstr;
  outstr:=outstr+'%';
  delete(outstr,1, pos ('O',outstr)-1);
  outstr:=#13+#10+outstr;
  for a:=1 to 50 do outstr:=#0+outstr;
  outstr:='%'+outstr;
  for a:=1 to 50 do outstr:=#0+outstr;
  ende1:=pos(#10,outstr);
  kopf:=copy(outstr,1,ende1);
  delete(outstr,1,ende1);

  ende1:=pos(#10,outstr);
  kopf:=kopf+copy(outstr,1,ende1);
  delete(outstr,1,ende1);
  kopf:=kopf+#0;

  outstr:=kopf+outstr;
  }

  //for a:=1 to 500 do outstr:=#32+outstr;

  //outstr := '%' + #13 + #10 + outstr + '%' + #13 + #10;
  TransFormTND200_ := text;
end;

function TSend.TransFormTND200(OutStr: string): string;
var
  a, ende1: Integer;
  text, kopf, fuss: string;
  i:integer;
begin
  // dec 165 == '?' ==   1010 0101
  // dec 37  == '%' ==   0010 0101

  // dec    'G' =       0110 1011

  kopf := '';

  kopf:= kopf + '%';

  for i := 1 to 40 do
    kopf:= kopf + #0;

  kopf := kopf + ' ';
  kopf := kopf + #13+#10;

  //kopf := kopf + 'O30(25H6             )(B         )(              )(23.07.10) ' + #13+#10;

//  for i := 1 to 400 do
//    kopf:= kopf + #0;


  fuss := '';

  for i := 1 to 40 do
    fuss:= fuss + #0;

  fuss := fuss + '%' + #13 +#10;

  text := kopf + outstr + fuss;


  TransFormTND200 := text;
end;

function TSend.TransFormMIYANO(OutStr: string): string;
var
  a: Integer;
begin
  outstr := #10 + outstr + '%' + #20;
  //for a:=1 to 50 do outstr:=#0+outstr;
  outstr := '%' + outstr;
  for a := 1 to 50 do
    outstr := #0 + outstr;
  outstr := #18 + outstr;
  //for a:=1 to length(outstr) do if outstr[a]=#13 then delete(outstr,a,1);
  TransFormMIYANO := OutStr;
end;

function TSend.TransFormINDEX(OutStr: string): string;
var
  a: Integer;
begin
  //outstr:=outstr+#7+#25+#13+#10;
  TransFormINDEX := OutStr;
end;

function TSend.TransForm(Outstr, typ: string): string;
begin
  if typ = 'TND200' then
    TransForm := TransFormTND200(outstr)
  else if typ = 'INDEX ABC' then
    TransForm := TransFormINDEX(outstr)
  else if typ = 'MIYANO BNE51S' then
    TransForm := TransFormMIYANO(OutStr)
  else
    TransForm := TransFormStandard(OutStr);
end;

procedure TSend.Sende;
var
  a: integer;
  result_1, result_2: integer;
  aus: string;
  ch: char;
  swap: textfile;
  k : integer;
  line:string;
begin

  aus := form1.edit.text; // Lade AusgabeString
  aus := transform(aus, form1.typ); // Konvertiere AusgabeString
  assignfile(swap, 'Output.txt');
  rewrite(swap);
  gauge1.maxvalue := length(aus); //

  senden_aktiv := true;
  k:=0;
  line:='';
  for a := 1 to length(aus) do //
  begin
    ch := (aus[a]); //  Ausgeben von  AusgabeString -Zeichenweise


    //if ( ord(ch) < 64) then
    //    ch := chr( ord(ch) + 128 );

    line := line + ch;
    k:=k+1;
    if (k=8) then begin
      line := '';
      k:=0;
      //form1.sendText(line);
    end;
    form1.sendChar( ch );

    application.ProcessMessages;
    write(swap, ch);
    gauge1.progress := a; //
    if not senden_aktiv then
    begin
      messagedlg(msg_abgebrochen, mtError, [mbok], 0);
      writeln(swap, '');
      writeln(swap, msg_abgebrochen);
      break;
    end;

  end;
  senden_aktiv := true;
  closefile(swap);
end;

procedure TSend.FormShow(Sender: TObject);
begin
  label1.caption := form1.typ;
  label2.caption := form1.programm_name;
  gauge1.Progress := 0;
  form1.schalte_an;
  senden_aktiv := false;
end;

procedure TSend.SpeedButton2Click(Sender: TObject);
begin
  speedbutton2.enabled := false;
  sende;
  speedbutton2.Enabled := true;
end;

procedure TSend.FormHide(Sender: TObject);
begin
  form1.schalte_aus;
end;

procedure TSend.SpeedButton1Click(Sender: TObject);
begin
  senden_aktiv := false;
  modalresult := mrCancel;
end;

end.

