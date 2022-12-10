object FBarcodeBarang: TFBarcodeBarang
  Left = 0
  Top = 0
  Caption = 'Ubah Kode Barcode Barang'
  ClientHeight = 163
  ClientWidth = 447
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
    Left = 20
    Top = 16
    Width = 61
    Height = 13
    Caption = 'Kode Barang'
  end
  object Label2: TLabel
    Left = 20
    Top = 41
    Width = 64
    Height = 13
    Caption = 'Nama Barang'
  end
  object Label3: TLabel
    Left = 20
    Top = 66
    Width = 79
    Height = 13
    Caption = 'Barcode Saat Ini'
  end
  object Label4: TLabel
    Left = 20
    Top = 91
    Width = 64
    Height = 13
    Caption = 'Barcode Baru'
  end
  object Label5: TLabel
    Left = 108
    Top = 16
    Width = 4
    Height = 13
    Caption = ':'
  end
  object Label6: TLabel
    Left = 108
    Top = 41
    Width = 4
    Height = 13
    Caption = ':'
  end
  object Label7: TLabel
    Left = 108
    Top = 66
    Width = 4
    Height = 13
    Caption = ':'
  end
  object Label8: TLabel
    Left = 108
    Top = 91
    Width = 4
    Height = 13
    Caption = ':'
  end
  object EkodeBarang: TEdit
    Left = 123
    Top = 13
    Width = 182
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object EnamaBarang: TEdit
    Left = 123
    Top = 38
    Width = 270
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object EbarcodeLama: TEdit
    Left = 122
    Top = 63
    Width = 270
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object EbarcodeBaru: TEdit
    Left = 122
    Top = 88
    Width = 270
    Height = 21
    TabOrder = 3
  end
  object btnSimpan: TcxButton
    Left = 96
    Top = 128
    Width = 105
    Height = 25
    Caption = 'Simpan [Ctrl + S ]'
    TabOrder = 4
    OnClick = btnSimpanClick
  end
  object btnTutup: TcxButton
    Left = 207
    Top = 128
    Width = 97
    Height = 25
    Caption = 'Batal'
    TabOrder = 5
    OnClick = btnTutupClick
  end
end
