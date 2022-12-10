object FbayarPiutangTitip: TFbayarPiutangTitip
  Left = 0
  Top = 0
  Caption = 'Pembayaran Piutang'
  ClientHeight = 540
  ClientWidth = 1015
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object cxGroupBox1: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    TabOrder = 0
    DesignSize = (
      1009
      102)
    Height = 102
    Width = 1009
    object Label1: TLabel
      Left = 16
      Top = 48
      Width = 46
      Height = 16
      Caption = 'No Bukti'
    end
    object Label2: TLabel
      Left = 16
      Top = 76
      Width = 46
      Height = 16
      Caption = 'Tanggal'
    end
    object Label3: TLabel
      Left = 68
      Top = 76
      Width = 5
      Height = 16
      Caption = ':'
    end
    object Label4: TLabel
      Left = 68
      Top = 48
      Width = 5
      Height = 16
      Caption = ':'
    end
    object Label5: TLabel
      Left = 224
      Top = 48
      Width = 59
      Height = 16
      Caption = 'Pelanggan'
    end
    object Label6: TLabel
      Left = 224
      Top = 76
      Width = 65
      Height = 16
      Caption = 'Keterangan'
    end
    object Label7: TLabel
      Left = 304
      Top = 48
      Width = 5
      Height = 16
      Caption = ':'
    end
    object Label8: TLabel
      Left = 304
      Top = 76
      Width = 5
      Height = 16
      Caption = ':'
    end
    object dxBevel1: TdxBevel
      Left = 8
      Top = 14
      Width = 993
      Height = 28
      Anchors = [akLeft, akTop, akRight]
      Shape = dxbsLineBottom
      ExplicitWidth = 900
    end
    object Enobukti: TcxTextEdit
      Left = 80
      Top = 45
      Properties.ReadOnly = True
      TabOrder = 0
      Width = 129
    end
    object dttanggal: TcxDateEdit
      Left = 80
      Top = 73
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 129
    end
    object Epelanggan: TcxTextEdit
      Left = 316
      Top = 45
      TabOrder = 2
      Width = 213
    end
    object Ekodepelanggan: TcxTextEdit
      Left = 535
      Top = 45
      TabOrder = 3
      Width = 84
    end
    object Eketerangan: TcxTextEdit
      Tag = 1
      Left = 316
      Top = 73
      TabOrder = 4
      Width = 423
    end
    object btnCariPelanggan: TcxButton
      Left = 625
      Top = 45
      Width = 117
      Height = 27
      Caption = 'Cari [ Ctrl + C ]'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E0000000000000000000000000000000000000000
        000000000000000000000000000F4C4C4CC7626262FF343B9EFF2D3697FF262D
        8DFF1F2681FF181E74FF121767FF414141FF303030BD00000000000000000000
        000000000000000000030D0D0D39787878FFDCDCDCFF3941A2FF5B65CEFF4E57
        C2FF3E47B1FF31389EFF171D72FFA1A1A1FF4C4C4CFF00000000000000000000
        0000000000000000000514141450808080FFDEDEDEFF656BB2FF3840A2FF333B
        9EFF2C3595FF252D8AFF43488AFFA5A5A5FF525252FF5D4B3BBD79604BFF7D54
        3CFF7A5037FF754B31FF644331FF7B7B7BFFDFDFDFFFDCDCDCFF1F277EFFCECE
        CEFFC6C6C6FF171D6EFFB3B3B3FFAAAAAAFF434343D28D7563FFE0DCD8FF9B79
        65FFCC9F84FFC2967BFFA77F66FF736861FF959595FFD8D8D8FF242D85FFCCCC
        CCFFC3C3C3FF1C2275FFB2B2B2FF6D6D6DFF1C1C1C68947F6DFFE2DEDAFFB299
        89FF9A7864FF926E58FF86624CFF74523EFF695B52FF6D6F71FF253B80FF3A56
        7AFE375478FE1E3275FF505254F21A1A1A5A00000000796657D2E3DFDBFFE0DD
        D8FF926953FFD3CFCAFFCBC7C1FF794D34FFA5A09AFF556272FF607A9AFF7BA5
        C6FF4F89B8FF2E5B88FF0F1E30780000000000000000372D2468A59384FFDDD8
        D3FF9B755FFFD2CCC7FFC9C5BEFF81563DFFA19C96FF2F4968FFB6C2D1FF7FBE
        E3FF6EB0DBFF4D86B2FF173152C20000000100000000000000002F261F5A7B67
        58F25F5A63FF3C5678FE395476FE50494FFF465154F834739EFE65A1C5FF3B80
        ADFF316F9FFF346D9EFF1F4877FB060F1C450000000000000000000000001422
        3475607A9AFF7BA5C6FF4F89B8FF284E75FF4198C1FD5FCDE3FF61DFEFFF5AEB
        FAFF4EE0F9FF3DBFE5FF2B93C4FF15386EF80000000200000000000000001C38
        59BEB6C2D1FF7FBEE3FF6EB0DBFF43759BFF317094F574B0D1FF69A7C9FF3D86
        B2FF2F77A7FF2776ABFF1D65A1FF0D254CBB00000004000000001128323F3474
        9FFB67A4C7FF3D84B1FF3375A4FF346A99FF214C71FD6392AEF3ADC9DDFFC5EB
        F3FF87DFF1FF3A9CCCFF1E5785E4050D1B5100000003000000004299C2F75FCF
        E4FF62E0EFFF5BEBFAFF4EE1F9FF3DBEE4FF2989B5FF1D466EFB204B67C62861
        8DF0235483EE133252B807111F5B0000000900000001000000002E6B89B276B4
        D3FF6BAACCFF448CB7FF377DACFF2A7CAFFF216DA6FF123052B70000001B0000
        0024000000200000001400000008000000010000000000000000112732406699
        B4DAB1D1E3FFE7F0F5FFBFE9F4FF61B1D6FF266896DA09152240000000000000
        0000000000000000000000000000000000000000000000000000000000001127
        324026597399347AA3E030729BE01D4764990B1B274000000000000000000000
        00000000000000000000000000000000000000000000}
      TabOrder = 5
      OnClick = btnCariPelangganClick
    end
    object cxLabel5: TcxLabel
      Left = 6
      Top = 6
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'TRANSAKSI PELUNASAN PIUTANG'
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
      Width = 840
    end
  end
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 111
    Width = 1009
    Height = 160
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dtrx.Dpiutang
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,###'
          Kind = skSum
          Column = cxGrid1DBTableView1kekurangan
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.Header = cxStyle1
      object cxGrid1DBTableView1fakturjual: TcxGridDBColumn
        Caption = 'FAKTUR JUAL'
        DataBinding.FieldName = 'fakturjual'
      end
      object cxGrid1DBTableView1tglinput: TcxGridDBColumn
        Caption = 'TGL NOTA'
        DataBinding.FieldName = 'tglinput'
      end
      object cxGrid1DBTableView1namapelanggan: TcxGridDBColumn
        Caption = 'PELANGGAN'
        DataBinding.FieldName = 'namapelanggan'
        Width = 150
      end
      object cxGrid1DBTableView1totalpiutang: TcxGridDBColumn
        Caption = 'PIUTANG'
        DataBinding.FieldName = 'piutang'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
        Width = 80
      end
      object cxGrid1DBTableView1dibayar: TcxGridDBColumn
        Caption = 'DIBAYAR'
        DataBinding.FieldName = 'dibayar'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
        Width = 80
      end
      object cxGrid1DBTableView1kekurangan: TcxGridDBColumn
        Caption = 'KEKURANGAN'
        DataBinding.FieldName = 'kekurangan'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###'
        Width = 80
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxGroupBox2: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 277
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      1009
      260)
    Height = 260
    Width = 1009
    object Label11: TLabel
      Left = 8
      Top = 90
      Width = 38
      Height = 16
      Caption = 'BAYAR'
    end
    object Label12: TLabel
      Left = 113
      Top = 90
      Width = 5
      Height = 16
      Caption = ':'
    end
    object Label15: TLabel
      Left = 8
      Top = 26
      Width = 51
      Height = 16
      Caption = 'PIUTANG'
    end
    object Label16: TLabel
      Left = 113
      Top = 26
      Width = 5
      Height = 16
      Caption = ':'
    end
    object Label13: TLabel
      Left = 8
      Top = 149
      Width = 83
      Height = 16
      Caption = 'SISA PIUTANG'
    end
    object Label14: TLabel
      Left = 113
      Top = 149
      Width = 5
      Height = 16
      Caption = ':'
    end
    object Label17: TLabel
      Left = 320
      Top = 27
      Width = 74
      Height = 16
      Caption = 'CARA BAYAR'
    end
    object Label18: TLabel
      Left = 432
      Top = 27
      Width = 5
      Height = 16
      Caption = ':'
    end
    object Label19: TLabel
      Left = 320
      Top = 56
      Width = 65
      Height = 16
      Caption = 'AKUN BANK'
    end
    object Label20: TLabel
      Left = 432
      Top = 56
      Width = 5
      Height = 16
      Caption = ':'
    end
    object LNOGIRO: TLabel
      Left = 696
      Top = 27
      Width = 4
      Height = 16
    end
    object Label9: TLabel
      Left = 8
      Top = 58
      Width = 99
      Height = 16
      Caption = 'DISKON PIUTANG'
    end
    object Label10: TLabel
      Left = 113
      Top = 58
      Width = 5
      Height = 16
      Caption = ':'
    end
    object Ebayar: TcxTextEdit
      Left = 124
      Top = 87
      Properties.OnChange = EbayarPropertiesChange
      TabOrder = 1
      Width = 185
    end
    object btnTutup: TcxButton
      Left = 160
      Top = 223
      Width = 141
      Height = 37
      Anchors = [akLeft, akBottom]
      Caption = 'Tutup '#13#10'[ ESC ]'
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
      TabOrder = 4
      OnClick = btnTutupClick
    end
    object btnSimpan: TcxButton
      Left = 6
      Top = 223
      Width = 148
      Height = 37
      Anchors = [akLeft, akBottom]
      Caption = 'Simpan '#13#10'[ Ctrl + S ]'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E0000000000000000000000000000000000000000
        000000000002000000070000000C0000001000000012000000110000000E0000
        0008000000020000000000000000000000000000000000000000000000010000
        0004000101120D2A1D79184E36C6216B4BFF216B4BFF216C4BFF1A533AD20F2F
        218400010115000000050000000100000000000000000000000000000005050F
        0A351C5B40DC24805CFF29AC7EFF2CC592FF2DC894FF2DC693FF2AAE80FF2585
        60FF1A563DD405110C3D00000007000000010000000000000003040E0A312065
        48ED299D74FF2FC896FF2EC996FF56D4ACFF68DAB5FF3BCD9DFF30C996FF32CA
        99FF2BA479FF227050F805110C3D00000005000000000000000A1A573DD02EA5
        7CFF33CA99FF2EC896FF4CD2A8FF20835CFF00673BFF45BE96FF31CB99FF31CB
        98FF34CC9CFF31AD83FF1B5C41D300010113000000020B23185E2E8A66FF3BCD
        9EFF30CA97FF4BD3A9FF349571FF87AF9DFFB1CFC1FF238A60FF45D3A8FF36CF
        9FFF33CD9BFF3ED0A3FF319470FF0F32237F00000007184D37B63DB38CFF39CD
        9FFF4BD5A9FF43A382FF699782FFF8F1EEFFF9F3EEFF357F5DFF56C4A1FF43D5
        A8FF3ED3A4FF3CD1A4FF41BC95FF1B5C43CD0000000B1C6446DF4BCAA4FF44D2
        A8FF4FB392FF4E826AFFF0E9E6FFC0C3B5FFEFE3DDFFCEDDD4FF1B754FFF60DC
        B8FF48D8ACFF47D6AAFF51D4ACFF247A58F80000000E217050F266D9B8FF46D3
        A8FF0B6741FFD2D2CBFF6A8F77FF116B43FF73967EFFF1E8E3FF72A28BFF46A6
        85FF5EDFBAFF4CD9AFFF6BE2C2FF278460FF020604191E684ADC78D9BEFF52DA
        B1FF3DBA92FF096941FF2F9C76FF57DEB8FF2D9973FF73967EFFF0EAE7FF4F88
        6CFF5ABB9AFF5BDEB9FF7FE2C7FF27835FF80000000C19523BAB77C8B0FF62E0
        BCFF56DDB7FF59DFBAFF5CE1BDFF5EE2BEFF5FE4C1FF288C67FF698E76FFE6E1
        DCFF176B47FF5FD8B4FF83D5BDFF1E674CC60000000909201747439C7BFF95EC
        D6FF5ADFBAFF5EE2BDFF61E4BFFF64E6C1FF67E6C5FF67E8C7FF39A17EFF1F6D
        4AFF288B64FF98EFD9FF4DAC8CFF1036286D00000004000000041C5F46B578C6
        ADFF9AEED9FF65E5C0FF64E7C3FF69E7C6FF6BE8C8FF6CE9C9FF6BEAC9FF5ED6
        B6FF97EDD7FF86D3BBFF237759D20102010C0000000100000001030A0718247B
        5BDA70C1A8FFB5F2E3FF98F0DAFF85EDD4FF75EBCEFF88EFD6FF9CF2DDFFBAF4
        E7FF78CDB3FF2A906DEA0615102E00000002000000000000000000000001030A
        07171E694FB844AB87FF85D2BBFFA8E6D6FFC5F4EBFFABE9D8FF89D8C1FF4BB6
        92FF237F60CB05130E2700000003000000000000000000000000000000000000
        0001000000030A241B411B60489D258464CF2C9D77EE258867CF1F7156B00E32
        26560000000600000002000000000000000000000000}
      TabOrder = 5
      OnClick = btnSimpanClick
    end
    object Eterbilang: TcxTextEdit
      Left = 124
      Top = 117
      Enabled = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.Color = clWhite
      StyleDisabled.TextColor = clRed
      TabOrder = 2
      Width = 529
    end
    object EjumlahPiutang: TcxTextEdit
      Left = 124
      Top = 25
      Enabled = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.Color = clWhite
      StyleDisabled.TextColor = clRed
      TabOrder = 0
      Width = 185
    end
    object Esisapiutang: TcxTextEdit
      Left = 124
      Top = 146
      Enabled = False
      TabOrder = 3
      Width = 185
    end
    object cbCaraBayar: TcxComboBox
      Left = 445
      Top = 24
      Properties.Items.Strings = (
        'TUNAI'
        'TRANSFER'
        'CEK/GIRO')
      Properties.OnCloseUp = cbCaraBayarPropertiesCloseUp
      TabOrder = 6
      Text = 'TRANSFER'
      Width = 245
    end
    object cbAKun: TcxComboBox
      Left = 445
      Top = 53
      TabOrder = 7
      Text = 'TRANSFER'
      Width = 245
    end
    object EDiskonPiutang: TcxTextEdit
      Tag = 1
      Left = 124
      Top = 55
      TabOrder = 8
      OnKeyUp = EDiskonPiutangKeyUp
      Width = 185
    end
    object cCetak: TCheckBox
      Left = 320
      Top = 96
      Width = 97
      Height = 17
      Caption = 'Cetak Struk'
      TabOrder = 9
    end
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
      TextColor = clBlack
    end
  end
  object jprint1: TJPRINTER
    Version = '1.1.1 Final'
    Author = 'http://edysoftware.com'
    Left = 656
    Top = 112
  end
end
