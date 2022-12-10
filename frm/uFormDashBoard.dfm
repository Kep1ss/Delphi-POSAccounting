object FFormDashBoard: TFFormDashBoard
  Left = 0
  Top = 0
  Caption = 'Form Dashboard'
  ClientHeight = 531
  ClientWidth = 880
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
    Left = 0
    Top = 0
    Align = alTop
    Caption = 'DAFTAR BARANG STOK LIMIT'
    Style.TextColor = clGreen
    Style.TextStyle = [fsBold]
    TabOrder = 0
    Transparent = True
    Height = 169
    Width = 880
    object Label1: TLabel
      Left = 3
      Top = 15
      Width = 874
      Height = 16
      Align = alTop
      Caption = 'STOK BARANG LIMIT !!! SILAHKAN LAKUKAN PEMBELIAN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 354
    end
    object cxg3: TcxGrid
      AlignWithMargins = True
      Left = 6
      Top = 34
      Width = 735
      Height = 123
      Align = alClient
      TabOrder = 0
      object cxgGrid1DBTableView12: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        OnCellClick = cxgGrid1DBTableView12CellClick
        DataController.DataSource = Dlaporan.DstokLimit
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object cxgGrid1DBTableView12kodebarang: TcxGridDBColumn
          Caption = 'KODE BARANG'
          DataBinding.FieldName = 'kodebarang'
        end
        object cxgGrid1DBTableView12namabarang: TcxGridDBColumn
          Caption = 'NAMA BARANG'
          DataBinding.FieldName = 'namabarang'
        end
        object cxgGrid1DBTableView12namakategori: TcxGridDBColumn
          Caption = 'NAMA KATEGORI'
          DataBinding.FieldName = 'namakategori'
        end
        object cxgGrid1DBTableView12stokmin: TcxGridDBColumn
          Caption = 'STOK MIN'
          DataBinding.FieldName = 'stokmin'
          Width = 200
        end
        object cxgGrid1DBTableView12stok: TcxGridDBColumn
          Caption = 'SISA STOK'
          DataBinding.FieldName = 'stok'
          Width = 200
        end
        object cxgGrid1DBTableView12PERINGATAN: TcxGridDBColumn
          DataBinding.FieldName = 'PERINGATAN'
          Width = 200
        end
      end
      object cxgGrid1Level12: TcxGridLevel
        GridView = cxgGrid1DBTableView12
      end
    end
    object G4: TcxGroupBox
      Left = 744
      Top = 31
      Align = alRight
      TabOrder = 1
      Height = 129
      Width = 133
      object CTAMPIL: TcxCheckBox
        Left = 3
        Top = 16
        Caption = 'Tampilkan Peringatan'
        TabOrder = 0
        Transparent = True
        OnClick = CTAMPILClick
      end
      object btnCetak: TcxButton
        Left = 7
        Top = 96
        Width = 118
        Height = 25
        Caption = 'CETAK'
        TabOrder = 1
        OnClick = btnCetakClick
      end
    end
  end
  object G2: TcxGroupBox
    Left = 0
    Top = 338
    Align = alTop
    Caption = 'DAFTAR PIUTANG JATUH TEMPO'
    Style.TextColor = clGreen
    Style.TextStyle = [fsBold]
    TabOrder = 1
    Height = 176
    Width = 880
    object Label2: TLabel
      Left = 3
      Top = 15
      Width = 874
      Height = 16
      Align = alTop
      Caption = 'PIUTANG PELANGGAN TELAH JATUH TEMPO !!!, LAKUKAN PENAGIHAN !'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 438
    end
    object cxg1: TcxGrid
      Left = 3
      Top = 31
      Width = 874
      Height = 136
      Align = alClient
      TabOrder = 0
      object cxgGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dtrx.Dpiutang
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.InvertSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.DataRowHeight = 40
        OptionsView.GroupByBox = False
        object cxgGrid1DBTableView1fakturjual: TcxGridDBColumn
          Caption = 'NO FAKTUR'
          DataBinding.FieldName = 'fakturjual'
        end
        object cxgGrid1DBTableView1tgltempo: TcxGridDBColumn
          Caption = 'TGL TEMPO'
          DataBinding.FieldName = 'tgltempo'
        end
        object cxgGrid1DBTableView1piutang: TcxGridDBColumn
          Caption = 'PIUTANG'
          DataBinding.FieldName = 'piutang'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '#,###'
        end
        object cxgGrid1DBTableView1kekurangan: TcxGridDBColumn
          Caption = 'KEKURANGAN'
          DataBinding.FieldName = 'kekurangan'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '#,###'
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
  end
  object G3: TcxGroupBox
    Left = 0
    Top = 514
    Align = alTop
    Caption = 'DAFTAR HUTANG JATUH TEMPO'
    Style.TextColor = 12615680
    Style.TextStyle = [fsBold]
    TabOrder = 2
    Height = 184
    Width = 880
    object Label3: TLabel
      Left = 3
      Top = 15
      Width = 874
      Height = 16
      Align = alTop
      Caption = 'HUTANG TELAH JATUH TEMPO, LAKUKAN PEMBAYARAN !!!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 364
    end
    object cxg2: TcxGrid
      Left = 3
      Top = 31
      Width = 874
      Height = 144
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12615680
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object cxgGrid1DBTableView11: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dtrx.Dhutang
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.DataRowHeight = 40
        OptionsView.GroupByBox = False
        object cxgGrid1DBTableView11nobukti: TcxGridDBColumn
          Caption = 'FAKTUR BELI'
          DataBinding.FieldName = 'nobukti'
        end
        object cxgGrid1DBTableView11tgltempo: TcxGridDBColumn
          Caption = 'TGL TEMPO'
          DataBinding.FieldName = 'tgltempo'
        end
        object cxgGrid1DBTableView11hutang: TcxGridDBColumn
          Caption = 'HUTANG'
          DataBinding.FieldName = 'hutang'
        end
        object cxgGrid1DBTableView11kekurangan: TcxGridDBColumn
          Caption = 'KEKURANGAN'
          DataBinding.FieldName = 'kekurangan'
        end
        object cxgGrid1DBTableView11namasupplier: TcxGridDBColumn
          Caption = 'SUPPLIER'
          DataBinding.FieldName = 'namasupplier'
        end
      end
      object cxgGrid1Level11: TcxGridLevel
        GridView = cxgGrid1DBTableView11
      end
    end
  end
  object Gpesan: TcxGroupBox
    Left = 0
    Top = 169
    Align = alTop
    Caption = 'DAFTAR PESANAN BARANG'
    Style.TextColor = clGreen
    Style.TextStyle = [fsBold]
    TabOrder = 3
    Transparent = True
    Height = 169
    Width = 880
    object Label4: TLabel
      Left = 3
      Top = 15
      Width = 874
      Height = 16
      Align = alTop
      Caption = 'BARANG PESANAN PELANGGAN SUDAH DATANG !!!!!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8388863
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 327
    end
    object cxGrid1: TcxGrid
      AlignWithMargins = True
      Left = 6
      Top = 34
      Width = 868
      Height = 123
      Align = alClient
      TabOrder = 0
      object cxGridDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        OnCellClick = cxgGrid1DBTableView12CellClick
        DataController.DataSource = dsPesanan
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object cxGridDBTableView1nomerpo: TcxGridDBColumn
          Caption = 'Nomer PO'
          DataBinding.FieldName = 'nomerpo'
        end
        object cxGridDBTableView1namapelanggan: TcxGridDBColumn
          Caption = 'Pelanggan'
          DataBinding.FieldName = 'namapelanggan'
        end
        object cxGridDBTableView1kodebarang: TcxGridDBColumn
          Caption = 'Kode Barang'
          DataBinding.FieldName = 'kodebarang'
        end
        object cxGridDBTableView1namabarang: TcxGridDBColumn
          Caption = 'Nama Barang'
          DataBinding.FieldName = 'namabarang'
        end
        object cxGridDBTableView1jumlah: TcxGridDBColumn
          Caption = 'Jumlah Order'
          DataBinding.FieldName = 'jumlah'
        end
        object cxGridDBTableView1stok: TcxGridDBColumn
          Caption = 'Stok'
          DataBinding.FieldName = 'stok'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
  end
  object tmr1: TTimer
    Interval = 500
    OnTimer = tmr1Timer
    Left = 544
    Top = 56
  end
  object QPesanan: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  po.`nomerpo`,'
      '  pl.namapelanggan,'
      '  p.`kodebarang`,'
      '  b.namabarang,'
      '  p.`jumlah`,'
      '  SUM('
      '    ks.saldoawal + ks.masuk - ks.keluar'
      '  ) AS stok '
      'FROM'
      '  popenjualandetil p '
      '  LEFT JOIN barang b '
      '    ON b.`kodebarang` = p.`kodebarang` '
      '  LEFT JOIN kartustok ks '
      '    ON ks.`kodebarang` = p.`kodebarang` '
      '  LEFT JOIN popenjualan po '
      '    ON po.`nomerpo` = p.`nomerpo` '
      '  LEFT JOIN pelanggan pl '
      '    ON pl.`idpelanggan` = po.`idpelanggan` '
      'GROUP BY p.`kodebarang`')
    Left = 464
    Top = 248
  end
  object dsPesanan: TDataSource
    DataSet = QPesanan
    Left = 536
    Top = 240
  end
end
