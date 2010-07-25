unit formMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, VaConst, VaTypes, VaClasses, VaComm, ExtCtrls,
  VaSystem;

type
  TfrmMain = class(TForm)
    VaComm1: TVaComm;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    EditTransmit: TEdit;
    CheckBoxAddLinefeed: TCheckBox;
    ButtonTransmit: TButton;
    Button1: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Memo2: TMemo;
    Panel4: TPanel;
    Memo1: TMemo;
    Splitter1: TSplitter;
    Panel5: TPanel;
    ButtonOpen: TButton;
    ButtonClose: TButton;
    CheckBoxRTS: TCheckBox;
    CheckBoxDTR: TCheckBox;
    CheckBoxBREAK: TCheckBox;
    CheckBoxXON: TCheckBox;
    Panel6: TPanel;
    LabelParity: TLabel;
    ComboParity: TComboBox;
    ComboStopbits: TComboBox;
    LabelStopbits: TLabel;
    LabelDataBits: TLabel;
    ComboDatabits: TComboBox;
    ComboBaudrate: TComboBox;
    LabelBaudrate: TLabel;
    Bevel1: TBevel;
    ButtonReset: TButton;
    Bevel2: TBevel;
    Label1: TLabel;
    ComboPortNum: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure ButtonOpenClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonResetClick(Sender: TObject);
    procedure ButtonTransmitClick(Sender: TObject);
    procedure Comm1TxEmpty(Sender: TObject);
    procedure Comm1Break(Sender: TObject);
    procedure Comm1Cts(Sender: TObject);
    procedure Comm1Dsr(Sender: TObject);
    procedure Comm1Error(Sender: TObject; Errors: Integer);
    procedure Comm1Ring(Sender: TObject);
    procedure Comm1Rlsd(Sender: TObject);
    procedure ComboBaudrateChange(Sender: TObject);
    procedure ComboDatabitsChange(Sender: TObject);
    procedure ComboStopbitsChange(Sender: TObject);
    procedure ComboParityChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBoxRTSClick(Sender: TObject);
    procedure CheckBoxDTRClick(Sender: TObject);
    procedure CheckBoxBREAKClick(Sender: TObject);
    procedure CheckBoxXONClick(Sender: TObject);
    procedure VaComm1Open(Sender: TObject);
    procedure VaComm1Close(Sender: TObject);
    procedure ComboPortNumChange(Sender: TObject);
    procedure VaComm1RxChar(Sender: TObject; Count: Integer);
    procedure VaComm1Rx80Full(Sender: TObject);
    procedure VaComm1Event1(Sender: TObject);
    procedure VaComm1Event2(Sender: TObject);
    procedure VaComm1RxFlag(Sender: TObject);
    procedure VaComm1PErr(Sender: TObject);
  private
    procedure HandleException(Sender: TObject; E: Exception);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}


procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Application.OnException := HandleException;

  with ComboPortNum do
    ItemIndex := Items.IndexOf('3');
  with ComboBaudrate do
    ItemIndex := Items.IndexOf('br38400');
  with ComboDataBits do
    ItemIndex := Items.IndexOf('db8');
  with ComboParity do
    ItemIndex := Items.IndexOf('paNone');
  with ComboStopbits do
    ItemIndex := Items.IndexOf('sb10');

  VaComm1.BaudRate := TVaBaudrate(ComboBaudrate.ItemIndex);
  VaComm1.Databits := TVaDataBits(ComboDatabits.ItemIndex);
  VaComm1.Parity := TVaParity(ComboParity.ItemIndex);
  VaComm1.StopBits := TVaStopBits(ComboStopbits.ItemIndex);
end;

procedure TfrmMain.HandleException(Sender: TObject; E: Exception);
begin
  if E is EVaCommError then
    with E as EVaCommError do
      ShowMessage(Message);
end;

procedure TfrmMain.ButtonOpenClick(Sender: TObject);
begin
  VaComm1.Open;
  VaComm1.SetDTR(True);
  VaComm1.SetRTS(True);
  Comm1Cts(VaComm1);
  Comm1Dsr(VaComm1);
  Comm1Ring(VaComm1);
  Comm1Rlsd(VaComm1);
end;

procedure TfrmMain.ButtonCloseClick(Sender: TObject);
begin
  VaComm1.Close;
  Comm1Cts(VaComm1);
  Comm1Dsr(VaComm1);
  Comm1Ring(VaComm1);
  Comm1Rlsd(VaComm1);
end;

