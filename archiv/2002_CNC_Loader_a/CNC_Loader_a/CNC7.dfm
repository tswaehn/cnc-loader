object Directory: TDirectory
  Left = 193
  Top = 103
  BorderStyle = bsDialog
  Caption = 'Verzeichnis'
  ClientHeight = 265
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 16
    Top = 8
    Width = 329
    Height = 50
    Style = bsRaised
  end
  object RxLabel1: TRxLabel
    Left = 24
    Top = 40
    Width = 80
    Height = 13
    Caption = 'Suchverzeichnis'
  end
  object Label1: TLabel
    Left = 112
    Top = 40
    Width = 132
    Height = 13
    Caption = 'C:\DELPHI_5\CNC_Loader'
  end
  object SpeedButton1: TSpeedButton
    Left = 360
    Top = 64
    Width = 73
    Height = 25
    Caption = 'OK'
    Flat = True
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 360
    Top = 96
    Width = 73
    Height = 25
    Caption = 'Abbrechen'
    Flat = True
    OnClick = SpeedButton2Click
  end
  object RxLabel2: TRxLabel
    Left = 24
    Top = 16
    Width = 48
    Height = 13
    Caption = 'Maschine'
  end
  object Label2: TLabel
    Left = 88
    Top = 16
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 16
    Top = 64
    Width = 169
    Height = 161
    DirLabel = Label1
    FileList = FileListBox1
    ItemHeight = 16
    TabOrder = 0
  end
  object FileListBox1: TFileListBox
    Left = 192
    Top = 64
    Width = 153
    Height = 161
    Enabled = False
    ItemHeight = 13
    TabOrder = 1
  end
  object DriveComboBox1: TDriveComboBox
    Left = 16
    Top = 232
    Width = 169
    Height = 19
    DirList = DirectoryListBox1
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 192
    Top = 232
    Width = 153
    Height = 21
    TabOrder = 3
    Text = 'Edit1'
  end
end
