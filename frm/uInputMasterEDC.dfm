object FinputMasterEDC: TFinputMasterEDC
  Left = 0
  Top = 0
  Caption = 'Input Master EDC'
  ClientHeight = 148
  ClientWidth = 288
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
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 57
    Height = 13
    Caption = 'Nama Mesin'
  end
  object Label2: TLabel
    Left = 24
    Top = 41
    Width = 58
    Height = 13
    Caption = 'Kartu Debet'
  end
  object Label3: TLabel
    Left = 23
    Top = 66
    Width = 45
    Height = 13
    Caption = 'Sucharge'
  end
  object Label4: TLabel
    Left = 88
    Top = 16
    Width = 4
    Height = 13
    Caption = ':'
  end
  object Label5: TLabel
    Left = 88
    Top = 41
    Width = 4
    Height = 13
    Caption = ':'
  end
  object Label6: TLabel
    Left = 87
    Top = 66
    Width = 4
    Height = 13
    Caption = ':'
  end
  object Label7: TLabel
    Left = 151
    Top = 66
    Width = 11
    Height = 13
    Caption = '%'
  end
  object EMesin: TcxTextEdit
    Left = 96
    Top = 13
    TabOrder = 0
    Width = 155
  end
  object EKartuDebet: TcxTextEdit
    Left = 96
    Top = 38
    TabOrder = 1
    Width = 155
  end
  object ESucharge: TcxTextEdit
    Left = 97
    Top = 63
    TabOrder = 2
    Width = 48
  end
  object btnSimpan: TcxButton
    Left = 40
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 3
    OnClick = btnSimpanClick
  end
  object btnTutup: TcxButton
    Left = 129
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Tutup'
    TabOrder = 4
    OnClick = btnTutupClick
  end
end
