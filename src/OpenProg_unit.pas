unit OpenProg_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls;

type
  TOpen = class(TForm)
    //RxLabel1: TRxLabel;
    //RxLabel2: TRxLabel;
    Label1: TLabel;
    Label2: TLabel;
    ListBox1: TListBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Bevel1: TBevel;
    //RxLabel3: TRxLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Timer1: TTimer;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure fill_files;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    function UPStr(instr:string):string;
    procedure FormHide(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Suche(Suchstr:string);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    filename:string;
  end;

var
  Open: TOpen;

implementation

uses main;



{$R *.DFM}

function TOpen.UpStr(InStr:string):string;
var a:integer;
begin
for a:=1 to length(instr) do Instr[a]:=upcase(instr[a]);
UpStr:=Instr;
end;

procedure Topen.suche(Suchstr:string);
var zeile,position:integer;
begin
if (listbox1.Items.Count < 1) then exit;

suchstr:=upstr(suchstr);
zeile:=0;
repeat
 position:=pos(suchstr,listbox1.Items.strings[zeile] );
 zeile:=zeile+1;
until (position=1) or (zeile=listbox1.items.count);
if position=1 then listbox1.itemindex:=zeile-1;

end;

procedure TOpen.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
suche(edit1.text);
end;

procedure TOpen.Fill_Files;
var sr:TSearchRec;result:word;
begin
listbox1.clear;
label1.caption:=form1.typ;
label2.caption:=form1.inifile.readstring('Verzeichnisse','Verzeichnis'+inttostr(form1.typ_index),'c:\');
label3.caption:=form1.inifile.readstring('Verzeichnisse','Extension'+inttostr(form1.typ_index),'*.LOG');
if label2.caption='' then label2.caption:='C:\';
if label3.caption='' then label3.caption:='*.LOG';
result:=FindFirst(label2.caption+label3.caption, faAnyFile, sr);
while result = 0 do
   begin
   listbox1.items.add(UPStr(sr.Name));
   result:=findnext(sr);
   end;
end;

procedure TOpen.FormShow(Sender: TObject);
begin
fill_files;
edit1.text:='';
timer1.enabled:=true;
end;

procedure TOpen.SpeedButton1Click(Sender: TObject);
begin
if listbox1.itemindex >= 0 then
    begin
    form1.programm_name:=listbox1.items[listbox1.itemindex];
    filename:=label2.caption+form1.Programm_name;
    end
    else form1.programm_name:='none';
modalresult:=mrok;
end;

procedure TOpen.SpeedButton2Click(Sender: TObject);
begin
modalresult:=mrcancel;
end;

procedure TOpen.FormHide(Sender: TObject);
begin
timer1.enabled:=false;
end;

procedure TOpen.Timer1Timer(Sender: TObject);
begin
//suche(edit1.text);
end;

procedure TOpen.SpeedButton3Click(Sender: TObject);
begin
suche(edit1.text);
end;

procedure TOpen.ListBox1Click(Sender: TObject);
begin
edit1.text:=listbox1.Items.strings[listbox1.itemindex];
end;

end.
