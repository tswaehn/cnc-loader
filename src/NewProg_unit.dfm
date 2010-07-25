object Neu: TNeu
  Left = 264
  Top = 108
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Neues Programm'
  ClientHeight = 96
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
    Top = 32
    Width = 73
    Height = 21
    MaxLength = 10
    TabOrder = 1
    Text = 'Unbenannt'
  end
  object BitBtn1: TBitBtn
    Left = 40
    Top = 64
    Width = 105
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
end
