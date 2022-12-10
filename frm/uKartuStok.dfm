object FkartuStok: TFkartuStok
  Left = 0
  Top = 0
  Caption = 'Kartu Stok'
  ClientHeight = 450
  ClientWidth = 846
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object G1: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    TabOrder = 0
    Transparent = True
    DesignSize = (
      840
      78)
    Height = 78
    Width = 840
    object Label1: TLabel
      Left = 8
      Top = 48
      Width = 46
      Height = 13
      Caption = 'Periode : '
    end
    object Label2: TLabel
      Left = 168
      Top = 48
      Width = 17
      Height = 13
      Caption = 'S/D'
    end
    object dxBevel1: TdxBevel
      Left = 8
      Top = 14
      Width = 817
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Shape = dxbsLineBottom
    end
    object Label3: TLabel
      Left = 328
      Top = 48
      Width = 44
      Height = 13
      Caption = 'Gudang :'
    end
    object Dt1: TcxDateEdit
      Left = 60
      Top = 45
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnChange = Dt1PropertiesChange
      Properties.OnCloseUp = Dt1PropertiesCloseUp
      TabOrder = 0
      Width = 106
    end
    object dt2: TcxDateEdit
      Left = 193
      Top = 45
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnCloseUp = Dt1PropertiesCloseUp
      TabOrder = 1
      Width = 121
    end
    object cxLabel1: TcxLabel
      Left = 8
      Top = 3
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'KARTU STOK BARANG'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = 16744448
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = True
      Style.LookAndFeel.NativeStyle = True
      Style.Shadow = False
      Style.TextColor = 16751157
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      Properties.LabelEffect = cxleExtrude
      Properties.LabelStyle = cxlsRaised
      Properties.ShadowedColor = clHighlight
      Properties.WordWrap = True
      Height = 33
      Width = 747
    end
    object cbGudang: TcxComboBox
      Left = 378
      Top = 45
      Properties.OnCloseUp = cbGudangPropertiesCloseUp
      TabOrder = 3
      Width = 167
    end
  end
  object G2: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 406
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      840
      41)
    Height = 41
    Width = 840
    object btnBaru: TcxButton
      Left = 8
      Top = 12
      Width = 109
      Height = 26
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Refresh [ F5 ]'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E0000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000030000000B00000013000000190000001A000000140000
        000B000000030000000000000000000000000000000000000000000000000000
        0000000000060402011C4827118B7C431ED2A65927FFA55927FF7E441ED44223
        0F7B0100000F0000000E00000007000000000000000000000000000000000000
        0005120A05348A4F26DDC58A53FFDCB37CFFEFD298FFEFD198FFB67643FF2E1A
        0C62100904398F5127E10E05013A000000060000000000000000000000020402
        01198D552BDCD1A169FFF1D6A5FFCE9E6EFFC08656FFBD8251FF613A1DA60000
        00227D4B26CBE2B97BFF5F290FCF010100190000000300000000000000074C2F
        1B82C99765FFECD2A3FFB98154FB5238238A120C07300F0A0627020101194C2F
        1B88CE9D66FFF6DC9BFFBA8657FF3F1C0C910000000D000000000000000A8C5B
        36D0E3C598FFCB9D75FF573B258C0000000C000000030000000620140C43BD87
        5AFBF8E5BCFFF8DFA5FFF7E4BAFFA16540FC1C0E074C0000000800000014B37A
        4BFAF5E6BDFFBC8356FF0D0704300000000C000000030000000796663FD5B87D
        4DFFBB8153FFF2D9A1FFB87D4DFFB87C4DFF9C6941DE845331D3A2633BFFBB85
        57FFF6E7BFFFBF8B5EFFA06238FF87522FDC00000006000000020000000B0D08
        042FA1653CFFF4DEAEFFB68155FA000000180000000A1F170F34C79D75FBFBF5
        DCFFFCF3CCFFFAF4DAFFB3855FFB21150C41000000040000000200000009492C
        1886BA8B5EFFE7CEA7FF926B48CB00000009000000000000000455402D77DDC1
        A2FFFDF7D9FFD4B598FF5037227F0202010C0D08041F110A05274B2D1986A168
        3EFAF3E4C3FFD8B692FF533F2C78000000040000000000000000000000058F6F
        50BCEFE1CDFF886343C20202010D58382091A3693CFFA66F43FFBE946DFFF4E9
        D1FFE3CAADFFA47E5BD60504030E00000001000000000000000000000001130F
        0B1DAB8863DA18130E242C1E1248B78B63FDF8F3E2FFF9F3E4FFEDDEC7FFDCC1
        A1FFA3815ED215110C2200000002000000000000000000000000000000000000
        0001000000010101000342301E629A7B5CC2C6A078F9C6A078F9997B5DC35646
        34710504030A0000000100000000000000000000000000000000000000000000
        0000000000000000000000000001000000020000000200000002000000020000
        0001000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000}
      TabOrder = 0
    end
    object btnPrint: TcxButton
      Left = 121
      Top = 12
      Width = 113
      Height = 26
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Cetak [ F4 ]'
      DropDownMenu = pm2
      Kind = cxbkOfficeDropDown
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E0000000000000000000000000000000000000000
        0000000000030000000C00000012000000140000001400000015000000150000
        00140000000D0000000300000000000000000000000000000000000000000000
        000000000009896256C2BD8A78FFBE8A78FFBD8A78FFBD8978FFBD8978FFBE89
        78FF876356C30000000B000000000000000000000000000000030000000E0000
        001500000021C08D7CFFF6EEE9FFF5EDE9FFF5EDE9FFF5ECE8FFF4ECE8FFF5EC
        E7FFBF8D7BFF00000026000000180000000F000000040000000C7B5042C5A76E
        5BFF9F6755FFC2917FFFF7F0ECFFE2B47DFFE2B37AFFE1B077FFE0AE72FFF6EE
        EAFFC2907FFF845545FF895847FF613E32C70000000E00000011BB7E6BFFECD9
        CCFFE3CEBEFFC59483FFF9F2F0FFE4B984FFE3B781FFE3B47CFFE0B176FFF7F0
        EDFFC59483FFE0CBBCFFEBD8CBFFB67763FF0000001400000010BE8571FFF1E5
        DAFFECDBD0FF7A4835FF7A4835FF7A4835FF7A4835FF7A4835FF7A4835FF7A48
        35FF7A4835FFEBDBCFFFF1E2D8FFB97C69FF000000130000000EC28B78FFF5EE
        E7FFF2E7DDFFF2E7DEFFF3E7DEFFF2E5DEFFF3E5DEFFF2E7DDFFF2E7DDFFF2E7
        DEFFF2E7DDFFF2E5DEFFF5EDE6FFBC826EFF000000120000000CC7937FFFFAF4
        F1FFCDBEB8FF6F5448FF614337FF614035FF5F3F34FF5E3F33FF5D3D32FF5D3D
        34FF6A4C44FFCABCB6FFF9F5F1FFC18875FF000000100000000ACC9986FFFDFA
        FAFF7D6054FF745043FF744F43FF744E43FF734E43FF734E42FF724D42FF724C
        41FF724C40FF73584DFFFDFAFAFFC58F7CFF0000000E00000008CF9F8DFFFFFF
        FFFF7A5A4CFF8E695AFFF9F4F1FFF0E6E0FFF0E5DFFFEFE5DEFFEFE5DEFFF6EF
        EBFF866253FF704F43FFFFFFFFFFCA9683FF0000000B00000005BE9584E9F5EC
        E8FF866656FF977262FFFAF6F4FFF2E8E3FFF1E8E1FFF1E7E2FFF1E7E1FFF8F2
        EEFF8E6A5BFF7A5B4CFFF5EAE6FFBA8E7DEA000000080000000234292545A783
        75CC947262FFA07B6AFFFCF9F8FFF3EBE6FFF4EAE5FFF2EAE5FFF3EAE3FFF9F5
        F3FF977263FF876658FFA68072CE342823480000000300000000000000010000
        00030000000AC89B89FFFDFBFAFFF5EDE8FFF4EDE8FFF5EDE7FFF5ECE7FFFBF7
        F6FFC59685FF0000001100000004000000020000000000000000000000000000
        000000000005CA9E8DFFFEFCFCFFF7F0ECFFF6EFEBFFF7EFEBFFF5EFEAFFFCFA
        F8FFC89A89FF0000000900000000000000000000000000000000000000000000
        000000000003CDA291FFFEFEFDFFFEFDFDFFFEFDFCFFFEFCFCFFFEFCFBFFFDFB
        FAFFCB9F8DFF0000000700000000000000000000000000000000000000000000
        0000000000019A796DBFCFA493FFCEA493FFCEA493FFCEA492FFCDA391FFCDA3
        91FF98786BC100000004000000000000000000000000}
      TabOrder = 1
    end
    object btnTutup: TcxButton
      Left = 237
      Top = 12
      Width = 101
      Height = 26
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Tutup [ ESC ]'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E00000000000000000000000000030000000B0000
        0012000000130000001300000014000000140000001400000014000000140000
        00140000001500000015000000140000000D000000030000000B1C116CC32617
        96FF271696FF261695FF261594FF251594FF251594FF241394FF241293FF2412
        92FF231292FF231192FF231191FF190C68C50000000C0000000F2B1C9BFF384A
        D3FF2637CEFF3042D2FF4254D9FF3646D4FF2437CCFF2434CCFF3444D3FF3C4E
        D6FF2A3ACEFF202FC9FF1E2CC9FF251595FF000000120000000F3121A0FF4356
        D7FF374BD5FF3F4BCBFF2827ABFF363CBEFF3E4FD6FF3D4ED5FF353ABEFF2827
        ABFF3B45C9FF2F41D0FF2332CCFF291A99FF000000120000000E3529A5FF4E62
        DBFF444FCCFF605DBDFFEDEDF8FF8B89CEFF383CBCFF383CBBFF8B89CEFFEDED
        F8FF5F5DBDFF3D47C9FF293ACEFF2D1F9EFF000000110000000D392FABFF596F
        DFFF2722A5FFECE7ECFFF5EBE4FFF8F2EEFF9491D1FF9491D1FFF8F1EDFFF3E9
        E2FFECE6EBFF2721A5FF2F42D1FF3326A3FF0000000F0000000C4036B1FF657A
        E2FF3135B7FF8070ADFFEBDBD3FFF4EAE4FFF7F2EDFFF8F1EDFFF4E9E2FFEADA
        D1FF7F6FACFF2E31B6FF3549D5FF372CA9FF0000000E0000000B453DB6FF6E83
        E5FF485EDCFF393BB7FF8A7FB9FFF6ECE7FFF5ECE6FFF4EBE5FFF6EBE5FF897D
        B8FF3739B6FF4054D9FF3D51D7FF3C33AFFF0000000D0000000A4A44BCFF788F
        E8FF6077E3FF4B4BBBFF9189C7FFF7EFE9FFF6EEE9FFF6EFE8FFF7EDE8FF9087
        C5FF4949BAFF596FDFFF4359DAFF423AB4FF0000000C00000009504CC2FF92A7
        EEFF5655BCFF8F89CAFFFBF6F4FFF7F1ECFFEDE1D9FFEDE0D9FFF7F0EAFFFAF5
        F2FF8F89CAFF5453BCFF6278E2FF4943B9FF0000000B000000086B6AD0FFADC1
        F4FF2A1E9BFFE5DADEFFF6EEEBFFEDDFDAFF816EA9FF816EA9FFEDDFD8FFF4EC
        E7FFE5D9DCFF2A1D9BFF8B9EEBFF6563C9FF0000000A000000077577D6FFB1C6
        F5FF6E77D1FF5747A1FFCCB6BCFF7A68A8FF4E4CB7FF4F4EB8FF7A68A8FFCBB5
        BCFF5746A1FF6B75D0FF8EA1ECFF706ED0FF0000000900000006797BDAFFB5CA
        F6FF93A7EEFF7079D2FF2E229BFF5453BBFF93A7EEFF93A7EEFF5555BCFF2E21
        9BFF6F77D1FF91A4EDFF90A3EDFF7475D4FF00000008000000057D80DEFFB9CD
        F6FFB9CDF6FFB9CCF6FFB9CCF6FFB9CDF6FFB8CCF6FFB8CCF6FFB7CCF6FFB7CB
        F6FFB6CBF6FFB5C9F6FFB5C9F6FF787AD8FF00000006000000036062A6C08184
        E1FF8183E0FF8083E0FF7F83DFFF7F83DFFF7F82DFFF7E81DFFF7E81DEFF7D81
        DEFF7D80DEFF7D7FDEFF7C7FDDFF5C5EA3C10000000400000000000000020000
        0003000000040000000400000004000000040000000400000004000000040000
        00040000000400000005000000050000000300000001}
      TabOrder = 2
      OnClick = btnTutupClick
    end
  end
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 108
    Width = 314
    Height = 292
    Align = alLeft
    TabOrder = 2
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
    LookAndFeel.SkinName = 'LiquidSky'
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellClick = cxGrid1DBTableView1CellClick
      DataController.DataSource = dm.DBarang
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      Styles.Header = cxStyle1
      object cxGrid1DBTableView1kodebarang: TcxGridDBColumn
        Caption = 'KODE BARANG'
        DataBinding.FieldName = 'kodebarang'
        Width = 100
      end
      object cxGrid1DBTableView1namabarang: TcxGridDBColumn
        Caption = 'NAMA BARANG'
        DataBinding.FieldName = 'namabarang'
        Width = 200
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Epencarian: TcxTextEdit
    Left = 0
    Top = 84
    Align = alTop
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGray
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsItalic]
    Style.IsFontAssigned = True
    TabOrder = 3
    Text = 'Ketikan nama barang atau kode barang'
    OnEnter = EpencarianEnter
    OnKeyDown = EpencarianKeyDown
    Width = 846
  end
  object sg1: TAdvStringGrid
    Left = 320
    Top = 105
    Width = 526
    Height = 298
    Cursor = crDefault
    Align = alClient
    DrawingStyle = gdsClassic
    ScrollBars = ssBoth
    TabOrder = 4
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'Tahoma'
    ActiveCellFont.Style = [fsBold]
    ControlLook.FixedGradientHoverFrom = clGray
    ControlLook.FixedGradientHoverTo = clWhite
    ControlLook.FixedGradientDownFrom = clGray
    ControlLook.FixedGradientDownTo = clSilver
    ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
    ControlLook.DropDownHeader.Font.Color = clWindowText
    ControlLook.DropDownHeader.Font.Height = -11
    ControlLook.DropDownHeader.Font.Name = 'Tahoma'
    ControlLook.DropDownHeader.Font.Style = []
    ControlLook.DropDownHeader.Visible = True
    ControlLook.DropDownHeader.Buttons = <>
    ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
    ControlLook.DropDownFooter.Font.Color = clWindowText
    ControlLook.DropDownFooter.Font.Height = -11
    ControlLook.DropDownFooter.Font.Name = 'Tahoma'
    ControlLook.DropDownFooter.Font.Style = []
    ControlLook.DropDownFooter.Visible = True
    ControlLook.DropDownFooter.Buttons = <>
    Filter = <>
    FilterDropDown.Font.Charset = DEFAULT_CHARSET
    FilterDropDown.Font.Color = clWindowText
    FilterDropDown.Font.Height = -11
    FilterDropDown.Font.Name = 'Tahoma'
    FilterDropDown.Font.Style = []
    FilterDropDownClear = '(All)'
    FixedRowHeight = 22
    FixedFont.Charset = DEFAULT_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -11
    FixedFont.Name = 'Tahoma'
    FixedFont.Style = [fsBold]
    FloatFormat = '%.2f'
    PrintSettings.DateFormat = 'dd/mm/yyyy'
    PrintSettings.Font.Charset = DEFAULT_CHARSET
    PrintSettings.Font.Color = clWindowText
    PrintSettings.Font.Height = -11
    PrintSettings.Font.Name = 'Tahoma'
    PrintSettings.Font.Style = []
    PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
    PrintSettings.FixedFont.Color = clWindowText
    PrintSettings.FixedFont.Height = -11
    PrintSettings.FixedFont.Name = 'Tahoma'
    PrintSettings.FixedFont.Style = []
    PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
    PrintSettings.HeaderFont.Color = clWindowText
    PrintSettings.HeaderFont.Height = -11
    PrintSettings.HeaderFont.Name = 'Tahoma'
    PrintSettings.HeaderFont.Style = []
    PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
    PrintSettings.FooterFont.Color = clWindowText
    PrintSettings.FooterFont.Height = -11
    PrintSettings.FooterFont.Name = 'Tahoma'
    PrintSettings.FooterFont.Style = []
    PrintSettings.PageNumSep = '/'
    SearchFooter.FindNextCaption = 'Find &next'
    SearchFooter.FindPrevCaption = 'Find &previous'
    SearchFooter.Font.Charset = DEFAULT_CHARSET
    SearchFooter.Font.Color = clWindowText
    SearchFooter.Font.Height = -11
    SearchFooter.Font.Name = 'Tahoma'
    SearchFooter.Font.Style = []
    SearchFooter.HighLightCaption = 'Highlight'
    SearchFooter.HintClose = 'Close'
    SearchFooter.HintFindNext = 'Find next occurrence'
    SearchFooter.HintFindPrev = 'Find previous occurrence'
    SearchFooter.HintHighlight = 'Highlight occurrences'
    SearchFooter.MatchCaseCaption = 'Match case'
    Version = '6.0.4.4'
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 656
    Top = 32
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16756059
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TextColor = 16750383
    end
  end
  object pm2: TPopupMenu
    Left = 376
    Top = 208
    object mniF2: TMenuItem
      Caption = 'Format Laporan'
      ImageIndex = 5
      OnClick = mniF2Click
    end
    object mniF3: TMenuItem
      Caption = 'Format Excel'
      ImageIndex = 4
      OnClick = mniF3Click
    end
  end
end
