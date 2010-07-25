unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  VaClasses, VaComm, StdCtrls, VaModem, VaProtocol, VaXYModem, VaSystem;

type
  TForm1 = class(TForm)
    VaComm: TVaComm;
    Memo1: TMemo;
    Button2: TButton;
    Label4: TLabel;
    VaModem1: TVaModem;
    Button1: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Button4: TButton;
    Label5: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Label7: TLabel;
    VaXModem1: TVaXModem;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
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
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure VaXModem1PacketEvent(Sender: TObject; Packet,
      ByteCount: Integer);
    procedure VaXModem1TransferStart(Sender: TObject);
    procedure VaXModem1TransferEnd(Sender: TObject; ExitCode: Integer);
    procedure VaXModem1FileInit(Sender: TObject; const Name: String;
      Size: Integer);
  private
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
  ComboBox1.ItemIndex := 0;
  VaXModem1.Protocol := TVaXProtocol(ComboBox1.ItemIndex);
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

procedure TForm1.Button1Click(Sender: TObject);
begin
  VaModem1.Active := false;
  VaXModem1.FileName := Edit1.Text;
  VaXModem1.Download;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  VaModem1.Active := false;
  VaXModem1.FileName := Edit1.Text;
  VaXModem1.Upload;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  VaXModem1.Cancel;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  VaXModem1.Protocol := TVaXProtocol(ComboBox1.ItemIndex);
end;

procedure TForm1.VaXModem1PacketEvent(Sender: TObject; Packet,
  ByteCount: Integer);
begin
  Label2.Caption := IntToStr(Packet);
  Label6.Caption := IntToStr(ByteCount);
end;

procedure TForm1.VaXModem1TransferStart(Sender: TObject);
begin
  Memo1.Lines.Add('Transfer started.');
end;

procedure TForm1.VaXModem1TransferEnd(Sender: TObject; ExitCode: Integer);
begin
  Memo1.Lines.Add('Transfer ended.');
  Memo1.Lines.Add('Exitcode: ' + IntToStr(TVaXYProtocol(Sender).ExitCode));
end;

procedure TForm1.VaXModem1FileInit(Sender: TObject; const Name: String;
  Size: Integer);
begin
  Label10.Caption := Name;
  Label11.Caption := IntToStr(Size);
end;


end.
