unit ucapture;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, VaClasses, VaComm;

type
  TForm1 = class(TForm)
    VaComm1: TVaComm;
    Memo1: TMemo;
    Button1: TButton;
    Memo2: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VaComm1RxChar(Sender: TObject; Count: Integer);
  private
    FMessage: string;
    procedure DoEvent(AMsg: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}


procedure TForm1.FormCreate(Sender: TObject);
begin
  VaComm1.Open;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.DoEvent(AMsg: string);
begin
  Memo1.Lines.Add('Got a message delimited by #13...');
  Memo1.Lines.Add(AMsg);
end;

procedure TForm1.VaComm1RxChar(Sender: TObject; Count: Integer);
var
  I: Integer;
  Tmp: string;
begin
  //read data from comport
  Tmp := VaComm1.ReadText;

  //debugging log...
  Memo2.Lines.Text := Memo2.Lines.Text + Tmp;

  for I := 1 to Length(Tmp) do
    case Tmp[I] of
      #10:; //skip this one
      #13:  //Waiting for this?
        begin
          DoEvent(FMessage);
          FMessage := '';  //reset received message
        end;
      else //not #10 or #13
        FMessage := FMessage + Tmp[I];
    end;
end;


end.
