object FCariPenjualanCabang: TFCariPenjualanCabang
  Left = 0
  Top = 0
  Caption = 'Cari Penjualan Cabang'
  ClientHeight = 464
  ClientWidth = 970
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox2: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alLeft
    PanelStyle.Active = True
    TabOrder = 0
    Height = 458
    Width = 185
    object cxGrid1: TcxGrid
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 175
      Height = 448
      Align = alClient
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        OnCellClick = cxGrid1DBTableView1CellClick
        DataController.DataSource = DCabang
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object cxGrid1DBTableView1nama: TcxGridDBColumn
          Caption = 'NAMA'
          DataBinding.FieldName = 'nama'
        end
        object cxGrid1DBTableView1var_database: TcxGridDBColumn
          DataBinding.FieldName = 'var_database'
          Visible = False
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 191
    Top = 0
    Align = alClient
    TabOrder = 1
    DesignSize = (
      779
      464)
    Height = 464
    Width = 779
    object Label1: TLabel
      Left = 8
      Top = 17
      Width = 51
      Height = 13
      Caption = 'Tanggal   :'
    end
    object EPencarian: TcxTextEdit
      Left = 344
      Top = 14
      TabOrder = 0
      OnKeyDown = EPencarianKeyDown
      Width = 425
    end
    object cxLabel1: TcxLabel
      Left = 203
      Top = 15
      Caption = 'Pencarian No Pembelian'
      Transparent = True
    end
    object cxgrd1: TcxGrid
      AlignWithMargins = True
      Left = 3
      Top = 48
      Width = 773
      Height = 413
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      object cxgGrid1DBTableView1: TcxGridDBTableView
        OnDblClick = cxgGrid1DBTableView1DblClick
        OnKeyDown = cxgGrid1DBTableView1KeyDown
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = DPembelian
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.GroupByHeaderLayout = ghlHorizontal
        object cxgGrid1DBTableView1fakturjual: TcxGridDBColumn
          Caption = 'NO FAKTUR'
          DataBinding.FieldName = 'fakturjual'
        end
        object cxgGrid1DBTableView1tgljual: TcxGridDBColumn
          Caption = 'TGL'
          DataBinding.FieldName = 'tgljual'
        end
        object cxgGrid1DBTableView1namapelanggan: TcxGridDBColumn
          Caption = 'PELANGGAN'
          DataBinding.FieldName = 'namapelanggan'
        end
        object cxgGrid1DBTableView1total: TcxGridDBColumn
          Caption = 'TOTAL'
          DataBinding.FieldName = 'total'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '#,###.00'
        end
        object cxgGrid1DBTableView1diskon: TcxGridDBColumn
          Caption = 'DISKON'
          DataBinding.FieldName = 'diskon'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '#,###.00'
        end
        object cxgGrid1DBTableView1grandtotal: TcxGridDBColumn
          Caption = 'GRAND TOTAL'
          DataBinding.FieldName = 'grandtotal'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '#,###.00'
        end
      end
      object cxgGrid1Level1: TcxGridLevel
        GridView = cxgGrid1DBTableView1
      end
    end
    object dt1: TDateTimePicker
      Left = 64
      Top = 14
      Width = 97
      Height = 21
      Date = 44250.842410115740000000
      Time = 44250.842410115740000000
      TabOrder = 3
      OnChange = dt1Change
    end
  end
  object QCabang: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT * FROM tokomanager.toko')
    Left = 24
    Top = 32
  end
  object DCabang: TMyDataSource
    DataSet = QCabang
    Left = 88
    Top = 40
  end
  object DPembelian: TMyDataSource
    DataSet = QPenjualan
    Left = 80
    Top = 106
  end
  object QPenjualan: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  p.fakturjual,'
      '  p.tgljual,'
      '  p.idpelanggan,'
      '  p.nomerso,'
      '  pl.namapelanggan,'
      
        '  (CASE WHEN p.pembayaran=0 THEN "CASH" ELSE "KREDIT" END) as TR' +
        'X,'
      
        '  (CASE WHEN p.nontunai<>0 THEN "NON TUNAI" ELSE "TUNAI" end ) a' +
        's pembayaran,'
      '  p.total,'
      '  p.tglkirim,'
      '  p.diskon,'
      
        '  SUM(d.subtotal - (( d.subtotal / d.jumlah) * d.jumlahretur)) a' +
        's grandtotal,'
      '  pg.namalengkap,'
      '  s.namasales,'
      '  s.kodesales,'
      '  p.kirim,'
      '  p.bayar,'
      '  p.kembali '
      'FROM'
      
        '  penjualan p LEFT JOIN penjualandetil d ON d.fakturjual=p.faktu' +
        'rjual'
      '  LEFT JOIN pelanggan pl '
      '    ON pl.`idpelanggan` = p.`idpelanggan`'
      '  LEFT JOIN m_user pg '
      '   ON pg.iduser=p.`iduser`'
      '  LEFT JOIN sales s '
      '   ON s.idsales=p.idsales'
      '   '
      'group by p.fakturjual')
    Left = 16
    Top = 112
  end
end
