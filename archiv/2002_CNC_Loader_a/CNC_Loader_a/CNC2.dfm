object ComSettings: TComSettings
  Left = 259
  Top = 120
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsToolWindow
  Caption = 'ComSettings'
  ClientHeight = 296
  ClientWidth = 165
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RxLabel1: TRxLabel
    Left = 8
    Top = 40
    Width = 21
    Height = 13
    Caption = 'Port'
  end
  object RxLabel2: TRxLabel
    Left = 8
    Top = 64
    Width = 45
    Height = 13
    Caption = 'Baudrate'
  end
  object RxLabel3: TRxLabel
    Left = 8
    Top = 88
    Width = 41
    Height = 13
    Caption = 'Databits'
  end
  object RxLabel4: TRxLabel
    Left = 8
    Top = 112
    Width = 25
    Height = 13
    Caption = 'DTR'
  end
  object RxLabel5: TRxLabel
    Left = 8
    Top = 184
    Width = 57
    Height = 13
    Caption = 'FlowControl'
  end
  object RxLabel6: TRxLabel
    Left = 8
    Top = 160
    Width = 28
    Height = 13
    Caption = 'Parity'
  end
  object RxLabel7: TRxLabel
    Left = 8
    Top = 136
    Width = 24
    Height = 13
    Caption = 'RTS'
  end
  object RxLabel8: TRxLabel
    Left = 8
    Top = 208
    Width = 41
    Height = 13
    Caption = 'StopBits'
  end
  object SpeedButton1: TSpeedButton
    Left = 40
    Top = 240
    Width = 97
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
  object SpeedButton2: TSpeedButton
    Left = 40
    Top = 264
    Width = 97
    Height = 22
    Caption = 'Cancel'
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
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 153
    Height = 25
    Style = bsRaised
  end
  object RxLabel9: TRxLabel
    Left = 48
    Top = 16
    Width = 47
    Height = 13
    Caption = 'RxLabel9'
  end
  object RxLabel10: TRxLabel
    Left = 16
    Top = 16
    Width = 26
    Height = 13
    Caption = 'Typ :'
  end
  object ComboBox1: TComboBox
    Left = 80
    Top = 40
    Width = 81
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 0
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8')
  end
  object ComboBox2: TComboBox
    Left = 80
    Top = 64
    Width = 81
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 1
    Items.Strings = (
      '110'
      '300'
      '600'
      '1200'
      '2400'
      '4800'
      '9600'
      '14400')
  end
  object ComboBox3: TComboBox
    Left = 80
    Top = 88
    Width = 81
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 2
    Items.Strings = (
      '5'
      '6'
      '7'
      '8')
  end
  object ComboBox4: TComboBox
    Left = 80
    Top = 112
    Width = 81
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 3
    Items.Strings = (
      'Enabled'
      'Disable'
      'Handshake')
  end
  object ComboBox5: TComboBox
    Left = 80
    Top = 136
    Width = 81
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 4
    Items.Strings = (
      'Enable'
      'Disable'
      'Handshake'
      'Toggle')
  end
  object ComboBox6: TComboBox
    Left = 80
    Top = 160
    Width = 81
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 5
    Items.Strings = (
      'Even'
      'Mark'
      'None'
      'Odd'
      'Space')
  end
  object ComboBox7: TComboBox
    Left = 80
    Top = 184
    Width = 81
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 6
    Items.Strings = (
      'DtrDsr'
      'None'
      'RtsCts'
      'XonXoff')
  end
  object ComboBox8: TComboBox
    Left = 80
    Top = 208
    Width = 81
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 7
    Items.Strings = (
      '1'
      '1.5'
      '2')
  end
end
