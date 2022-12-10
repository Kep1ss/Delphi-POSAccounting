object FCariDataStokOpname: TFCariDataStokOpname
  Left = 0
  Top = 0
  Caption = 'Cari Data Stok Opname'
  ClientHeight = 400
  ClientWidth = 753
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
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
    Caption = 'Nomer Stok Opname'
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
      DataController.DataSource = DStokOpanme
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
        Width = 150
      end
      object cxgGrid1DBTableView1tanggal: TcxGridDBColumn
        Caption = 'TANGGAL'
        DataBinding.FieldName = 'tanggal'
        Width = 100
      end
      object cxgGrid1DBTableView1keterangan: TcxGridDBColumn
        Caption = 'KETERANGAN'
        DataBinding.FieldName = 'keterangan'
        Width = 400
      end
      object cxgGrid1DBTableView1namalokasi: TcxGridDBColumn
        Caption = 'LOKASI'
        DataBinding.FieldName = 'namalokasi'
      end
      object cxgGrid1DBTableView1namalengkap: TcxGridDBColumn
        Caption = 'PETUGAS'
        DataBinding.FieldName = 'namalengkap'
      end
    end
    object cxgGrid1Level1: TcxGridLevel
      GridView = cxgGrid1DBTableView1
    end
  end
  object QTempStokOpname: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  so.nobukti,'
      '  so.tanggal,'
      '  so.kodebarang,'
      '  b.kodebarcode,'
      '  b.namabarang,'
      '  so.stokkomp,'
      '  so.stoknyata,'
      '  so.selisih,'
      '  so.keterangan,'
      '  k.namalokasi,'
      '  u.namalengkap,'
      '  ab.username '
      'FROM'
      '  temp_stokopname so '
      '  LEFT JOIN barang b '
      '    ON so.`kodebarang` = b.`kodebarang`'
      '  left join lokasi k on k.idlokasi=so.idgudang'
      '  left join m_user u on u.iduser=so.lastuser'
      '  LEFT JOIN m_user ab on ab.iduser=so.petugascheck')
    Left = 448
    Top = 120
  end
  object DStokOpanme: TMyDataSource
    DataSet = QTempStokOpname
    Left = 456
    Top = 208
  end
end
