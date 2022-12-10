object FpenerimaanBarang: TFpenerimaanBarang
  Left = 0
  Top = 0
  Caption = 'Penerimaan Barang'
  ClientHeight = 477
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object G1: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    TabOrder = 0
    Height = 102
    Width = 794
    object Label1: TLabel
      Left = 8
      Top = 13
      Width = 46
      Height = 16
      Caption = 'No Bukti'
      Transparent = True
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 46
      Height = 16
      Caption = 'Tanggal'
      Transparent = True
    end
    object Label3: TLabel
      Left = 80
      Top = 13
      Width = 5
      Height = 16
      Caption = ':'
      Transparent = True
    end
    object Label4: TLabel
      Left = 80
      Top = 40
      Width = 5
      Height = 16
      Caption = ':'
      Transparent = True
    end
    object Label8: TLabel
      Left = 339
      Top = 13
      Width = 5
      Height = 16
      Caption = ':'
      Transparent = True
    end
    object Label9: TLabel
      Left = 257
      Top = 40
      Width = 18
      Height = 16
      Caption = 'Ket'
      Transparent = True
    end
    object Label10: TLabel
      Left = 339
      Top = 40
      Width = 5
      Height = 16
      Caption = ':'
      Transparent = True
    end
    object Label7: TLabel
      Left = 80
      Top = 68
      Width = 5
      Height = 16
      Caption = ':'
      Transparent = True
    end
    object Label11: TLabel
      Left = 8
      Top = 68
      Width = 51
      Height = 16
      Caption = 'Bukti Beli'
      Transparent = True
    end
    object Label6: TLabel
      Left = 257
      Top = 13
      Width = 47
      Height = 16
      Caption = 'Supplier'
      Transparent = True
    end
    object Label5: TLabel
      Left = 257
      Top = 67
      Width = 76
      Height = 16
      Caption = 'No Order Beli'
      Transparent = True
    end
    object Label12: TLabel
      Left = 339
      Top = 67
      Width = 5
      Height = 16
      Caption = ':'
      Transparent = True
    end
    object ENobukti: TcxTextEdit
      Left = 96
      Top = 10
      TabOrder = 0
      Width = 154
    end
    object dtbukti: TcxDateEdit
      Left = 96
      Top = 37
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 154
    end
    object Eketerangan: TcxTextEdit
      Tag = 1
      Left = 349
      Top = 37
      TabOrder = 2
      Width = 440
    end
    object EKodeSupplier: TcxTextEdit
      Left = 601
      Top = 10
      TabOrder = 3
      Width = 188
    end
    object ENoOrder: TcxTextEdit
      Tag = 1
      Left = 96
      Top = 64
      TabOrder = 4
      Width = 121
    end
    object ESupplier: TcxTextEdit
      Left = 349
      Top = 10
      TabOrder = 5
      Width = 242
    end
    object ENoOrderBeli: TcxTextEdit
      Tag = 1
      Left = 349
      Top = 64
      TabOrder = 6
      Width = 167
    end
    object btnCariBeli: TcxButton
      Left = 219
      Top = 64
      Width = 31
      Height = 24
      Caption = '...'
      TabOrder = 7
      OnClick = btnCariBeliClick
    end
  end
  object G3: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 344
    Align = alBottom
    PanelStyle.Active = True
    TabOrder = 1
    DesignSize = (
      794
      130)
    Height = 130
    Width = 794
    object btnSimpan: TcxButton
      Left = 3
      Top = 90
      Width = 140
      Height = 34
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Simpan'#13#10'[ Ctrl + S ]'
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000040000000F000000110000
        000B000000040000000100000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000E431B10FF31130BE1190A
        0598030407420000000C00000002000000000000000000000000000000000000
        0000000000000000000000000000000000000000000D673C29DCB8C7D2FF7789
        A3FF224084FF040F34960000000F000000020000000000000000000000000000
        0000000000000000000000000000000000000000000841261A91869AB3FFC7E3
        F6FF1B65B9FF286BABFF041237950000000E0000000200000000000000000000
        000000000000000000000000000000000000000000031013163E458BC6FFDDFE
        FDFF4DB4E6FF1B67BAFF2E73B1FF051439940000000D00000002000000000000
        00000000000000000000000000000000000000000001000000081B44628D439F
        D5FFDDFEFDFF55C0ECFF1D6ABCFF337BB6FF06163B920000000CA5A5A5A7A1A1
        A1A9A1A1A1A9A5A5A5A74C4C4C4DBBBBBBC0B8B8B8C1B8B8B8C1B1B1B1C46D96
        B5E348A5D8FFDDFEFDFF5DCBF2FF206EBFFF3883BCFF07193E90A1A1A1A8744E
        42F7744E42F7B8B8B8C18989898E94847EDC6A4132FF978883D86A4032FF7457
        4DF04F6981FC4BABDAFFDDFEFDFF64D5F7FF2474C1FF3C8BC1FFA2A2A2A89275
        6BE86E4332FFA6A19ECCB2B2B2C38C695CF0734737FFAAA7A6C97B4E3EFF7D51
        3FFF917C76E259758FF64EAFDDFFDDFEFDFF6BDEFBFF287AC5FF72727275A79A
        95D3744534FF704232FF7E4F3CFF845342FF7C584BF4B2B2B2C4835342FF8563
        56F0B5B5B5C2ABA8A6C853667DFF51B2DFFFDDFEFDFF4CA7D7FF33333334B5B1
        B0C6895541FF8F6556F49A8279E182513EFF8E756CE3B5B5B5C27F4F3DFF7F5D
        52F0B7B7B7C2B1AEACC77B4E3CFF58728AF8327FBFFF163A5A860D0D0D0DBBBB
        BBC1916A5BEF855848F79F8A82DC804D3AFFA49792D2B8B8B8C284503DFF7443
        32FF947E76E0937366EC7F4E3DFF927D75DF8888889000000003000000008A8A
        8A8DA2887EDF824C37FF956D5DF0804F3DFBBABABAC1BABABAC18B5540FF8558
        48F78C6253F38C5C48FB916F62EBBBBBBBC15959595A00000000000000005959
        595AB0A5A1CD8B533CFF8E5740FF8B6154EFAFAFAFB3BBBBBBC18A543FFF926A
        5CEFACACACB5AFAFAFB4AFAFAFB37F7F7F800000000000000000000000002626
        2626BCBCBCC0966450F78B523BFFA18A83DA8B8B8B8DBCBCBCC08B513DFF8C63
        54EF8A8A8A8D0000000000000000000000000000000000000000000000000000
        0000A5A5A5A6BDBDBDC0BDBDBDC0BEBEBEC04C4C4C4CBEBEBEBFBDBDBDC0BDBD
        BDC08B8B8B8C0000000000000000000000000000000000000000}
      TabOrder = 0
      WordWrap = True
      OnClick = btnSimpanClick
    end
    object btnTutup: TcxButton
      Left = 149
      Top = 90
      Width = 166
      Height = 34
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Tutup '#13#10'[ ESC ]'
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000030000
        000B000000120000001300000013000000140000001400000014000000140000
        0014000000140000001500000015000000140000000D000000030000000B1C11
        6CC3261796FF271696FF261695FF261594FF251594FF251594FF241394FF2412
        93FF241292FF231292FF231192FF231191FF190C68C50000000C0000000F2B1C
        9BFF384AD3FF2637CEFF3042D2FF4254D9FF3646D4FF2437CCFF2434CCFF3444
        D3FF3C4ED6FF2A3ACEFF202FC9FF1E2CC9FF251595FF000000120000000F3121
        A0FF4356D7FF374BD5FF3F4BCBFF2827ABFF363CBEFF3E4FD6FF3D4ED5FF353A
        BEFF2827ABFF3B45C9FF2F41D0FF2332CCFF291A99FF000000120000000E3529
        A5FF4E62DBFF444FCCFF605DBDFFEDEDF8FF8B89CEFF383CBCFF383CBBFF8B89
        CEFFEDEDF8FF5F5DBDFF3D47C9FF293ACEFF2D1F9EFF000000110000000D392F
        ABFF596FDFFF2722A5FFECE7ECFFF5EBE4FFF8F2EEFF9491D1FF9491D1FFF8F1
        EDFFF3E9E2FFECE6EBFF2721A5FF2F42D1FF3326A3FF0000000F0000000C4036
        B1FF657AE2FF3135B7FF8070ADFFEBDBD3FFF4EAE4FFF7F2EDFFF8F1EDFFF4E9
        E2FFEADAD1FF7F6FACFF2E31B6FF3549D5FF372CA9FF0000000E0000000B453D
        B6FF6E83E5FF485EDCFF393BB7FF8A7FB9FFF6ECE7FFF5ECE6FFF4EBE5FFF6EB
        E5FF897DB8FF3739B6FF4054D9FF3D51D7FF3C33AFFF0000000D0000000A4A44
        BCFF788FE8FF6077E3FF4B4BBBFF9189C7FFF7EFE9FFF6EEE9FFF6EFE8FFF7ED
        E8FF9087C5FF4949BAFF596FDFFF4359DAFF423AB4FF0000000C00000009504C
        C2FF92A7EEFF5655BCFF8F89CAFFFBF6F4FFF7F1ECFFEDE1D9FFEDE0D9FFF7F0
        EAFFFAF5F2FF8F89CAFF5453BCFF6278E2FF4943B9FF0000000B000000086B6A
        D0FFADC1F4FF2A1E9BFFE5DADEFFF6EEEBFFEDDFDAFF816EA9FF816EA9FFEDDF
        D8FFF4ECE7FFE5D9DCFF2A1D9BFF8B9EEBFF6563C9FF0000000A000000077577
        D6FFB1C6F5FF6E77D1FF5747A1FFCCB6BCFF7A68A8FF4E4CB7FF4F4EB8FF7A68
        A8FFCBB5BCFF5746A1FF6B75D0FF8EA1ECFF706ED0FF0000000900000006797B
        DAFFB5CAF6FF93A7EEFF7079D2FF2E229BFF5453BBFF93A7EEFF93A7EEFF5555
        BCFF2E219BFF6F77D1FF91A4EDFF90A3EDFF7475D4FF00000008000000057D80
        DEFFB9CDF6FFB9CDF6FFB9CCF6FFB9CCF6FFB9CDF6FFB8CCF6FFB8CCF6FFB7CC
        F6FFB7CBF6FFB6CBF6FFB5C9F6FFB5C9F6FF787AD8FF00000006000000036062
        A6C08184E1FF8183E0FF8083E0FF7F83DFFF7F83DFFF7F82DFFF7E81DFFF7E81
        DEFF7D81DEFF7D80DEFF7D7FDEFF7C7FDDFF5C5EA3C100000004000000000000
        0002000000030000000400000004000000040000000400000004000000040000
        0004000000040000000400000005000000050000000300000001}
      TabOrder = 1
      OnClick = btnTutupClick
    end
  end
  object sg1: TAdvStringGrid
    AlignWithMargins = True
    Left = 3
    Top = 111
    Width = 794
    Height = 227
    Cursor = crDefault
    Align = alClient
    DrawingStyle = gdsClassic
    ScrollBars = ssBoth
    TabOrder = 2
    OnKeyUp = sg1KeyUp
    OnSelectCell = sg1SelectCell
    OnGetEditorType = sg1GetEditorType
    OnGetEditorProp = sg1GetEditorProp
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
end
