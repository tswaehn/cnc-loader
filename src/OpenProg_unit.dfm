object Open: TOpen
  Left = 230
  Top = 45
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = #214'ffnen...'
  ClientHeight = 325
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 16
    Top = 8
    Width = 305
    Height = 57
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 88
    Top = 16
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 88
    Top = 32
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object SpeedButton1: TSpeedButton
    Left = 240
    Top = 80
    Width = 81
    Height = 25
    Caption = 'OK'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 240
    Top = 111
    Width = 81
    Height = 25
    Caption = 'Abbrechen'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
      33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
      993337777F777F3377F3393999707333993337F77737333337FF993399933333
      399377F3777FF333377F993339903333399377F33737FF33377F993333707333
      399377F333377FF3377F993333101933399377F333777FFF377F993333000993
      399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
      99333773FF777F777733339993707339933333773FF7FFF77333333999999999
      3333333777333777333333333999993333333333377777333333}
    NumGlyphs = 2
    OnClick = SpeedButton2Click
  end
  object Label3: TLabel
    Left = 88
    Top = 48
    Width = 32
    Height = 13
    Caption = 'Label3'
  end
  object Label4: TLabel
    Left = 16
    Top = 283
    Width = 31
    Height = 13
    Caption = 'Suche'
  end
  object Label5: TLabel
    Left = 24
    Top = 16
    Width = 46
    Height = 13
    Caption = 'Maschine'
  end
  object Label6: TLabel
    Left = 24
    Top = 32
    Width = 54
    Height = 13
    Caption = 'Verzeichnis'
  end
  object Label7: TLabel
    Left = 24
    Top = 48
    Width = 61
    Height = 13
    Caption = 'Dateiendung'
  end
  object ListBox1: TListBox
    Left = 16
    Top = 80
    Width = 209
    Height = 193
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    OnClick = ListBox1Click
  end
  object Edit1: TEdit
    Left = 16
    Top = 296
    Width = 209
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
    OnKeyPress = Edit1KeyPress
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 240
    Top = 176
  end
end
