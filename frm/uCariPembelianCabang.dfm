object FCariPebembelianCabang: TFCariPebembelianCabang
  Left = 0
  Top = 0
  Caption = 'Cari Pembelian Cabang'
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
      Left = 6
      Top = 6
      Width = 173
      Height = 446
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 5
      ExplicitTop = 5
      ExplicitWidth = 175
      ExplicitHeight = 448
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
        object cxgGrid1DBTableView1nobukti: TcxGridDBColumn
          Caption = 'NO BUKTI'
          DataBinding.FieldName = 'nobukti'
          Width = 120
        end
        object cxgGrid1DBTableView1tgl: TcxGridDBColumn
          Caption = 'TANGGAL'
          DataBinding.FieldName = 'tgl'
          Width = 100
        end
        object cxgGrid1DBTableView1refnota: TcxGridDBColumn
          Caption = 'REFF NOTA'
          DataBinding.FieldName = 'refnota'
          Width = 120
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
    DataSet = QPembelian
    Left = 80
    Top = 106
  end
  object QPembelian: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT * FROM tokomanager.toko')
    Left = 16
    Top = 104
  end
end
