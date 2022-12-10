object FinputBarang: TFinputBarang
  Left = 0
  Top = 0
  Caption = 'Input Data Barang'
  ClientHeight = 512
  ClientWidth = 1185
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object dxbvl1: TdxBevel
    Left = 0
    Top = 0
    Width = 1185
    Height = 33
    Align = alTop
    Shape = dxbsLineBottom
    ExplicitWidth = 384
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 177
    Height = 16
    Caption = 'INPUT / EDIT DATA BARANG'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object btnSimpan: TcxButton
    Left = 272
    Top = 474
    Width = 122
    Height = 30
    Caption = 'Simpan'
    OptionsImage.Glyph.SourceDPI = 96
    OptionsImage.Glyph.Data = {
      424D360400000000000036000000280000001000000010000000010020000000
      000000000000C40E0000C40E0000000000000000000000000000000000000000
      000000000002000000070000000C0000001000000012000000110000000E0000
      0008000000020000000000000000000000000000000000000000000000010000
      0004000101120D2A1D79184E36C6216B4BFF216B4BFF216C4BFF1A533AD20F2F
      218400010115000000050000000100000000000000000000000000000005050F
      0A351C5B40DC24805CFF29AC7EFF2CC592FF2DC894FF2DC693FF2AAE80FF2585
      60FF1A563DD405110C3D00000007000000010000000000000003040E0A312065
      48ED299D74FF2FC896FF2EC996FF56D4ACFF68DAB5FF3BCD9DFF30C996FF32CA
      99FF2BA479FF227050F805110C3D00000005000000000000000A1A573DD02EA5
      7CFF33CA99FF2EC896FF4CD2A8FF20835CFF00673BFF45BE96FF31CB99FF31CB
      98FF34CC9CFF31AD83FF1B5C41D300010113000000020B23185E2E8A66FF3BCD
      9EFF30CA97FF4BD3A9FF349571FF87AF9DFFB1CFC1FF238A60FF45D3A8FF36CF
      9FFF33CD9BFF3ED0A3FF319470FF0F32237F00000007184D37B63DB38CFF39CD
      9FFF4BD5A9FF43A382FF699782FFF8F1EEFFF9F3EEFF357F5DFF56C4A1FF43D5
      A8FF3ED3A4FF3CD1A4FF41BC95FF1B5C43CD0000000B1C6446DF4BCAA4FF44D2
      A8FF4FB392FF4E826AFFF0E9E6FFC0C3B5FFEFE3DDFFCEDDD4FF1B754FFF60DC
      B8FF48D8ACFF47D6AAFF51D4ACFF247A58F80000000E217050F266D9B8FF46D3
      A8FF0B6741FFD2D2CBFF6A8F77FF116B43FF73967EFFF1E8E3FF72A28BFF46A6
      85FF5EDFBAFF4CD9AFFF6BE2C2FF278460FF020604191E684ADC78D9BEFF52DA
      B1FF3DBA92FF096941FF2F9C76FF57DEB8FF2D9973FF73967EFFF0EAE7FF4F88
      6CFF5ABB9AFF5BDEB9FF7FE2C7FF27835FF80000000C19523BAB77C8B0FF62E0
      BCFF56DDB7FF59DFBAFF5CE1BDFF5EE2BEFF5FE4C1FF288C67FF698E76FFE6E1
      DCFF176B47FF5FD8B4FF83D5BDFF1E674CC60000000909201747439C7BFF95EC
      D6FF5ADFBAFF5EE2BDFF61E4BFFF64E6C1FF67E6C5FF67E8C7FF39A17EFF1F6D
      4AFF288B64FF98EFD9FF4DAC8CFF1036286D00000004000000041C5F46B578C6
      ADFF9AEED9FF65E5C0FF64E7C3FF69E7C6FF6BE8C8FF6CE9C9FF6BEAC9FF5ED6
      B6FF97EDD7FF86D3BBFF237759D20102010C0000000100000001030A0718247B
      5BDA70C1A8FFB5F2E3FF98F0DAFF85EDD4FF75EBCEFF88EFD6FF9CF2DDFFBAF4
      E7FF78CDB3FF2A906DEA0615102E00000002000000000000000000000001030A
      07171E694FB844AB87FF85D2BBFFA8E6D6FFC5F4EBFFABE9D8FF89D8C1FF4BB6
      92FF237F60CB05130E2700000003000000000000000000000000000000000000
      0001000000030A241B411B60489D258464CF2C9D77EE258867CF1F7156B00E32
      26560000000600000002000000000000000000000000}
    TabOrder = 0
    OnClick = btnSimpanClick
  end
  object btnTutup: TcxButton
    Left = 400
    Top = 472
    Width = 102
    Height = 32
    Caption = 'Tutup'
    OptionsImage.Glyph.SourceDPI = 96
    OptionsImage.Glyph.Data = {
      424D360400000000000036000000280000001000000010000000010020000000
      000000000000C40E0000C40E00000000000000000000000000030000000B0000
      0012000000130000001300000014000000140000001400000014000000140000
      00140000001500000015000000140000000D000000030000000B1C116CC32617
      96FF271696FF261695FF261594FF251594FF251594FF241394FF241293FF2412
      92FF231292FF231192FF231191FF190C68C50000000C0000000F2B1C9BFF384A
      D3FF2637CEFF3042D2FF4254D9FF3646D4FF2437CCFF2434CCFF3444D3FF3C4E
      D6FF2A3ACEFF202FC9FF1E2CC9FF251595FF000000120000000F3121A0FF4356
      D7FF374BD5FF3F4BCBFF2827ABFF363CBEFF3E4FD6FF3D4ED5FF353ABEFF2827
      ABFF3B45C9FF2F41D0FF2332CCFF291A99FF000000120000000E3529A5FF4E62
      DBFF444FCCFF605DBDFFEDEDF8FF8B89CEFF383CBCFF383CBBFF8B89CEFFEDED
      F8FF5F5DBDFF3D47C9FF293ACEFF2D1F9EFF000000110000000D392FABFF596F
      DFFF2722A5FFECE7ECFFF5EBE4FFF8F2EEFF9491D1FF9491D1FFF8F1EDFFF3E9
      E2FFECE6EBFF2721A5FF2F42D1FF3326A3FF0000000F0000000C4036B1FF657A
      E2FF3135B7FF8070ADFFEBDBD3FFF4EAE4FFF7F2EDFFF8F1EDFFF4E9E2FFEADA
      D1FF7F6FACFF2E31B6FF3549D5FF372CA9FF0000000E0000000B453DB6FF6E83
      E5FF485EDCFF393BB7FF8A7FB9FFF6ECE7FFF5ECE6FFF4EBE5FFF6EBE5FF897D
      B8FF3739B6FF4054D9FF3D51D7FF3C33AFFF0000000D0000000A4A44BCFF788F
      E8FF6077E3FF4B4BBBFF9189C7FFF7EFE9FFF6EEE9FFF6EFE8FFF7EDE8FF9087
      C5FF4949BAFF596FDFFF4359DAFF423AB4FF0000000C00000009504CC2FF92A7
      EEFF5655BCFF8F89CAFFFBF6F4FFF7F1ECFFEDE1D9FFEDE0D9FFF7F0EAFFFAF5
      F2FF8F89CAFF5453BCFF6278E2FF4943B9FF0000000B000000086B6AD0FFADC1
      F4FF2A1E9BFFE5DADEFFF6EEEBFFEDDFDAFF816EA9FF816EA9FFEDDFD8FFF4EC
      E7FFE5D9DCFF2A1D9BFF8B9EEBFF6563C9FF0000000A000000077577D6FFB1C6
      F5FF6E77D1FF5747A1FFCCB6BCFF7A68A8FF4E4CB7FF4F4EB8FF7A68A8FFCBB5
      BCFF5746A1FF6B75D0FF8EA1ECFF706ED0FF0000000900000006797BDAFFB5CA
      F6FF93A7EEFF7079D2FF2E229BFF5453BBFF93A7EEFF93A7EEFF5555BCFF2E21
      9BFF6F77D1FF91A4EDFF90A3EDFF7475D4FF00000008000000057D80DEFFB9CD
      F6FFB9CDF6FFB9CCF6FFB9CCF6FFB9CDF6FFB8CCF6FFB8CCF6FFB7CCF6FFB7CB
      F6FFB6CBF6FFB5C9F6FFB5C9F6FF787AD8FF00000006000000036062A6C08184
      E1FF8183E0FF8083E0FF7F83DFFF7F83DFFF7F82DFFF7E81DFFF7E81DEFF7D81
      DEFF7D80DEFF7D7FDEFF7C7FDDFF5C5EA3C10000000400000000000000020000
      0003000000040000000400000004000000040000000400000004000000040000
      00040000000400000005000000050000000300000001}
    TabOrder = 1
    OnClick = btnTutupClick
  end
  object cxPageControl1: TcxPageControl
    Left = 8
    Top = 39
    Width = 1169
    Height = 418
    TabOrder = 2
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    Properties.MultiLine = True
    Properties.ShowFrame = True
    Properties.Style = 9
    Properties.TabPosition = tpBottom
    LookAndFeel.NativeStyle = False
    OnChange = cxPageControl1Change
    ClientRectBottom = 395
    ClientRectLeft = 1
    ClientRectRight = 1168
    ClientRectTop = 1
    object cxTabSheet1: TcxTabSheet
      Caption = 'Info Barang'
      ImageIndex = 0
      object Label2: TLabel
        Left = 8
        Top = 73
        Width = 77
        Height = 16
        Caption = 'Nama Barang'
        Transparent = True
      end
      object Label4: TLabel
        Left = 8
        Top = 130
        Width = 47
        Height = 16
        Caption = 'Kategori'
        Transparent = True
      end
      object Label5: TLabel
        Left = 8
        Top = 188
        Width = 13
        Height = 16
        Caption = 'Isi'
        Transparent = True
      end
      object Label6: TLabel
        Left = 112
        Top = 73
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label8: TLabel
        Left = 112
        Top = 130
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label9: TLabel
        Left = 112
        Top = 188
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label10: TLabel
        Left = 8
        Top = 246
        Width = 49
        Height = 16
        Caption = 'Stok Min'
        Transparent = True
      end
      object Label11: TLabel
        Left = 8
        Top = 275
        Width = 52
        Height = 16
        Caption = 'Stok Max'
        Transparent = True
      end
      object Label12: TLabel
        Left = 113
        Top = 246
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label13: TLabel
        Left = 112
        Top = 276
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label14: TLabel
        Left = 8
        Top = 13
        Width = 72
        Height = 16
        Caption = 'Kode Barang'
        Transparent = True
      end
      object Label15: TLabel
        Left = 112
        Top = 13
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label16: TLabel
        Left = 8
        Top = 43
        Width = 78
        Height = 16
        Caption = 'Kode Barcode'
        Transparent = True
      end
      object Label17: TLabel
        Left = 112
        Top = 43
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label18: TLabel
        Left = 8
        Top = 159
        Width = 64
        Height = 16
        Caption = 'Satuan Beli'
        Transparent = True
      end
      object Label19: TLabel
        Left = 112
        Top = 159
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label20: TLabel
        Left = 8
        Top = 217
        Width = 66
        Height = 16
        Caption = 'Satuan Jual'
        Transparent = True
      end
      object Label21: TLabel
        Left = 112
        Top = 217
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label3: TLabel
        Left = 440
        Top = 13
        Width = 58
        Height = 16
        Caption = 'Harga Beli'
        Transparent = True
      end
      object Label7: TLabel
        Left = 544
        Top = 13
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label22: TLabel
        Left = 440
        Top = 158
        Width = 45
        Height = 16
        Caption = 'Harga 1'
        Transparent = True
      end
      object Label23: TLabel
        Left = 544
        Top = 158
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label24: TLabel
        Left = 440
        Top = 215
        Width = 45
        Height = 16
        Caption = 'Harga 2'
        Transparent = True
      end
      object Label25: TLabel
        Left = 544
        Top = 215
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label26: TLabel
        Left = 440
        Top = 275
        Width = 45
        Height = 16
        Caption = 'Harga 3'
        Transparent = True
      end
      object Label27: TLabel
        Left = 544
        Top = 275
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label32: TLabel
        Left = 440
        Top = 73
        Width = 22
        Height = 16
        Caption = 'PPN'
        Transparent = True
      end
      object Label33: TLabel
        Left = 544
        Top = 73
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label95: TLabel
        Left = 112
        Top = 101
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label94: TLabel
        Left = 8
        Top = 101
        Width = 83
        Height = 16
        Caption = 'Nama Barcode'
        Transparent = True
      end
      object Label42: TLabel
        Left = 440
        Top = 130
        Width = 65
        Height = 16
        Caption = 'Margin (%)'
        Transparent = True
      end
      object Label43: TLabel
        Left = 544
        Top = 130
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label51: TLabel
        Left = 440
        Top = 103
        Width = 96
        Height = 16
        Caption = 'Harga Beli + PPN'
        Transparent = True
      end
      object Label52: TLabel
        Left = 544
        Top = 103
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label53: TLabel
        Left = 440
        Top = 187
        Width = 65
        Height = 16
        Caption = 'Margin (%)'
        Transparent = True
      end
      object Label54: TLabel
        Left = 544
        Top = 187
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label55: TLabel
        Left = 440
        Top = 240
        Width = 65
        Height = 16
        Caption = 'Margin (%)'
        Transparent = True
      end
      object Label56: TLabel
        Left = 544
        Top = 241
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label57: TLabel
        Left = 8
        Top = 306
        Width = 81
        Height = 16
        Caption = 'Minimal Order'
        Transparent = True
      end
      object Label58: TLabel
        Left = 112
        Top = 306
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label91: TLabel
        Left = 440
        Top = 43
        Width = 71
        Height = 16
        Caption = 'Harga Rata2'
        Transparent = True
      end
      object Label92: TLabel
        Left = 544
        Top = 43
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label28: TLabel
        Left = 8
        Top = 362
        Width = 44
        Height = 19
        Caption = 'STOK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label29: TLabel
        Left = 113
        Top = 365
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label63: TLabel
        Left = 8
        Top = 335
        Width = 88
        Height = 16
        Caption = 'Supplier Utama'
        Transparent = True
      end
      object Label64: TLabel
        Left = 112
        Top = 335
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label118: TLabel
        Left = 440
        Top = 306
        Width = 21
        Height = 16
        Caption = 'BKP'
        Transparent = True
      end
      object Label119: TLabel
        Left = 544
        Top = 306
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Enamabarang: TcxTextEdit
        Left = 128
        Top = 70
        Hint = 'Nama Barang'
        TabOrder = 2
        Width = 282
      end
      object EisiBox: TcxTextEdit
        Tag = 1
        Left = 128
        Top = 185
        Hint = 'isi'
        TabOrder = 6
        Width = 65
      end
      object EStokMin: TcxTextEdit
        Tag = 1
        Left = 128
        Top = 243
        Hint = 'Stok Min'
        TabOrder = 8
        Width = 169
      end
      object EstokMax: TcxTextEdit
        Tag = 1
        Left = 128
        Top = 273
        Hint = 'Stok Max'
        TabOrder = 9
        Width = 169
      end
      object Ekodebarang: TcxTextEdit
        Left = 128
        Top = 10
        Hint = 'Nama pelanggan'
        TabOrder = 0
        Width = 164
      end
      object Ekodebarcode: TcxTextEdit
        Left = 128
        Top = 40
        Hint = 'Kode Barcode'
        TabOrder = 1
        OnKeyDown = EkodebarcodeKeyDown
        Width = 164
      end
      object cbKategori: TcxComboBox
        Left = 128
        Top = 127
        Hint = 'Kategori'
        TabOrder = 4
        Width = 121
      end
      object btnCariKategori: TcxButton
        Left = 253
        Top = 127
        Width = 39
        Height = 21
        Caption = '....'
        TabOrder = 22
        OnClick = btnCariKategoriClick
      end
      object cbsatuanbeli: TcxComboBox
        Left = 128
        Top = 156
        Hint = 'Kategori'
        TabOrder = 5
        Width = 121
      end
      object btnCariSatuan: TcxButton
        Left = 253
        Top = 156
        Width = 39
        Height = 21
        Caption = '....'
        TabOrder = 23
        OnClick = btnCariSatuanClick
      end
      object cbSatuanjual: TcxComboBox
        Left = 128
        Top = 214
        Hint = 'Satuan Jual'
        TabOrder = 7
        Width = 121
      end
      object EHargaBeli: TcxTextEdit
        Tag = 1
        Left = 560
        Top = 10
        Hint = 'Harga Beli'
        Properties.OnChange = EHargaBeliPropertiesChange
        TabOrder = 12
        Width = 113
      end
      object EHargaJual: TcxTextEdit
        Tag = 1
        Left = 560
        Top = 155
        Hint = 'Harga Ecer'
        TabOrder = 17
        OnKeyUp = EHargaJualKeyUp
        Width = 113
      end
      object EHargaGrosir: TcxTextEdit
        Tag = 1
        Left = 560
        Top = 212
        Hint = 'Max Piutang'
        TabOrder = 19
        OnKeyUp = EHargaGrosirKeyUp
        Width = 113
      end
      object EHargaPartai: TcxTextEdit
        Tag = 1
        Left = 560
        Top = 272
        Hint = 'Max Piutang'
        TabOrder = 21
        OnKeyUp = EHargaPartaiKeyUp
        Width = 113
      end
      object Eppn: TcxTextEdit
        Tag = 1
        Left = 560
        Top = 70
        Hint = 'Max Piutang'
        Properties.OnChange = EppnPropertiesChange
        TabOrder = 14
        Width = 41
      end
      object EnamaBarcode: TcxTextEdit
        Tag = 1
        Left = 128
        Top = 98
        Hint = 'Nama Barcode'
        TabOrder = 3
        Width = 164
      end
      object EMargin: TcxTextEdit
        Tag = 1
        Left = 560
        Top = 127
        Hint = 'Max Piutang'
        Properties.ReadOnly = False
        StyleDisabled.BorderColor = clSilver
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 16
        OnKeyUp = EMarginKeyUp
        Width = 41
      end
      object EHargaSetelahPPN: TcxTextEdit
        Tag = 1
        Left = 560
        Top = 100
        Hint = 'Max Piutang'
        TabOrder = 15
        Width = 113
      end
      object EMarginGrosir: TcxTextEdit
        Tag = 1
        Left = 560
        Top = 184
        Hint = 'Max Piutang'
        Properties.ReadOnly = False
        StyleDisabled.BorderColor = clSilver
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 18
        OnKeyUp = EMarginGrosirKeyUp
        Width = 41
      end
      object EMarginPartai: TcxTextEdit
        Tag = 1
        Left = 560
        Top = 240
        Hint = 'Max Piutang'
        Properties.ReadOnly = False
        StyleDisabled.BorderColor = clSilver
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 20
        OnKeyUp = EMarginPartaiKeyUp
        Width = 41
      end
      object EMinimalOrder: TcxTextEdit
        Tag = 1
        Left = 128
        Top = 303
        Hint = 'Minimal Order'
        TabOrder = 10
        Width = 169
      end
      object Ecogs: TcxTextEdit
        Tag = 1
        Left = 560
        Top = 40
        Hint = 'Max Piutang'
        Enabled = False
        Properties.OnChange = EHargaBeliPropertiesChange
        TabOrder = 13
        Width = 113
      end
      object ESTOK: TcxTextEdit
        Tag = 1
        Left = 128
        Top = 359
        Hint = 'Max Piutang'
        Enabled = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 24
        Width = 113
      end
      object cbSupplier: TcxComboBox
        Tag = 1
        Left = 128
        Top = 332
        TabOrder = 11
        Width = 282
      end
      object cxGroupBox1: TcxGroupBox
        Left = 696
        Top = -1
        Caption = 'Harga Promo'
        TabOrder = 25
        Height = 298
        Width = 433
        object grp3: TGroupBox
          Left = 16
          Top = 208
          Width = 377
          Height = 80
          Caption = 'Harga Promo Level 3'
          Color = 16744576
          ParentBackground = False
          ParentColor = False
          TabOrder = 0
          object Label89: TLabel
            Left = 8
            Top = 24
            Width = 52
            Height = 16
            Caption = 'Tgl Mulai'
          end
          object Label90: TLabel
            Left = 180
            Top = 23
            Width = 63
            Height = 16
            Caption = 'Tgl Selesai'
          end
          object Label93: TLabel
            Left = 8
            Top = 57
            Width = 75
            Height = 16
            Caption = 'Harga Promo'
            Transparent = True
          end
          object Label96: TLabel
            Left = 104
            Top = 57
            Width = 5
            Height = 16
            Caption = ':'
            Transparent = True
          end
          object Label97: TLabel
            Left = 240
            Top = 54
            Width = 65
            Height = 16
            Caption = 'Margin (%)'
            Transparent = True
          end
          object Label98: TLabel
            Left = 314
            Top = 53
            Width = 5
            Height = 16
            Caption = ':'
            Transparent = True
          end
          object dtawal3: TDateTimePicker
            Left = 66
            Top = 19
            Width = 108
            Height = 24
            Date = 44317.612846527780000000
            Time = 44317.612846527780000000
            TabOrder = 0
          end
          object dtselesai3: TDateTimePicker
            Left = 250
            Top = 19
            Width = 116
            Height = 24
            Date = 44317.612846527780000000
            Time = 44317.612846527780000000
            TabOrder = 1
          end
          object EHargaPromo3: TcxTextEdit
            Tag = 1
            Left = 120
            Top = 50
            Hint = 'Max Piutang'
            TabOrder = 2
            OnKeyUp = EHargaPromo3KeyUp
            Width = 113
          end
          object Emarginpromo3: TcxTextEdit
            Tag = 1
            Left = 327
            Top = 50
            Hint = 'Max Piutang'
            Properties.ReadOnly = True
            StyleDisabled.BorderColor = clSilver
            StyleDisabled.Color = clWhite
            StyleDisabled.TextColor = clBlack
            TabOrder = 3
            OnKeyUp = EMarginPartaiKeyUp
            Width = 41
          end
        end
        object grp2: TGroupBox
          Left = 16
          Top = 120
          Width = 377
          Height = 80
          Caption = 'Harga Promo Level 2'
          Color = 57088
          ParentBackground = False
          ParentColor = False
          TabOrder = 1
          object Label78: TLabel
            Left = 8
            Top = 24
            Width = 52
            Height = 16
            Caption = 'Tgl Mulai'
          end
          object Label84: TLabel
            Left = 180
            Top = 23
            Width = 63
            Height = 16
            Caption = 'Tgl Selesai'
          end
          object Label85: TLabel
            Left = 8
            Top = 57
            Width = 75
            Height = 16
            Caption = 'Harga Promo'
            Transparent = True
          end
          object Label86: TLabel
            Left = 104
            Top = 57
            Width = 5
            Height = 16
            Caption = ':'
            Transparent = True
          end
          object Label87: TLabel
            Left = 240
            Top = 54
            Width = 65
            Height = 16
            Caption = 'Margin (%)'
            Transparent = True
          end
          object Label88: TLabel
            Left = 314
            Top = 53
            Width = 5
            Height = 16
            Caption = ':'
            Transparent = True
          end
          object dtawal2: TDateTimePicker
            Left = 66
            Top = 19
            Width = 108
            Height = 24
            Date = 44317.612846527780000000
            Time = 44317.612846527780000000
            TabOrder = 0
          end
          object dtselesai2: TDateTimePicker
            Left = 250
            Top = 19
            Width = 116
            Height = 24
            Date = 44317.612846527780000000
            Time = 44317.612846527780000000
            TabOrder = 1
          end
          object EHargaPromo2: TcxTextEdit
            Tag = 1
            Left = 121
            Top = 49
            Hint = 'Max Piutang'
            TabOrder = 2
            OnKeyUp = EHargaPromo2KeyUp
            Width = 113
          end
          object Emarginpromo2: TcxTextEdit
            Tag = 1
            Left = 327
            Top = 50
            Hint = 'Max Piutang'
            Properties.ReadOnly = True
            StyleDisabled.BorderColor = clSilver
            StyleDisabled.Color = clWhite
            StyleDisabled.TextColor = clBlack
            TabOrder = 3
            OnKeyUp = EMarginPartaiKeyUp
            Width = 41
          end
        end
        object grp1: TGroupBox
          Left = 16
          Top = 26
          Width = 377
          Height = 80
          Caption = 'Harga Promo Level 1'
          Color = 5987327
          ParentBackground = False
          ParentColor = False
          TabOrder = 2
          object Label30: TLabel
            Left = 8
            Top = 24
            Width = 52
            Height = 16
            Caption = 'Tgl Mulai'
          end
          object Label31: TLabel
            Left = 180
            Top = 23
            Width = 63
            Height = 16
            Caption = 'Tgl Selesai'
          end
          object Label59: TLabel
            Left = 8
            Top = 57
            Width = 75
            Height = 16
            Caption = 'Harga Promo'
            Transparent = True
          end
          object Label60: TLabel
            Left = 104
            Top = 57
            Width = 5
            Height = 16
            Caption = ':'
            Transparent = True
          end
          object Label61: TLabel
            Left = 240
            Top = 54
            Width = 65
            Height = 16
            Caption = 'Margin (%)'
            Transparent = True
          end
          object Label62: TLabel
            Left = 314
            Top = 53
            Width = 5
            Height = 16
            Caption = ':'
            Transparent = True
          end
          object dtAwal: TDateTimePicker
            Left = 66
            Top = 19
            Width = 108
            Height = 24
            Date = 44317.612846527780000000
            Time = 44317.612846527780000000
            TabOrder = 0
          end
          object dtSelesai: TDateTimePicker
            Left = 250
            Top = 19
            Width = 116
            Height = 24
            Date = 44317.612846527780000000
            Time = 44317.612846527780000000
            TabOrder = 1
          end
          object EHargaPromo: TcxTextEdit
            Tag = 1
            Left = 120
            Top = 50
            Hint = 'Max Piutang'
            TabOrder = 2
            OnKeyUp = EHargaPromoKeyUp
            Width = 113
          end
          object EMarginPromo: TcxTextEdit
            Tag = 1
            Left = 327
            Top = 50
            Hint = 'Max Piutang'
            Properties.ReadOnly = True
            StyleDisabled.BorderColor = clSilver
            StyleDisabled.Color = clWhite
            StyleDisabled.TextColor = clBlack
            TabOrder = 3
            OnKeyUp = EMarginPartaiKeyUp
            Width = 41
          end
        end
      end
      object cBKP: TcxCheckBox
        Left = 557
        Top = 303
        Caption = 'Ya'
        TabOrder = 26
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Multi Harga'
      ImageIndex = 1
      object dxBevel1: TdxBevel
        Left = 13
        Top = 197
        Width = 695
        Height = 15
        Shape = dxbsLineBottom
      end
      object Label65: TLabel
        Left = 2
        Top = 211
        Width = 58
        Height = 16
        Caption = 'Multi Qty'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4227072
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = True
      end
      object Label66: TLabel
        Left = 19
        Top = 234
        Width = 44
        Height = 16
        Caption = 'Jika Qty'
        Transparent = True
      end
      object Label67: TLabel
        Left = 19
        Top = 260
        Width = 44
        Height = 16
        Caption = 'Jika Qty'
        Transparent = True
      end
      object Label68: TLabel
        Left = 19
        Top = 286
        Width = 44
        Height = 16
        Caption = 'Jika Qty'
        Transparent = True
      end
      object Label72: TLabel
        Left = 71
        Top = 234
        Width = 18
        Height = 16
        Caption = '>='
        Transparent = True
      end
      object Label69: TLabel
        Left = 71
        Top = 260
        Width = 18
        Height = 16
        Caption = '>='
        Transparent = True
      end
      object Label70: TLabel
        Left = 71
        Top = 286
        Width = 18
        Height = 16
        Caption = '>='
        Transparent = True
      end
      object Label71: TLabel
        Left = 283
        Top = 234
        Width = 45
        Height = 16
        Caption = 'Dan Qty'
        Transparent = True
      end
      object Label73: TLabel
        Left = 283
        Top = 260
        Width = 45
        Height = 16
        Caption = 'Dan Qty'
        Transparent = True
      end
      object Label74: TLabel
        Left = 283
        Top = 286
        Width = 45
        Height = 16
        Caption = 'Dan Qty'
        Transparent = True
      end
      object Label75: TLabel
        Left = 342
        Top = 234
        Width = 9
        Height = 16
        Caption = '<'
        Transparent = True
      end
      object Label76: TLabel
        Left = 342
        Top = 260
        Width = 9
        Height = 16
        Caption = '<'
        Transparent = True
      end
      object Label77: TLabel
        Left = 342
        Top = 286
        Width = 9
        Height = 16
        Caption = '<'
        Transparent = True
      end
      object Lpcs4: TLabel
        Left = 483
        Top = 234
        Width = 34
        Height = 16
        Caption = 'Harga'
        Transparent = True
      end
      object Label79: TLabel
        Left = 483
        Top = 260
        Width = 34
        Height = 16
        Caption = 'Harga'
        Transparent = True
      end
      object Label80: TLabel
        Left = 483
        Top = 286
        Width = 34
        Height = 16
        Caption = 'Harga'
        Transparent = True
      end
      object Label81: TLabel
        Left = 526
        Top = 234
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label82: TLabel
        Left = 526
        Top = 260
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label83: TLabel
        Left = 526
        Top = 286
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Lpcs1: TLabel
        Left = 142
        Top = 236
        Width = 40
        Height = 16
        Caption = 'Satuan'
        Transparent = True
      end
      object Lpcs2: TLabel
        Left = 142
        Top = 260
        Width = 40
        Height = 16
        Caption = 'Satuan'
        Transparent = True
      end
      object Lpcs3: TLabel
        Left = 142
        Top = 286
        Width = 40
        Height = 16
        Caption = 'Satuan'
        Transparent = True
      end
      object Lpcs7: TLabel
        Left = 437
        Top = 286
        Width = 23
        Height = 16
        Caption = 'PCS'
        Transparent = True
      end
      object Lpcs5: TLabel
        Left = 437
        Top = 236
        Width = 23
        Height = 16
        Caption = 'PCS'
        Transparent = True
      end
      object Lpcs6: TLabel
        Left = 437
        Top = 260
        Width = 23
        Height = 16
        Caption = 'PCS'
        Transparent = True
      end
      object Label44: TLabel
        Left = 28
        Top = 31
        Width = 46
        Height = 16
        Caption = 'Satuan'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object shp2: TShape
        Left = 14
        Top = 189
        Width = 764
        Height = 2
      end
      object shp3: TShape
        Left = 12
        Top = 27
        Width = 2
        Height = 164
      end
      object shp5: TShape
        Left = 113
        Top = 27
        Width = 2
        Height = 164
      end
      object shp6: TShape
        Left = 157
        Top = 27
        Width = 2
        Height = 164
      end
      object shp7: TShape
        Left = 289
        Top = 25
        Width = 2
        Height = 164
      end
      object Label34: TLabel
        Left = 121
        Top = 31
        Width = 15
        Height = 16
        Caption = 'Isi'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label35: TLabel
        Left = 165
        Top = 30
        Width = 44
        Height = 16
        Caption = 'Margin'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label36: TLabel
        Left = 215
        Top = 31
        Width = 51
        Height = 16
        Caption = 'Harga 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object shp8: TShape
        Left = 430
        Top = 27
        Width = 2
        Height = 164
      end
      object Label37: TLabel
        Left = 295
        Top = 30
        Width = 44
        Height = 16
        Caption = 'Margin'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label38: TLabel
        Left = 345
        Top = 31
        Width = 51
        Height = 16
        Caption = 'Harga 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label39: TLabel
        Left = 436
        Top = 30
        Width = 44
        Height = 16
        Caption = 'Margin'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label40: TLabel
        Left = 486
        Top = 31
        Width = 51
        Height = 16
        Caption = 'Harga 3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object shp9: TShape
        Left = 573
        Top = 25
        Width = 2
        Height = 166
      end
      object Label41: TLabel
        Left = 593
        Top = 31
        Width = 89
        Height = 16
        Caption = 'Kode Barcode'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label45: TLabel
        Left = 624
        Top = 233
        Width = 39
        Height = 16
        Caption = 'Margin'
        Transparent = True
      end
      object Label46: TLabel
        Left = 624
        Top = 259
        Width = 39
        Height = 16
        Caption = 'Margin'
        Transparent = True
      end
      object Label47: TLabel
        Left = 624
        Top = 285
        Width = 39
        Height = 16
        Caption = 'Margin'
        Transparent = True
      end
      object Label48: TLabel
        Left = 667
        Top = 233
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label49: TLabel
        Left = 667
        Top = 259
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object Label50: TLabel
        Left = 667
        Top = 285
        Width = 5
        Height = 16
        Caption = ':'
        Transparent = True
      end
      object shp12: TShape
        Left = 776
        Top = 25
        Width = 2
        Height = 166
      end
      object shp1: TShape
        Left = 12
        Top = 25
        Width = 766
        Height = -2
      end
      object Label117: TLabel
        Left = 784
        Top = 28
        Width = 206
        Height = 16
        Caption = 'Pilih Satuan Untuk Program Promo :'
      end
      object cbSatuan1: TcxComboBox
        Tag = 1
        Left = 20
        Top = 59
        Properties.DropDownListStyle = lsFixedList
        TabOrder = 0
        Width = 89
      end
      object cbSatuan2: TcxComboBox
        Tag = 1
        Left = 20
        Top = 85
        Properties.DropDownListStyle = lsFixedList
        TabOrder = 8
        Width = 89
      end
      object cbSatuan3: TcxComboBox
        Tag = 1
        Left = 20
        Top = 111
        Properties.DropDownListStyle = lsFixedList
        TabOrder = 17
        Width = 89
      end
      object cbSatuan4: TcxComboBox
        Tag = 1
        Left = 20
        Top = 136
        Properties.DropDownListStyle = lsFixedList
        TabOrder = 26
        Width = 89
      end
      object cbSatuan5: TcxComboBox
        Tag = 1
        Left = 20
        Top = 162
        Properties.DropDownListStyle = lsFixedList
        TabOrder = 35
        Width = 89
      end
      object EIsi1: TcxTextEdit
        Tag = 1
        Left = 121
        Top = 59
        TabOrder = 1
        Width = 30
      end
      object EIsi2: TcxTextEdit
        Tag = 1
        Left = 121
        Top = 85
        TabOrder = 9
        Width = 30
      end
      object EIsi3: TcxTextEdit
        Tag = 1
        Left = 121
        Top = 111
        TabOrder = 18
        Width = 30
      end
      object Eisi4: TcxTextEdit
        Tag = 1
        Left = 121
        Top = 136
        TabOrder = 27
        Width = 30
      end
      object EIsi5: TcxTextEdit
        Tag = 1
        Left = 121
        Top = 162
        TabOrder = 36
        Width = 30
      end
      object EHarga1: TcxTextEdit
        Tag = 1
        Left = 214
        Top = 59
        Properties.OnChange = EHarga1PropertiesChange
        TabOrder = 2
        Width = 72
      end
      object EHarga2: TcxTextEdit
        Tag = 1
        Left = 214
        Top = 85
        Properties.OnChange = EHarga2PropertiesChange
        TabOrder = 11
        Width = 72
      end
      object EHarga3: TcxTextEdit
        Tag = 1
        Left = 214
        Top = 111
        Properties.OnChange = EHarga3PropertiesChange
        TabOrder = 20
        Width = 72
      end
      object EHarga4: TcxTextEdit
        Tag = 1
        Left = 215
        Top = 136
        Properties.OnChange = EHarga4PropertiesChange
        TabOrder = 29
        Width = 72
      end
      object EHarga5: TcxTextEdit
        Tag = 1
        Left = 214
        Top = 162
        Properties.OnChange = EHarga5PropertiesChange
        TabOrder = 38
        Width = 72
      end
      object Eqty1: TcxTextEdit
        Tag = 1
        Left = 98
        Top = 230
        TabOrder = 44
        Width = 38
      end
      object Eqty2: TcxTextEdit
        Tag = 1
        Left = 98
        Top = 257
        TabOrder = 47
        Width = 38
      end
      object Eqty3: TcxTextEdit
        Tag = 1
        Left = 98
        Top = 283
        TabOrder = 50
        Width = 38
      end
      object Eqtydan1: TcxTextEdit
        Tag = 1
        Left = 362
        Top = 231
        TabOrder = 45
        Width = 67
      end
      object Eqtydan2: TcxTextEdit
        Tag = 1
        Left = 362
        Top = 257
        TabOrder = 48
        Width = 67
      end
      object Eqtydan3: TcxTextEdit
        Tag = 1
        Left = 362
        Top = 283
        TabOrder = 51
        Width = 67
      end
      object Ehrg3: TcxTextEdit
        Tag = 1
        Left = 545
        Top = 283
        Properties.OnChange = Ehrg3PropertiesChange
        TabOrder = 52
        Width = 72
      end
      object Ehrg2: TcxTextEdit
        Tag = 1
        Left = 546
        Top = 257
        Properties.OnChange = Ehrg2PropertiesChange
        TabOrder = 49
        Width = 71
      end
      object Ehrg1: TcxTextEdit
        Tag = 1
        Left = 546
        Top = 231
        Properties.OnChange = Ehrg1PropertiesChange
        TabOrder = 46
        Width = 71
      end
      object Ehargapartai1: TcxTextEdit
        Tag = 1
        Left = 485
        Top = 59
        Properties.OnChange = Ehargapartai1PropertiesChange
        TabOrder = 6
        Width = 82
      end
      object Ehargapartai2: TcxTextEdit
        Tag = 1
        Left = 486
        Top = 85
        Properties.OnChange = Ehargapartai2PropertiesChange
        TabOrder = 15
        Width = 82
      end
      object Ehargapartai3: TcxTextEdit
        Tag = 1
        Left = 486
        Top = 111
        Properties.OnChange = Ehargapartai3PropertiesChange
        TabOrder = 24
        Width = 82
      end
      object Ehargapartai4: TcxTextEdit
        Tag = 1
        Left = 486
        Top = 136
        Properties.OnChange = Ehargapartai4PropertiesChange
        TabOrder = 33
        Width = 82
      end
      object Ehargapartai5: TcxTextEdit
        Tag = 1
        Left = 486
        Top = 162
        TabOrder = 42
        Width = 82
      end
      object E6: TcxTextEdit
        Tag = 1
        Left = 163
        Top = 59
        TabOrder = 53
        Width = 46
      end
      object E7: TcxTextEdit
        Tag = 1
        Left = 163
        Top = 85
        TabOrder = 10
        Width = 46
      end
      object E8: TcxTextEdit
        Tag = 1
        Left = 163
        Top = 111
        TabOrder = 19
        Width = 46
      end
      object E9: TcxTextEdit
        Tag = 1
        Left = 163
        Top = 136
        TabOrder = 28
        Width = 46
      end
      object E10: TcxTextEdit
        Tag = 1
        Left = 163
        Top = 162
        TabOrder = 37
        Width = 46
      end
      object E11: TcxTextEdit
        Tag = 1
        Left = 295
        Top = 59
        TabOrder = 3
        Width = 46
      end
      object Ehargagrosir1: TcxTextEdit
        Tag = 1
        Left = 347
        Top = 59
        Properties.OnChange = Ehargagrosir1PropertiesChange
        TabOrder = 4
        Width = 81
      end
      object Ehargagrosir2: TcxTextEdit
        Tag = 1
        Left = 346
        Top = 85
        Properties.OnChange = Ehargagrosir2PropertiesChange
        TabOrder = 13
        Width = 81
      end
      object E14: TcxTextEdit
        Tag = 1
        Left = 295
        Top = 85
        TabOrder = 12
        Width = 46
      end
      object E15: TcxTextEdit
        Tag = 1
        Left = 295
        Top = 111
        TabOrder = 21
        Width = 46
      end
      object Ehargagrosir3: TcxTextEdit
        Tag = 1
        Left = 346
        Top = 111
        Properties.OnChange = Ehargagrosir3PropertiesChange
        TabOrder = 22
        Width = 81
      end
      object Ehargagrosir4: TcxTextEdit
        Tag = 1
        Left = 346
        Top = 136
        Properties.OnChange = Ehargagrosir4PropertiesChange
        TabOrder = 31
        Width = 81
      end
      object E18: TcxTextEdit
        Tag = 1
        Left = 295
        Top = 136
        TabOrder = 30
        Width = 46
      end
      object E19: TcxTextEdit
        Tag = 1
        Left = 295
        Top = 162
        TabOrder = 39
        Width = 46
      end
      object Ehargagrosir5: TcxTextEdit
        Tag = 1
        Left = 346
        Top = 162
        Properties.OnChange = Ehargagrosir5PropertiesChange
        TabOrder = 40
        Width = 81
      end
      object E21: TcxTextEdit
        Tag = 1
        Left = 436
        Top = 59
        TabOrder = 5
        Width = 46
      end
      object E22: TcxTextEdit
        Tag = 1
        Left = 436
        Top = 85
        TabOrder = 14
        Width = 46
      end
      object E23: TcxTextEdit
        Tag = 1
        Left = 436
        Top = 111
        TabOrder = 23
        Width = 46
      end
      object E24: TcxTextEdit
        Tag = 1
        Left = 436
        Top = 136
        TabOrder = 32
        Width = 46
      end
      object E25: TcxTextEdit
        Tag = 1
        Left = 436
        Top = 162
        TabOrder = 41
        Width = 46
      end
      object Ekodebarcode1: TcxTextEdit
        Tag = 1
        Left = 581
        Top = 59
        TabOrder = 7
        Width = 120
      end
      object Ekodebarcode2: TcxTextEdit
        Tag = 1
        Left = 581
        Top = 85
        TabOrder = 16
        Width = 120
      end
      object Ekodebarcode3: TcxTextEdit
        Tag = 1
        Left = 581
        Top = 111
        TabOrder = 25
        Width = 120
      end
      object Ekodebarcode4: TcxTextEdit
        Tag = 1
        Left = 581
        Top = 136
        TabOrder = 34
        Width = 120
      end
      object Ekodebarcode5: TcxTextEdit
        Tag = 1
        Left = 581
        Top = 162
        TabOrder = 43
        Width = 120
      end
      object EM1: TcxTextEdit
        Tag = 1
        Left = 678
        Top = 230
        Enabled = False
        StyleDisabled.BorderColor = clGray
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 54
        Width = 55
      end
      object EM2: TcxTextEdit
        Tag = 1
        Left = 678
        Top = 256
        Enabled = False
        StyleDisabled.BorderColor = clGray
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 55
        Width = 55
      end
      object EM3: TcxTextEdit
        Tag = 1
        Left = 678
        Top = 283
        Enabled = False
        StyleDisabled.BorderColor = clGray
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 56
        Width = 55
      end
      object btnH1: TButton
        Left = 722
        Top = 57
        Width = 48
        Height = 25
        Caption = 'Hapus'
        TabOrder = 57
        OnClick = btnH1Click
      end
      object btnH2: TButton
        Left = 722
        Top = 85
        Width = 48
        Height = 25
        Caption = 'Hapus'
        TabOrder = 58
        OnClick = btnH2Click
      end
      object btnH3: TButton
        Left = 722
        Top = 111
        Width = 48
        Height = 25
        Caption = 'Hapus'
        TabOrder = 59
        OnClick = btnH3Click
      end
      object btnH4: TButton
        Left = 722
        Top = 136
        Width = 48
        Height = 25
        Caption = 'Hapus'
        TabOrder = 60
        OnClick = btnH4Click
      end
      object btnH5: TButton
        Left = 722
        Top = 162
        Width = 48
        Height = 25
        Caption = 'Hapus'
        TabOrder = 61
        OnClick = btnH5Click
      end
      object cbSatuanQty1: TcxComboBox
        Tag = 1
        Left = 188
        Top = 230
        Properties.DropDownListStyle = lsFixedList
        Properties.OnChange = cbSatuanQty1PropertiesChange
        TabOrder = 62
        Width = 89
      end
      object cbSatuanQty2: TcxComboBox
        Tag = 1
        Left = 189
        Top = 258
        Properties.DropDownListStyle = lsFixedList
        Properties.OnChange = cbSatuanQty2PropertiesChange
        TabOrder = 63
        Width = 89
      end
      object cbSatuanQty3: TcxComboBox
        Tag = 1
        Left = 189
        Top = 284
        Properties.DropDownListStyle = lsFixedList
        Properties.OnChange = cbSatuanQty3PropertiesChange
        TabOrder = 64
        Width = 89
      end
      object GroupBox1: TGroupBox
        Left = 784
        Top = 53
        Width = 377
        Height = 88
        Caption = 'Harga Promo Level 1'
        Color = 5987327
        ParentBackground = False
        ParentColor = False
        TabOrder = 65
        object Label99: TLabel
          Left = 8
          Top = 24
          Width = 52
          Height = 16
          Caption = 'Tgl Mulai'
        end
        object Label100: TLabel
          Left = 180
          Top = 23
          Width = 63
          Height = 16
          Caption = 'Tgl Selesai'
        end
        object Label101: TLabel
          Left = 8
          Top = 54
          Width = 75
          Height = 16
          Caption = 'Harga Promo'
          Transparent = True
        end
        object Label102: TLabel
          Left = 104
          Top = 54
          Width = 5
          Height = 16
          Caption = ':'
          Transparent = True
        end
        object Label103: TLabel
          Left = 240
          Top = 54
          Width = 65
          Height = 16
          Caption = 'Margin (%)'
          Transparent = True
        end
        object Label104: TLabel
          Left = 314
          Top = 53
          Width = 5
          Height = 16
          Caption = ':'
          Transparent = True
        end
        object dtPromoLevel11: TDateTimePicker
          Left = 66
          Top = 20
          Width = 108
          Height = 24
          Date = 44317.612846527780000000
          Time = 44317.612846527780000000
          TabOrder = 0
        end
        object dtPromoLevel12: TDateTimePicker
          Left = 250
          Top = 19
          Width = 116
          Height = 24
          Date = 44317.612846527780000000
          Time = 44317.612846527780000000
          TabOrder = 1
        end
        object EHargaPromoLevel1: TcxTextEdit
          Tag = 1
          Left = 120
          Top = 50
          Hint = 'Max Piutang'
          Properties.OnChange = EHargaPromoLevel1PropertiesChange
          TabOrder = 2
          OnKeyUp = EHargaPromoKeyUp
          Width = 113
        end
        object EMarginPromoLevel1: TcxTextEdit
          Tag = 1
          Left = 327
          Top = 50
          Hint = 'Max Piutang'
          Properties.ReadOnly = True
          StyleDisabled.BorderColor = clSilver
          StyleDisabled.Color = clWhite
          StyleDisabled.TextColor = clBlack
          TabOrder = 3
          OnKeyUp = EMarginPartaiKeyUp
          Width = 41
        end
      end
      object GroupBox2: TGroupBox
        Left = 784
        Top = 147
        Width = 377
        Height = 84
        Caption = 'Harga Promo Level 2'
        Color = 57088
        ParentBackground = False
        ParentColor = False
        TabOrder = 66
        object Label105: TLabel
          Left = 8
          Top = 28
          Width = 52
          Height = 16
          Caption = 'Tgl Mulai'
        end
        object Label106: TLabel
          Left = 180
          Top = 27
          Width = 63
          Height = 16
          Caption = 'Tgl Selesai'
        end
        object Label107: TLabel
          Left = 8
          Top = 57
          Width = 75
          Height = 16
          Caption = 'Harga Promo'
          Transparent = True
        end
        object Label108: TLabel
          Left = 104
          Top = 57
          Width = 5
          Height = 16
          Caption = ':'
          Transparent = True
        end
        object Label109: TLabel
          Left = 240
          Top = 57
          Width = 65
          Height = 16
          Caption = 'Margin (%)'
          Transparent = True
        end
        object Label110: TLabel
          Left = 314
          Top = 56
          Width = 5
          Height = 16
          Caption = ':'
          Transparent = True
        end
        object dtPromoLevel21: TDateTimePicker
          Left = 66
          Top = 23
          Width = 108
          Height = 24
          Date = 44317.612846527780000000
          Time = 44317.612846527780000000
          TabOrder = 0
        end
        object dtPromoLevel22: TDateTimePicker
          Left = 250
          Top = 23
          Width = 116
          Height = 24
          Date = 44317.612846527780000000
          Time = 44317.612846527780000000
          TabOrder = 1
        end
        object EHargaPromoLevel2: TcxTextEdit
          Tag = 1
          Left = 121
          Top = 53
          Hint = 'Max Piutang'
          Properties.OnChange = EHargaPromoLevel2PropertiesChange
          TabOrder = 2
          OnKeyUp = EHargaPromo2KeyUp
          Width = 113
        end
        object EMarginPromoLevel2: TcxTextEdit
          Tag = 1
          Left = 327
          Top = 53
          Hint = 'Max Piutang'
          Properties.ReadOnly = True
          StyleDisabled.BorderColor = clSilver
          StyleDisabled.Color = clWhite
          StyleDisabled.TextColor = clBlack
          TabOrder = 3
          OnKeyUp = EMarginPartaiKeyUp
          Width = 41
        end
      end
      object GroupBox3: TGroupBox
        Left = 784
        Top = 238
        Width = 377
        Height = 91
        Caption = 'Harga Promo Level 3'
        Color = 16744576
        ParentBackground = False
        ParentColor = False
        TabOrder = 67
        object Label111: TLabel
          Left = 8
          Top = 31
          Width = 52
          Height = 16
          Caption = 'Tgl Mulai'
        end
        object Label112: TLabel
          Left = 180
          Top = 34
          Width = 63
          Height = 16
          Caption = 'Tgl Selesai'
        end
        object Label113: TLabel
          Left = 8
          Top = 63
          Width = 75
          Height = 16
          Caption = 'Harga Promo'
          Transparent = True
        end
        object Label114: TLabel
          Left = 104
          Top = 63
          Width = 5
          Height = 16
          Caption = ':'
          Transparent = True
        end
        object Label115: TLabel
          Left = 240
          Top = 60
          Width = 65
          Height = 16
          Caption = 'Margin (%)'
          Transparent = True
        end
        object Label116: TLabel
          Left = 314
          Top = 59
          Width = 5
          Height = 16
          Caption = ':'
          Transparent = True
        end
        object dtPromoLevel31: TDateTimePicker
          Left = 66
          Top = 26
          Width = 108
          Height = 24
          Date = 44317.612846527780000000
          Time = 44317.612846527780000000
          TabOrder = 0
        end
        object dtPromoLevel32: TDateTimePicker
          Left = 250
          Top = 26
          Width = 116
          Height = 24
          Date = 44317.612846527780000000
          Time = 44317.612846527780000000
          TabOrder = 1
        end
        object EHargaPromoLevel3: TcxTextEdit
          Tag = 1
          Left = 120
          Top = 56
          Hint = 'Max Piutang'
          Properties.OnChange = EHargaPromoLevel3PropertiesChange
          TabOrder = 2
          OnKeyUp = EHargaPromo3KeyUp
          Width = 113
        end
        object EMarginPromoLevel3: TcxTextEdit
          Tag = 1
          Left = 327
          Top = 56
          Hint = 'Max Piutang'
          Properties.ReadOnly = True
          StyleDisabled.BorderColor = clSilver
          StyleDisabled.Color = clWhite
          StyleDisabled.TextColor = clBlack
          TabOrder = 3
          OnKeyUp = EMarginPartaiKeyUp
          Width = 41
        end
      end
      object cbPromo: TcxComboBox
        Tag = 1
        Left = 996
        Top = 24
        Properties.DropDownListStyle = lsFixedList
        Properties.OnChange = cbPromoPropertiesChange
        TabOrder = 68
        Width = 164
      end
    end
  end
end
