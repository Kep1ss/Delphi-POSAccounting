object FcariPenjualan: TFcariPenjualan
  Left = 0
  Top = 0
  Caption = 'Cari Penjualan'
  ClientHeight = 472
  ClientWidth = 649
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    TabOrder = 0
    Height = 46
    Width = 643
    object Label1: TLabel
      Left = 8
      Top = 17
      Width = 179
      Height = 13
      Caption = 'Ketikan No Faktur/ Nama Pelanggan :'
    end
    object Epencarian: TcxTextEdit
      Left = 192
      Top = 14
      TabOrder = 0
      OnKeyDown = EpencarianKeyDown
      Width = 433
    end
  end
  object cxGroupBox2: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 55
    Align = alClient
    TabOrder = 1
    Height = 414
    Width = 643
    object cxGrid1: TcxGrid
      AlignWithMargins = True
      Left = 6
      Top = 25
      Width = 631
      Height = 383
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 5
      ExplicitTop = 21
      ExplicitWidth = 633
      ExplicitHeight = 388
      object cxGrid1DBTableView1: TcxGridDBTableView
        OnDblClick = cxGrid1DBTableView1DblClick
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dtrx.Dpenjualan
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsView.GroupByBox = False
        object cxGrid1DBTableView1fakturjual: TcxGridDBColumn
          Caption = 'FAKTUR JUAL'
          DataBinding.FieldName = 'fakturjual'
          Width = 140
        end
        object cxGrid1DBTableView1tgljual: TcxGridDBColumn
          Caption = 'TGL'
          DataBinding.FieldName = 'tgljual'
          Width = 100
        end
        object cxGrid1DBTableView1namapelanggan: TcxGridDBColumn
          Caption = 'PELANGGAN'
          DataBinding.FieldName = 'namapelanggan'
        end
        object cxGrid1DBTableView1grandtotal: TcxGridDBColumn
          Caption = 'GRAND TOTAL'
          DataBinding.FieldName = 'grandtotal'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '#,###'
        end
        object cxGrid1DBTableView1namasales: TcxGridDBColumn
          Caption = 'SALES'
          DataBinding.FieldName = 'namasales'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
end
