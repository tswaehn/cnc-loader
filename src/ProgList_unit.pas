unit ProgList_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Grids, StdCtrls, Mask;
  //, ToolEdit;

type
  TProgVerzeichnisse = class(TForm)
    Grid: TStringGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Tabelle_Beschriften;
    procedure GridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure aendere_Verzeichnis(aRow:integer);
    procedure save_;
    function dateierweiterung(arow:integer):string;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  ProgVerzeichnisse: TProgVerzeichnisse;

implementation

uses main, DirList_unit;



{$R *.DFM}

function TProgVerzeichnisse.dateierweiterung(arow:integer):string;
begin
if grid.cells[2,arow]='' then dateierweiterung:='*.LOG'
  else dateierweiterung:=grid.cells[2,arow];
end;

procedure TProgVerzeichnisse.Save_;
var a:integer;
begin
for a:=1 to 11 do begin
                  form1.inifile.writestring('Verzeichnisse','Verzeichnis'+inttostr(a),grid.cells[1,a]);
                  form1.inifile.writestring('Verzeichnisse','Extension'+inttostr(a),grid.cells[2,a]);
                  end;
speedbutton1.enabled:=false;
end;

procedure TProgVerzeichnisse.aendere_Verzeichnis(aRow:integer);
begin
directory.directorylistbox1.directory:=grid.cells[1,arow];
directory.label2.caption:=grid.cells[0,arow];
directory.Edit1.text:=dateierweiterung(arow);
directory.showmodal;
if directory.modalresult=mrok then
                              begin
                              grid.cells[1,arow]:=directory.directorylistbox1.directory;
                              if length(grid.cells[1,arow])>3 then grid.cells[1,arow]:=grid.cells[1,arow]+'\';
                              grid.cells[2,arow]:=directory.edit1.text;
                              speedbutton1.enabled:=true;
                              end;
end;

procedure TProgVerzeichnisse.Tabelle_Beschriften;
var a:integer;
begin
grid.width:=480;
grid.ColWidths[0]:=98;
grid.ColWidthS[1]:=318;
grid.ColWidthS[2]:=58;
grid.cells[0,0]:='Maschine';
grid.cells[1,0]:='Verzeichnis';
grid.cells[2,0]:='Ext.';
grid.cells[0,1]:='TND200';
grid.cells[0,2]:='TNS3042D';
grid.cells[0,3]:='MIYANO BNE51S';
grid.cells[0,4]:='INDEX ABC';
grid.cells[0,5]:='STAR RNC16B';
grid.cells[0,6]:='STAR SR16';
grid.cells[0,7]:='STAR SR20 R';
grid.cells[0,8]:='STAR SW7';
grid.cells[0,9]:='STAR SV32';
grid.cells[0,10]:='OKUM LB9';
grid.cells[0,11]:='OKUMA LT10M';
for a:=1 to 11 do begin
                  grid.cells[1,a]:=form1.inifile.readstring('Verzeichnisse','Verzeichnis'+inttostr(a),'');
                  grid.cells[2,a]:=form1.inifile.readstring('Verzeichnisse','Extension'+inttostr(a),'');
                  end;
end;

procedure TProgVerzeichnisse.SpeedButton1Click(Sender: TObject);
begin
save_;
end;

procedure TProgVerzeichnisse.SpeedButton2Click(Sender: TObject);
var a:word;
begin
if speedbutton1.enabled=true then
   begin
   a:=messagedlg('Sie haben Änderungen vorgenommen, möchten Sie diese speichern?',mtinformation,[mbyes,mbno],0);
   if a=mryes then save_;
   end;
modalresult:=mrcancel;
end;

procedure TProgVerzeichnisse.FormShow(Sender: TObject);
begin
tabelle_beschriften;
end;

procedure TProgVerzeichnisse.GridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
aendere_Verzeichnis(aRow);
end;

end.
