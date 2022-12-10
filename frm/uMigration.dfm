object FMigrationData: TFMigrationData
  Left = 0
  Top = 0
  Caption = 'Migration Data'
  ClientHeight = 406
  ClientWidth = 733
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 22
    Height = 13
    Caption = 'Host'
  end
  object Label2: TLabel
    Left = 16
    Top = 35
    Width = 22
    Height = 13
    Caption = 'User'
  end
  object Label3: TLabel
    Left = 16
    Top = 54
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object Label4: TLabel
    Left = 16
    Top = 73
    Width = 20
    Height = 13
    Caption = 'Port'
  end
  object Label5: TLabel
    Left = 16
    Top = 92
    Width = 46
    Height = 13
    Caption = 'Database'
  end
  object Label6: TLabel
    Left = 80
    Top = 16
    Width = 4
    Height = 13
    Caption = ':'
  end
  object Label7: TLabel
    Left = 80
    Top = 35
    Width = 4
    Height = 13
    Caption = ':'
  end
  object Label8: TLabel
    Left = 80
    Top = 54
    Width = 4
    Height = 13
    Caption = ':'
  end
  object Label9: TLabel
    Left = 80
    Top = 73
    Width = 4
    Height = 13
    Caption = ':'
  end
  object Label10: TLabel
    Left = 80
    Top = 92
    Width = 4
    Height = 13
    Caption = ':'
  end
  object EHost: TEdit
    Left = 96
    Top = 13
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'localhost'
  end
  object Euser: TEdit
    Left = 96
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'root'
  end
  object EPassword: TEdit
    Left = 96
    Top = 51
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'anaba'
  end
  object EPort: TEdit
    Left = 96
    Top = 70
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '3308'
  end
  object EDatabase: TEdit
    Left = 96
    Top = 89
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'cashv35'
  end
  object btnConnect: TButton
    Left = 223
    Top = 87
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 5
    OnClick = btnConnectClick
  end
  object btnSatuan: TButton
    Left = 16
    Top = 190
    Width = 121
    Height = 25
    Caption = 'Import Satuan'
    TabOrder = 6
    OnClick = btnSatuanClick
  end
  object btnKategori: TButton
    Left = 16
    Top = 159
    Width = 121
    Height = 25
    Caption = 'Import Kategori'
    TabOrder = 7
    OnClick = btnKategoriClick
  end
  object btnPelanggan: TButton
    Left = 16
    Top = 221
    Width = 121
    Height = 25
    Caption = 'Import Pelanggan'
    TabOrder = 8
    OnClick = btnPelangganClick
  end
  object btnSupplier: TButton
    Left = 16
    Top = 252
    Width = 121
    Height = 25
    Caption = 'Import Supplier'
    TabOrder = 9
    OnClick = btnSupplierClick
  end
  object btnBarang: TButton
    Left = 16
    Top = 283
    Width = 121
    Height = 25
    Caption = 'Import Data Barang'
    TabOrder = 10
    OnClick = btnBarangClick
  end
  object btnPembelian: TButton
    Left = 16
    Top = 313
    Width = 121
    Height = 25
    Caption = 'Import Pembelian'
    TabOrder = 11
    OnClick = btnPembelianClick
  end
  object btnPenjualan: TButton
    Left = 16
    Top = 345
    Width = 121
    Height = 25
    Caption = 'Import Penjualan'
    TabOrder = 12
    OnClick = btnPenjualanClick
  end
  object PKategori: TProgressBar
    Left = 160
    Top = 164
    Width = 317
    Height = 17
    TabOrder = 13
  end
  object PSatuan: TProgressBar
    Left = 160
    Top = 194
    Width = 317
    Height = 17
    TabOrder = 14
  end
  object PPelanggan: TProgressBar
    Left = 160
    Top = 225
    Width = 317
    Height = 17
    TabOrder = 15
  end
  object PSupplier: TProgressBar
    Left = 160
    Top = 256
    Width = 317
    Height = 17
    TabOrder = 16
  end
  object PDataBarang: TProgressBar
    Left = 160
    Top = 287
    Width = 317
    Height = 17
    TabOrder = 17
  end
  object PPembelian: TProgressBar
    Left = 160
    Top = 319
    Width = 317
    Height = 17
    TabOrder = 18
  end
  object PPenjualan: TProgressBar
    Left = 160
    Top = 350
    Width = 317
    Height = 17
    TabOrder = 19
  end
  object dtJual2: TDateTimePicker
    Left = 595
    Top = 345
    Width = 98
    Height = 21
    Date = 44772.866237951390000000
    Time = 44772.866237951390000000
    TabOrder = 20
  end
  object cPenjualanPiutang: TCheckBox
    Left = 160
    Top = 376
    Width = 97
    Height = 17
    Caption = 'Penjualan Piutang'
    TabOrder = 21
  end
  object dtBeli1: TDateTimePicker
    Left = 483
    Top = 317
    Width = 102
    Height = 21
    Date = 44772.866237951390000000
    Time = 44772.866237951390000000
    TabOrder = 22
  end
  object dtBeli2: TDateTimePicker
    Left = 591
    Top = 317
    Width = 102
    Height = 21
    Date = 44772.866237951390000000
    Time = 44772.866237951390000000
    TabOrder = 23
  end
  object dtJual1: TDateTimePicker
    Left = 483
    Top = 344
    Width = 102
    Height = 21
    Date = 44772.866237951390000000
    Time = 44772.866237951390000000
    TabOrder = 24
  end
  object Button1: TButton
    Left = 520
    Top = 159
    Width = 121
    Height = 25
    Caption = 'Sync Stok'
    TabOrder = 25
    OnClick = Button1Click
  end
  object ProgressBar1: TProgressBar
    Left = 520
    Top = 190
    Width = 197
    Height = 17
    TabOrder = 26
  end
  object Con2: TMyConnection
    Left = 344
    Top = 8
  end
  object Q1: TMyQuery
    Connection = Con2
    Left = 392
    Top = 24
  end
  object Q3: TMyQuery
    Connection = Con2
    Left = 392
    Top = 72
  end
  object Q2: TMyQuery
    Connection = Con2
    Left = 440
    Top = 24
  end
  object Q4: TMyQuery
    Connection = Con2
    Left = 440
    Top = 72
  end
  object Q5: TMyQuery
    Connection = Con2
    Left = 392
    Top = 120
  end
  object Q6: TMyQuery
    Connection = Con2
    Left = 440
    Top = 120
  end
  object Q7: TMyQuery
    Connection = Con2
    Left = 344
    Top = 72
  end
end
