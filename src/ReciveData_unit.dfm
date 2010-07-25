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
    Top = 264
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
  end
  object led_timer: TTimer
    Enabled = False
    Interval = 200
    OnTimer = led_timerTimer
    Left = 376
    Top = 8
  end
  object ereignis_timer: TTimer
    OnTimer = ereignis_timerTimer
    Left = 432
    Top = 152
  end
end
