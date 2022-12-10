object FlapPivot: TFlapPivot
  Left = 0
  Top = 0
  Caption = 'Laporan Pivot Table'
  ClientHeight = 441
  ClientWidth = 948
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 948
    Height = 441
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = cxTabSheet5
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'MoneyTwins'
    ClientRectBottom = 439
    ClientRectLeft = 2
    ClientRectRight = 946
    ClientRectTop = 26
    object cxTabSheet5: TcxTabSheet
      Caption = 'Pivot Data Penjualan'
      ImageIndex = 1
      object cxPageControl3: TcxPageControl
        Left = 0
        Top = 0
        Width = 944
        Height = 413
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = cxTabSheet6
        Properties.CustomButtons.Buttons = <>
        Properties.Rotate = True
        Properties.TabCaptionAlignment = taLeftJustify
        Properties.TabPosition = tpLeft
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'iMaginary'
        ClientRectBottom = 406
        ClientRectLeft = 147
        ClientRectRight = 937
        ClientRectTop = 3
        object cxTabSheet6: TcxTabSheet
          Caption = 'Pivot Penjualan Per Periode'
          ImageIndex = 0
          object cxGroupBox4: TcxGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Align = alTop
            Caption = 'Silahkan pilih Periode'
            TabOrder = 0
            Height = 57
            Width = 784
            object Label5: TLabel
              Left = 8
              Top = 24
              Width = 46
              Height = 13
              Caption = 'Periode : '
            end
            object Label6: TLabel
              Left = 168
              Top = 24
              Width = 15
              Height = 13
              Caption = 's/d'
            end
            object dt5: TDateTimePicker
              Left = 55
              Top = 21
              Width = 106
              Height = 21
              Date = 43390.709585636580000000
              Time = 43390.709585636580000000
              TabOrder = 0
            end
            object dt6: TDateTimePicker
              Left = 189
              Top = 21
              Width = 100
              Height = 21
              Date = 43390.709942118050000000
              Time = 43390.709942118050000000
              TabOrder = 1
            end
            object btn3: TcxButton
              Left = 295
              Top = 19
              Width = 75
              Height = 25
              Caption = 'Proses'
              TabOrder = 2
              OnClick = btn3Click
            end
          end
          object cxGrid1: TcxGrid
            Left = 0
            Top = 63
            Width = 790
            Height = 297
            Align = alClient
            TabOrder = 1
            object cxdata: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.Footer = True
              OptionsView.FooterMultiSummaries = True
              OptionsView.GroupFooterMultiSummaries = True
              OptionsView.GroupFooters = gfVisibleWhenExpanded
            end
            object cxGrid1Level1: TcxGridLevel
              GridView = cxdata
            end
          end
          object cxgrpbx3: TcxGroupBox
            Left = 0
            Top = 360
            Align = alBottom
            TabOrder = 2
            Height = 43
            Width = 790
            object btn9: TcxButton
              Left = 3
              Top = 12
              Width = 198
              Height = 25
              Caption = 'Export Data Ke Excel Format'
              OptionsImage.Glyph.SourceDPI = 96
              OptionsImage.Glyph.Data = {
                424D360400000000000036000000280000001000000010000000010020000000
                000000000000C40E0000C40E0000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000080000000C0000
                000D0000000D0000000D0000000D0000000D0000000D0000000D0000000E0000
                000E0000000E0000000E0000000E0000000D000000097B5A50BFAB7D6FFFAA7D
                6FFFAA7C6FFFAA7C6EFFAA7C6DFFA97B6DFFA97B6DFFA87B6DFFA97A6CFFA97A
                6CFFA8796CFFA87A6BFFA7796BFFA8786AFF78564CC0AC8072FFF9F2EEFFF9F3
                EEFFF9F1EEFFF9F1EEFFCFB2A8FFF9F1EEFFF8F1EEFFF8F2EEFFF8F1EDFFCEB0
                A6FFF9F1EDFFF9F2EDFFF9F1EDFFF9F1EEFFA87A6CFFAE8274FFF9F3F0FFF7EF
                EAFFF7EFEAFFF8F2EEFFD2B7AFFFF9F2EFFFF9F2EFFFF9F3EFFFF9F3EFFFD1B7
                AEFFF8F3EFFFF8F3EFFFF9F3EEFFFAF5F2FFBE9B91FFAF8375FFD3B8B0FFC5A3
                99FFC5A298FFD3B9B1FF2B8758FF2B8758FF2A8658FF2A8657FF2A8458FF2A84
                57FF298456FF298357FF298254FF298256FF298254FFB18578FFFAF4F0FFF8F0
                EBFFF7F0EBFFF9F3F0FF2C895BFF74DEC1FF74DEC1FF74DEC1FF74DEC0FF3597
                6AFF74DEC0FF74DEC0FF74DEC0FF74DEC0FF298455FFB28779FFF9F5F1FFF8F0
                ECFFF8F1EBFFFAF4F1FF2E8B5DFF76DFC1FF5FD6AFFF5DD6AEFF5DD5ADFF369A
                6CFF5DD5ACFF5DD5ACFF5CD5ADFF74DEC1FF2B8758FFB4887CFFD8C0B8FFC8A7
                9DFFC8A79DFFD5BCB4FF2E8E5EFF389D70FF389D70FF389C6FFF389C6FFF389B
                6EFF379B6EFF389B6DFF379A6DFF379A6DFF2C885AFFB48A7EFFFAF5F3FFF8F2
                EDFFF8F1EDFFFAF4F1FF2F9062FF77E0C3FF63D8B1FF62D7B1FF62D7B2FF399D
                70FF62D7B1FF62D7B0FF61D7B1FF76DFC2FF2E8A5CFFB68D7FFFFAF6F3FFF9F2
                EDFFF9F2EDFFFAF4F1FF309264FF78E0C4FF78E0C4FF78E0C4FF78E0C4FF3A9F
                73FF78DFC4FF78DFC3FF77E0C3FF78DFC3FF2E8D5EFFB78E81FFDDC6BFFFCBAB
                A2FFCBACA2FFD7C0B8FF329566FF339366FF329265FF309265FF329264FF3291
                64FF309163FF2F9062FF2F9062FF2F8F60FF2E8F60FFB88F82FFFAF7F4FFF8F3
                EFFFF8F2EEFFF9F4F1FFD8C0B9FFFAF6F2FFFAF5F3FFFAF5F2FFFAF5F2FFD7C0
                B8FFFAF6F2FFFAF5F2FFFAF5F2FFFCF8F6FFC7A79DFFB99085FFFBF8F5FFFAF8
                F5FFFBF8F4FFFBF6F4FFDFCAC3FFFBF6F5FFFBF7F4FFFBF7F4FFFBF6F4FFDDC8
                C1FFFAF6F4FFFBF7F5FFFBF6F5FFFBF7F5FFB68C80FF8A6C63C0BA9185FFBA91
                85FFBA9185FFBA9084FFB99185FFB99084FFB99084FFB99084FFB99083FFB890
                83FFB98F83FFB78F83FFB88E82FFB78E82FF876960C100000003000000040000
                0005000000050000000500000005000000050000000500000005000000050000
                00050000000500000006000000060000000500000004}
              TabOrder = 0
              OnClick = btn9Click
            end
          end
        end
        object cxTabSheet7: TcxTabSheet
          Caption = 'Pivot Penjualan Per Bulan'
          ImageIndex = 1
          object cxGroupBox5: TcxGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Align = alTop
            Caption = 'Silahkan pilih Periode'
            TabOrder = 0
            Height = 57
            Width = 784
            object Label7: TLabel
              Left = 8
              Top = 24
              Width = 30
              Height = 13
              Caption = 'Tahun'
            end
            object dt7: TDateTimePicker
              Left = 55
              Top = 21
              Width = 106
              Height = 21
              Date = 43390.709585636580000000
              Format = 'yyyy'
              Time = 43390.709585636580000000
              DateMode = dmUpDown
              TabOrder = 0
            end
            object btn4: TcxButton
              Left = 167
              Top = 18
              Width = 75
              Height = 25
              Caption = 'Proses'
              TabOrder = 1
              OnClick = btn4Click
            end
          end
          object cxGrid2: TcxGrid
            Left = 0
            Top = 63
            Width = 790
            Height = 297
            Align = alClient
            TabOrder = 1
            object cxdata2: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.Footer = True
              OptionsView.FooterMultiSummaries = True
              OptionsView.GroupFooterMultiSummaries = True
              OptionsView.GroupFooters = gfVisibleWhenExpanded
            end
            object cxGridLevel1: TcxGridLevel
              GridView = cxdata2
            end
          end
          object cxgrpbx4: TcxGroupBox
            Left = 0
            Top = 360
            Align = alBottom
            TabOrder = 2
            Height = 43
            Width = 790
            object btn10: TcxButton
              Left = 3
              Top = 12
              Width = 198
              Height = 25
              Caption = 'Export Data Ke Excel Format'
              OptionsImage.Glyph.SourceDPI = 96
              OptionsImage.Glyph.Data = {
                424D360400000000000036000000280000001000000010000000010020000000
                000000000000C40E0000C40E0000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000080000000C0000
                000D0000000D0000000D0000000D0000000D0000000D0000000D0000000E0000
                000E0000000E0000000E0000000E0000000D000000097B5A50BFAB7D6FFFAA7D
                6FFFAA7C6FFFAA7C6EFFAA7C6DFFA97B6DFFA97B6DFFA87B6DFFA97A6CFFA97A
                6CFFA8796CFFA87A6BFFA7796BFFA8786AFF78564CC0AC8072FFF9F2EEFFF9F3
                EEFFF9F1EEFFF9F1EEFFCFB2A8FFF9F1EEFFF8F1EEFFF8F2EEFFF8F1EDFFCEB0
                A6FFF9F1EDFFF9F2EDFFF9F1EDFFF9F1EEFFA87A6CFFAE8274FFF9F3F0FFF7EF
                EAFFF7EFEAFFF8F2EEFFD2B7AFFFF9F2EFFFF9F2EFFFF9F3EFFFF9F3EFFFD1B7
                AEFFF8F3EFFFF8F3EFFFF9F3EEFFFAF5F2FFBE9B91FFAF8375FFD3B8B0FFC5A3
                99FFC5A298FFD3B9B1FF2B8758FF2B8758FF2A8658FF2A8657FF2A8458FF2A84
                57FF298456FF298357FF298254FF298256FF298254FFB18578FFFAF4F0FFF8F0
                EBFFF7F0EBFFF9F3F0FF2C895BFF74DEC1FF74DEC1FF74DEC1FF74DEC0FF3597
                6AFF74DEC0FF74DEC0FF74DEC0FF74DEC0FF298455FFB28779FFF9F5F1FFF8F0
                ECFFF8F1EBFFFAF4F1FF2E8B5DFF76DFC1FF5FD6AFFF5DD6AEFF5DD5ADFF369A
                6CFF5DD5ACFF5DD5ACFF5CD5ADFF74DEC1FF2B8758FFB4887CFFD8C0B8FFC8A7
                9DFFC8A79DFFD5BCB4FF2E8E5EFF389D70FF389D70FF389C6FFF389C6FFF389B
                6EFF379B6EFF389B6DFF379A6DFF379A6DFF2C885AFFB48A7EFFFAF5F3FFF8F2
                EDFFF8F1EDFFFAF4F1FF2F9062FF77E0C3FF63D8B1FF62D7B1FF62D7B2FF399D
                70FF62D7B1FF62D7B0FF61D7B1FF76DFC2FF2E8A5CFFB68D7FFFFAF6F3FFF9F2
                EDFFF9F2EDFFFAF4F1FF309264FF78E0C4FF78E0C4FF78E0C4FF78E0C4FF3A9F
                73FF78DFC4FF78DFC3FF77E0C3FF78DFC3FF2E8D5EFFB78E81FFDDC6BFFFCBAB
                A2FFCBACA2FFD7C0B8FF329566FF339366FF329265FF309265FF329264FF3291
                64FF309163FF2F9062FF2F9062FF2F8F60FF2E8F60FFB88F82FFFAF7F4FFF8F3
                EFFFF8F2EEFFF9F4F1FFD8C0B9FFFAF6F2FFFAF5F3FFFAF5F2FFFAF5F2FFD7C0
                B8FFFAF6F2FFFAF5F2FFFAF5F2FFFCF8F6FFC7A79DFFB99085FFFBF8F5FFFAF8
                F5FFFBF8F4FFFBF6F4FFDFCAC3FFFBF6F5FFFBF7F4FFFBF7F4FFFBF6F4FFDDC8
                C1FFFAF6F4FFFBF7F5FFFBF6F5FFFBF7F5FFB68C80FF8A6C63C0BA9185FFBA91
                85FFBA9185FFBA9084FFB99185FFB99084FFB99084FFB99084FFB99083FFB890
                83FFB98F83FFB78F83FFB88E82FFB78E82FF876960C100000003000000040000
                0005000000050000000500000005000000050000000500000005000000050000
                00050000000500000006000000060000000500000004}
              TabOrder = 0
              OnClick = btn10Click
            end
          end
        end
        object cxTabSheet1: TcxTabSheet
          Caption = 'Pivot Penjualan Tahunan'
          ImageIndex = 2
          object cxGroupBox1: TcxGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Align = alTop
            Caption = 'Silahkan pilih Periode'
            TabOrder = 0
            Height = 57
            Width = 784
            object cxButton1: TcxButton
              Left = 9
              Top = 21
              Width = 75
              Height = 25
              Caption = 'Proses'
              TabOrder = 0
              OnClick = cxButton1Click
            end
          end
          object cxGrid5: TcxGrid
            Left = 0
            Top = 63
            Width = 790
            Height = 340
            Align = alClient
            TabOrder = 1
            ExplicitHeight = 297
            object cxDataTahunan: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.Footer = True
              OptionsView.FooterMultiSummaries = True
              OptionsView.GroupFooterMultiSummaries = True
              OptionsView.GroupFooters = gfVisibleWhenExpanded
            end
            object cxGridLevel4: TcxGridLevel
              GridView = cxDataTahunan
            end
          end
        end
      end
    end
    object CxPivotPenjualanBarang: TcxTabSheet
      Caption = 'Pivot Data Penjualan Barang'
      ImageIndex = 2
      object cxPageControl4: TcxPageControl
        Left = 0
        Top = 0
        Width = 944
        Height = 413
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = cxtbsht2
        Properties.CustomButtons.Buttons = <>
        Properties.Rotate = True
        Properties.TabCaptionAlignment = taLeftJustify
        Properties.TabPosition = tpLeft
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'iMaginary'
        ClientRectBottom = 406
        ClientRectLeft = 187
        ClientRectRight = 937
        ClientRectTop = 3
        object cxTabSheet8: TcxTabSheet
          Caption = 'Pivot QTY Penjualan Per Periode'
          ImageIndex = 0
          object cxGroupBox6: TcxGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Align = alTop
            Caption = 'Silahkan pilih Periode'
            TabOrder = 0
            Height = 57
            Width = 744
            object Label8: TLabel
              Left = 8
              Top = 24
              Width = 46
              Height = 13
              Caption = 'Periode : '
            end
            object Label9: TLabel
              Left = 168
              Top = 24
              Width = 15
              Height = 13
              Caption = 's/d'
            end
            object dt8: TDateTimePicker
              Left = 55
              Top = 21
              Width = 106
              Height = 21
              Date = 43390.709585636580000000
              Time = 43390.709585636580000000
              TabOrder = 0
            end
            object dt9: TDateTimePicker
              Left = 189
              Top = 21
              Width = 108
              Height = 21
              Date = 43390.709942118050000000
              Time = 43390.709942118050000000
              TabOrder = 1
            end
            object btn5: TcxButton
              Left = 303
              Top = 19
              Width = 75
              Height = 25
              Caption = 'Proses'
              TabOrder = 2
              OnClick = btn5Click
            end
          end
          object cxGrid3: TcxGrid
            Left = 0
            Top = 63
            Width = 750
            Height = 297
            Align = alClient
            TabOrder = 1
            object cxData3: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.FooterMultiSummaries = True
              OptionsView.GroupFooterMultiSummaries = True
              OptionsView.GroupFooters = gfVisibleWhenExpanded
            end
            object cxGridLevel2: TcxGridLevel
              GridView = cxData3
            end
          end
          object cxgrpbx5: TcxGroupBox
            Left = 0
            Top = 360
            Align = alBottom
            TabOrder = 2
            Height = 43
            Width = 750
            object btn11: TcxButton
              Left = 3
              Top = 12
              Width = 198
              Height = 25
              Caption = 'Export Data Ke Excel Format'
              OptionsImage.Glyph.SourceDPI = 96
              OptionsImage.Glyph.Data = {
                424D360400000000000036000000280000001000000010000000010020000000
                000000000000C40E0000C40E0000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000080000000C0000
                000D0000000D0000000D0000000D0000000D0000000D0000000D0000000E0000
                000E0000000E0000000E0000000E0000000D000000097B5A50BFAB7D6FFFAA7D
                6FFFAA7C6FFFAA7C6EFFAA7C6DFFA97B6DFFA97B6DFFA87B6DFFA97A6CFFA97A
                6CFFA8796CFFA87A6BFFA7796BFFA8786AFF78564CC0AC8072FFF9F2EEFFF9F3
                EEFFF9F1EEFFF9F1EEFFCFB2A8FFF9F1EEFFF8F1EEFFF8F2EEFFF8F1EDFFCEB0
                A6FFF9F1EDFFF9F2EDFFF9F1EDFFF9F1EEFFA87A6CFFAE8274FFF9F3F0FFF7EF
                EAFFF7EFEAFFF8F2EEFFD2B7AFFFF9F2EFFFF9F2EFFFF9F3EFFFF9F3EFFFD1B7
                AEFFF8F3EFFFF8F3EFFFF9F3EEFFFAF5F2FFBE9B91FFAF8375FFD3B8B0FFC5A3
                99FFC5A298FFD3B9B1FF2B8758FF2B8758FF2A8658FF2A8657FF2A8458FF2A84
                57FF298456FF298357FF298254FF298256FF298254FFB18578FFFAF4F0FFF8F0
                EBFFF7F0EBFFF9F3F0FF2C895BFF74DEC1FF74DEC1FF74DEC1FF74DEC0FF3597
                6AFF74DEC0FF74DEC0FF74DEC0FF74DEC0FF298455FFB28779FFF9F5F1FFF8F0
                ECFFF8F1EBFFFAF4F1FF2E8B5DFF76DFC1FF5FD6AFFF5DD6AEFF5DD5ADFF369A
                6CFF5DD5ACFF5DD5ACFF5CD5ADFF74DEC1FF2B8758FFB4887CFFD8C0B8FFC8A7
                9DFFC8A79DFFD5BCB4FF2E8E5EFF389D70FF389D70FF389C6FFF389C6FFF389B
                6EFF379B6EFF389B6DFF379A6DFF379A6DFF2C885AFFB48A7EFFFAF5F3FFF8F2
                EDFFF8F1EDFFFAF4F1FF2F9062FF77E0C3FF63D8B1FF62D7B1FF62D7B2FF399D
                70FF62D7B1FF62D7B0FF61D7B1FF76DFC2FF2E8A5CFFB68D7FFFFAF6F3FFF9F2
                EDFFF9F2EDFFFAF4F1FF309264FF78E0C4FF78E0C4FF78E0C4FF78E0C4FF3A9F
                73FF78DFC4FF78DFC3FF77E0C3FF78DFC3FF2E8D5EFFB78E81FFDDC6BFFFCBAB
                A2FFCBACA2FFD7C0B8FF329566FF339366FF329265FF309265FF329264FF3291
                64FF309163FF2F9062FF2F9062FF2F8F60FF2E8F60FFB88F82FFFAF7F4FFF8F3
                EFFFF8F2EEFFF9F4F1FFD8C0B9FFFAF6F2FFFAF5F3FFFAF5F2FFFAF5F2FFD7C0
                B8FFFAF6F2FFFAF5F2FFFAF5F2FFFCF8F6FFC7A79DFFB99085FFFBF8F5FFFAF8
                F5FFFBF8F4FFFBF6F4FFDFCAC3FFFBF6F5FFFBF7F4FFFBF7F4FFFBF6F4FFDDC8
                C1FFFAF6F4FFFBF7F5FFFBF6F5FFFBF7F5FFB68C80FF8A6C63C0BA9185FFBA91
                85FFBA9185FFBA9084FFB99185FFB99084FFB99084FFB99084FFB99083FFB890
                83FFB98F83FFB78F83FFB88E82FFB78E82FF876960C100000003000000040000
                0005000000050000000500000005000000050000000500000005000000050000
                00050000000500000006000000060000000500000004}
              TabOrder = 0
              OnClick = btn11Click
            end
          end
        end
        object cxTabSheet9: TcxTabSheet
          Caption = 'Pivot QTY Penjualan Per Bulan'
          ImageIndex = 1
          object cxGroupBox7: TcxGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Align = alTop
            Caption = 'Silahkan pilih Periode'
            TabOrder = 0
            Height = 57
            Width = 744
            object Label10: TLabel
              Left = 8
              Top = 24
              Width = 30
              Height = 13
              Caption = 'Tahun'
            end
            object dt10: TDateTimePicker
              Left = 55
              Top = 21
              Width = 106
              Height = 21
              Date = 43390.709585636580000000
              Format = 'yyyy'
              Time = 43390.709585636580000000
              DateMode = dmUpDown
              TabOrder = 0
            end
            object btn6: TcxButton
              Left = 167
              Top = 18
              Width = 75
              Height = 25
              Caption = 'Proses'
              TabOrder = 1
              OnClick = btn6Click
            end
          end
          object cxGrid4: TcxGrid
            Left = 0
            Top = 63
            Width = 750
            Height = 297
            Align = alClient
            TabOrder = 1
            object cxData4: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.FooterMultiSummaries = True
              OptionsView.GroupFooterMultiSummaries = True
              OptionsView.GroupFooters = gfVisibleWhenExpanded
            end
            object cxGridLevel3: TcxGridLevel
              GridView = cxData4
            end
          end
          object cxgrpbx6: TcxGroupBox
            Left = 0
            Top = 360
            Align = alBottom
            TabOrder = 2
            Height = 43
            Width = 750
            object btn12: TcxButton
              Left = 3
              Top = 12
              Width = 198
              Height = 25
              Caption = 'Export Data Ke Excel Format'
              OptionsImage.Glyph.SourceDPI = 96
              OptionsImage.Glyph.Data = {
                424D360400000000000036000000280000001000000010000000010020000000
                000000000000C40E0000C40E0000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000080000000C0000
                000D0000000D0000000D0000000D0000000D0000000D0000000D0000000E0000
                000E0000000E0000000E0000000E0000000D000000097B5A50BFAB7D6FFFAA7D
                6FFFAA7C6FFFAA7C6EFFAA7C6DFFA97B6DFFA97B6DFFA87B6DFFA97A6CFFA97A
                6CFFA8796CFFA87A6BFFA7796BFFA8786AFF78564CC0AC8072FFF9F2EEFFF9F3
                EEFFF9F1EEFFF9F1EEFFCFB2A8FFF9F1EEFFF8F1EEFFF8F2EEFFF8F1EDFFCEB0
                A6FFF9F1EDFFF9F2EDFFF9F1EDFFF9F1EEFFA87A6CFFAE8274FFF9F3F0FFF7EF
                EAFFF7EFEAFFF8F2EEFFD2B7AFFFF9F2EFFFF9F2EFFFF9F3EFFFF9F3EFFFD1B7
                AEFFF8F3EFFFF8F3EFFFF9F3EEFFFAF5F2FFBE9B91FFAF8375FFD3B8B0FFC5A3
                99FFC5A298FFD3B9B1FF2B8758FF2B8758FF2A8658FF2A8657FF2A8458FF2A84
                57FF298456FF298357FF298254FF298256FF298254FFB18578FFFAF4F0FFF8F0
                EBFFF7F0EBFFF9F3F0FF2C895BFF74DEC1FF74DEC1FF74DEC1FF74DEC0FF3597
                6AFF74DEC0FF74DEC0FF74DEC0FF74DEC0FF298455FFB28779FFF9F5F1FFF8F0
                ECFFF8F1EBFFFAF4F1FF2E8B5DFF76DFC1FF5FD6AFFF5DD6AEFF5DD5ADFF369A
                6CFF5DD5ACFF5DD5ACFF5CD5ADFF74DEC1FF2B8758FFB4887CFFD8C0B8FFC8A7
                9DFFC8A79DFFD5BCB4FF2E8E5EFF389D70FF389D70FF389C6FFF389C6FFF389B
                6EFF379B6EFF389B6DFF379A6DFF379A6DFF2C885AFFB48A7EFFFAF5F3FFF8F2
                EDFFF8F1EDFFFAF4F1FF2F9062FF77E0C3FF63D8B1FF62D7B1FF62D7B2FF399D
                70FF62D7B1FF62D7B0FF61D7B1FF76DFC2FF2E8A5CFFB68D7FFFFAF6F3FFF9F2
                EDFFF9F2EDFFFAF4F1FF309264FF78E0C4FF78E0C4FF78E0C4FF78E0C4FF3A9F
                73FF78DFC4FF78DFC3FF77E0C3FF78DFC3FF2E8D5EFFB78E81FFDDC6BFFFCBAB
                A2FFCBACA2FFD7C0B8FF329566FF339366FF329265FF309265FF329264FF3291
                64FF309163FF2F9062FF2F9062FF2F8F60FF2E8F60FFB88F82FFFAF7F4FFF8F3
                EFFFF8F2EEFFF9F4F1FFD8C0B9FFFAF6F2FFFAF5F3FFFAF5F2FFFAF5F2FFD7C0
                B8FFFAF6F2FFFAF5F2FFFAF5F2FFFCF8F6FFC7A79DFFB99085FFFBF8F5FFFAF8
                F5FFFBF8F4FFFBF6F4FFDFCAC3FFFBF6F5FFFBF7F4FFFBF7F4FFFBF6F4FFDDC8
                C1FFFAF6F4FFFBF7F5FFFBF6F5FFFBF7F5FFB68C80FF8A6C63C0BA9185FFBA91
                85FFBA9185FFBA9084FFB99185FFB99084FFB99084FFB99084FFB99083FFB890
                83FFB98F83FFB78F83FFB88E82FFB78E82FF876960C100000003000000040000
                0005000000050000000500000005000000050000000500000005000000050000
                00050000000500000006000000060000000500000004}
              TabOrder = 0
              OnClick = btn12Click
            end
          end
        end
        object cxtbsht1: TcxTabSheet
          Caption = 'Pivot Nominal Penjualan Per Periode'
          ImageIndex = 2
          object cxgrpbx1: TcxGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Align = alTop
            Caption = 'Silahkan pilih Periode'
            TabOrder = 0
            Height = 57
            Width = 744
            object Label11: TLabel
              Left = 8
              Top = 24
              Width = 46
              Height = 13
              Caption = 'Periode : '
            end
            object Label12: TLabel
              Left = 168
              Top = 24
              Width = 15
              Height = 13
              Caption = 's/d'
            end
            object dt11: TDateTimePicker
              Left = 55
              Top = 21
              Width = 106
              Height = 21
              Date = 43390.709585636580000000
              Time = 43390.709585636580000000
              TabOrder = 0
            end
            object dt12: TDateTimePicker
              Left = 189
              Top = 21
              Width = 100
              Height = 21
              Date = 43390.709942118050000000
              Time = 43390.709942118050000000
              TabOrder = 1
            end
            object btn7: TcxButton
              Left = 295
              Top = 19
              Width = 75
              Height = 25
              Caption = 'Proses'
              TabOrder = 2
              OnClick = btn7Click
            end
          end
          object cxgrd1: TcxGrid
            Left = 0
            Top = 63
            Width = 750
            Height = 297
            Align = alClient
            TabOrder = 1
            object cxdata5: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.FooterMultiSummaries = True
              OptionsView.GroupFooterMultiSummaries = True
              OptionsView.GroupFooters = gfVisibleWhenExpanded
            end
            object cxgrdlvl1: TcxGridLevel
              GridView = cxdata5
            end
          end
          object cxgrpbx7: TcxGroupBox
            Left = 0
            Top = 360
            Align = alBottom
            TabOrder = 2
            Height = 43
            Width = 750
            object btn13: TcxButton
              Left = 3
              Top = 12
              Width = 198
              Height = 25
              Caption = 'Export Data Ke Excel Format'
              OptionsImage.Glyph.SourceDPI = 96
              OptionsImage.Glyph.Data = {
                424D360400000000000036000000280000001000000010000000010020000000
                000000000000C40E0000C40E0000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000080000000C0000
                000D0000000D0000000D0000000D0000000D0000000D0000000D0000000E0000
                000E0000000E0000000E0000000E0000000D000000097B5A50BFAB7D6FFFAA7D
                6FFFAA7C6FFFAA7C6EFFAA7C6DFFA97B6DFFA97B6DFFA87B6DFFA97A6CFFA97A
                6CFFA8796CFFA87A6BFFA7796BFFA8786AFF78564CC0AC8072FFF9F2EEFFF9F3
                EEFFF9F1EEFFF9F1EEFFCFB2A8FFF9F1EEFFF8F1EEFFF8F2EEFFF8F1EDFFCEB0
                A6FFF9F1EDFFF9F2EDFFF9F1EDFFF9F1EEFFA87A6CFFAE8274FFF9F3F0FFF7EF
                EAFFF7EFEAFFF8F2EEFFD2B7AFFFF9F2EFFFF9F2EFFFF9F3EFFFF9F3EFFFD1B7
                AEFFF8F3EFFFF8F3EFFFF9F3EEFFFAF5F2FFBE9B91FFAF8375FFD3B8B0FFC5A3
                99FFC5A298FFD3B9B1FF2B8758FF2B8758FF2A8658FF2A8657FF2A8458FF2A84
                57FF298456FF298357FF298254FF298256FF298254FFB18578FFFAF4F0FFF8F0
                EBFFF7F0EBFFF9F3F0FF2C895BFF74DEC1FF74DEC1FF74DEC1FF74DEC0FF3597
                6AFF74DEC0FF74DEC0FF74DEC0FF74DEC0FF298455FFB28779FFF9F5F1FFF8F0
                ECFFF8F1EBFFFAF4F1FF2E8B5DFF76DFC1FF5FD6AFFF5DD6AEFF5DD5ADFF369A
                6CFF5DD5ACFF5DD5ACFF5CD5ADFF74DEC1FF2B8758FFB4887CFFD8C0B8FFC8A7
                9DFFC8A79DFFD5BCB4FF2E8E5EFF389D70FF389D70FF389C6FFF389C6FFF389B
                6EFF379B6EFF389B6DFF379A6DFF379A6DFF2C885AFFB48A7EFFFAF5F3FFF8F2
                EDFFF8F1EDFFFAF4F1FF2F9062FF77E0C3FF63D8B1FF62D7B1FF62D7B2FF399D
                70FF62D7B1FF62D7B0FF61D7B1FF76DFC2FF2E8A5CFFB68D7FFFFAF6F3FFF9F2
                EDFFF9F2EDFFFAF4F1FF309264FF78E0C4FF78E0C4FF78E0C4FF78E0C4FF3A9F
                73FF78DFC4FF78DFC3FF77E0C3FF78DFC3FF2E8D5EFFB78E81FFDDC6BFFFCBAB
                A2FFCBACA2FFD7C0B8FF329566FF339366FF329265FF309265FF329264FF3291
                64FF309163FF2F9062FF2F9062FF2F8F60FF2E8F60FFB88F82FFFAF7F4FFF8F3
                EFFFF8F2EEFFF9F4F1FFD8C0B9FFFAF6F2FFFAF5F3FFFAF5F2FFFAF5F2FFD7C0
                B8FFFAF6F2FFFAF5F2FFFAF5F2FFFCF8F6FFC7A79DFFB99085FFFBF8F5FFFAF8
                F5FFFBF8F4FFFBF6F4FFDFCAC3FFFBF6F5FFFBF7F4FFFBF7F4FFFBF6F4FFDDC8
                C1FFFAF6F4FFFBF7F5FFFBF6F5FFFBF7F5FFB68C80FF8A6C63C0BA9185FFBA91
                85FFBA9185FFBA9084FFB99185FFB99084FFB99084FFB99084FFB99083FFB890
                83FFB98F83FFB78F83FFB88E82FFB78E82FF876960C100000003000000040000
                0005000000050000000500000005000000050000000500000005000000050000
                00050000000500000006000000060000000500000004}
              TabOrder = 0
              OnClick = btn13Click
            end
          end
        end
        object cxtbsht2: TcxTabSheet
          Caption = 'Pivot Nominal Penjualan Per Bulan'
          ImageIndex = 3
          object cxgrpbx2: TcxGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Align = alTop
            Caption = 'Silahkan pilih Periode'
            TabOrder = 0
            Height = 57
            Width = 744
            object Label13: TLabel
              Left = 8
              Top = 24
              Width = 30
              Height = 13
              Caption = 'Tahun'
            end
            object dt13: TDateTimePicker
              Left = 55
              Top = 21
              Width = 106
              Height = 21
              Date = 43390.709585636580000000
              Format = 'yyyy'
              Time = 43390.709585636580000000
              DateMode = dmUpDown
              TabOrder = 0
            end
            object btn8: TcxButton
              Left = 167
              Top = 18
              Width = 75
              Height = 25
              Caption = 'Proses'
              TabOrder = 1
              OnClick = btn8Click
            end
          end
          object cxgrd2: TcxGrid
            Left = 0
            Top = 63
            Width = 750
            Height = 297
            Align = alClient
            TabOrder = 1
            object cxdata6: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.FooterMultiSummaries = True
              OptionsView.GroupFooterMultiSummaries = True
              OptionsView.GroupFooters = gfVisibleWhenExpanded
            end
            object cxgrdlvl2: TcxGridLevel
              GridView = cxdata6
            end
          end
          object cxgrpbx8: TcxGroupBox
            Left = 0
            Top = 360
            Align = alBottom
            TabOrder = 2
            Height = 43
            Width = 750
            object btn14: TcxButton
              Left = 3
              Top = 12
              Width = 198
              Height = 25
              Caption = 'Export Data Ke Excel Format'
              OptionsImage.Glyph.SourceDPI = 96
              OptionsImage.Glyph.Data = {
                424D360400000000000036000000280000001000000010000000010020000000
                000000000000C40E0000C40E0000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000080000000C0000
                000D0000000D0000000D0000000D0000000D0000000D0000000D0000000E0000
                000E0000000E0000000E0000000E0000000D000000097B5A50BFAB7D6FFFAA7D
                6FFFAA7C6FFFAA7C6EFFAA7C6DFFA97B6DFFA97B6DFFA87B6DFFA97A6CFFA97A
                6CFFA8796CFFA87A6BFFA7796BFFA8786AFF78564CC0AC8072FFF9F2EEFFF9F3
                EEFFF9F1EEFFF9F1EEFFCFB2A8FFF9F1EEFFF8F1EEFFF8F2EEFFF8F1EDFFCEB0
                A6FFF9F1EDFFF9F2EDFFF9F1EDFFF9F1EEFFA87A6CFFAE8274FFF9F3F0FFF7EF
                EAFFF7EFEAFFF8F2EEFFD2B7AFFFF9F2EFFFF9F2EFFFF9F3EFFFF9F3EFFFD1B7
                AEFFF8F3EFFFF8F3EFFFF9F3EEFFFAF5F2FFBE9B91FFAF8375FFD3B8B0FFC5A3
                99FFC5A298FFD3B9B1FF2B8758FF2B8758FF2A8658FF2A8657FF2A8458FF2A84
                57FF298456FF298357FF298254FF298256FF298254FFB18578FFFAF4F0FFF8F0
                EBFFF7F0EBFFF9F3F0FF2C895BFF74DEC1FF74DEC1FF74DEC1FF74DEC0FF3597
                6AFF74DEC0FF74DEC0FF74DEC0FF74DEC0FF298455FFB28779FFF9F5F1FFF8F0
                ECFFF8F1EBFFFAF4F1FF2E8B5DFF76DFC1FF5FD6AFFF5DD6AEFF5DD5ADFF369A
                6CFF5DD5ACFF5DD5ACFF5CD5ADFF74DEC1FF2B8758FFB4887CFFD8C0B8FFC8A7
                9DFFC8A79DFFD5BCB4FF2E8E5EFF389D70FF389D70FF389C6FFF389C6FFF389B
                6EFF379B6EFF389B6DFF379A6DFF379A6DFF2C885AFFB48A7EFFFAF5F3FFF8F2
                EDFFF8F1EDFFFAF4F1FF2F9062FF77E0C3FF63D8B1FF62D7B1FF62D7B2FF399D
                70FF62D7B1FF62D7B0FF61D7B1FF76DFC2FF2E8A5CFFB68D7FFFFAF6F3FFF9F2
                EDFFF9F2EDFFFAF4F1FF309264FF78E0C4FF78E0C4FF78E0C4FF78E0C4FF3A9F
                73FF78DFC4FF78DFC3FF77E0C3FF78DFC3FF2E8D5EFFB78E81FFDDC6BFFFCBAB
                A2FFCBACA2FFD7C0B8FF329566FF339366FF329265FF309265FF329264FF3291
                64FF309163FF2F9062FF2F9062FF2F8F60FF2E8F60FFB88F82FFFAF7F4FFF8F3
                EFFFF8F2EEFFF9F4F1FFD8C0B9FFFAF6F2FFFAF5F3FFFAF5F2FFFAF5F2FFD7C0
                B8FFFAF6F2FFFAF5F2FFFAF5F2FFFCF8F6FFC7A79DFFB99085FFFBF8F5FFFAF8
                F5FFFBF8F4FFFBF6F4FFDFCAC3FFFBF6F5FFFBF7F4FFFBF7F4FFFBF6F4FFDDC8
                C1FFFAF6F4FFFBF7F5FFFBF6F5FFFBF7F5FFB68C80FF8A6C63C0BA9185FFBA91
                85FFBA9185FFBA9084FFB99185FFB99084FFB99084FFB99084FFB99083FFB890
                83FFB98F83FFB78F83FFB88E82FFB78E82FF876960C100000003000000040000
                0005000000050000000500000005000000050000000500000005000000050000
                00050000000500000006000000060000000500000004}
              TabOrder = 0
              OnClick = btn14Click
            end
          end
        end
      end
    end
  end
  object DBCrossPivotPediode: TDBCrossTabSource
    DataSet = Dlaporan.QpivotHari
    GroupField = 'namasales'
    LabelField = 'tgljual'
    ValueField = 'total'
    Left = 176
    Top = 176
  end
  object DBCrossPivotBulan: TDBCrossTabSource
    DataSet = Dlaporan.QpivotHari
    GroupField = 'namasales'
    LabelField = 'tgljual'
    ValueField = 'total'
    Left = 328
    Top = 176
  end
end
