unit CNC7;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FileCtrl, StdCtrls, RXCtrls, Buttons, ExtCtrls;

type
  TDirectory = class(TForm)
    RxLabel1: TRxLabel;
    Label1: TLabel;
    DirectoryListBox1: TDirectoryListBox;
    FileListBox1: TFileListBox;
    DriveComboBox1: TDriveComboBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    RxLabel2: TRxLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Edit1: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    function check_extension:boolean;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Directory: TDirectory;

implementation

{$R *.DFM}

function TDirectory.Check_extension:boolean;
var is_punkt,richtige_laenge,sternchen:boolean;
begin
if (pos('.',edit1.text)>0) then is_punkt:=true else is_punkt:=false;
if ( length(edit1.text)-pos('.',edit1.text)=3)and(pos('.',edit1.text)=2) then richtige_laenge:=true else richtige_laenge:=false;
if (pos('*',edit1.text)>0) then sternchen:=true else sternchen:=false;
if is_punkt and richtige_laenge
   and sternchen then check_extension:=true
                 else Messagedlg('Die Dateierweiterung hat ein falsches Format.',mterror,[mbok],0);
end;

procedure TDirectory.SpeedButton1Click(Sender: TObject);
begin
if check_extension then modalresult:=mrok;
end;

procedure TDirectory.SpeedButton2Click(Sender: TObject);
begin
modalresult:=mrcancel;
end;

end.
