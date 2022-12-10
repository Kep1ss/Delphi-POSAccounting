object FcariPembelian: TFcariPembelian
  Left = 0
  Top = 0
  Caption = 'Cari Pembelian'
  ClientHeight = 400
  ClientWidth = 790
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dxBevel1: TdxBevel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 784
    Height = 41
    Align = alTop
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 753
  end
  object cxLabel1: TcxLabel
    Left = 16
    Top = 16
    Caption = 'Pencarian No Pembelian'
    Transparent = True
  end
  object EPencarian: TcxTextEdit
    Left = 144
    Top = 15
    TabOrder = 1
    OnKeyDown = EPencarianKeyDown
    Width = 529
  end
  object cxgrd1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 784
    Height = 347
    Align = alClient
    TabOrder = 2
    object cxgGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxgGrid1DBTableView1DblClick
      OnKeyDown = cxgGrid1DBTableView1KeyDown
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dtrx.DPembelian
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.GroupByHeaderLayout = ghlHorizontal
      object cxgGrid1DBTableView1nobukti: TcxGridDBColumn
        Caption = 'NO BUKTI'
        DataBinding.FieldName = 'nobukti'
      end
      object cxgGrid1DBTableView1tgl: TcxGridDBColumn
        Caption = 'TANGGAL'
        DataBinding.FieldName = 'tgl'
      end
      object cxgGrid1DBTableView1refnota: TcxGridDBColumn
        Caption = 'REFF NOTA'
        DataBinding.FieldName = 'refnota'
        Width = 150
      end
      object cxgGrid1DBTableView1pembayaran: TcxGridDBColumn
        Caption = 'PEMBAYARAN'
        DataBinding.FieldName = 'pembayaran'
        Width = 100
      end
      object cxgGrid1DBTableView1namasupplier: TcxGridDBColumn
        Caption = 'NAMA SUPPLIER'
        DataBinding.FieldName = 'namasupplier'
        Width = 300
      end
      object cxgGrid1DBTableView1total: TcxGridDBColumn
        Caption = 'TOTAL'
        DataBinding.FieldName = 'total'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
        Width = 100
      end
    end
    object cxgGrid1Level1: TcxGridLevel
      GridView = cxgGrid1DBTableView1
    end
  end
end
