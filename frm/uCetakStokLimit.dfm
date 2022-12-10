object FcetakStokLimit: TFcetakStokLimit
  Left = 0
  Top = 0
  Caption = 'Laporan Stok Limit Barang'
  ClientHeight = 375
  ClientWidth = 703
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxg3: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 697
    Height = 327
    Align = alClient
    TabOrder = 0
    object cxgGrid1DBTableView12: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
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
        Width = 150
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
  object cxGroupBox1: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 336
    Align = alBottom
    TabOrder = 1
    Height = 36
    Width = 697
    object btnPrint: TcxButton
      Left = 4
      Top = 6
      Width = 86
      Height = 25
      Caption = 'Cetak'
      TabOrder = 0
      OnClick = btnPrintClick
    end
    object btnClose: TcxButton
      Left = 96
      Top = 6
      Width = 86
      Height = 25
      Caption = 'Tutup'
      TabOrder = 1
      OnClick = btnCloseClick
    end
  end
end
