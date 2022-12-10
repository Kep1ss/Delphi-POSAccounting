object FpilihSatuan: TFpilihSatuan
  Left = 0
  Top = 0
  Caption = 'Pilih Satuan'
  ClientHeight = 340
  ClientWidth = 640
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
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 640
    Height = 340
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnKeyUp = cxGrid1DBTableView1KeyUp
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dm.DmultiSatuan
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
      OptionsView.DataRowHeight = 40
      OptionsView.GroupByBox = False
      OptionsView.HeaderEndEllipsis = True
      OptionsView.HeaderHeight = 40
      OptionsView.RowSeparatorColor = 33023
      object cxGrid1DBTableView1satuan: TcxGridDBColumn
        Caption = 'SATUAN'
        DataBinding.FieldName = 'satuan'
      end
      object cxGrid1DBTableView1isi: TcxGridDBColumn
        Caption = 'ISI'
        DataBinding.FieldName = 'isi'
      end
      object charga: TcxGridDBColumn
        Caption = 'HARGA'
        DataBinding.FieldName = 'harga'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
        Width = 100
      end
      object cHargabeli: TcxGridDBColumn
        Caption = 'HARGA BELI'
        DataBinding.FieldName = 'hargabeli'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
      end
      object cPromo1: TcxGridDBColumn
        Caption = 'PROMO 1'
        DataBinding.FieldName = 'hargapromo'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,###'
      end
      object cPromo2: TcxGridDBColumn
        Caption = 'PROMO 2'
        DataBinding.FieldName = 'hargapromo2'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,###'
      end
      object cPromo3: TcxGridDBColumn
        Caption = 'PROMO 3'
        DataBinding.FieldName = 'hargapromo3'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '#,###'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object sx1: TcxStyleRepository
    Left = 352
    Top = 88
    PixelsPerInch = 96
    object cxstyl1: TcxStyle
      AssignedValues = [svBitmap, svColor]
      Color = clRed
      Bitmap.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF747FC27984C4FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF606DBA1D34A90322AF0622AA0121B20622AA2A3FAD7883C3
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF707B
        C10622AA0325BB0226C10226C10226C10329C60329C60329C6042BBE1833AEFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5160B90223B60226C1
        0226C00226C10226C1042AC20329C60329C60329C6032BCA0533CC032CB6FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6774C30325BB0226C10226C1001EC300
        26C70329C60329C6032AC7032BCA0027C90027C9042ECA0539D10632BBFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF0121B20329C60226C11034C74561D50C32CA0026
        C7042FCC0533CC032AC72D55D53C62D80535CE0535CE0847D41A3DB9FFFFFFFF
        FFFFFFFFFF485AC1042AC20329C6001EC35570DAFFFFFFC2CDF2153ECF032BCA
        032BCA4D75DEF5F7FDE7EEFB0E44D2033DD00744D40744CCFFFFFFFFFFFFFFFF
        FF092BBA032AC70329C6032AC7193FCED4DDF7FFFFFFC7D3F41343D14D75DEFA
        FAFEFFFFFF84A6EA0243D3094CD50847D40A54D83B59C7FFFFFF6C7CD0042AC2
        032BCA042ECA0533CC032BCA1F4CD3D4DDF7FFFFFFD6E1F7F3F7FEFFFFFF8FAE
        EC0147D5084BD5094FD7094FD70B5ADB1749C9FFFFFF586ECF0530C7042FCC05
        33CC0539CE063CD00237CF1A51D5DDE6F9FFFFFFFFFFFF95B4EE0147D50752D7
        0A55D90A55D90A55D90862DE0B4CCFFFFFFF586ECF0535C90535CE0539CE063F
        D10742D2003BD14F7DE0ECF0FCFFFFFFFFFFFFBFD2F51861DC0255DA0C5EDC0C
        5EDC0C5EDC0E6BE10D52D3FFFFFF6D82D80535C9063FD1063FD10744D20243D3
        5382E2FAFAFEFFFFFF9ABBF0CDDDF8FFFFFFCADFF91C6CE00660DE0D65DF0D65
        DF0F72E41856D5FFFFFFFFFFFF0D3DCB0846D30744D20243D3366EDDFFFFFFFF
        FFFF90B5EF0053DA2170E1D5E4F9FFFFFFBBD5F60B6BE10E6CE10E6CE1107CE7
        3E68DAFFFFFFFFFFFF4968D8094CD5094CD50147D54F84E3E7EEFB8BB3EE0660
        DE0862DE0262DF267BE4CADFF9CBE1F91277E50F72E4107CE71676E4FFFFFFFF
        FFFFFFFFFFFFFFFF0846D30A55D90A55D90B5ADB1A68DE0660DE0B66DF0E6CE1
        0F72E4086FE31277E51B7FE81079E61079E6228EED2966DCFFFFFFFFFFFFFFFF
        FFFFFFFF6785E10C5EDC0C5EDC0C5EDC0862DE0E6BE10E6CE10F72E40F73E410
        7CE70E7BE70E7EE80E7EE82894EE2C7BE5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF507DE20D65DF0E6CE10E6BE10E6CE10F73E4107CE7107CE70E7EE80C81
        EA1389EC3EA0F03C89E785A7EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF739BE90E6CE1107CE7147EE8147EE81482E91788EB2291ED3B9FF056A6F0
        478CE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF659CEA2982E71B7FE82588EA3290EC3D92EB4F95EB80AEEEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF7AAFF07FB2F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
    end
    object cxstyl2: TcxStyle
    end
  end
end
