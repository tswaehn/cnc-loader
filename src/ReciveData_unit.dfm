object Recive: TRecive
  Left = 198
  Top = 120
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Empfange Daten...'
  ClientHeight = 307
  ClientWidth = 539
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 376
    Top = 72
    Width = 113
    Height = 22
    Caption = 'Daten '#252'bernehmen'
    Enabled = False
    Flat = True
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 376
    Top = 104
    Width = 113
    Height = 22
    Caption = 'Daten verwerfen'
    Flat = True
    OnClick = SpeedButton2Click
  end
  object rxLed: TLED
    Left = 24
    Top = 240
    LEDOnColor = LEDGreen
  end
  object OpenLED: TLED
    Left = 24
    Top = 264
    LEDOnColor = LEDGreen
  end
  object ereignis_led: TLED
    Left = 136
    Top = 266
  end
  object Label1: TLabel
    Left = 376
    Top = 168
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 56
    Top = 240
    Width = 42
    Height = 13
    Caption = 'Empfang'
  end
  object Label3: TLabel
    Left = 56
    Top = 264
    Width = 52
    Height = 13
    Caption = 'Verbunden'
  end
  object Label4: TLabel
    Left = 168
    Top = 264
    Width = 37
    Height = 13
    Caption = 'Ereignis'
  end
  object ComLed1: TComLed
    Left = 376
    Top = 211
    Width = 25
    Height = 25
    ComPort = Form1.ComPort1
    LedSignal = lsDSR
    Kind = lkGreenLight
  end
  object Label5: TLabel
    Left = 407
    Top = 215
    Width = 21
    Height = 13
    Caption = 'CTS'
  end
  object ComLed2: TComLed
    Left = 376
    Top = 234
    Width = 25
    Height = 25
    ComPort = Form1.ComPort1
    LedSignal = lsCTS
    Kind = lkGreenLight
  end
  object RTS: TLabel
    Left = 407
    Top = 234
    Width = 22
    Height = 13
    Caption = 'RTS'
  end
  object Memo1: TMemo
    Left = 16
    Top = 16
    Width = 345
    Height = 217
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    OnChange = Memo1Change
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 288
    Width = 539
    Height = 19
    Panels = <
      item
        Width = 80
      end
      item
        Width = 50
      end>
    ExplicitTop = 286
  end
  object CheckBox1: TCheckBox
    Left = 376
    Top = 265
    Width = 137
    Height = 17
    Caption = 'Zeige Sonderzeichen'
    TabOrder = 2
    OnClick = CheckBox1Click
  end
  object led_timer: TTimer
    Enabled = False
    Interval = 200
    OnTimer = led_timerTimer
    Left = 304
    Top = 248
  end
  object ereignis_timer: TTimer
    OnTimer = ereignis_timerTimer
    Left = 312
    Top = 224
  end
end
