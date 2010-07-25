unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CPort;

type
  TForm1 = class(TForm)
    ComPort1: TComPort;
    memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    text: string;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var count:integer;
  I: Integer;
  line:string;
begin
  comport1.DataBits := dbEight;

  count := memo1.lines.count;
  for I := 1 to count do begin
    line := memo1.Lines[i];
    comport1.WriteStr( line );

  end;

  comport1.DataBits := dbSeven;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  datei:textfile;
  buf:string;
begin
  memo1.Text := '%'+#13+#10
+'O2(TESTITZEN-D31    )(B         )(FREI-SCHNAUZE )(16.07.10)'     +#13+#10
+'G59X0Z115'                                                   +#13+#10
+'G26'                                                          +#13+#10
+'N30(ANSCHLAGEN)'                                              +#13+#10
+'T3030'                                                        +#13+#10
+'G0X0Z1'                                                       +#13+#10
+'M30'                                                          +#13+#10
+'%'                                                           +#13+#10    ;

  assignfile(datei, 'file.txt');
  reset(datei);

  text:='';
  while (not eof(datei)) do begin
    readln(datei,buf);
    text:= text + buf+ #13#10;
  end;


  closefile(datei);
//  comport1.DataBits := dbEight;
  comport1.WriteStr( text );
  //comport1.DataBits := dbSeven;

end;

procedure TForm1.ComPort1RxChar(Sender: TObject; Count: Integer);
var buf:string;
begin
  comport1.ReadStr(buf, count);
  text:=text+buf;
  memo1.text := memo1.text + buf;
end;

end.
