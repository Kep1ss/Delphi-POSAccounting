object FdataHutang: TFdataHutang
  Left = 0
  Top = 0
  Caption = 'Daftar Hutang'
  ClientHeight = 450
  ClientWidth = 932
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object G1: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    PanelStyle.Active = True
    TabOrder = 0
    Height = 70
    Width = 926
    object Label1: TLabel
      Left = 8
      Top = 40
      Width = 46
      Height = 13
      Caption = 'Periode : '
      Transparent = True
    end
    object Label2: TLabel
      Left = 168
      Top = 40
      Width = 17
      Height = 13
      Caption = 'S/D'
      Transparent = True
    end
    object Label3: TLabel
      Left = 320
      Top = 40
      Width = 57
      Height = 13
      Caption = 'Pencarian : '
      Transparent = True
    end
    object Dt1: TcxDateEdit
      Left = 59
      Top = 37
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnCloseUp = Dt1PropertiesCloseUp
      TabOrder = 0
      Width = 106
    end
    object dt2: TcxDateEdit
      Left = 192
      Top = 37
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnCloseUp = Dt1PropertiesCloseUp
      TabOrder = 1
      Width = 121
    end
    object EPencarian: TcxTextEdit
      Left = 381
      Top = 37
      TabOrder = 2
      OnKeyDown = EPencarianKeyDown
      Width = 188
    end
    object c1: TCheckBox
      Left = 574
      Top = 39
      Width = 211
      Height = 17
      Caption = 'Tampilkan Hutang Belum Lunas'
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = c1Click
    end
    object CheckBox1: TCheckBox
      Left = 750
      Top = 39
      Width = 155
      Height = 17
      Caption = 'Hutang Jatuh Tempo'
      TabOrder = 4
      OnClick = CheckBox1Click
    end
    object cxlbl1: TcxLabel
      Left = 3
      Top = 3
      Align = alTop
      AutoSize = False
      Caption = 'Data Hutang'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = 16744448
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = True
      Style.LookAndFeel.NativeStyle = True
      Style.Shadow = False
      Style.TextColor = 16751157
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      Properties.LabelEffect = cxleExtrude
      Properties.LabelStyle = cxlsRaised
      Properties.ShadowedColor = clHighlight
      Properties.WordWrap = True
      Height = 30
      Width = 920
    end
  end
  object cxgrd1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 79
    Width = 926
    Height = 321
    Align = alClient
    TabOrder = 1
    object cxgGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dtrx.DreturJual
      DataController.DetailKeyFieldNames = 'nobukti'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      DataController.OnDetailExpanding = cxgGrid1DBTableView1DataControllerDetailExpanding
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxgGrid1DBTableView1nobukti: TcxGridDBColumn
        Caption = 'NO BUKTI'
        DataBinding.FieldName = 'nobukti'
        Width = 100
      end
      object cxgGrid1DBTableView1tgl: TcxGridDBColumn
        Caption = 'TGL'
        DataBinding.FieldName = 'tgl'
      end
      object cxgGrid1DBTableView1nobuktijual: TcxGridDBColumn
        Caption = 'NOBUKTI JUAL'
        DataBinding.FieldName = 'nobuktijual'
      end
      object cxgGrid1DBTableView1namapelanggan: TcxGridDBColumn
        Caption = 'PELANGGAN'
        DataBinding.FieldName = 'namapelanggan'
      end
      object cxgGrid1DBTableView1total: TcxGridDBColumn
        Caption = 'TOTAL'
        DataBinding.FieldName = 'total'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
      end
      object cxgGrid1DBTableView1keterangan: TcxGridDBColumn
        Caption = 'KETERANGAN'
        DataBinding.FieldName = 'keterangan'
        Width = 200
      end
    end
    object cxgrd1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dtrx.DDetailReturJual
      DataController.DetailKeyFieldNames = 'nobukti'
      DataController.MasterKeyFieldNames = 'nobukti'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxgrd1DBTableView1kodebarcode: TcxGridDBColumn
        Caption = 'KODE BARANG'
        DataBinding.FieldName = 'kodebarcode'
      end
      object cxgrd1DBTableView1namabarang: TcxGridDBColumn
        Caption = 'NAMA BARANG'
        DataBinding.FieldName = 'namabarang'
      end
      object cxgrd1DBTableView1satuan: TcxGridDBColumn
        Caption = 'SATUAN'
        DataBinding.FieldName = 'satuan'
      end
      object cxgrd1DBTableView1harga: TcxGridDBColumn
        Caption = 'HARGA'
        DataBinding.FieldName = 'harga'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
      end
      object cxgrd1DBTableView1jumlah: TcxGridDBColumn
        Caption = 'JUMLAH'
        DataBinding.FieldName = 'jumlah'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
      end
      object cxgrd1DBTableView1subtotal: TcxGridDBColumn
        Caption = 'SUBTOTAL'
        DataBinding.FieldName = 'subtotal'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
      end
    end
    object cxgrd1DBTableView2: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dtrx.Dhutang
      DataController.DetailKeyFieldNames = 'nobukti'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,###.00'
          Kind = skSum
          Column = cxgrd1DBTableView2kekurangan
        end
        item
          Format = '#,###.00'
          Kind = skSum
          Column = cxgrd1DBTableView2dibayar
        end
        item
          Format = '#,###.00'
          Kind = skSum
          Column = cxgrd1DBTableView2hutang
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxgrd1DBTableView2nobukti: TcxGridDBColumn
        Caption = 'NO BUKTI'
        DataBinding.FieldName = 'nobukti'
      end
      object cxgrd1DBTableView2namasupplier: TcxGridDBColumn
        Caption = 'SUPPLIER'
        DataBinding.FieldName = 'namasupplier'
      end
      object cxgrd1DBTableView2tglinput: TcxGridDBColumn
        Caption = 'TGL'
        DataBinding.FieldName = 'tglinput'
      end
      object cxgrd1DBTableView2tgltempo: TcxGridDBColumn
        Caption = 'Jatuh Tempo'
        DataBinding.FieldName = 'tgltempo'
      end
      object cxgrd1DBTableView2hutang: TcxGridDBColumn
        Caption = 'HUTANG'
        DataBinding.FieldName = 'hutang'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###.00'
      end
      object cxgrd1DBTableView2dibayar: TcxGridDBColumn
        Caption = 'DIBAYAR'
        DataBinding.FieldName = 'dibayar'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###.00'
      end
      object cxgrd1DBTableView2kekurangan: TcxGridDBColumn
        Caption = 'KEKURANGAN'
        DataBinding.FieldName = 'kekurangan'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###.00'
      end
    end
    object cxgrd1DBTableView3: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dtrx.DDetailBeli
      DataController.DetailKeyFieldNames = 'nobukti'
      DataController.MasterKeyFieldNames = 'nobukti'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxgrd1DBTableView3kodebarang: TcxGridDBColumn
        Caption = 'Kode Barang'
        DataBinding.FieldName = 'kodebarang'
        Width = 150
      end
      object cxgrd1DBTableView3namabarang: TcxGridDBColumn
        Caption = 'Nama Barang'
        DataBinding.FieldName = 'namabarang'
        Width = 300
      end
      object cxgrd1DBTableView3satuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
        Width = 100
      end
      object cxgrd1DBTableView3harga: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,###'
      end
      object cxgrd1DBTableView3jumlah: TcxGridDBColumn
        Caption = 'Jumlah'
        DataBinding.FieldName = 'jumlah'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,###'
      end
      object cxgrd1DBTableView3diskonpersen: TcxGridDBColumn
        Caption = 'Diskon'
        DataBinding.FieldName = 'diskonpersen'
      end
      object cxgrd1DBTableView3diskon2: TcxGridDBColumn
        Caption = 'Diskon2'
        DataBinding.FieldName = 'diskon2'
      end
      object cxgrd1DBTableView3diskon3: TcxGridDBColumn
        Caption = 'Diskon3'
        DataBinding.FieldName = 'diskon3'
      end
      object cxgrd1DBTableView3subtotal: TcxGridDBColumn
        Caption = 'Subtotal'
        DataBinding.FieldName = 'subtotal'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,###'
      end
    end
    object cxgrd1Level1: TcxGridLevel
      GridView = cxgrd1DBTableView2
    end
  end
  object G2: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 406
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      926
      41)
    Height = 41
    Width = 926
    object btnPrint: TcxButton
      Left = 3
      Top = 12
      Width = 126
      Height = 26
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Cetak [ F4 ]'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E0000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000080000000C0000
        000D0000000D0000000D0000000D0000000D0000000D0000000D0000000E0000
        000E0000000E0000000E0000000E0000000D000000097B5A50BFAB7D6FFFAA7D
        6FFFAA7C6FFFAA7C6EFFAA7C6DFFA97B6DFFA97B6DFFA87B6DFFA97A6CFFA97A
        6CFFA8796CFFA87A6BFFA7796BFFA8786AFF78564CC0AC8072FFF9F2EEFFF9F3
        EEFFF9F1EEFFF9F1EEFFCFB2A8FFF9F1EEFFF8F1EEFFF8F2EEFFF8F1EDFFCEB0
        A6FFF9F1EDFFF9F2EDFFF9F1EDFFF9F1EEFFA87A6CFFAE8274FFF9F3F0FFF7EF
        EAFFF7EFEAFFF8F2EEFFD2B7AFFFF9F2EFFFF9F2EFFFF9F3EFFFF9F3EFFFD1B7
        AEFFF8F3EFFFF8F3EFFFF9F3EEFFFAF5F2FFBE9B91FFAF8375FFD3B8B0FFC5A3
        99FFC5A298FFD3B9B1FF2B8758FF2B8758FF2A8658FF2A8657FF2A8458FF2A84
        57FF298456FF298357FF298254FF298256FF298254FFB18578FFFAF4F0FFF8F0
        EBFFF7F0EBFFF9F3F0FF2C895BFF74DEC1FF74DEC1FF74DEC1FF74DEC0FF3597
        6AFF74DEC0FF74DEC0FF74DEC0FF74DEC0FF298455FFB28779FFF9F5F1FFF8F0
        ECFFF8F1EBFFFAF4F1FF2E8B5DFF76DFC1FF5FD6AFFF5DD6AEFF5DD5ADFF369A
        6CFF5DD5ACFF5DD5ACFF5CD5ADFF74DEC1FF2B8758FFB4887CFFD8C0B8FFC8A7
        9DFFC8A79DFFD5BCB4FF2E8E5EFF389D70FF389D70FF389C6FFF389C6FFF389B
        6EFF379B6EFF389B6DFF379A6DFF379A6DFF2C885AFFB48A7EFFFAF5F3FFF8F2
        EDFFF8F1EDFFFAF4F1FF2F9062FF77E0C3FF63D8B1FF62D7B1FF62D7B2FF399D
        70FF62D7B1FF62D7B0FF61D7B1FF76DFC2FF2E8A5CFFB68D7FFFFAF6F3FFF9F2
        EDFFF9F2EDFFFAF4F1FF309264FF78E0C4FF78E0C4FF78E0C4FF78E0C4FF3A9F
        73FF78DFC4FF78DFC3FF77E0C3FF78DFC3FF2E8D5EFFB78E81FFDDC6BFFFCBAB
        A2FFCBACA2FFD7C0B8FF329566FF339366FF329265FF309265FF329264FF3291
        64FF309163FF2F9062FF2F9062FF2F8F60FF2E8F60FFB88F82FFFAF7F4FFF8F3
        EFFFF8F2EEFFF9F4F1FFD8C0B9FFFAF6F2FFFAF5F3FFFAF5F2FFFAF5F2FFD7C0
        B8FFFAF6F2FFFAF5F2FFFAF5F2FFFCF8F6FFC7A79DFFB99085FFFBF8F5FFFAF8
        F5FFFBF8F4FFFBF6F4FFDFCAC3FFFBF6F5FFFBF7F4FFFBF7F4FFFBF6F4FFDDC8
        C1FFFAF6F4FFFBF7F5FFFBF6F5FFFBF7F5FFB68C80FF8A6C63C0BA9185FFBA91
        85FFBA9185FFBA9084FFB99185FFB99084FFB99084FFB99084FFB99083FFB890
        83FFB98F83FFB78F83FFB88E82FFB78E82FF876960C100000003000000040000
        0005000000050000000500000005000000050000000500000005000000050000
        00050000000500000006000000060000000500000004}
      TabOrder = 0
      OnClick = btnPrintClick
    end
    object btnTutup: TcxButton
      Left = 135
      Top = 12
      Width = 91
      Height = 26
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Tutup [ ESC ]'
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
  end
end
