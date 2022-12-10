object FubahHargaBeli: TFubahHargaBeli
  Left = 0
  Top = 0
  Caption = 'Ubah Harga Barang'
  ClientHeight = 381
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object G1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    TabOrder = 0
    Height = 49
    Width = 464
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 188
      Height = 19
      Caption = 'UBAH HARGA BARANG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object G2: TcxGroupBox
    Left = 0
    Top = 49
    Align = alClient
    TabOrder = 1
    Height = 274
    Width = 464
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 61
      Height = 13
      Caption = 'Kode Barang'
      Transparent = True
    end
    object Label3: TLabel
      Left = 16
      Top = 81
      Width = 64
      Height = 13
      Caption = 'Nama Barang'
      Transparent = True
    end
    object Label4: TLabel
      Left = 16
      Top = 106
      Width = 48
      Height = 13
      Caption = 'Harga Beli'
      Transparent = True
    end
    object Label5: TLabel
      Left = 16
      Top = 131
      Width = 38
      Height = 13
      Caption = 'Harga 1'
      Transparent = True
    end
    object Label6: TLabel
      Left = 16
      Top = 156
      Width = 38
      Height = 13
      Caption = 'Harga 2'
      Transparent = True
    end
    object Label7: TLabel
      Left = 17
      Top = 181
      Width = 38
      Height = 13
      Caption = 'Harga 3'
      Transparent = True
    end
    object Label8: TLabel
      Left = 89
      Top = 24
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label9: TLabel
      Left = 89
      Top = 81
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label10: TLabel
      Left = 89
      Top = 106
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label11: TLabel
      Left = 89
      Top = 131
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label12: TLabel
      Left = 89
      Top = 156
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label13: TLabel
      Left = 90
      Top = 181
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label17: TLabel
      Left = 89
      Top = 233
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label16: TLabel
      Left = 88
      Top = 208
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label15: TLabel
      Left = 16
      Top = 233
      Width = 38
      Height = 13
      Caption = 'Harga 5'
      Transparent = True
    end
    object Label14: TLabel
      Left = 15
      Top = 208
      Width = 38
      Height = 13
      Caption = 'Harga 4'
      Transparent = True
    end
    object Label18: TLabel
      Left = 16
      Top = 51
      Width = 66
      Height = 13
      Caption = 'Kode Barcode'
      Transparent = True
    end
    object Label19: TLabel
      Left = 89
      Top = 51
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object EKodeBarang: TcxTextEdit
      Left = 96
      Top = 21
      Enabled = False
      TabOrder = 0
      Width = 185
    end
    object ENamaBarang: TcxTextEdit
      Left = 96
      Top = 78
      Enabled = False
      TabOrder = 2
      Width = 313
    end
    object EHargaBeli: TcxTextEdit
      Left = 96
      Top = 103
      TabOrder = 3
      Width = 81
    end
    object EHargaEcer: TcxTextEdit
      Left = 96
      Top = 128
      TabOrder = 4
      Width = 81
    end
    object EHargaGrosir: TcxTextEdit
      Left = 96
      Top = 153
      TabOrder = 5
      Width = 81
    end
    object EHargaPartai: TcxTextEdit
      Left = 96
      Top = 178
      TabOrder = 6
      Width = 80
    end
    object EH5: TcxTextEdit
      Left = 95
      Top = 230
      TabOrder = 8
      Width = 80
    end
    object EH4: TcxTextEdit
      Left = 95
      Top = 205
      TabOrder = 7
      Width = 81
    end
    object Ekodebarcode: TcxTextEdit
      Left = 96
      Top = 48
      Enabled = False
      TabOrder = 1
      Width = 185
    end
  end
  object G3: TcxGroupBox
    Left = 0
    Top = 323
    Align = alBottom
    TabOrder = 2
    Height = 58
    Width = 464
    object btnSimpan: TcxButton
      Left = 8
      Top = 22
      Width = 75
      Height = 25
      Caption = 'Simpan'
      TabOrder = 0
      OnClick = btnSimpanClick
    end
    object btnTutup: TcxButton
      Left = 89
      Top = 22
      Width = 75
      Height = 25
      Caption = 'Tutup'
      TabOrder = 1
      OnClick = btnTutupClick
    end
  end
end
