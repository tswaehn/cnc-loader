unit udial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  VaClasses, VaComm, VaSystem, StdCtrls, ExtCtrls, VaModem, ComCtrls;

type
  TForm1 = class(TForm)
    VaComm: TVaComm;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    DialButton: TButton;
    HangupButton: TButton;
    Label4: TLabel;
    Memo1: TMemo;
    Bevel1: TBevel;
    Label5: TLabel;
    Memo2: TMemo;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    RetryTimer: TTimer;
    VaModem1: TVaModem;
    procedure VaCommRxBuf(Sender: TObject; Data: PVaData;
      Count: Integer);
    procedure FormCreate(Sender: TObject);
    procedure VaModem21CommandTimeout(Sender: TObject);
    procedure VaModem21Error(Sender: TObject);
    procedure VaModem21OK(Sender: TObject);
    procedure DialButtonClick(Sender: TObject);
    procedure VaModem21Busy(Sender: TObject);
    procedure RetryTimerTimer(Sender: TObject);
    procedure VaModem21NoDialTone(Sender: TObject);
    procedure VaModem21Voice(Sender: TObject);
    procedure VaModem21Connect(Sender: TObject;
      const ConnectString: String);
    procedure HangupButtonClick(Sender: TObject);
    procedure VaModem21DialTimeout(Sender: TObject);
    procedure VaModem1NoCarrier(Sender: TObject);
  private
    Retries: Integer;
    Redial: Boolean;
    MemoIndex: Integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  VaUtils;

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  MemoIndex := Memo2.Lines.Add('');
  VaComm.Open;
  VaModem1.Init;
end;

procedure TForm1.DialButtonClick(Sender: TObject);
begin
  Retries := 1;
  RetryTimer.Interval := UpDown2.Position * 1000; //calc seconds
  VaModem1.Cancel;
  VaModem1.Dial(Edit1.Text);
end;

//Debug window update, receives raw data from comm
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

procedure TForm1.VaModem21CommandTimeout(Sender: TObject);
begin
  case VaModem1.ModemAction of
    maInit: Memo1.Lines.Add('Error initializing modem.');
  end;
end;

procedure TForm1.VaModem21Error(Sender: TObject);
begin
  case VaModem1.ModemAction of
    maInit: Memo1.Lines.Add('Error initializing modem.');
    maDial: Memo1.Lines.Add('Error in dial string.');
  end;
end;

procedure TForm1.VaModem21OK(Sender: TObject);
begin
  case VaModem1.ModemAction of
    maInit: Memo1.Lines.Add('Modem initialized.');
  end;
end;

procedure TForm1.VaModem21Busy(Sender: TObject);
begin
  Memo1.Lines.Add('Line is busy.');
  Inc(Retries);
  Redial := Retries < UpDown1.Position;
  if Redial then
  begin
    Memo1.Lines.Add('Delayed: ' + Edit3.Text + ' seconds');
    RetryTimer.Enabled := True;
  end else Memo1.Lines.Add('Max. retries reached.');
end;

procedure TForm1.RetryTimerTimer(Sender: TObject);
begin
  RetryTimer.Enabled := false;
  Memo1.Lines.Add('Attempt: '+IntToStr(Retries));
  VaModem1.Dial(Edit1.Text);
end;

procedure TForm1.VaModem21NoDialTone(Sender: TObject);
begin
  Memo1.Lines.Add('No dialtone');
end;

procedure TForm1.VaModem21Voice(Sender: TObject);
begin
  Memo1.Lines.Add('Voice line');
end;

procedure TForm1.VaModem21Connect(Sender: TObject;
  const ConnectString: String);
begin
  Memo1.Lines.Add('Connect: '+ConnectString);
end;

procedure TForm1.HangupButtonClick(Sender: TObject);
begin
  RetryTimer.Enabled := false;
  VaModem1.Cancel;
  VaModem1.Hangup(VaComm.Rlsd);
end;

procedure TForm1.VaModem21DialTimeout(Sender: TObject);
begin
  Memo1.Lines.Add('Timeout dialing number.');
  VaModem1.Hangup(false);
end;

procedure TForm1.VaModem1NoCarrier(Sender: TObject);
begin
  Memo1.Lines.Add('No Carrier.');
end;


end.
