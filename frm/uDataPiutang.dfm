object FdataPiutang: TFdataPiutang
  Left = 0
  Top = 0
  Caption = 'Daftar Piutang'
  ClientHeight = 450
  ClientWidth = 944
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
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
    Width = 938
    object Label1: TLabel
      Left = 8
      Top = 46
      Width = 46
      Height = 13
      Caption = 'Periode : '
      Transparent = True
    end
    object Label2: TLabel
      Left = 168
      Top = 46
      Width = 17
      Height = 13
      Caption = 'S/D'
      Transparent = True
    end
    object Label3: TLabel
      Left = 320
      Top = 46
      Width = 57
      Height = 13
      Caption = 'Pencarian : '
      Transparent = True
    end
    object Dt1: TcxDateEdit
      Left = 59
      Top = 43
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnCloseUp = Dt1PropertiesCloseUp
      TabOrder = 0
      Width = 106
    end
    object dt2: TcxDateEdit
      Left = 192
      Top = 43
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnCloseUp = Dt1PropertiesCloseUp
      TabOrder = 1
      Width = 121
    end
    object EPencarian: TcxTextEdit
      Left = 381
      Top = 43
      TabOrder = 2
      OnKeyDown = EPencarianKeyDown
      Width = 220
    end
    object c1: TCheckBox
      Left = 606
      Top = 43
      Width = 211
      Height = 17
      Caption = 'Tampilkan Piutang Belum Lunas'
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = c1Click
    end
    object cxlbl1: TcxLabel
      Left = 3
      Top = 3
      Align = alTop
      AutoSize = False
      Caption = 'DATA PIUTANG'
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
      Width = 932
    end
  end
  object cxgrd1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 79
    Width = 938
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
      DataController.DataSource = dtrx.Dpiutang
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,###.00'
          Kind = skSum
          Column = cxgrd1DBTableView2piutang
        end
        item
          Format = '#,###.00'
          Kind = skSum
          Column = cxgrd1DBTableView2dibayar
        end
        item
          Format = '#,###.00'
          Kind = skSum
          Column = cxgrd1DBTableView2kekurangan
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxgrd1DBTableView2fakturjual: TcxGridDBColumn
        Caption = 'FAKTUR JUAL'
        DataBinding.FieldName = 'fakturjual'
        Width = 120
      end
      object cxgrd1DBTableView2namapelanggan: TcxGridDBColumn
        Caption = 'PELANGGAN'
        DataBinding.FieldName = 'namapelanggan'
        Width = 200
      end
      object cxgrd1DBTableView2tglinput: TcxGridDBColumn
        Caption = 'TGL PIUTANG'
        DataBinding.FieldName = 'tglinput'
      end
      object cxgrd1DBTableView2tgltempo: TcxGridDBColumn
        Caption = 'TGL TEMPO'
        DataBinding.FieldName = 'tgltempo'
      end
      object cxgrd1DBTableView2piutang: TcxGridDBColumn
        Caption = 'PIUTANG'
        DataBinding.FieldName = 'piutang'
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
        Caption = 'KEKUARANGAN'
        DataBinding.FieldName = 'kekurangan'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###.00'
      end
      object cxgrd1DBTableView2lunas: TcxGridDBColumn
        Caption = 'LUNAS'
        DataBinding.FieldName = 'lunas'
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
      938
      41)
    Height = 41
    Width = 938
    object btnPrint: TcxButton
      Left = 14
      Top = 12
      Width = 91
      Height = 26
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Cetak [ F4 ]'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E0000000000000000000000000000000000000000
        0000000000030000000C00000012000000140000001400000015000000150000
        00140000000D0000000300000000000000000000000000000000000000000000
        000000000009896256C2BD8A78FFBE8A78FFBD8A78FFBD8978FFBD8978FFBE89
        78FF876356C30000000B000000000000000000000000000000030000000E0000
        001500000021C08D7CFFF6EEE9FFF5EDE9FFF5EDE9FFF5ECE8FFF4ECE8FFF5EC
        E7FFBF8D7BFF00000026000000180000000F000000040000000C7B5042C5A76E
        5BFF9F6755FFC2917FFFF7F0ECFFE2B47DFFE2B37AFFE1B077FFE0AE72FFF6EE
        EAFFC2907FFF845545FF895847FF613E32C70000000E00000011BB7E6BFFECD9
        CCFFE3CEBEFFC59483FFF9F2F0FFE4B984FFE3B781FFE3B47CFFE0B176FFF7F0
        EDFFC59483FFE0CBBCFFEBD8CBFFB67763FF0000001400000010BE8571FFF1E5
        DAFFECDBD0FF7A4835FF7A4835FF7A4835FF7A4835FF7A4835FF7A4835FF7A48
        35FF7A4835FFEBDBCFFFF1E2D8FFB97C69FF000000130000000EC28B78FFF5EE
        E7FFF2E7DDFFF2E7DEFFF3E7DEFFF2E5DEFFF3E5DEFFF2E7DDFFF2E7DDFFF2E7
        DEFFF2E7DDFFF2E5DEFFF5EDE6FFBC826EFF000000120000000CC7937FFFFAF4
        F1FFCDBEB8FF6F5448FF614337FF614035FF5F3F34FF5E3F33FF5D3D32FF5D3D
        34FF6A4C44FFCABCB6FFF9F5F1FFC18875FF000000100000000ACC9986FFFDFA
        FAFF7D6054FF745043FF744F43FF744E43FF734E43FF734E42FF724D42FF724C
        41FF724C40FF73584DFFFDFAFAFFC58F7CFF0000000E00000008CF9F8DFFFFFF
        FFFF7A5A4CFF8E695AFFF9F4F1FFF0E6E0FFF0E5DFFFEFE5DEFFEFE5DEFFF6EF
        EBFF866253FF704F43FFFFFFFFFFCA9683FF0000000B00000005BE9584E9F5EC
        E8FF866656FF977262FFFAF6F4FFF2E8E3FFF1E8E1FFF1E7E2FFF1E7E1FFF8F2
        EEFF8E6A5BFF7A5B4CFFF5EAE6FFBA8E7DEA000000080000000234292545A783
        75CC947262FFA07B6AFFFCF9F8FFF3EBE6FFF4EAE5FFF2EAE5FFF3EAE3FFF9F5
        F3FF977263FF876658FFA68072CE342823480000000300000000000000010000
        00030000000AC89B89FFFDFBFAFFF5EDE8FFF4EDE8FFF5EDE7FFF5ECE7FFFBF7
        F6FFC59685FF0000001100000004000000020000000000000000000000000000
        000000000005CA9E8DFFFEFCFCFFF7F0ECFFF6EFEBFFF7EFEBFFF5EFEAFFFCFA
        F8FFC89A89FF0000000900000000000000000000000000000000000000000000
        000000000003CDA291FFFEFEFDFFFEFDFDFFFEFDFCFFFEFCFCFFFEFCFBFFFDFB
        FAFFCB9F8DFF0000000700000000000000000000000000000000000000000000
        0000000000019A796DBFCFA493FFCEA493FFCEA493FFCEA492FFCDA391FFCDA3
        91FF98786BC100000004000000000000000000000000}
      TabOrder = 0
      OnClick = btnPrintClick
    end
    object btnTutup: TcxButton
      Left = 111
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
