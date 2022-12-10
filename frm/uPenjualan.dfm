object FPenjualanBarang: TFPenjualanBarang
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Penjualan Barang'
  ClientHeight = 546
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object G1: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    PanelStyle.Active = True
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.LookAndFeel.SkinName = 'TheAsphaltWorld'
    Style.TransparentBorder = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.SkinName = 'TheAsphaltWorld'
    TabOrder = 0
    DesignSize = (
      994
      115)
    Height = 115
    Width = 994
    object Label1: TLabel
      Left = 5
      Top = 8
      Width = 46
      Height = 16
      Caption = 'No Bukti'
      Transparent = True
    end
    object Label2: TLabel
      Left = 5
      Top = 35
      Width = 46
      Height = 16
      Caption = 'Tanggal'
      Transparent = True
    end
    object Label3: TLabel
      Left = 5
      Top = 63
      Width = 33
      Height = 16
      Caption = 'Cust .'
      Transparent = True
    end
    object Label4: TLabel
      Left = 57
      Top = 8
      Width = 5
      Height = 16
      Caption = ':'
      Transparent = True
    end
    object Label5: TLabel
      Left = 57
      Top = 35
      Width = 5
      Height = 16
      Caption = ':'
      Transparent = True
    end
    object Label6: TLabel
      Left = 57
      Top = 63
      Width = 5
      Height = 16
      Caption = ':'
      Transparent = True
    end
    object Label7: TLabel
      Left = 205
      Top = 8
      Width = 71
      Height = 16
      Caption = 'Pembayaran'
      Transparent = True
    end
    object Label8: TLabel
      Left = 205
      Top = 35
      Width = 40
      Height = 16
      Caption = 'Tempo'
      Transparent = True
    end
    object Label9: TLabel
      Left = 293
      Top = 8
      Width = 5
      Height = 16
      Caption = ':'
      Transparent = True
    end
    object Label10: TLabel
      Left = 293
      Top = 35
      Width = 5
      Height = 16
      Caption = ':'
      Transparent = True
    end
    object Label11: TLabel
      Left = 304
      Top = 91
      Width = 43
      Height = 16
      Caption = 'Gudang'
      Transparent = True
    end
    object Label12: TLabel
      Left = 357
      Top = 91
      Width = 5
      Height = 16
      Caption = ':'
      Transparent = True
    end
    object lbl6: TLabel
      Left = 5
      Top = 91
      Width = 40
      Height = 16
      Caption = 'Alamat'
      Transparent = True
    end
    object lbl7: TLabel
      Left = 57
      Top = 91
      Width = 5
      Height = 16
      Caption = ':'
      Transparent = True
    end
    object Label14: TLabel
      Left = 304
      Top = 118
      Width = 51
      Height = 16
      Caption = 'Tgl Kirim'
      Visible = False
    end
    object Label23: TLabel
      Left = 357
      Top = 118
      Width = 5
      Height = 16
      Caption = ':'
      Transparent = True
      Visible = False
    end
    object Label24: TLabel
      Left = 473
      Top = 115
      Width = 75
      Height = 16
      Caption = 'NOMER PO : '
      Visible = False
    end
    object Lkasir: TLabel
      Left = 940
      Top = 8
      Width = 49
      Height = 19
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Lkasir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 966
    end
    object Enobukti: TcxTextEdit
      Left = 77
      Top = 5
      Enabled = False
      TabOrder = 0
      Text = 'Enobukti'
      Width = 105
    end
    object ENamaCust: TcxTextEdit
      Left = 77
      Top = 60
      TabOrder = 1
      Width = 221
    end
    object cbPembayaran: TcxComboBox
      Left = 304
      Top = 5
      Properties.Items.Strings = (
        'CASH'
        'KREDIT')
      Properties.OnChange = cbPembayaranPropertiesChange
      TabOrder = 2
      Text = 'cbPembayaran'
      Width = 156
    end
    object cbTempo: TcxComboBox
      Tag = 1
      Left = 304
      Top = 32
      Properties.Items.Strings = (
        '7 Hari'
        '12 Hari'
        '14 Hari'
        '21 Hari'
        '30 Hari')
      TabOrder = 3
      Text = 'cxComboBox1'
      Width = 156
    end
    object btnCariSupplier: TcxButton
      Left = 419
      Top = 60
      Width = 42
      Height = 23
      Caption = '....'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E0000000000000000000000000000000000000000
        000100000002000000080000000C0000000F0000000F0000000D000000070000
        0004000000070000000700000002000000000000000000000000000000010000
        00050204031C102F2291184A34D31E5C41FF1E5B40FF184732D2112F227D0000
        000E14382995072C1B9500000009000000010000000000000001000000080A1C
        145722674CE723966DFF23B481FF24CA92FF39CF9DFF37886AFF0C21185D0610
        0C392A7B5CFB146744FB020C08370000000400000000000000060D251C652E88
        67FF28B586FF3BDAA8FF59E0B7FF6FE5C2FF5FC6A6FF1F533FBF000000161E52
        3DBF27B786FF1EB07DFF0C3E28BF0000000C00000001040A0822308062F62BBA
        8BFF42DDADFF65CEADFF53AB8EFF3A8B6EFF2F7D60FA07120D360E241B5D2F96
        71FF28D59EFF28D59EFF1D805AFF051B125C00000005194434903CAC88FF2DDA
        A5FF5ECFAEFF45987CF914362A750409072002050415010302162B7357E12ACC
        98FF29D8A1FF2AD7A0FF26C592FF145438E00001010F2A7258D438C79BFF30DD
        A9FF5CB699FF194133810000000700000001000000061941328460B89CFF83EC
        CFFF2BDAA5FF34DBA8FF88EDD0FF479D7FFF0B2A1C77358C6DF250DFB6FF61E8
        C2FF3F9475FF040A081E00000002000000000205040F36896CF4378F70FF419A
        7BFF30DCA8FF38D7A7FF358A6BFF34886AFF317E61EF3B997AFA98EDD8FF8DF1
        D8FF398E6DFF040B082000000001000000000000000200000007020504193F96
        75FF43E2B3FF4DDAB1FF1D6749F20000000F0000000734856AD398E1CFFF9AF4
        DEFF57A98BFF11382681000000060000000100000001000000051237287659B0
        92FF8BF1D7FF6ECEB2FF1E6047D400000006000000002359478A81CFBAFFB4F9
        EAFF82D3BCFF3A8767FB0E352383030C0823030C08230E3222753D8E6EF984DF
        C7FFAAF6E5FF6FB8A0FF1642328C0000000300000000050D0A1855B295F5A5E5
        D5FFBCFAEDFF94E5D0FF56A386FF2D7B59FF2D7B59FF54A386FF85D4BDFFB5F8
        EAFF9ADAC9FF419477F5030A0719000000010000000000000002173A2F5669C6
        AAFFAAE7D9FFCBFDF3FFC1FBEFFFBAF9ECFFB8F9EBFFBEFBEEFFC7FCF2FFA6E5
        D5FF5CB096FF123026570000000200000000000000000000000000000002122E
        264453AB90E38AD7C2FFB2EADDFFCEF9F1FFCEF9F1FFB1EADCFF87D4BFFF50A7
        8CE40F2920440000000200000000000000000000000000000000000000000000
        00010409070F255D4C813A9076C849B896FC49B795FC399075C8255B4A820309
        0710000000010000000000000000000000000000000000000000000000000000
        0000000000000000000100000002000000020000000200000002000000010000
        00000000000000000000000000000000000000000000}
      TabOrder = 4
      OnClick = btnCariPelangganClick
    end
    object cbGudang: TcxComboBox
      Tag = 12
      Left = 368
      Top = 88
      TabOrder = 5
      Width = 96
    end
    object ETotal: TcxTextEdit
      AlignWithMargins = True
      Left = 470
      Top = 3
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Enabled = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Color = 16761992
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -93
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = False
      Style.IsFontAssigned = True
      StyleDisabled.Color = 16761992
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.TextColor = clRed
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 6
      Text = '0'
      Height = 105
      Width = 521
    end
    object EkodeCust: TcxTextEdit
      Left = 304
      Top = 60
      TabOrder = 7
      Width = 109
    end
    object m1: TcxMemo
      Left = 77
      Top = 88
      Properties.ReadOnly = True
      TabOrder = 8
      Height = 24
      Width = 221
    end
    object dtp1: TDateTimePicker
      Left = 368
      Top = 114
      Width = 96
      Height = 24
      Date = 43308.609846932870000000
      Time = 43308.609846932870000000
      TabOrder = 9
      Visible = False
    end
    object ENomerPO: TcxTextEdit
      Tag = 1
      Left = 550
      Top = 112
      TabOrder = 10
      Visible = False
      Width = 268
    end
    object dt1: TDateTimePicker
      Left = 77
      Top = 32
      Width = 105
      Height = 24
      Date = 43354.225527824080000000
      Time = 43354.225527824080000000
      TabOrder = 11
    end
  end
  object sg1: TAdvStringGrid
    AlignWithMargins = True
    Left = 3
    Top = 124
    Width = 994
    Height = 230
    Cursor = crDefault
    Align = alClient
    Color = 16761992
    ColCount = 10
    Ctl3D = False
    DefaultColWidth = 10
    DefaultRowHeight = 28
    DefaultDrawing = True
    DoubleBuffered = True
    DrawingStyle = gdsClassic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentCtl3D = False
    ParentDoubleBuffered = False
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
    OnKeyDown = sg1KeyDown
    OnKeyPress = sg1KeyPress
    OnKeyUp = sg1KeyUp
    OnSelectCell = sg1SelectCell
    OnGetAlignment = sg1GetAlignment
    OnRowChanging = sg1RowChanging
    OnGetFloatFormat = sg1GetFloatFormat
    HighlightColor = clNone
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'Tahoma'
    ActiveCellFont.Style = [fsBold]
    ActiveCellColor = clNone
    BorderColor = clSilver
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
    FixedRightCols = 1
    FixedColWidth = 918
    FixedRowHeight = 28
    FixedFont.Charset = DEFAULT_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -13
    FixedFont.Name = 'Tahoma'
    FixedFont.Style = [fsBold]
    Flat = True
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
    ScrollWidth = 16
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
    SelectionColor = clYellow
    SelectionRectangle = True
    SelectionTextColor = clNone
    Version = '6.0.4.4'
    ColWidths = (
      918
      10
      10
      10
      10
      10
      10
      10
      10
      10)
    RowHeights = (
      28
      28
      16
      28
      28
      28
      28
      28
      28
      28)
  end
  object G2: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 360
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      994
      158)
    Height = 158
    Width = 994
    object Label13: TLabel
      Left = 16
      Top = 50
      Width = 197
      Height = 16
      Caption = 'Scan Barcode Pelanggan [ F3 ]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label16: TLabel
      Left = 16
      Top = 5
      Width = 55
      Height = 16
      Caption = 'PACKING'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 167
      Top = 5
      Width = 33
      Height = 16
      Caption = 'KODE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 676
      Top = 11
      Width = 55
      Height = 19
      Anchors = [akRight, akBottom]
      Caption = 'TOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExplicitTop = 8
    end
    object Label17: TLabel
      Left = 676
      Top = 42
      Width = 40
      Height = 19
      Anchors = [akRight, akBottom]
      Caption = 'DISC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExplicitTop = 39
    end
    object Label18: TLabel
      Left = 676
      Top = 105
      Width = 120
      Height = 19
      Anchors = [akRight, akBottom]
      Caption = 'GRAND TOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExplicitTop = 102
    end
    object Label19: TLabel
      Left = 804
      Top = 12
      Width = 6
      Height = 19
      Anchors = [akRight, akBottom]
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExplicitTop = 9
    end
    object Label20: TLabel
      Left = 804
      Top = 42
      Width = 6
      Height = 19
      Anchors = [akRight, akBottom]
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExplicitTop = 39
    end
    object Label21: TLabel
      Left = 804
      Top = 106
      Width = 6
      Height = 19
      Anchors = [akRight, akBottom]
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExplicitTop = 103
    end
    object Label22: TLabel
      Left = 720
      Top = 38
      Width = 44
      Height = 14
      Anchors = [akRight, akBottom]
      Caption = '[ F10 ] '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExplicitTop = 35
    end
    object lbl2: TLabel
      Left = 86
      Top = 5
      Width = 42
      Height = 16
      Caption = '[ F12 ]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label26: TLabel
      Left = 301
      Top = 51
      Width = 76
      Height = 16
      Caption = 'Keterangan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label27: TLabel
      Left = 301
      Top = 28
      Width = 131
      Height = 16
      Caption = 'Piutang Sebelumnya'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label28: TLabel
      Left = 747
      Top = 62
      Width = 75
      Height = 16
      Caption = 'Total Rokok'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4227072
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label29: TLabel
      Left = 747
      Top = 108
      Width = 103
      Height = 16
      Caption = 'Total Non Rokok'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label30: TLabel
      Left = 438
      Top = 28
      Width = 5
      Height = 16
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label31: TLabel
      Left = 860
      Top = 88
      Width = 5
      Height = 16
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4227072
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label32: TLabel
      Left = 860
      Top = 109
      Width = 5
      Height = 16
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object LtotalRokok: TLabel
      Left = 869
      Top = 88
      Width = 8
      Height = 16
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4227072
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object LtotalNonRokok: TLabel
      Left = 869
      Top = 109
      Width = 8
      Height = 16
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4227072
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object LpiutangSebelumnya: TLabel
      Left = 449
      Top = 28
      Width = 8
      Height = 16
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label33: TLabel
      Left = 676
      Top = 73
      Width = 114
      Height = 19
      Anchors = [akRight, akBottom]
      Caption = 'PEMBULATAN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label34: TLabel
      Left = 805
      Top = 72
      Width = 6
      Height = 19
      Anchors = [akRight, akBottom]
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExplicitTop = 69
    end
    object btnPenjualanNew: TcxButton
      Left = 16
      Top = 107
      Width = 64
      Height = 42
      Caption = 'Baru'#13#10' [INS]'
      TabOrder = 0
      WordWrap = True
      OnClick = btnPenjualanNewClick
    end
    object btnSimpan: TcxButton
      Left = 145
      Top = 107
      Width = 65
      Height = 42
      Caption = 'Simpan '#13#10'[F8]'
      TabOrder = 1
      OnClick = btnSimpanClick
    end
    object btnCariPelanggan: TcxButton
      Left = 445
      Top = 107
      Width = 67
      Height = 42
      Caption = 'Cari Cust '#13#10'[F3]'
      TabOrder = 2
      OnClick = btnCariPelangganClick
    end
    object btnCariBarang: TcxButton
      Left = 515
      Top = 107
      Width = 76
      Height = 42
      Caption = 'Cari Barang '#13#10'[ F5 ]'
      TabOrder = 3
      OnClick = btnCariBarangClick
    end
    object btnHapus: TcxButton
      Left = 593
      Top = 107
      Width = 68
      Height = 42
      Caption = 'Hapus '#13#10'[ DEL ]'
      TabOrder = 4
      OnClick = btnHapusClick
    end
    object EScanBarcode: TcxTextEdit
      Tag = 1
      Left = 16
      Top = 68
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 5
      OnKeyDown = EScanBarcodeKeyDown
      Height = 28
      Width = 282
    end
    object btnFocus: TcxButton
      Left = 82
      Top = 107
      Width = 62
      Height = 42
      Caption = 'Scan'#13#10'[ F2]'
      TabOrder = 6
      OnClick = btnFocusClick
    end
    object btnPending: TcxButton
      Left = 211
      Top = 107
      Width = 70
      Height = 42
      Caption = 'Pending'#13#10' [F9]'
      TabOrder = 7
      OnClick = btnPendingClick
    end
    object btnBukaPending: TcxButton
      Left = 285
      Top = 107
      Width = 86
      Height = 42
      Caption = 'Buka Pending '#13#10'[F6]'
      TabOrder = 8
      OnClick = btnBukaPendingClick
    end
    object btnCopyNota: TcxButton
      Left = 374
      Top = 107
      Width = 69
      Height = 42
      Caption = 'Copy Nota'#13#10' [F7]'
      TabOrder = 9
      OnClick = btnCopyNotaClick
    end
    object ESales: TcxTextEdit
      Left = 16
      Top = 24
      Hint = 'SALES'
      Properties.ReadOnly = False
      TabOrder = 10
      OnKeyDown = ESalesKeyDown
      Width = 150
    end
    object E1: TcxTextEdit
      Left = 167
      Top = 24
      Properties.ReadOnly = True
      TabOrder = 11
      Width = 131
    end
    object Esubtotal: TcxTextEdit
      Tag = 1
      Left = 813
      Top = 11
      Anchors = [akRight, akBottom]
      Enabled = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.Shadow = True
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      StyleDisabled.Color = clWhite
      StyleDisabled.TextColor = clBlack
      TabOrder = 12
      Width = 178
    end
    object Edisc: TcxTextEdit
      Tag = 3
      Left = 813
      Top = 39
      Anchors = [akRight, akBottom]
      ParentFont = False
      Properties.OnChange = EdiscPropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.Shadow = True
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 13
      Width = 51
    end
    object EdiscRp: TcxTextEdit
      Tag = 3
      Left = 865
      Top = 39
      Anchors = [akRight, akBottom]
      ParentFont = False
      Properties.OnChange = EdiscPropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.Shadow = True
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 14
      Width = 126
    end
    object EGrandTotal: TcxTextEdit
      Tag = 1
      Left = 813
      Top = 101
      Anchors = [akRight, akBottom]
      Enabled = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.Shadow = True
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      StyleDisabled.Color = clWhite
      StyleDisabled.TextColor = clBlack
      TabOrder = 15
      Width = 178
    end
    object btnTutup: TcxButton
      Left = 823
      Top = 107
      Width = 74
      Height = 43
      Caption = 'Tutup '#13#10'[ ESC ]'
      TabOrder = 16
      Visible = False
      OnClick = btnTutupClick
    end
    object EKeterangan: TcxTextEdit
      Tag = 1
      Left = 301
      Top = 67
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 17
      OnKeyDown = EScanBarcodeKeyDown
      Height = 29
      Width = 353
    end
    object btnGantiKasir: TcxButton
      Left = 670
      Top = 107
      Width = 74
      Height = 42
      Caption = 'Ganti Kasir'#13#10'[ F11 ]'
      TabOrder = 18
      Visible = False
      OnClick = btnGantiKasirClick
    end
    object EPembulatan: TcxTextEdit
      Tag = 3
      Left = 813
      Top = 70
      Anchors = [akRight, akBottom]
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.Shadow = True
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      StyleDisabled.Color = clWhite
      StyleDisabled.TextColor = clBlack
      TabOrder = 19
      OnKeyUp = EPembulatanKeyUp
      Width = 178
    end
    object cxButton1: TcxButton
      Left = 746
      Top = 107
      Width = 74
      Height = 42
      Caption = 'Terima'#13#10'Piutang'
      TabOrder = 20
      Visible = False
      OnClick = cxButton1Click
    end
  end
  object stat1: TStatusBar
    AlignWithMargins = True
    Left = 3
    Top = 524
    Width = 994
    Height = 19
    Panels = <
      item
        Text = 'Komputer ID'
        Width = 100
      end
      item
        Width = 100
      end
      item
        Text = 'User'
        Width = 50
      end
      item
        Width = 0
      end
      item
        Width = 100
      end
      item
        Text = 'Level'
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object jPrint1: TJPRINTER
    Version = '1.1.1 Final'
    Author = 'http://edysoftware.com'
    Left = 480
    Top = 184
  end
end
