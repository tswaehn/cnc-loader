object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 333
  ClientWidth = 562
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object memo1: TMemo
    Left = 136
    Top = 24
    Width = 385
    Height = 273
    Lines.Strings = (
      'memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 40
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 40
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
  object ComPort1: TComPort
    Connected = True
    BaudRate = br300
    Port = 'COM1'
    Parity.Bits = prNone
    Parity.Check = True
    StopBits = sbOneStopBit
    DataBits = dbSeven
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = True
    FlowControl.XonXoffIn = True
    OnRxChar = ComPort1RxChar
    Left = 80
    Top = 144
  end
end
