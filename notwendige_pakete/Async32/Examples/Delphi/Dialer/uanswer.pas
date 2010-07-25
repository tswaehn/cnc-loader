unit uanswer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  VaTypes, VaClasses, VaComm, StdCtrls, VaModem;

type
  TForm1 = class(TForm)
    VaComm: TVaComm;
    Memo1: TMemo;
    Button2: TButton;
    Memo2: TMemo;
    Label5: TLabel;
    Label4: TLabel;
    VaModem1: TVaModem;
    procedure VaCommRxBuf(Sender: TObject; Data: PVaData;
      Count: Integer);
    procedure FormCreate(Sender: TObject);
    procedure VaModem21RingDetect(Sender: TObject; Rings: Integer;
      var AcceptCall: Boolean);
    procedure VaModem21CommandTimeout(Sender: TObject);
    procedure VaModem21Error(Sender: TObject);
    procedure VaModem21OK(Sender: TObject);
    procedure VaModem21Voice(Sender: TObject);
    procedure VaModem21RingWaitTimeout(Sender: TObject);
    procedure VaModem21NoCarrier(Sender: TObject);
    procedure VaModem21Connect(Sender: TObject;
      const ConnectString: String);
    procedure VaModem21AnswerTimeout(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure VaCommDsr(Sender: TObject);
  private
    MemoIndex: Integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  VaComm.Open;
  VaModem1.Init;
  MemoIndex := Memo2.Lines.Add('');
end;

procedure TForm1.VaCommRxBuf(Sender: TObject; Data: PVaData;
  Count: Integer);
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    case Data^[I] of
      #10:;
      #13: MemoIndex := Memo2.Lines.Add('');
      else
      begin
        Memo2.Lines[MemoIndex] := Memo2.Lines[MemoIndex] + Data^[I];
        Memo2.Refresh;
      end;
    end;
end;

procedure TForm1.VaModem21RingDetect(Sender: TObject; Rings: Integer;
  var AcceptCall: Boolean);
begin
  Memo1.Lines.Add('RING: ' + IntToStr(Rings));
  AcceptCall := Rings >= 1;
end;

procedure TForm1.VaModem21CommandTimeout(Sender: TObject);
begin
  case VaModem1.ModemAction of
    maInit: Memo1.Lines.Add('Error initializing modem.');
  end;
end;

procedure TForm1.VaModem21Error(Sender: TObject);
begin
  case VaModem1.ModemAction of
    maInit:
      begin
        Memo1.Lines.Add('Error initializing modem.');
        VaModem1.Active := false; //take modem offline
      end;
    maAnswer: Memo1.Lines.Add('Error in answer string.');
  end;
end;

procedure TForm1.VaModem21OK(Sender: TObject);
begin
  case VaModem1.ModemAction of
    maInit:
      begin
        Memo1.Lines.Add('Modem initialized.');
        Memo1.Lines.Add('Waiting for call.');
      end;
  end;
end;

procedure TForm1.VaModem21Voice(Sender: TObject);
begin
  Memo1.Lines.Add('Voice line');
end;

procedure TForm1.VaModem21RingWaitTimeout(Sender: TObject);
begin
  Memo1.Lines.Add('Ring wait timeout, resetting');
end;

procedure TForm1.VaModem21NoCarrier(Sender: TObject);
begin
  Memo1.Lines.Add('No carrier');
end;

procedure TForm1.VaModem21Connect(Sender: TObject;
  const ConnectString: String);
begin
  Memo1.Lines.Add('Connect: '+ConnectString);
end;

procedure TForm1.VaModem21AnswerTimeout(Sender: TObject);
begin
  Memo1.Lines.Add('Timeout answering call.');
  VaModem1.Hangup(false);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  VaModem1.Cancel;
  VaModem1.Hangup(True);
end;

procedure TForm1.VaCommDsr(Sender: TObject);
begin
  Button2.Enabled := VaComm.Dsr;
end;

end.
