object Neu: TNeu
  Left = 264
  Top = 108
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Neues Programm'
  ClientHeight = 108
  ClientWidth = 188
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 11
    Width = 39
    Height = 13
    Caption = 'Nummer'
  end
  object Label2: TLabel
    Left = 24
    Top = 38
    Width = 62
    Height = 13
    Caption = 'Bezeichnung'
  end
  object SpeedButton1: TSpeedButton
    Left = 40
    Top = 78
    Width = 105
    Height = 22
    Caption = 'OK'
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
  object Edit1: TEdit
    Left = 104
    Top = 8
    Width = 73
    Height = 21
    MaxLength = 4
    TabOrder = 0
    Text = '0000'
  end
  object Edit2: TEdit
    Left = 104
    Top = 35
    Width = 73
    Height = 21
    MaxLength = 10
    TabOrder = 1
    Text = 'Unbenannt'
  end
end
