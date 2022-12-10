object FsetHargaDefault: TFsetHargaDefault
  Left = 0
  Top = 0
  Caption = 'Sinkronisasi Harga'
  ClientHeight = 62
  ClientWidth = 297
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btn1: TButton
    Left = 8
    Top = 32
    Width = 89
    Height = 25
    Caption = 'Set Default Harga'
    TabOrder = 0
    OnClick = btn1Click
  end
  object pb1: TProgressBar
    Left = 8
    Top = 8
    Width = 281
    Height = 17
    TabOrder = 1
  end
  object btn2: TButton
    Left = 103
    Top = 31
    Width = 89
    Height = 25
    Caption = 'Tutup'
    TabOrder = 2
    OnClick = btn2Click
  end
end
