object FhistoryHargaBarang: TFhistoryHargaBarang
  Left = 0
  Top = 0
  Caption = 'History Harga Barang'
  ClientHeight = 445
  ClientWidth = 899
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
  object cxG1: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    TabOrder = 0
    Height = 41
    Width = 893
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 46
      Height = 13
      Caption = 'Periode : '
      Transparent = True
    end
    object Label2: TLabel
      Left = 168
      Top = 16
      Width = 17
      Height = 13
      Caption = 'S/D'
      Transparent = True
    end
    object Label3: TLabel
      Left = 320
      Top = 16
      Width = 57
      Height = 13
      Caption = 'Pencarian : '
      Transparent = True
    end
    object EPencarian: TcxTextEdit
      Left = 381
      Top = 13
      TabOrder = 0
      OnKeyDown = EPencarianKeyDown
      Width = 500
    end
    object dt1: TDateTimePicker
      Left = 56
      Top = 12
      Width = 106
      Height = 21
      Date = 43737.024677418980000000
      Time = 43737.024677418980000000
      TabOrder = 1
      OnChange = dt1Change
    end
    object dt2: TDateTimePicker
      Left = 191
      Top = 12
      Width = 106
      Height = 21
      Date = 43737.024677418980000000
      Time = 43737.024677418980000000
      TabOrder = 2
      OnChange = dt1Change
    end
  end
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 893
    Height = 392
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DHistoryHarga
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1kodebarang: TcxGridDBColumn
        Caption = 'KODE BARANG'
        DataBinding.FieldName = 'kodebarang'
        Width = 100
      end
      object cxGrid1DBTableView1namabarang: TcxGridDBColumn
        Caption = 'NAMA BARANG'
        DataBinding.FieldName = 'namabarang'
        Width = 300
      end
      object cxGrid1DBTableView1namasupplier: TcxGridDBColumn
        Caption = 'SUPPLIER'
        DataBinding.FieldName = 'namasupplier'
        Width = 300
      end
      object cxGrid1DBTableView1tgl: TcxGridDBColumn
        Caption = 'TGL'
        DataBinding.FieldName = 'tgl'
        Width = 100
      end
      object cxGrid1DBTableView1harga: TcxGridDBColumn
        Caption = 'HARGA BELI'
        DataBinding.FieldName = 'harga'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
        Width = 100
      end
      object cxGrid1DBTableView1hargaecer: TcxGridDBColumn
        Caption = 'Harga Ecer'
        DataBinding.FieldName = 'hargaecer'
      end
      object cxGrid1DBTableView1jumlah: TcxGridDBColumn
        Caption = 'JUMLAH'
        DataBinding.FieldName = 'jumlah'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object QHistoryHarga: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  d.kodebarang,'
      '  b.namabarang,'
      '  s.namasupplier,'
      '  p.tgl,'
      '  d.harga,'
      '  d.hargaecer,'
      '  d.jumlah '
      'FROM'
      '  detailbeli d '
      '  LEFT JOIN barang b '
      '    ON d.`kodebarang` = b.`kodebarang` '
      '  LEFT JOIN pembelian p '
      '    ON p.`nobukti` = d.`nobukti` '
      '  LEFT JOIN m_supplier s '
      '    ON s.`idsupplier` = p.`idsupplier`')
    Left = 648
    Top = 448
  end
  object DHistoryHarga: TMyDataSource
    DataSet = QHistoryHarga
    Left = 648
    Top = 512
  end
end
