object FtutupKasir: TFtutupKasir
  Left = 0
  Top = 0
  Caption = 'Tutup Kasir'
  ClientHeight = 536
  ClientWidth = 841
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxbvl1: TdxBevel
    Left = 0
    Top = 0
    Width = 841
    Height = 33
    Align = alTop
    Shape = dxbsLineBottom
    ExplicitWidth = 384
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 135
    Height = 16
    Caption = 'Laporan Kasir Harian'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 8
    Top = 42
    Width = 57
    Height = 19
    Caption = 'Tanggal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 77
    Top = 47
    Width = 4
    Height = 13
    Caption = ':'
  end
  object Label32: TLabel
    Left = 120
    Top = 603
    Width = 4
    Height = 14
    Caption = ':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label43: TLabel
    Left = 241
    Top = 391
    Width = 120
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Setor Ke Kas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label44: TLabel
    Left = 368
    Top = 391
    Width = 6
    Height = 19
    Caption = ':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label48: TLabel
    Left = 241
    Top = 450
    Width = 120
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Tinggal Di Kasir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label50: TLabel
    Left = 368
    Top = 450
    Width = 6
    Height = 19
    Caption = ':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label26: TLabel
    Left = 242
    Top = 423
    Width = 120
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Jumlah'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label27: TLabel
    Left = 368
    Top = 423
    Width = 6
    Height = 19
    Caption = ':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label28: TLabel
    Left = 208
    Top = 42
    Width = 82
    Height = 19
    Caption = 'Pilih Kasir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label29: TLabel
    Left = 309
    Top = 47
    Width = 3
    Height = 13
    Caption = ':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object grp2: TGroupBox
    Left = 380
    Top = 87
    Width = 445
    Height = 282
    Caption = 'Informasi Kas Penjualan'
    TabOrder = 6
    object Label8: TLabel
      Left = 419
      Top = 88
      Width = 15
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label46: TLabel
      Left = 25
      Top = 219
      Width = 136
      Height = 19
      Caption = 'Total Uang Kasir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label47: TLabel
      Left = 242
      Top = 224
      Width = 3
      Height = 13
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LtotalUangKasir: TLabel
      Left = 252
      Top = 219
      Width = 138
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Penjualan Cash'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label42: TLabel
      Left = 32
      Top = 23
      Width = 118
      Height = 19
      Caption = 'Saldo Awal Kasir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label45: TLabel
      Left = 242
      Top = 28
      Width = 4
      Height = 13
      Caption = ':'
    end
    object LsaldoAwal: TLabel
      Left = 204
      Top = 23
      Width = 186
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Penjualan Cash'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 32
      Top = 51
      Width = 114
      Height = 19
      Caption = 'Penjualan Tunai'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 242
      Top = 53
      Width = 4
      Height = 13
      Caption = ':'
    end
    object LpenjualanTunai: TLabel
      Left = 204
      Top = 51
      Width = 186
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Penjualan Cash'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 31
      Top = 156
      Width = 87
      Height = 19
      Caption = 'Pengeluaran'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 242
      Top = 161
      Width = 4
      Height = 13
      Caption = ':'
    end
    object LtotalPengeluaran: TLabel
      Left = 204
      Top = 156
      Width = 186
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Penjualan Cash'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object shp3: TShape
      Left = 218
      Top = 100
      Width = 196
      Height = 1
    end
    object LtotalUangMasuk: TLabel
      Left = 204
      Top = 105
      Width = 186
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Penjualan Cash'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 32
      Top = 129
      Width = 174
      Height = 19
      Caption = 'Pembelian/Bayar Hutang'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label23: TLabel
      Left = 242
      Top = 133
      Width = 4
      Height = 13
      Caption = ':'
    end
    object LtotalPembelian: TLabel
      Left = 205
      Top = 128
      Width = 186
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Penjualan Cash'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object shp5: TShape
      Left = 218
      Top = 212
      Width = 196
      Height = 1
    end
    object Label25: TLabel
      Left = 419
      Top = 196
      Width = 9
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 31
      Top = 76
      Width = 145
      Height = 19
      Caption = 'Pembayaran Piutang'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 242
      Top = 77
      Width = 4
      Height = 13
      Caption = ':'
    end
    object LpembayaranPiutang: TLabel
      Left = 204
      Top = 75
      Width = 186
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label21: TLabel
      Left = 31
      Top = 183
      Width = 139
      Height = 19
      Caption = 'Disetor Ke Kasbesar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 242
      Top = 187
      Width = 4
      Height = 13
      Caption = ':'
    end
    object Ldisetorkas: TLabel
      Left = 204
      Top = 182
      Width = 186
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Penjualan Cash'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object dt1: TDateTimePicker
    Left = 88
    Top = 44
    Width = 97
    Height = 21
    Date = 43720.182006319450000000
    Time = 43720.182006319450000000
    TabOrder = 0
    OnChange = dt1Change
  end
  object btnTutup: TcxButton
    Left = 267
    Top = 495
    Width = 120
    Height = 25
    Caption = 'Proses'
    TabOrder = 1
    OnClick = btnTutupClick
  end
  object btnTutupForm: TcxButton
    Left = 393
    Top = 495
    Width = 120
    Height = 25
    Caption = 'Batal'
    TabOrder = 2
    OnClick = btnTutupFormClick
  end
  object ESetorKekasBesar: TcxTextEdit
    Left = 380
    Top = 418
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 3
    OnKeyUp = ESetorKekasBesarKeyUp
    Width = 177
  end
  object ETinggalDIkasir: TcxTextEdit
    Left = 381
    Top = 450
    Enabled = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 4
    Width = 177
  end
  object grp1: TGroupBox
    Left = 8
    Top = 87
    Width = 366
    Height = 282
    Caption = 'Informasi Transaksi'
    TabOrder = 5
    object Label2: TLabel
      Left = 8
      Top = 23
      Width = 108
      Height = 19
      Caption = 'Penjualan Cash'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 157
      Top = 28
      Width = 4
      Height = 13
      Caption = ':'
    end
    object Label6: TLabel
      Left = 8
      Top = 48
      Width = 115
      Height = 19
      Caption = 'Penjualan Kredit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 157
      Top = 53
      Width = 4
      Height = 13
      Caption = ':'
    end
    object LpenjualanCash: TLabel
      Left = 168
      Top = 23
      Width = 185
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Penjualan Cash'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LpenjualanKredit: TLabel
      Left = 167
      Top = 48
      Width = 186
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Penjualan Cash'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object shp1: TShape
      Left = 157
      Top = 71
      Width = 196
      Height = 1
    end
    object Label9: TLabel
      Left = 8
      Top = 76
      Width = 110
      Height = 19
      Caption = 'Total Penjualan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 157
      Top = 81
      Width = 4
      Height = 13
      Caption = ':'
    end
    object LtotalPenjualan: TLabel
      Left = 167
      Top = 76
      Width = 186
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Penjualan Cash'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object shp2: TShape
      Left = 8
      Top = 106
      Width = 345
      Height = 2
    end
    object Label11: TLabel
      Left = 8
      Top = 115
      Width = 112
      Height = 19
      Caption = 'Transaksi Tunai'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 157
      Top = 120
      Width = 4
      Height = 13
      Caption = ':'
    end
    object Ltunai: TLabel
      Left = 167
      Top = 115
      Width = 186
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Penjualan Cash'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 8
      Top = 140
      Width = 131
      Height = 19
      Caption = 'Transaksi Transfer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 157
      Top = 145
      Width = 4
      Height = 13
      Caption = ':'
    end
    object Ltransfer: TLabel
      Left = 167
      Top = 140
      Width = 186
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Penjualan Cash'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object shp4: TShape
      Left = 8
      Top = 166
      Width = 345
      Height = 2
    end
  end
  object cbKas: TComboBox
    Left = 380
    Top = 385
    Width = 281
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object cbKasir: TComboBox
    Left = 328
    Top = 39
    Width = 170
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnChange = cbKasirChange
  end
end
