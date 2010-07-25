unit versioninfo;

interface
uses
  Windows, sysutils;

type
  // 1: Major, 2: Minor, 3: Release, 4: Build
  TFileVersion = array[1..4] of Smallint;

function GetExeVersion(FileName: string): TFileVersion;
function GetExeVersionStr(FileName: string): string;

implementation

function GetExeVersion(FileName: string): TFileVersion;
var
  VerInfoSize, VerValueSize, Dummy: DWord;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
begin
  // Länge der Dateiinformationen bekommen.
  VerInfoSize := GetFileVersionInfoSize(PChar(FileName), Dummy);
  // Speicherplatz reservieren.
  GetMem(VerInfo, VerInfoSize);
  // Dateiinformationen selektieren.
  GetFileVersionInfo(PChar(FileName), 0, VerInfoSize, VerInfo);
  // Prüfen ob Dateiinformationen vorhanden
  if VerInfo <> nil then
  begin
    // Dateiinformationen auslesen.
    VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
    // Version auslesen und zurückgeben.
    with VerValue^ do
    begin
      // Major
      Result[1] := dwFileVersionMS shr 16;
      // Minor
      Result[2] := dwFileVersionMS and $FFFF;
      // Release
      Result[3] := dwFileVersionLS shr 16;
      // Build
      Result[4] := dwFileVersionLS and $FFFF;
    end;
  end;
  // Speicher freigeben (Dateiinformationen).
  FreeMem(VerInfo, VerInfoSize);
end;

function GetExeVersionStr(FileName: string): string;
var
  ver: TFileVersion;
  ver_str: string;
begin
  ver := GetExeVersion(filename);

  ver_str := IntToStr(ver[1]) + '.' + IntToStr(ver[2]) + '.' + IntToStr(ver[3])
    +
    '.' + IntToStr(ver[4]);
  GetExeVersionStr := ver_str;
end;

end.

