object FtutupTahun: TFtutupTahun
  Left = 0
  Top = 0
  Caption = 'Tutup Tahun'
  ClientHeight = 110
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 216
    Top = 11
    Width = 25
    Height = 13
    Caption = 'TGL :'
  end
  object Lproses1: TLabel
    Left = 8
    Top = 55
    Width = 3
    Height = 13
  end
  object Lproses: TLabel
    Left = 160
    Top = 56
    Width = 3
    Height = 13
  end
  object btn1: TcxButton
    Left = 8
    Top = 79
    Width = 121
    Height = 25
    Caption = 'Proses Tutup Tahun'
    Enabled = False
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn2: TcxButton
    Left = 135
    Top = 79
    Width = 121
    Height = 25
    Caption = 'Selesai'
    TabOrder = 1
    OnClick = btn2Click
  end
  object dtp1: TDateTimePicker
    Left = 247
    Top = 8
    Width = 106
    Height = 21
    Date = 43251.715270532400000000
    Time = 43251.715270532400000000
    TabOrder = 2
    OnCloseUp = dtp1CloseUp
  end
  object pb1: TProgressBar
    Left = 8
    Top = 32
    Width = 341
    Height = 17
    Smooth = True
    TabOrder = 3
  end
end
