object ComSettings: TComSettings
  Left = 259
  Top = 120
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsToolWindow
  Caption = 'ComSettings'
  ClientHeight = 311
  ClientWidth = 166
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
  object Label1: TLabel
    Left = 15
    Top = 13
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 8
    Top = 43
    Width = 40
    Height = 13
    Caption = 'ComPort'
  end
  object Label3: TLabel
    Left = 8
    Top = 67
    Width = 43
    Height = 13
    Caption = 'Baudrate'
  end
  object Label4: TLabel
    Left = 8
    Top = 91
    Width = 40
    Height = 13
    Caption = 'DataBits'
  end
  object Label5: TLabel
    Left = 8
    Top = 115
    Width = 23
    Height = 13
    Caption = 'DTR'
  end
  object Label6: TLabel
    Left = 8
    Top = 139
    Width = 22
    Height = 13
    Caption = 'RTS'
  end
  object Label7: TLabel
    Left = 8
    Top = 163
    Width = 26
    Height = 13
    Caption = 'Parity'
  end
  object Label8: TLabel
    Left = 8
    Top = 187
    Width = 55
    Height = 13
    Caption = 'FlowControl'
  end
  object Label9: TLabel
    Left = 8
    Top = 211
    Width = 39
    Height = 13
    Caption = 'StopBits'
  end
  object cbPort: TComboBox
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
      '8'
      '9'
      '10'
      '11'
      '12'
      '13'
      '14'
      '15'
      '16'
      '17'
      '18'
      '19'
      '20'
      '21'
      '22'
      '23'
      '24'
      '25'
      '26'
      '27'
      '28'
      '29'
      '30')
  end
  object cbBaud: TComboBox
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
  object cbDatabits: TComboBox
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
  object cbDTR: TComboBox
    Left = 80
    Top = 112
    Width = 81
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 3
    Items.Strings = (
      'Enable'
      'Disable'
      'Handshake')
  end
  object cbRTS: TComboBox
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
  object cbParity: TComboBox
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
  object cbFlowControl: TComboBox
    Left = 80
    Top = 184
    Width = 81
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 6
    Items.Strings = (
      'Custom'
      'None'
      'RtsCts'
      'XonXoff')
  end
  object cbStopBits: TComboBox
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
