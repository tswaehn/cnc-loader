unit logBox_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, CPortCtl;

type
  TLogBox = class(TForm)
    ListBox1: TListBox;
    SpeedButton1: TSpeedButton;
    GroupBox1: TGroupBox;
    ComLed1: TComLed;
    ComLed2: TComLed;
    ComLed3: TComLed;
    ComLed4: TComLed;
    ComLed5: TComLed;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    procedure log(text: string);
  end;

var
  LogBox: TLogBox;

implementation

{$R *.dfm}

procedure TLogBox.log(text: string);
begin
  // lösche zeilen, wenn zu viele zeilen
  if (listbox1.Items.Count > 2000) then
  begin
    while (listbox1.Items.count > 1000) do
    begin
      listbox1.Items.Delete(0);
    end;
  end;

  listbox1.Items.Add(text);
  listbox1.ItemIndex := listbox1.Items.count - 1;
  //listbox1.DeleteSelected;
  //listbox1.Selected[listbox1.Items.Count] := true;

end;

procedure TLogBox.SpeedButton1Click(Sender: TObject);
begin
  listbox1.Items.Clear;
end;

end.
