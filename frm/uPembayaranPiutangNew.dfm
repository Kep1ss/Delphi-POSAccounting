object FbayarPiutangNew: TFbayarPiutangNew
  Left = 0
  Top = 0
  Caption = 'Pembayaran Piutang'
  ClientHeight = 468
  ClientWidth = 1026
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    1026
    468)
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    AlignWithMargins = True
    Left = 695
    Top = 3
    Align = alRight
    TabOrder = 0
    Height = 462
    Width = 328
    object lbl3: TLabel
      Left = 16
      Top = 20
      Width = 46
      Height = 13
      Caption = 'TANGGAL'
    end
    object lbl4: TLabel
      Left = 16
      Top = 53
      Width = 47
      Height = 13
      Caption = 'NO BUKTI'
    end
    object lbl5: TLabel
      Left = 16
      Top = 86
      Width = 47
      Height = 13
      Caption = 'SUPPLIER'
    end
    object lbl6: TLabel
      Left = 16
      Top = 119
      Width = 74
      Height = 13
      Caption = 'NO TRANSAKSI'
    end
    object lbl7: TLabel
      Left = 16
      Top = 152
      Width = 76
      Height = 13
      Caption = 'TOTAL HUTANG'
    end
    object lbl8: TLabel
      Left = 16
      Top = 185
      Width = 75
      Height = 13
      Caption = 'JUMLAH RETUR'
    end
    object lbl9: TLabel
      Left = 16
      Top = 218
      Width = 67
      Height = 13
      Caption = 'SISA HUTANG'
    end
    object lbl10: TLabel
      Left = 16
      Top = 251
      Width = 75
      Height = 13
      Caption = 'JUMLAH BAYAR'
    end
    object lbl11: TLabel
      Left = 16
      Top = 284
      Width = 66
      Height = 13
      Caption = 'KETERANGAN'
    end
    object lbl12: TLabel
      Left = 98
      Top = 20
      Width = 4
      Height = 13
      Caption = ':'
    end
    object lbl13: TLabel
      Left = 98
      Top = 53
      Width = 4
      Height = 13
      Caption = ':'
    end
    object lbl14: TLabel
      Left = 98
      Top = 86
      Width = 4
      Height = 13
      Caption = ':'
    end
    object lbl15: TLabel
      Left = 98
      Top = 119
      Width = 4
      Height = 13
      Caption = ':'
    end
    object lbl16: TLabel
      Left = 98
      Top = 152
      Width = 4
      Height = 13
      Caption = ':'
    end
    object lbl17: TLabel
      Left = 98
      Top = 185
      Width = 4
      Height = 13
      Caption = ':'
    end
    object lbl18: TLabel
      Left = 98
      Top = 218
      Width = 4
      Height = 13
      Caption = ':'
    end
    object lbl19: TLabel
      Left = 98
      Top = 251
      Width = 4
      Height = 13
      Caption = ':'
    end
    object lbl20: TLabel
      Left = 98
      Top = 284
      Width = 4
      Height = 13
      Caption = ':'
    end
    object dt1: TcxDateEdit
      Left = 108
      Top = 17
      TabOrder = 0
      Width = 121
    end
    object ENObukti: TcxTextEdit
      Left = 108
      Top = 50
      TabOrder = 1
      Width = 121
    end
    object ESupplier: TcxTextEdit
      Left = 108
      Top = 83
      TabOrder = 2
      Width = 215
    end
    object EnoTransaksi: TcxTextEdit
      Left = 108
      Top = 116
      TabOrder = 3
      Width = 141
    end
    object ETotalHutang: TcxTextEdit
      Left = 108
      Top = 149
      TabOrder = 4
      Width = 121
    end
    object EJumlahRetur: TcxTextEdit
      Left = 108
      Top = 182
      TabOrder = 5
      Width = 121
    end
    object ESisaHutang: TcxTextEdit
      Left = 108
      Top = 215
      TabOrder = 6
      Width = 121
    end
    object EJumlahBayar: TcxTextEdit
      Left = 108
      Top = 248
      TabOrder = 7
      Width = 121
    end
    object EKeterangan: TcxTextEdit
      Left = 108
      Top = 281
      AutoSize = False
      TabOrder = 8
      Height = 22
      Width = 205
    end
    object btnSimpan: TcxButton
      Left = 16
      Top = 344
      Width = 75
      Height = 25
      Caption = 'SIMPAN'
      TabOrder = 9
      OnClick = btnSimpanClick
    end
    object btnTutup: TcxButton
      Left = 97
      Top = 344
      Width = 75
      Height = 25
      Caption = 'TUTUP'
      TabOrder = 10
      OnClick = btnTutupClick
    end
  end
  object G1: TcxGroupBox
    AlignWithMargins = True
    Left = 6
    Top = 4
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    DesignSize = (
      683
      241)
    Height = 241
    Width = 683
    object Bv1: TdxBevel
      Left = 12
      Top = 6
      Width = 517
      Height = 27
      Shape = dxbsLineBottom
    end
    object lbl1: TLabel
      Left = 12
      Top = 12
      Width = 73
      Height = 13
      Caption = 'Data Piutang'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ECari: TcxTextEdit
      Left = 104
      Top = 9
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clSilver
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsItalic]
      Style.IsFontAssigned = True
      TabOrder = 0
      OnEnter = ECariEnter
      OnExit = ECariExit
      OnKeyDown = ECariKeyDown
      Width = 425
    end
    object cxgrd1: TcxGrid
      Left = 12
      Top = 38
      Width = 668
      Height = 200
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      object cxgGrid1DBTableView1: TcxGridDBTableView
        OnDblClick = cxgGrid1DBTableView1DblClick
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
        OptionsSelection.MultiSelect = True
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object cxgGrid1DBTableView1fakturjual: TcxGridDBColumn
          Caption = 'NO FAKTUR'
          DataBinding.FieldName = 'fakturjual'
        end
        object cxgGrid1DBTableView1nomerso: TcxGridDBColumn
          Caption = 'NOMER SO'
          DataBinding.FieldName = 'nomerso'
        end
        object cxgGrid1DBTableView1namapelanggan: TcxGridDBColumn
          Caption = 'PELANGGAN'
          DataBinding.FieldName = 'namapelanggan'
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
        object cxgGrid1DBTableView1dibayar: TcxGridDBColumn
          Caption = 'DIBAYAR'
          DataBinding.FieldName = 'dibayar'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '#,###'
        end
        object cxgGrid1DBTableView1kekurangan: TcxGridDBColumn
          Caption = 'KEKURANGAN'
          DataBinding.FieldName = 'kekurangan'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '#,###'
        end
      end
      object cxgGrid1Level1: TcxGridLevel
        GridView = cxgGrid1DBTableView1
      end
    end
  end
  object G2: TcxGroupBox
    AlignWithMargins = True
    Left = 6
    Top = 255
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    DesignSize = (
      683
      205)
    Height = 205
    Width = 683
    object Bv2: TdxBevel
      Left = 12
      Top = -4
      Width = 517
      Height = 34
      Shape = dxbsLineBottom
    end
    object lbl2: TLabel
      Left = 12
      Top = 11
      Width = 91
      Height = 13
      Caption = 'Retur Penjualan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxGrid1: TcxGrid
      AlignWithMargins = True
      Left = 9
      Top = 36
      Width = 671
      Height = 164
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        OnFocusedRecordChanged = cxGrid1DBTableView1FocusedRecordChanged
        DataController.DataModeController.SmartRefresh = True
        DataController.DataSource = dtrx.DreturJual
        DataController.KeyFieldNames = 'nobukti'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '#,###'
            Kind = skSum
          end
          item
            Format = '#,###'
            Kind = skSum
          end
          item
            Format = '#,###'
            Kind = skSum
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.FooterAutoHeight = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object ColCheck: TcxGridDBColumn
          DataBinding.ValueType = 'Boolean'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Properties.OnEditValueChanged = ColCheckPropertiesEditValueChanged
        end
        object cxGrid1DBTableView1nobukti: TcxGridDBColumn
          Caption = 'NO BUKTI'
          DataBinding.FieldName = 'nobukti'
        end
        object cxGrid1DBTableView1tgl: TcxGridDBColumn
          Caption = 'TGL'
          DataBinding.FieldName = 'tgl'
        end
        object cxGrid1DBTableView1namapelanggan: TcxGridDBColumn
          Caption = 'PELANGGAN'
          DataBinding.FieldName = 'namapelanggan'
        end
        object cxGrid1DBTableView1total: TcxGridDBColumn
          Caption = 'TOTAL'
          DataBinding.FieldName = 'total'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '#,###'
        end
      end
      object cxGrid1DBTableView2: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dtrx.DDetailJual
        DataController.DetailKeyFieldNames = 'fakturjual'
        DataController.MasterKeyFieldNames = 'fakturjual'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object cxGrid1DBTableView2kodebarang: TcxGridDBColumn
          Caption = 'KODE BARANG'
          DataBinding.FieldName = 'kodebarang'
        end
        object cxGrid1DBTableView2namabarang: TcxGridDBColumn
          Caption = 'NAMA BARANG'
          DataBinding.FieldName = 'namabarang'
        end
        object cxGrid1DBTableView2satuan: TcxGridDBColumn
          Caption = 'SATUAN'
          DataBinding.FieldName = 'satuan'
        end
        object cxGrid1DBTableView2harga: TcxGridDBColumn
          Caption = 'HARGA'
          DataBinding.FieldName = 'harga'
        end
        object cxGrid1DBTableView2jumlah: TcxGridDBColumn
          Caption = 'JUMLAH'
          DataBinding.FieldName = 'jumlah'
        end
        object cxGrid1DBTableView2diskonpersen: TcxGridDBColumn
          Caption = 'DISKON 1'
          DataBinding.FieldName = 'diskonpersen'
        end
        object cxGrid1DBTableView2diskon2: TcxGridDBColumn
          Caption = 'DISKON 2'
          DataBinding.FieldName = 'diskon2'
        end
        object cxGrid1DBTableView2diskon3: TcxGridDBColumn
          Caption = 'DISKON 3'
          DataBinding.FieldName = 'diskon3'
        end
        object cxGrid1DBTableView2subtotal: TcxGridDBColumn
          Caption = 'SUBTOTAL'
          DataBinding.FieldName = 'subtotal'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
end
