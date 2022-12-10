object FcariPO: TFcariPO
  Left = 0
  Top = 0
  Caption = 'Cari No Order Beli'
  ClientHeight = 400
  ClientWidth = 753
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
    Width = 747
    Height = 41
    Align = alTop
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 753
  end
  object cxLabel1: TcxLabel
    Left = 16
    Top = 16
    Caption = 'Pencarian No Order Beli : '
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
    Width = 747
    Height = 347
    Align = alClient
    TabOrder = 2
    object cxgGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxgGrid1DBTableView1DblClick
      OnKeyDown = cxgGrid1DBTableView1KeyDown
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dtrx.DpoBeli
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
        Width = 100
      end
      object cxgGrid1DBTableView1tgl: TcxGridDBColumn
        Caption = 'TGL'
        DataBinding.FieldName = 'tgl'
        Width = 100
      end
      object cxgGrid1DBTableView1namasupplier: TcxGridDBColumn
        Caption = 'SUPPLIER'
        DataBinding.FieldName = 'namasupplier'
        Width = 200
      end
      object cxgGrid1DBTableView1alamat: TcxGridDBColumn
        Caption = 'ALAMAT'
        DataBinding.FieldName = 'alamat'
        Width = 200
      end
      object cxgGrid1DBTableView1kota: TcxGridDBColumn
        Caption = 'KOTA'
        DataBinding.FieldName = 'kota'
        Width = 100
      end
      object cxgGrid1DBTableView1total: TcxGridDBColumn
        Caption = 'TOTAL'
        DataBinding.FieldName = 'total'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
      end
    end
    object cxgGrid1Level1: TcxGridLevel
      GridView = cxgGrid1DBTableView1
    end
  end
end
