object FreturPembelian: TFreturPembelian
  Left = 0
  Top = 0
  Caption = 'Retur Pembelian'
  ClientHeight = 433
  ClientWidth = 871
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
    Width = 865
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
      Width = 109
      Height = 16
      Caption = 'No Bukti Pembelian'
      Transparent = True
    end
    object Label6: TLabel
      Left = 232
      Top = 40
      Width = 47
      Height = 16
      Caption = 'Supplier'
      Transparent = True
    end
    object Label7: TLabel
      Left = 352
      Top = 13
      Width = 5
      Height = 16
      Caption = ':'
      Transparent = True
    end
    object Label8: TLabel
      Left = 352
      Top = 40
      Width = 5
      Height = 16
      Caption = ':'
      Transparent = True
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
    object Label13: TLabel
      Left = 576
      Top = 69
      Width = 43
      Height = 16
      Caption = 'Gudang'
      Transparent = True
    end
    object Label15: TLabel
      Left = 623
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
    object ENobuktiBeli: TcxTextEdit
      Left = 363
      Top = 10
      TabOrder = 2
      Width = 206
    end
    object ESupplier: TcxTextEdit
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
    object cbGudang: TcxComboBox
      Left = 634
      Top = 66
      TabOrder = 5
      Width = 203
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
        DataController.DataSource = dtrx.DPembelian
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object cxgGrid1DBTableView1nobukti: TcxGridDBColumn
          Caption = 'NO BUKTI'
          DataBinding.FieldName = 'nobukti'
        end
        object cxgGrid1DBTableView1namasupplier: TcxGridDBColumn
          Caption = 'SUPPLIER'
          DataBinding.FieldName = 'namasupplier'
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
    Width = 566
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
        Width = 100
      end
      object cHarga: TcxGridColumn
        Caption = 'Harga'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
        Width = 80
      end
      object cPPn: TcxGridColumn
        Caption = 'PPN'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
        Visible = False
        Width = 100
      end
      object cDiskonpersen: TcxGridColumn
        Caption = 'Diskon ( % )'
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
        Properties.OnEditValueChanged = CJumlahReturPropertiesEditValueChanged
        Width = 100
      end
      object cSubtotal: TcxGridColumn
        Caption = 'Subtotal'
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
      865
      38)
    Height = 38
    Width = 865
    object btnBaru: TcxButton
      Left = 8
      Top = 12
      Width = 91
      Height = 26
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Baru [ F1 ]'
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000020000000A170D0738542D1894814626D193502AEA924F2AE87F45
        25D0522C17931209053000000009000000010000000000000000000000000000
        00030201011159311B97A96239FAC58957FFD6A36DFFDDAF75FFDDAF74FFD6A4
        6BFFC58956FFA46137F53C2112730000000F0000000300000000000000020201
        0110744226B9BC7C4DFFDDAE77FFDEB076FFE2B782FFE3BB87FFE3BC86FFE1B7
        82FFDEAF74FFDBAB72FFBD7E4EFF6F3E24B50000001000000002000000085C36
        2095BE8053FFE0B37CFFDFB076FFDEB177FFB78254FFAA7144FFAB7245FFBC88
        59FFDFB279FFDFB277FFDEB077FFC08253FF55321D920000000A190F0932B070
        47FADFB27DFFDFB27AFFE0B37BFFE0B57DFFA56B3FFFF5EFEAFFF8F3EEFFAB72
        45FFE2B67EFFE0B47CFFE0B47BFFDEB079FFB3734AFB130B072F613C2795CD9B
        6FFFE2B780FFE5BD89FFE7C291FFE8C393FFA56B3FFFF1E6DEFFF9F5F1FFAA71
        44FFE8C494FFE8C393FFE5BF8CFFE1B77FFFD09C6EFF5434218B935E3DD2DCB3
        83FFE3B781FFBA8659FFA97043FFAB7245FFAC7346FFF5EDE6FFFAF6F3FFAD75
        47FFB0784AFFB17A4BFFC29162FFE4B983FFDEB17EFF8E5B3BD0B0744CF2E3BF
        8FFFE4BB84FFA56B3FFFF3EBE6FFFAF6F3FFF6EFE8FFF7F0EAFFFBF7F5FFFAF7
        F4FFFAF7F3FFFAF6F2FFAB7245FFE5BD87FFE5BE8BFFAB714CEEAE764FECE9C9
        A0FFE5BE89FFA56B3FFFE0D2CAFFE1D3CCFFE3D5CFFFF2EAE4FFF8F3EFFFEADF
        D9FFE6DAD4FFE9DED9FFAA7144FFE7C08CFFEACA9DFFAE764FEE9A6A49D0E9CD
        ACFFEAC796FFB78456FFA56B3FFFA56B3FFFA56B3FFFF1EAE5FFFAF6F3FFA56B
        3FFFA56B3FFFA56B3FFFB78457FFEACA99FFEBD1ADFF996A49D46E4E3697DDBB
        9DFFEED3A9FFEECFA2FFEED2A5FFF0D6A9FFA56B3FFFF0EAE7FFFDFCFBFFA56B
        3FFFF1D6AAFFF0D5A8FFEED2A5FFEFD4A7FFE0C2A2FF6246318F1C140E2BC794
        6CFCF5E8CCFFEFD6ABFFF1D8AEFFF2DAB0FFA56B3FFFDECFC9FFDFD1CBFFA56B
        3FFFF3DCB2FFF1DBB0FFF1D8ADFFF7EACDFFC69470FA1A120D2E000000036F52
        3C92D7B08CFFF8EFD3FFF3E0B9FFF3DFB7FFB98A5FFFA56B3FFFA56B3FFFBA8A
        5FFFF4E1B9FFF4E2BDFFFAF1D5FFD9B390FF664B368C00000006000000010202
        0107906C4EB8D9B38FFFF7EDD3FFF8EED0FFF7EBC9FFF6E8C4FFF6E8C5FFF7EC
        CAFFF8EED0FFF4E8CDFFD7AF8BFF88664AB30202010B00000001000000000000
        00010202010770543F8FCFA078FCE2C4A2FFEBD7B8FFF4E9CDFFF4EACEFFECD8
        B9FFE3C5A3FFC59973F24C392A67000000060000000100000000000000000000
        000000000001000000022019122C6C543E89A47E5FCCC59770F1C19570EEA47E
        60CD6C543F8B16110D2200000003000000010000000000000000}
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
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000040000000F000000110000
        000B000000040000000100000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000E431B10FF31130BE1190A
        0598030407420000000C00000002000000000000000000000000000000000000
        0000000000000000000000000000000000000000000D673C29DCB8C7D2FF7789
        A3FF224084FF040F34960000000F000000020000000000000000000000000000
        0000000000000000000000000000000000000000000841261A91869AB3FFC7E3
        F6FF1B65B9FF286BABFF041237950000000E0000000200000000000000000000
        000000000000000000000000000000000000000000031013163E458BC6FFDDFE
        FDFF4DB4E6FF1B67BAFF2E73B1FF051439940000000D00000002000000000000
        00000000000000000000000000000000000000000001000000081B44628D439F
        D5FFDDFEFDFF55C0ECFF1D6ABCFF337BB6FF06163B920000000CA5A5A5A7A1A1
        A1A9A1A1A1A9A5A5A5A74C4C4C4DBBBBBBC0B8B8B8C1B8B8B8C1B1B1B1C46D96
        B5E348A5D8FFDDFEFDFF5DCBF2FF206EBFFF3883BCFF07193E90A1A1A1A8744E
        42F7744E42F7B8B8B8C18989898E94847EDC6A4132FF978883D86A4032FF7457
        4DF04F6981FC4BABDAFFDDFEFDFF64D5F7FF2474C1FF3C8BC1FFA2A2A2A89275
        6BE86E4332FFA6A19ECCB2B2B2C38C695CF0734737FFAAA7A6C97B4E3EFF7D51
        3FFF917C76E259758FF64EAFDDFFDDFEFDFF6BDEFBFF287AC5FF72727275A79A
        95D3744534FF704232FF7E4F3CFF845342FF7C584BF4B2B2B2C4835342FF8563
        56F0B5B5B5C2ABA8A6C853667DFF51B2DFFFDDFEFDFF4CA7D7FF33333334B5B1
        B0C6895541FF8F6556F49A8279E182513EFF8E756CE3B5B5B5C27F4F3DFF7F5D
        52F0B7B7B7C2B1AEACC77B4E3CFF58728AF8327FBFFF163A5A860D0D0D0DBBBB
        BBC1916A5BEF855848F79F8A82DC804D3AFFA49792D2B8B8B8C284503DFF7443
        32FF947E76E0937366EC7F4E3DFF927D75DF8888889000000003000000008A8A
        8A8DA2887EDF824C37FF956D5DF0804F3DFBBABABAC1BABABAC18B5540FF8558
        48F78C6253F38C5C48FB916F62EBBBBBBBC15959595A00000000000000005959
        595AB0A5A1CD8B533CFF8E5740FF8B6154EFAFAFAFB3BBBBBBC18A543FFF926A
        5CEFACACACB5AFAFAFB4AFAFAFB37F7F7F800000000000000000000000002626
        2626BCBCBCC0966450F78B523BFFA18A83DA8B8B8B8DBCBCBCC08B513DFF8C63
        54EF8A8A8A8D0000000000000000000000000000000000000000000000000000
        0000A5A5A5A6BDBDBDC0BDBDBDC0BEBEBEC04C4C4C4CBEBEBEBFBDBDBDC0BDBD
        BDC08B8B8B8C0000000000000000000000000000000000000000}
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
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00020000000900000012000000180000001A0000001A00000018000000100000
        0005000000010000000000000000000000000000000000000000000000020000
        000D3524146A936338E5A56B3AFFA36938FFA16736FF9D6233FB633E20B70805
        022800000006000000010000000000000000000000000000000000000008442F
        1D78C18B59FEE1AC76FFE4C296FFB5793BFFB5793CFFB5793CFFAD7239FF7E50
        2AD80302042A00000006000000010000000000000000000000000000000DB07D
        4EF3E6B17AFFE9B47DFFE9B47DFFE7C79DFFB67A3DFFB57A3DFFB57A3DFF6953
        7BFF090E5ED50001052800000006000000010000000000000000000000086A4E
        329DEFD7B3FFE9B47DFFE9B47DFFE9B47DFFEACDA4FFB57B3EFF735C86FF313F
        CCFF2935B8FF0B1161D501010627000000050000000100000000000000010000
        000C745538A5F2DDBBFFE9B47DFFE9B47DFFE9B47DFFD1CEE1FF3443CEFF3443
        CDFF3443CEFF2C39BAFF0D1463D4010106260000000500000001000000000000
        00020000000B76583BA4F5E2C1FFE9B47DFFB5A9B8FF829FF1FFB1C9F5FF3949
        D1FF3A4AD1FF3A49D1FF303FBDFF111767D30101062500000005000000000000
        0000000000010000000B785B3DA3E9E1D2FF87A3F2FF87A4F1FF87A3F2FFB9D0
        F7FF3E50D5FF3E50D5FF3F50D5FF3545C2FF141B6AD201010622000000000000
        000000000000000000010000000A2C386FA2C9E2F9FF8CA8F3FF8DA8F3FF8CA8
        F3FFC0D8F9FF4457D9FF4356D9FF4456D9FF3949C2FF141A61C2000000000000
        000000000000000000000000000100000009303D74A1CFE7FBFF92ADF3FF91AD
        F4FF92ADF4FFC6DEFAFF495EDBFF495DDCFF475AD7FF232F8BF0000000000000
        00000000000000000000000000000000000100000008334177A0D4ECFCFF97B2
        F5FF97B2F4FF97B3F5FFCCE4FBFF4A5FDAFF3141A4F6090C214A000000000000
        000000000000000000000000000000000000000000010000000736457A9FD8F0
        FDFF9DB7F5FF9CB7F5FFD9F1FEFF6B81CAF50B0E234700000006000000000000
        0000000000000000000000000000000000000000000000000001000000063947
        7D9EDBF3FEFFDBF3FFFF677FCFF513192C440000000500000001000000000000
        0000000000000000000000000000000000000000000000000000000000010000
        00053543728E4F63AACD151A2D40000000040000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0001000000030000000400000002000000000000000000000000}
      TabOrder = 2
      OnClick = btnTutupClick
    end
  end
end
