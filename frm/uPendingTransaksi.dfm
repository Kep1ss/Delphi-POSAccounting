object FpendingTransaksi: TFpendingTransaksi
  Left = 0
  Top = 0
  Caption = 'Transaksi Pending'
  ClientHeight = 475
  ClientWidth = 827
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object G1: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    TabOrder = 0
    Height = 49
    Width = 821
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 65
      Height = 16
      Caption = 'Pencarian :'
      Transparent = True
    end
    object EPencarian: TcxTextEdit
      Left = 87
      Top = 13
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clSilver
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsItalic]
      Style.TextColor = clSilver
      Style.IsFontAssigned = True
      TabOrder = 0
      Text = 'NO Faktur atau nama pelanggan'
      OnEnter = EPencarianEnter
      OnExit = EPencarianExit
      OnKeyDown = EPencarianKeyDown
      Width = 650
    end
  end
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 250
    Width = 821
    Height = 168
    Align = alBottom
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dtrx.Dtempjualdetail
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1kodebarang: TcxGridDBColumn
        Caption = 'KODE BARANG'
        DataBinding.FieldName = 'kodebarang'
      end
      object cxGrid1DBTableView1namabarang: TcxGridDBColumn
        Caption = 'NAMA BARANG'
        DataBinding.FieldName = 'namabarang'
        Width = 250
      end
      object cxGrid1DBTableView1satuan: TcxGridDBColumn
        Caption = 'SATUAN'
        DataBinding.FieldName = 'satuan'
        Width = 100
      end
      object cxGrid1DBTableView1harga: TcxGridDBColumn
        Caption = 'HARGA'
        DataBinding.FieldName = 'harga'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
      end
      object cxGrid1DBTableView1jumlah: TcxGridDBColumn
        Caption = 'JUMLAH'
        DataBinding.FieldName = 'jumlah'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###.00'
      end
      object cxGrid1DBTableView1subtotal: TcxGridDBColumn
        Caption = 'SUBTOTAL'
        DataBinding.FieldName = 'subtotal'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxGroupBox1: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 424
    Align = alBottom
    TabOrder = 2
    Height = 48
    Width = 821
    object btnOk: TcxButton
      Left = 16
      Top = 16
      Width = 89
      Height = 25
      Caption = 'Pilih'
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnHapus: TcxButton
      Left = 200
      Top = 16
      Width = 154
      Height = 25
      Caption = 'Hapus Semua Pending'
      TabOrder = 1
      OnClick = btnHapusClick
    end
    object btnTutup: TcxButton
      Left = 517
      Top = 16
      Width = 154
      Height = 25
      Caption = 'Tutup'
      TabOrder = 2
      OnClick = btnTutupClick
    end
    object btn1: TcxButton
      Left = 358
      Top = 16
      Width = 154
      Height = 25
      Caption = 'Print'
      TabOrder = 3
      OnClick = btn1Click
    end
    object btnHapusPending: TcxButton
      Left = 111
      Top = 16
      Width = 89
      Height = 25
      Caption = 'Hapus'
      TabOrder = 4
      OnClick = btnHapusPendingClick
    end
  end
  object cxg3: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 58
    Width = 821
    Height = 183
    Align = alTop
    TabOrder = 3
    object cxg1: TcxGridDBTableView
      OnDblClick = cxg1DblClick
      Navigator.Buttons.CustomButtons = <>
      OnCanSelectRecord = cxg1CanSelectRecord
      OnCellClick = cxg1CellClick
      OnSelectionChanged = cxg1SelectionChanged
      DataController.DataSource = dtrx.Dtempjual
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxg1fakturjual: TcxGridDBColumn
        Caption = 'NO PENDING'
        DataBinding.FieldName = 'fakturjual'
        Width = 120
      end
      object cxg1tgljual: TcxGridDBColumn
        Caption = 'TGL JUAL'
        DataBinding.FieldName = 'tgljual'
        Width = 120
      end
      object cxg1namapelanggan: TcxGridDBColumn
        Caption = 'NAMA PELANGGAN'
        DataBinding.FieldName = 'namapelanggan'
        Width = 200
      end
      object cxg1grandtotal: TcxGridDBColumn
        Caption = 'GRAND TOTAL'
        DataBinding.FieldName = 'grandtotal'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
        Width = 120
      end
      object cxg1namalengkap: TcxGridDBColumn
        Caption = 'PETUGAS'
        DataBinding.FieldName = 'namalengkap'
        Width = 100
      end
    end
    object cxg2: TcxGridLevel
      GridView = cxg1
    end
  end
end
