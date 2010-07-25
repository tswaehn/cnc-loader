object Speichern: TSpeichern
  Left = 261
  Top = 100
  ActiveControl = Edit1
  BorderStyle = bsDialog
  Caption = 'Speichern'
  ClientHeight = 359
  ClientWidth = 319
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RxLabel1: TRxLabel
    Left = 32
    Top = 16
    Width = 48
    Height = 13
    Caption = 'Maschine'
  end
  object RxLabel2: TRxLabel
    Left = 32
    Top = 48
    Width = 20
    Height = 13
    Caption = 'Ext.'
  end
  object Label1: TLabel
    Left = 96
    Top = 16
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 96
    Top = 32
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object RxLabel3: TRxLabel
    Left = 32
    Top = 32
    Width = 56
    Height = 13
    Caption = 'Verzeichnis'
  end
  object Label3: TLabel
    Left = 96
    Top = 48
    Width = 32
    Height = 13
    Caption = 'Label3'
  end
  object Bevel1: TBevel
    Left = 16
    Top = 8
    Width = 297
    Height = 65
    Style = bsRaised
  end
  object SpeedButton1: TSpeedButton
    Left = 216
    Top = 104
    Width = 89
    Height = 25
    Caption = 'Speichern'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
      FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
      FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
      007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
      7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
      99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    NumGlyphs = 2
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 216
    Top = 136
    Width = 89
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
  object ListBox1: TListBox
    Left = 16
    Top = 80
    Width = 177
    Height = 241
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    Sorted = True
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 16
    Top = 328
    Width = 177
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
end
