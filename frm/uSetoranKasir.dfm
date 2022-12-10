object FSetoranKasir: TFSetoranKasir
  Left = 0
  Top = 0
  Caption = 'Setoran Kasir'
  ClientHeight = 442
  ClientWidth = 1030
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
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    TabOrder = 0
    Height = 49
    Width = 1030
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 38
      Height = 13
      Caption = 'Tanggal'
    end
    object Label2: TLabel
      Left = 60
      Top = 16
      Width = 4
      Height = 13
      Caption = ':'
    end
    object dt1: TDateTimePicker
      Left = 72
      Top = 13
      Width = 113
      Height = 21
      Date = 44823.041497164360000000
      Time = 44823.041497164360000000
      TabOrder = 0
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 400
    Align = alBottom
    TabOrder = 1
    Height = 42
    Width = 1030
    object cxButton1: TcxButton
      Left = 11
      Top = 8
      Width = 94
      Height = 25
      Caption = 'Simpan'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        6100000021744558745469746C65004170706C793B4F4B3B436865636B3B4261
        72733B526962626F6E3B6463C8680000037D49444154785E4D8E7F4C94051CC6
        3FEF7B77E02073EA92742577579B684891E62AB6C4526B6013696BC9DC5A0B33
        D0322DA716D3CA94A21A8E96E976AEB654688E409B46B859CC249500E3F81588
        234EE0F875DC1DF7A3BB7BDFF7DBC16AEBD9F3D9BEFF3CCFF7C13555CB58A801
        40014CC5E5696BF638D24FBEF7EDF2D683550F7B0E5666B4969C5A5EBBEBCB65
        2F0209803A116E6438F82377A66A60385007A0E4EFB2A5BC51B1B4AEF4EC5AB9
        D476583A87AA642C7055BA47CE4A43F72752713157F67D93DE54B0DFBE04308D
        867E9E290050725F4BBDB7F8E8B29EAA86B7C4E5BF203DDEE3D23E71585AC6F6
        48E7E4C7D2E777C870A05E7E68DE277B4F668C6EDE6BCF00D4017F350A607EF5
        48DAB99CECBC9CF4343BC3E1264CAA60C282AAA8288A028A30313E852DE509EE
        0C4D72EEF26967CD17FD4F0EDE0A064DF9BBEDEB6CD6C51F3C9DF5382EFF1540
        104014216E500C2ED6DDA4F67C3BEDB79BC9C95EC3E8F8784AD28288BBADC1D3
        6C4E98652A7C2C7D2543816674430304C4885B0755E1CC99EBCC51D750F14E35
        DBCB32E91DF98DCCA5ABE8FCB36733E0500D3132EF9EAB108C7AE9ED1BA6B4AC
        969F2E39896A11CE5F68212529975D5B4A395A59C40B79CF6049D0489AAD81AA
        3C0A9854436741140FE148809AEA16CA8AAEA34C65F1E9E7F524EBEBD99A7F80
        53751FB2707118EB836642311F31C63174497C286BEE6C55D3F48971DF2088C1
        A60D6BF9BAB6849D0547D8FD520D2F3F5F822FD8C7AFCEEF58B16A11FEC82831
        3DC6A87F8868C488745C9D0C9AF5A8D2E51EF15BE72FD248B127E2F5FE8DE3FB
        FDEC28280755E1FDCFB691BF310B6FC48566C4C030F08D458984B40E4057837E
        ADAAA7CB87A0E2090EB2E491594C1A4DD45C2EC779AB0E53B287C4399384A353
        718288A8F4767B09F8F4F380069094BBDD7AB3E474869CB8B1428E5DCB90AAB6
        0DB2E59055B2B621C72EAF93134D99723C8EE3F79572A83A5336EEB439EF9A67
        990FA82A1071F7855EF9E35AC0D3EB0C010A9EF000799B56F1EEDBAFC7BF87D0
        0D411185BEEE30AD8DFE88AB2B501CF0C4FC5706DE34CC0D7F15E9AB53BF6A17
        784ED78C4AB72BF6803DDD82B6B013D5A420064CB875FABB628CB8A21DEEDBA1
        A2D6FAB11B8066480C7EE92F045000737CD6BCA736DFB77F7D616A63EE769BCC
        B0C326CF6E4D6D5B5D70FF47C9732CF700164099CE4D3373FCA76CAB43052CFF
        62065440001D884E130F19FC4FFF00FE20CB5D5DF1FFF30000000049454E44AE
        426082}
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 111
      Top = 8
      Width = 94
      Height = 25
      Caption = 'Print'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000000C744558745469746C65005072696E743BC83632EA00000267494441
        54785E7D93CB6B135114C6BF99C434A60F05698B1B5716752582E84AAD2822B6
        88B8101F50B45441210BEBC285150591A250A326462AA218F20FB810178A482C
        AD165AD0958216051F68D1966426F3B82FCFDCCC0C71512F7C73EE3DDCEF77EE
        DC87A19442D40C6AB74A332F4CD3EC05745E7FA33982F1CAF0E0D65D34E69127
        897F9B49EA3D7374A376AA901041F2E5D9ED0012A4A5019C0B28092C5A5E58D9
        808244476B0B38135111C4005AB55E7D587D191712928C147579052308908272
        5C03D2E4610064A0C0648E8E5776DF2EBF7D33385CB0BF7C7E0F2915494288C0
        28C0833E69EEE33B1C3E35FA67ECE1CCF4C5DCD33D0012C9E0B33CD3513EB477
        6DD744E54930D4D5852008240CD55807A3B1EB3AB0EC1A8EF4ADDF547A2C4B00
        D66880E0AAAB7B550675CB42329186904A5754A119000125015C38561DAB3B33
        604C75462B303D5F5042229D4AE0E78FEF3878EC4274046150210C686F4BE8B9
        9EC7D00460700832347000378B252C2C542145E0931AA1A4D23BBC72453B4E0F
        1D87C3380138026F03E032D409D2B3A107C5FC95C6A1C8F0084D8A8D0C744602
        B6CB41459B003E47CDE1A8D7194E666FE07FED5EFE2C7C9102F385E60600C3F7
        04AA1643D576B0BFBF0FD981CD284CCDEBCD6402641038BFA31BC5F22C7E2FDA
        A03F81CF1A0013009BFFF5753277E719EE8E3F070FCFDD63244E002E29070DE3
        D4B976BD8C91CB0FF0E9C3E46B10C708EF762BA985D43632F6722E7B628BDE79
        4087F846161E4DE3EAB99DEB0054490EC94E2AA54490085FA3655BD6ABDCFDA9
        6DF1B6A9F8ADC2756B1300BE91C75EEA31F9B94BFDFB00A44866EC44FCB23D92
        DB6CF80BF54A6944F3A08E160000000049454E44AE426082}
      TabOrder = 1
      OnClick = cxButton2Click
    end
    object cxButton3: TcxButton
      Left = 211
      Top = 8
      Width = 94
      Height = 25
      Caption = 'Tutup'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        6100000023744558745469746C650043616E63656C3B53746F703B457869743B
        426172733B526962626F6E3B4C9696B20000038849444154785E1D906B4C5367
        18C7FF3DBD40CB1A2E32B55C9D598B4CA675D8D13836652E9B0359B67D589665
        3259E644A52571644474CB4CB6ECC23770C4449DD38D2885005E4683AB69C616
        8DA12384264EC8AAAC0C9149A1175ACEE9E939CFDE9EE7E477F2CBFFB924E720
        E6E943CC3B8895D12B00A0FEE3D08167A75A5BBAEEB71D9D081E6B4DA549FBDD
        A3CEEFDD1F3658016818AA98A71FD1915E202DE980A19D741E3EF6E0F8A7FC7F
        673B6979E002C5BC43B4C2581EB8480BE7BA68E6441BEF3B72F03300990C8E1D
        5016554E7B55D6C1ED9543C6C2B5BB739FDF025988838424E4240F10A0D2EAA0
        D26540AD37203CFE17C2C187A3EDBFDE7CF3DAD4748403A06EA8A8E830AC5FB3
        3B7BAB1901B717AE23DFE1CEC5EBEC90A0E0EB71A3CFD981C0B017C6F252180B
        D6BD74BCFA856E003A0CBDFD966DF250532AD4FF038DB734D18557DF21CFB08F
        2E37B5D370ED5E72D7D52BEEF9654CE9F91C1FD392EB0C4D3A0E4BE7F6ECD909
        CFDEFAD381AF4ED0A3D35FD399E272BA3F3D478F971234FD2044BDCE930AF798
        CF2FAED0DF5373CACCFCA92F2970B29DDCAFD7F56B48945E918201C41738945A
        2D581C7461ADA3192AB50AD64F9A010272730CC8D4AA313BE44289D58CF85D3F
        2411504BB28D93845489145E041F9CC1863C09A11BD7E1EFEA86240339463DB2
        B3F59025C0DFD98DD0C83594E6886C360831F408523265D208BC0021B20A35A7
        82B8BC0429C2239A10D812417988007088B14C8A8421EA75A094044A8A48F200
        17E78587629220B370E69F2884EA3750F07E23245946868E43A64EA3B8695F23
        F8EA7A046763EC780AC9640AF155FEB1269AE0BD91AC8CFDF910108E26F15A5B
        33788D1E860CF6CDE7CF225D45FB3F02A0C7CE36076E5CBD84825C3562A20E4B
        097E0CAD051B5FFCA97C9BE4ABAEA05B2FDBE9E6BE0F880F8568FCDB0E1AA9AA
        646C579C654AEF564D15FDB96333FDBCC94A8E751B6A0140DF5168B9E42A7B86
        266AB6D2ED1A1BF559CAC853B58DFCB576F2D7D9D3AE64B777D96862D716EA2F
        2BA76F4CE62B008C1A00C2F9C57F9D8DA2C99212C5E72C85323699F320A77FD2
        72040021DF9885F56BF2204457706F9EC74C4CF2F744169A012430DBF21E00A8
        2B754F98BEC82EEEED7AF2291A306FA451EBD3346633938FF13BF341969D62BD
        CF738AAF6ED6EA4B006882CE77A14ABFD255D2799903606830E4EF28E274070C
        1C67D74255041044C25C9CE43B4149F8B16735F41B8038DB9300E07F6924ECFB
        01D589CC0000000049454E44AE426082}
      TabOrder = 2
      OnClick = cxButton3Click
    end
  end
  object sg: TAdvStringGrid
    Left = 0
    Top = 49
    Width = 1030
    Height = 351
    Cursor = crDefault
    Align = alClient
    DrawingStyle = gdsClassic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 2
    OnKeyUp = sgKeyUp
    OnCanEditCell = sgCanEditCell
    OnGetFloatFormat = sgGetFloatFormat
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
    FloatFormat = '%.0n'
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
  object frxReport1: TfrxReport
    Version = '6.6.7'
    DotMatrixReport = False
    EngineOptions.PrintIfEmpty = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43193.713056620400000000
    ReportOptions.LastChange = 44823.532391724540000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 432
    Top = 96
    Datasets = <
      item
        DataSet = frSetoranKasir
        DataSetName = 'frSetoranKasir'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 60.472480000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'LAPORAN SETORAN KASIR')
          ParentFont = False
        end
        object Fprofilnamaperusahaan: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 22.677180000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataSetName = 'Fprofil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'LEBERTY KARANG GEDE')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 253.228510000000000000
        Width = 1046.929810000000000000
        DataSet = frSetoranKasir
        DataSetName = 'frSetoranKasir'
        RowCount = 0
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[Line#]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = 'namalengkap'
          DataSet = frSetoranKasir
          DataSetName = 'frSetoranKasir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frSetoranKasir."namalengkap"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'total_penjualan'
          DataSet = frSetoranKasir
          DataSetName = 'frSetoranKasir'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frSetoranKasir."total_penjualan"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 336.378170000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataField = 'diskon'
          DataSet = frSetoranKasir
          DataSetName = 'frSetoranKasir'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frSetoranKasir."diskon"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 657.638220000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'penjualan_bersih'
          DataSet = frSetoranKasir
          DataSetName = 'frSetoranKasir'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frSetoranKasir."penjualan_bersih"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 404.409710000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = 'non_tunai'
          DataSet = frSetoranKasir
          DataSetName = 'frSetoranKasir'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frSetoranKasir."non_tunai"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 495.118430000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataField = 'pembayaran_poin'
          DataSet = frSetoranKasir
          DataSetName = 'frSetoranKasir'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frSetoranKasir."pembayaran_poin"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 578.268090000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'tunai'
          DataSet = frSetoranKasir
          DataSetName = 'frSetoranKasir'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frSetoranKasir."tunai"]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 234.330860000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataField = 'pembulatan'
          DataSet = frSetoranKasir
          DataSetName = 'frSetoranKasir'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frSetoranKasir."pembulatan"]')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 767.244590000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'setoran'
          DataSet = frSetoranKasir
          DataSetName = 'frSetoranKasir'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frSetoranKasir."setoran"]')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 861.732840000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = 'selisih'
          DataSet = frSetoranKasir
          DataSetName = 'frSetoranKasir'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frSetoranKasir."selisih"]')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 952.441560000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = 'item_counter'
          DataSet = frSetoranKasir
          DataSetName = 'frSetoranKasir'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frSetoranKasir."item_counter"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 374.173470000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 90.708695590000000000
        Top = 139.842610000000000000
        Width = 1046.929810000000000000
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'TANGGAL')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 22.677180000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'TGL CETAK')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 136.063080000000000000
          Top = 3.779530000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 136.063080000000000000
          Top = 22.677180000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object Lbulan: TfrxMemoView
          AllowVectorExport = True
          Left = 154.960730000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 52.913420000000000000
          Width = 34.015770000000000000
          Height = 37.795275590551180000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'NO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 52.913420000000000000
          Width = 90.708720000000000000
          Height = 37.795275590551180000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'NAMA KASIR')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Top = 52.913420000000000000
          Width = 105.826840000000000000
          Height = 37.795275590551180000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'PENJUALAN '
            'KOTOR')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 336.378170000000000000
          Top = 52.913420000000000000
          Width = 68.031540000000000000
          Height = 37.795275590551180000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'DISKON')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 657.638220000000000000
          Top = 52.913420000000000000
          Width = 109.606370000000000000
          Height = 37.795275590551180000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'PENJUALAN'
            'BERSIH')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 154.960730000000000000
          Top = 22.677180000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 404.409710000000000000
          Top = 52.913420000000000000
          Width = 90.708720000000000000
          Height = 37.795275590551180000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'NON TUNAI')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 495.118430000000000000
          Top = 52.913420000000000000
          Width = 83.149660000000000000
          Height = 37.795275590551180000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'P. POIN')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 578.268090000000000000
          Top = 52.913420000000000000
          Width = 79.370130000000000000
          Height = 37.795275590551180000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'TUNAI')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 234.330860000000000000
          Top = 52.913420000000000000
          Width = 102.047310000000000000
          Height = 37.795275590551180000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'PEMBULATAN')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 767.244590000000000000
          Top = 52.913420000000000000
          Width = 94.488250000000000000
          Height = 37.795275590551180000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'SETORAN')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 861.732840000000000000
          Top = 52.913420000000000000
          Width = 90.708720000000000000
          Height = 37.795275590551180000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'SELISIH')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 952.441560000000000000
          Top = 52.913420000000000000
          Width = 90.708720000000000000
          Height = 37.795275590551180000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'TOTAL ITEM '
            'TERJUAL')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 294.803340000000000000
        Width = 1046.929810000000000000
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = 16752706
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataSetName = 'FrLapOmset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Fill.BackColor = 16752706
          Memo.UTF8W = (
            'TOTAL')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 495.118430000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSetName = 'FrLapOmset'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16752706
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frSetoranKasir."pembayaran_poin">,MasterData1)]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 657.638220000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataSetName = 'FrLapOmset'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16752706
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frSetoranKasir."penjualan_bersih">,MasterData1)]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 578.268090000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSetName = 'FrLapOmset'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16752706
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frSetoranKasir."tunai">,MasterData1)]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 234.330860000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataSetName = 'FrLapOmset'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16752706
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frSetoranKasir."pembulatan">,MasterData1)]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 404.409710000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataSetName = 'FrLapOmset'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16752706
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frSetoranKasir."non_tunai">,MasterData1)]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataSetName = 'FrLapOmset'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Fill.BackColor = 16752706
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frSetoranKasir."total_penjualan">,MasterData1)]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 336.378170000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataSetName = 'FrLapOmset'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16752706
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frSetoranKasir."diskon">,MasterData1)]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 861.732840000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataSetName = 'FrLapOmset'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16752706
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frSetoranKasir."selisih">,MasterData1)]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 767.244590000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSetName = 'FrLapOmset'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16752706
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frSetoranKasir."setoran">,MasterData1)]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 952.441560000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataSetName = 'FrLapOmset'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16752706
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frSetoranKasir."item_counter">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object frSetoranKasir: TfrxDBDataset
    UserName = 'frSetoranKasir'
    CloseDataSource = False
    FieldAliases.Strings = (
      'iduser=iduser'
      'namalengkap=namalengkap'
      'tgl=tgl'
      'total_penjualan=total_penjualan'
      'pembulatan=pembulatan'
      'diskon=diskon'
      'non_tunai=non_tunai'
      'pembayaran_poin=pembayaran_poin'
      'tunai=tunai'
      'penjualan_bersih=penjualan_bersih'
      'setoran=setoran'
      'selisih=selisih'
      'item_counter=item_counter')
    DataSet = QSetoranKasir
    BCDToCurrency = False
    Left = 496
    Top = 96
  end
  object QSetoranKasir: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  s.iduser,'
      '  pg.namalengkap,'
      '  s.tgl,'
      '  s.total_penjualan,'
      '  s.pembulatan,'
      '  s.diskon,'
      '  s.non_tunai,'
      '  s.pembayaran_poin,'
      '  s.tunai,'
      '  s.penjualan_bersih,'
      '  s.setoran,'
      '  s.selisih,'
      '  fc_item_count(s.iduser,s.tgl) as item_counter'
      'FROM'
      '  setoran_kasir s '
      '  LEFT JOIN m_user pg '
      '    ON s.`iduser` = pg.`iduser` GROUP BY s.`iduser`')
    Left = 496
    Top = 160
  end
end
