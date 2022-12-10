object FreturPenjualan: TFreturPenjualan
  Left = 0
  Top = 0
  Caption = 'Retur Penjualan'
  ClientHeight = 433
  ClientWidth = 773
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object G1: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    TabOrder = 0
    Height = 102
    Width = 767
    object Label1: TLabel
      Left = 16
      Top = 13
      Width = 46
      Height = 16
      Caption = 'No Bukti'
      Transparent = True
    end
    object Label2: TLabel
      Left = 16
      Top = 40
      Width = 46
      Height = 16
      Caption = 'Tanggal'
      Transparent = True
    end
    object Label3: TLabel
      Left = 80
      Top = 13
      Width = 5
      Height = 16
      Caption = ':'
      Transparent = True
    end
    object Label4: TLabel
      Left = 80
      Top = 40
      Width = 5
      Height = 16
      Caption = ':'
      Transparent = True
    end
    object Label5: TLabel
      Left = 232
      Top = 13
      Width = 106
      Height = 16
      Caption = 'No Bukti Penjualan'
      Transparent = True
    end
    object Label6: TLabel
      Left = 232
      Top = 40
      Width = 59
      Height = 16
      Caption = 'Pelanggan'
      Transparent = True
    end
    object Label7: TLabel
      Left = 352
      Top = 13
      Width = 5
      Height = 16
      Caption = ':'
    end
    object Label8: TLabel
      Left = 352
      Top = 40
      Width = 5
      Height = 16
      Caption = ':'
    end
    object Label9: TLabel
      Left = 16
      Top = 69
      Width = 18
      Height = 16
      Caption = 'Ket'
      Transparent = True
    end
    object Label10: TLabel
      Left = 80
      Top = 69
      Width = 5
      Height = 16
      Caption = ':'
      Transparent = True
    end
    object ENobukti: TcxTextEdit
      Left = 96
      Top = 10
      TabOrder = 0
      Width = 121
    end
    object cxDateEdit1: TcxDateEdit
      Left = 96
      Top = 37
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 121
    end
    object Enobuktijual: TcxTextEdit
      Left = 363
      Top = 10
      TabOrder = 2
      Width = 121
    end
    object Epelanggan: TcxTextEdit
      Left = 363
      Top = 37
      TabOrder = 3
      Width = 206
    end
    object Eketerangan: TcxTextEdit
      Tag = 1
      Left = 96
      Top = 66
      TabOrder = 4
      Width = 473
    end
  end
  object G2: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 111
    Align = alLeft
    PanelStyle.Active = True
    TabOrder = 1
    Height = 275
    Width = 293
    object dxBevel1: TdxBevel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 283
      Height = 64
      Align = alTop
      ExplicitWidth = 247
    end
    object Label11: TLabel
      Left = 8
      Top = 16
      Width = 90
      Height = 16
      Caption = 'Tgl Transaksi : '
      Transparent = True
    end
    object Label12: TLabel
      Left = 8
      Top = 43
      Width = 23
      Height = 16
      Caption = 'Cari'
      Transparent = True
    end
    object cxgrd1: TcxGrid
      AlignWithMargins = True
      Left = 5
      Top = 75
      Width = 283
      Height = 195
      Align = alClient
      TabOrder = 0
      object cxgGrid1DBTableView1: TcxGridDBTableView
        OnDblClick = cxgGrid1DBTableView1DblClick
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dtrx.Dpenjualan
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object cxgGrid1DBTableView1fakturjual: TcxGridDBColumn
          Caption = 'FAKTUR JUAL'
          DataBinding.FieldName = 'fakturjual'
        end
        object cxgGrid1DBTableView1namapelanggan: TcxGridDBColumn
          Caption = 'PELANGGAN'
          DataBinding.FieldName = 'namapelanggan'
        end
      end
      object cxgGrid1Level1: TcxGridLevel
        GridView = cxgGrid1DBTableView1
      end
    end
    object cxDateEdit2: TcxDateEdit
      Left = 104
      Top = 10
      Properties.ShowTime = False
      Properties.OnChange = cxDateEdit2PropertiesChange
      TabOrder = 1
      Width = 146
    end
    object EPencarian: TcxTextEdit
      Tag = 1
      Left = 40
      Top = 40
      TabOrder = 2
      OnKeyUp = EPencarianKeyUp
      Width = 239
    end
  end
  object cxgrd2: TcxGrid
    AlignWithMargins = True
    Left = 302
    Top = 111
    Width = 468
    Height = 275
    Align = alClient
    TabOrder = 2
    object cxgrd2TableView1: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      OnEditing = cxgrd2TableView1Editing
      OnEditKeyUp = cxgrd2TableView1EditKeyUp
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.FocusRect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.GroupByBox = False
      object CkodeBarcode: TcxGridColumn
        Caption = 'Kode Barcode'
        Width = 120
      end
      object cNamaBarang: TcxGridColumn
        Caption = 'Nama Barang'
        Width = 200
      end
      object CSatuan: TcxGridColumn
        Caption = 'Satuan'
        Visible = False
        Width = 100
      end
      object cHarga: TcxGridColumn
        Caption = 'Harga'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
        Width = 80
      end
      object cDiskonpersen: TcxGridColumn
        Caption = 'Diskon ( % )'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
        Width = 100
      end
      object cDiskonRupiah: TcxGridColumn
        Caption = 'Diskon (Rp)'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
        Width = 100
      end
      object cJumlah: TcxGridColumn
        Caption = 'Jumlah'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
        Width = 80
      end
      object CJumlahRetur: TcxGridColumn
        Caption = 'Jml Retur'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
        Width = 100
      end
      object cSubtotal: TcxGridColumn
        Caption = 'Sutotal'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
        Width = 100
      end
      object cIsi: TcxGridColumn
        Caption = 'Isi'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
        Visible = False
        Width = 20
      end
      object cIdgudang: TcxGridColumn
        Caption = 'idgudang'
        Visible = False
      end
    end
    object cxgGrid1Level11: TcxGridLevel
      GridView = cxgrd2TableView1
    end
  end
  object G3: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 392
    Align = alBottom
    PanelStyle.Active = True
    TabOrder = 3
    DesignSize = (
      767
      38)
    Height = 38
    Width = 767
    object btnBaru: TcxButton
      Left = 8
      Top = 12
      Width = 91
      Height = 26
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Baru [ F1 ]'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E0000000000000000000000000000000000000000
        00020000000A170D0738542D1894814626D193502AEA924F2AE87F4525D0522C
        1793120905300000000900000001000000000000000000000000000000030201
        011159311B97A96239FAC58957FFD6A36DFFDDAF75FFDDAF74FFD6A46BFFC589
        56FFA46137F53C2112730000000F000000030000000000000002020101107442
        26B9BC7C4DFFDDAE77FFDEB076FFE2B782FFE3BB87FFE3BC86FFE1B782FFDEAF
        74FFDBAB72FFBD7E4EFF6F3E24B50000001000000002000000085C362095BE80
        53FFE0B37CFFDFB076FFDEB177FFB78254FFAA7144FFAB7245FFBC8859FFDFB2
        79FFDFB277FFDEB077FFC08253FF55321D920000000A190F0932B07047FADFB2
        7DFFDFB27AFFE0B37BFFE0B57DFFA56B3FFFF5EFEAFFF8F3EEFFAB7245FFE2B6
        7EFFE0B47CFFE0B47BFFDEB079FFB3734AFB130B072F613C2795CD9B6FFFE2B7
        80FFE5BD89FFE7C291FFE8C393FFA56B3FFFF1E6DEFFF9F5F1FFAA7144FFE8C4
        94FFE8C393FFE5BF8CFFE1B77FFFD09C6EFF5434218B935E3DD2DCB383FFE3B7
        81FFBA8659FFA97043FFAB7245FFAC7346FFF5EDE6FFFAF6F3FFAD7547FFB078
        4AFFB17A4BFFC29162FFE4B983FFDEB17EFF8E5B3BD0B0744CF2E3BF8FFFE4BB
        84FFA56B3FFFF3EBE6FFFAF6F3FFF6EFE8FFF7F0EAFFFBF7F5FFFAF7F4FFFAF7
        F3FFFAF6F2FFAB7245FFE5BD87FFE5BE8BFFAB714CEEAE764FECE9C9A0FFE5BE
        89FFA56B3FFFE0D2CAFFE1D3CCFFE3D5CFFFF2EAE4FFF8F3EFFFEADFD9FFE6DA
        D4FFE9DED9FFAA7144FFE7C08CFFEACA9DFFAE764FEE9A6A49D0E9CDACFFEAC7
        96FFB78456FFA56B3FFFA56B3FFFA56B3FFFF1EAE5FFFAF6F3FFA56B3FFFA56B
        3FFFA56B3FFFB78457FFEACA99FFEBD1ADFF996A49D46E4E3697DDBB9DFFEED3
        A9FFEECFA2FFEED2A5FFF0D6A9FFA56B3FFFF0EAE7FFFDFCFBFFA56B3FFFF1D6
        AAFFF0D5A8FFEED2A5FFEFD4A7FFE0C2A2FF6246318F1C140E2BC7946CFCF5E8
        CCFFEFD6ABFFF1D8AEFFF2DAB0FFA56B3FFFDECFC9FFDFD1CBFFA56B3FFFF3DC
        B2FFF1DBB0FFF1D8ADFFF7EACDFFC69470FA1A120D2E000000036F523C92D7B0
        8CFFF8EFD3FFF3E0B9FFF3DFB7FFB98A5FFFA56B3FFFA56B3FFFBA8A5FFFF4E1
        B9FFF4E2BDFFFAF1D5FFD9B390FF664B368C000000060000000102020107906C
        4EB8D9B38FFFF7EDD3FFF8EED0FFF7EBC9FFF6E8C4FFF6E8C5FFF7ECCAFFF8EE
        D0FFF4E8CDFFD7AF8BFF88664AB30202010B0000000100000000000000010202
        010770543F8FCFA078FCE2C4A2FFEBD7B8FFF4E9CDFFF4EACEFFECD8B9FFE3C5
        A3FFC59973F24C392A6700000006000000010000000000000000000000000000
        0001000000022019122C6C543E89A47E5FCCC59770F1C19570EEA47E60CD6C54
        3F8B16110D2200000003000000010000000000000000}
      TabOrder = 0
      OnClick = btnBaruClick
    end
    object btnSimpan: TcxButton
      Left = 105
      Top = 12
      Width = 137
      Height = 26
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Simpan [ Ctrl + S ]'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E0000000000000000000000000000000000000000
        0000000000000000000000000000000000040000000F000000110000000B0000
        0004000000010000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000E431B10FF31130BE1190A05980304
        07420000000C0000000200000000000000000000000000000000000000000000
        00000000000000000000000000000000000D673C29DCB8C7D2FF7789A3FF2240
        84FF040F34960000000F00000002000000000000000000000000000000000000
        00000000000000000000000000000000000841261A91869AB3FFC7E3F6FF1B65
        B9FF286BABFF041237950000000E000000020000000000000000000000000000
        0000000000000000000000000000000000031013163E458BC6FFDDFEFDFF4DB4
        E6FF1B67BAFF2E73B1FF051439940000000D0000000200000000000000000000
        000000000000000000000000000000000001000000081B44628D439FD5FFDDFE
        FDFF55C0ECFF1D6ABCFF337BB6FF06163B920000000CA5A5A5A7A1A1A1A9A1A1
        A1A9A5A5A5A74C4C4C4DBBBBBBC0B8B8B8C1B8B8B8C1B1B1B1C46D96B5E348A5
        D8FFDDFEFDFF5DCBF2FF206EBFFF3883BCFF07193E90A1A1A1A8744E42F7744E
        42F7B8B8B8C18989898E94847EDC6A4132FF978883D86A4032FF74574DF04F69
        81FC4BABDAFFDDFEFDFF64D5F7FF2474C1FF3C8BC1FFA2A2A2A892756BE86E43
        32FFA6A19ECCB2B2B2C38C695CF0734737FFAAA7A6C97B4E3EFF7D513FFF917C
        76E259758FF64EAFDDFFDDFEFDFF6BDEFBFF287AC5FF72727275A79A95D37445
        34FF704232FF7E4F3CFF845342FF7C584BF4B2B2B2C4835342FF856356F0B5B5
        B5C2ABA8A6C853667DFF51B2DFFFDDFEFDFF4CA7D7FF33333334B5B1B0C68955
        41FF8F6556F49A8279E182513EFF8E756CE3B5B5B5C27F4F3DFF7F5D52F0B7B7
        B7C2B1AEACC77B4E3CFF58728AF8327FBFFF163A5A860D0D0D0DBBBBBBC1916A
        5BEF855848F79F8A82DC804D3AFFA49792D2B8B8B8C284503DFF744332FF947E
        76E0937366EC7F4E3DFF927D75DF8888889000000003000000008A8A8A8DA288
        7EDF824C37FF956D5DF0804F3DFBBABABAC1BABABAC18B5540FF855848F78C62
        53F38C5C48FB916F62EBBBBBBBC15959595A00000000000000005959595AB0A5
        A1CD8B533CFF8E5740FF8B6154EFAFAFAFB3BBBBBBC18A543FFF926A5CEFACAC
        ACB5AFAFAFB4AFAFAFB37F7F7F8000000000000000000000000026262626BCBC
        BCC0966450F78B523BFFA18A83DA8B8B8B8DBCBCBCC08B513DFF8C6354EF8A8A
        8A8D00000000000000000000000000000000000000000000000000000000A5A5
        A5A6BDBDBDC0BDBDBDC0BEBEBEC04C4C4C4CBEBEBEBFBDBDBDC0BDBDBDC08B8B
        8B8C0000000000000000000000000000000000000000}
      TabOrder = 1
      OnClick = btnSimpanClick
    end
    object btnTutup: TcxButton
      Left = 250
      Top = 12
      Width = 107
      Height = 26
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Tutup [ ESC ]'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E0000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000020000
        000900000012000000180000001A0000001A0000001800000010000000050000
        00010000000000000000000000000000000000000000000000020000000D3524
        146A936338E5A56B3AFFA36938FFA16736FF9D6233FB633E20B7080502280000
        0006000000010000000000000000000000000000000000000008442F1D78C18B
        59FEE1AC76FFE4C296FFB5793BFFB5793CFFB5793CFFAD7239FF7E502AD80302
        042A00000006000000010000000000000000000000000000000DB07D4EF3E6B1
        7AFFE9B47DFFE9B47DFFE7C79DFFB67A3DFFB57A3DFFB57A3DFF69537BFF090E
        5ED50001052800000006000000010000000000000000000000086A4E329DEFD7
        B3FFE9B47DFFE9B47DFFE9B47DFFEACDA4FFB57B3EFF735C86FF313FCCFF2935
        B8FF0B1161D501010627000000050000000100000000000000010000000C7455
        38A5F2DDBBFFE9B47DFFE9B47DFFE9B47DFFD1CEE1FF3443CEFF3443CDFF3443
        CEFF2C39BAFF0D1463D401010626000000050000000100000000000000020000
        000B76583BA4F5E2C1FFE9B47DFFB5A9B8FF829FF1FFB1C9F5FF3949D1FF3A4A
        D1FF3A49D1FF303FBDFF111767D3010106250000000500000000000000000000
        00010000000B785B3DA3E9E1D2FF87A3F2FF87A4F1FF87A3F2FFB9D0F7FF3E50
        D5FF3E50D5FF3F50D5FF3545C2FF141B6AD20101062200000000000000000000
        0000000000010000000A2C386FA2C9E2F9FF8CA8F3FF8DA8F3FF8CA8F3FFC0D8
        F9FF4457D9FF4356D9FF4456D9FF3949C2FF141A61C200000000000000000000
        0000000000000000000100000009303D74A1CFE7FBFF92ADF3FF91ADF4FF92AD
        F4FFC6DEFAFF495EDBFF495DDCFF475AD7FF232F8BF000000000000000000000
        000000000000000000000000000100000008334177A0D4ECFCFF97B2F5FF97B2
        F4FF97B3F5FFCCE4FBFF4A5FDAFF3141A4F6090C214A00000000000000000000
        0000000000000000000000000000000000010000000736457A9FD8F0FDFF9DB7
        F5FF9CB7F5FFD9F1FEFF6B81CAF50B0E23470000000600000000000000000000
        000000000000000000000000000000000000000000010000000639477D9EDBF3
        FEFFDBF3FFFF677FCFF513192C44000000050000000100000000000000000000
        0000000000000000000000000000000000000000000000000001000000053543
        728E4F63AACD151A2D4000000004000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000010000
        00030000000400000002000000000000000000000000}
      TabOrder = 2
      OnClick = btnTutupClick
    end
  end
end
