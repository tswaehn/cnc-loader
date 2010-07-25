object Send: TSend
  Left = 193
  Top = 178
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Senden...'
  ClientHeight = 125
  ClientWidth = 503
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
  object Bevel1: TBevel
    Left = 16
    Top = 8
    Width = 481
    Height = 41
    Style = bsRaised
  end
  object Gauge1: TGauge
    Left = 16
    Top = 64
    Width = 369
    Height = 25
    Progress = 0
  end
  object SpeedButton1: TSpeedButton
    Left = 400
    Top = 64
    Width = 97
    Height = 25
    Caption = 'Ende'
    Flat = True
    OnClick = SpeedButton1Click
  end
  object OpenLED: TLED
    Left = 16
    Top = 96
    LEDOnColor = LEDGreen
  end
  object RxLabel1: TRxLabel
    Left = 40
    Top = 96
    Width = 50
    Height = 13
    Caption = 'Port Open'
  end
  object SpeedButton2: TSpeedButton
    Left = 136
    Top = 96
    Width = 153
    Height = 25
    Caption = 'Sende Programm'
    OnClick = SpeedButton2Click
  end
  object RxLabel2: TRxLabel
    Left = 24
    Top = 16
    Width = 48
    Height = 13
    Caption = 'Maschine'
  end
  object Label1: TLabel
    Left = 80
    Top = 16
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object RxLabel3: TRxLabel
    Left = 24
    Top = 32
    Width = 49
    Height = 13
    Caption = 'Programm'
    OnClick = FormHide
  end
  object Label2: TLabel
    Left = 80
    Top = 32
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object RxLabel4: TRxLabel
    Left = 320
    Top = 96
    Width = 47
    Height = 17
    Caption = 'RxLabel4'
  end
  object RxLabel5: TRxLabel
    Left = 320
    Top = 112
    Width = 47
    Height = 13
    Caption = 'RxLabel5'
  end
end