procedure TfrmMain.ButtonResetClick(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo2.Lines.Clear;
end;

procedure TfrmMain.ButtonTransmitClick(Sender: TObject);
var
  S: string;
  Ok: Boolean;
begin
  S := EditTransmit.Text;
  if CheckBoxAddLinefeed.Checked then
    S := S + #13#10;
  Ok := VaComm1.WriteText(S);
  if not Ok then
    Memo1.Lines.add('Error writing to: ' + Format('Port %d', [VaComm1.PortNum]))
  else Memo1.Lines.add(Format('Writing %d characters', [Length(S)]));
end;

procedure TfrmMain.Comm1TxEmpty(Sender: TObject);
begin
  Memo1.Lines.add('TxEmpty signal detected...');
end;

procedure TfrmMain.Comm1Break(Sender: TObject);
begin
  Memo1.Lines.add('Break signal detected...');
end;

procedure TfrmMain.Comm1Cts(Sender: TObject);
begin
  if VaComm1.CTS then
    StatusBar1.Panels[0].Text := 'CTS'
  else StatusBar1.Panels[0].Text := '';
end;

procedure TfrmMain.Comm1Dsr(Sender: TObject);
begin
  if VaComm1.DSR then
    StatusBar1.Panels[1].Text := 'DSR'
  else StatusBar1.Panels[1].Text := '';
end;

procedure TfrmMain.Comm1Ring(Sender: TObject);
begin
  if VaComm1.Ring then
    StatusBar1.Panels[2].Text := 'RING'
  else StatusBar1.Panels[2].Text := '';
end;

procedure TfrmMain.Comm1Rlsd(Sender: TObject);
begin
  if VaComm1.Rlsd then
    StatusBar1.Panels[3].Text := 'RLSD'
  else StatusBar1.Panels[3].Text := '';
end;

procedure TfrmMain.Comm1Error(Sender: TObject; Errors: Integer);
begin
  if (Errors and CE_BREAK > 0) then Memo1.Lines.add(sCE_BREAK);
  if (Errors and CE_DNS > 0) then Memo1.Lines.add(sCE_DNS);
  if (Errors and CE_FRAME > 0) then Memo1.Lines.add(sCE_FRAME);
  if (Errors and CE_IOE > 0) then Memo1.Lines.add(sCE_IOE);
  if (Errors and CE_MODE > 0) then Memo1.Lines.add(sCE_MODE);
  if (Errors and CE_OOP > 0) then Memo1.Lines.add(sCE_OOP);
  if (Errors and CE_OVERRUN > 0) then Memo1.Lines.add(sCE_OVERRUN);
  if (Errors and CE_PTO > 0) then Memo1.Lines.add(sCE_PTO);
  if (Errors and CE_RXOVER > 0) then Memo1.Lines.add(sCE_RXOVER);
  if (Errors and CE_RXPARITY > 0) then Memo1.Lines.add(sCE_RXPARITY);
  if (Errors and CE_TXFULL > 0) then Memo1.Lines.add(sCE_TXFULL);
end;

procedure TfrmMain.ComboPortNumChange(Sender: TObject);
begin
  try
    VaComm1.PortNum := ComboPortNum.ItemIndex + 1;
  except
    ComboPortNum.ItemIndex := VaComm1.PortNum - 1;
    raise;
  end;
end;

procedure TfrmMain.ComboBaudrateChange(Sender: TObject);
begin
  VaComm1.BaudRate := TVaBaudrate(ComboBaudrate.ItemIndex);
  Memo1.Lines.add('Baudrate: ' + ComboBaudrate.Text);
end;

procedure TfrmMain.ComboDatabitsChange(Sender: TObject);
begin
  VaComm1.Databits := TVaDataBits(ComboDatabits.ItemIndex);
  Memo1.Lines.add('Databits: ' + ComboDatabits.Text);
end;

procedure TfrmMain.ComboStopbitsChange(Sender: TObject);
begin
  VaComm1.StopBits := TVaStopBits(ComboStopbits.ItemIndex);
  Memo1.Lines.add('StopBits: ' + ComboStopbits.Text);
end;

procedure TfrmMain.ComboParityChange(Sender: TObject);
begin
  VaComm1.Parity := TVaParity(ComboParity.ItemIndex);
  Memo1.Lines.add('Parity: ' + ComboParity.Text);
end;

procedure TfrmMain.Button1Click(Sender: TObject);
var
  I: Integer;
  S: string;
begin
  if MessageDlg('This will sent the input a thousand times, continue?',
    mtConfirmation, [mbOk, mbCancel], 0) <> mrOk then exit;
  S := EditTransmit.Text;
  if CheckBoxAddLinefeed.Checked then
    S := S + crlf;
  for I := 1 to 1000 do
  begin
    VaComm1.WriteText(S);
    Application.ProcessMessages;
  end;
end;

procedure TfrmMain.CheckBoxRTSClick(Sender: TObject);
begin
  VaComm1.SetRTS(CheckBoxRTS.Checked);
end;

procedure TfrmMain.CheckBoxDTRClick(Sender: TObject);
begin
  VaComm1.SetDTR(CheckBoxDTR.Checked);
end;

procedure TfrmMain.CheckBoxBREAKClick(Sender: TObject);
begin
  VaComm1.SetBREAK(CheckBoxBREAK.Checked);
end;

procedure TfrmMain.CheckBoxXONClick(Sender: TObject);
begin
  VaComm1.SetXOn(CheckBoxXON.Checked);
end;

procedure TfrmMain.VaComm1RxChar(Sender: TObject; Count: Integer);
begin
  Memo2.Lines.Text := Memo2.Lines.Text + VaComm1.ReadText;
  Memo1.Lines.add('Reading ' + IntToStr(Count) + ' bytes');
end;

procedure TfrmMain.VaComm1Open(Sender: TObject);
begin
  Memo1.Lines.add('Port open');
end;

procedure TfrmMain.VaComm1Close(Sender: TObject);
begin
  Memo1.Lines.Add('Port closed');
end;

procedure TfrmMain.VaComm1Rx80Full(Sender: TObject);
begin
  Memo1.Lines.Add('Receiver buffer is 80% full.');
end;

procedure TfrmMain.VaComm1Event1(Sender: TObject);
begin
  Memo1.Lines.Add('Provider specific event 1.');
end;

procedure TfrmMain.VaComm1Event2(Sender: TObject);
begin
  Memo1.Lines.Add('Provider specific event 2.');
end;

procedure TfrmMain.VaComm1RxFlag(Sender: TObject);
begin
  Memo1.Lines.Add('RxFlag character received.');
end;

procedure TfrmMain.VaComm1PErr(Sender: TObject);
begin
  Memo1.Lines.Add('Printer error detected.');
end;

end.
