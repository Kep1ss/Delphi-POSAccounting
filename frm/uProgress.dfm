object FLoading: TFLoading
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  ClientHeight = 81
  ClientWidth = 424
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
  object Label1: TLabel
    Left = 2
    Top = 8
    Width = 151
    Height = 13
    Caption = 'Sedang menyiapkan data ...... '
  end
  object Lprogres: TLabel
    Left = 3
    Top = 32
    Width = 42
    Height = 13
    Caption = 'Lprogres'
  end
  object pb1: TProgressBar
    Left = 2
    Top = 48
    Width = 414
    Height = 25
    TabOrder = 0
  end
end
