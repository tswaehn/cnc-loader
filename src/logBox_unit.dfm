object LogBox: TLogBox
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'LogBox'
  ClientHeight = 314
  ClientWidth = 557
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 168
    Top = 284
    Width = 129
    Height = 22
    Caption = 'l'#246'sche Log'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
      305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
      005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
      B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
      B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
      B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
      B0557777FF577777F7F500000E055550805577777F7555575755500000555555
      05555777775555557F5555000555555505555577755555557555}
    NumGlyphs = 2
    OnClick = SpeedButton1Click
  end
  object ListBox1: TListBox
    Left = 24
    Top = 24
    Width = 417
    Height = 241
    ItemHeight = 13
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 459
    Top = 24
    Width = 86
    Height = 241
    TabOrder = 1
    object ComLed1: TComLed
      Left = 3
      Top = 25
      Width = 25
      Height = 25
      ComPort = Form1.ComPort1
      LedSignal = lsConn
      Kind = lkGreenLight
    end
    object ComLed2: TComLed
      Left = 3
      Top = 125
      Width = 25
      Height = 25
      ComPort = Form1.ComPort1
      LedSignal = lsDSR
      Kind = lkRedLight
    end
    object ComLed3: TComLed
      Left = 3
      Top = 197
      Width = 25
      Height = 25
      ComPort = Form1.ComPort1
      LedSignal = lsRing
      Kind = lkYellowLight
    end
    object ComLed4: TComLed
      Left = 3
      Top = 100
      Width = 25
      Height = 25
      ComPort = Form1.ComPort1
      LedSignal = lsCTS
      Kind = lkRedLight
    end
    object ComLed5: TComLed
      Left = 3
      Top = 150
      Width = 25
      Height = 25
      ComPort = Form1.ComPort1
      LedSignal = lsRLSD
      Kind = lkRedLight
    end
    object Label1: TLabel
      Left = 34
      Top = 30
      Width = 40
      Height = 13
      Caption = 'Connect'
    end
    object Label2: TLabel
      Left = 34
      Top = 106
      Width = 19
      Height = 13
      Caption = 'CTS'
    end
    object Label3: TLabel
      Left = 34
      Top = 156
      Width = 25
      Height = 13
      Caption = 'RLSD'
    end
    object Label4: TLabel
      Left = 34
      Top = 131
      Width = 20
      Height = 13
      Caption = 'DSR'
    end
    object Label5: TLabel
      Left = 34
      Top = 200
      Width = 25
      Height = 13
      Caption = 'RING'
    end
  end
end
