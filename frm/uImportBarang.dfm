object FimportBarang: TFimportBarang
  Left = 0
  Top = 0
  Caption = 'Import Data Barang'
  ClientHeight = 393
  ClientWidth = 791
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
  object grp1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 785
    Height = 70
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 23
      Height = 13
      Caption = 'File :'
    end
    object Label2: TLabel
      Left = 240
      Top = 45
      Width = 334
      Height = 13
      Caption = 
        'Untuk kolom KATEGORI pastikan data kategori sudah ada di databas' +
        'e'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 202
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Efile: TEdit
      Left = 40
      Top = 13
      Width = 425
      Height = 21
      TabOrder = 0
    end
    object btn1: TcxButton
      Left = 471
      Top = 11
      Width = 42
      Height = 25
      Caption = '....'
      TabOrder = 1
      OnClick = btn1Click
    end
    object btn2: TcxButton
      Left = 8
      Top = 40
      Width = 169
      Height = 25
      Caption = 'Download Format Import'
      TabOrder = 2
      OnClick = btn2Click
    end
  end
  object grp2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 79
    Width = 785
    Height = 267
    Align = alClient
    TabOrder = 1
    object sg1: TAdvStringGrid
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 775
      Height = 244
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
      TabOrder = 0
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
  object grp3: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 352
    Width = 785
    Height = 38
    Align = alBottom
    TabOrder = 2
    object btn3: TcxButton
      Left = 8
      Top = 10
      Width = 121
      Height = 25
      Caption = 'Proses'
      TabOrder = 0
      OnClick = btn3Click
    end
    object btn4: TcxButton
      Left = 135
      Top = 9
      Width = 121
      Height = 25
      Caption = 'Tutup'
      TabOrder = 1
      OnClick = btn4Click
    end
    object btnKosongbarang: TcxButton
      Left = 262
      Top = 10
      Width = 139
      Height = 25
      Caption = 'Kosongkan Data Barang'
      TabOrder = 2
      OnClick = btnKosongbarangClick
    end
  end
  object OD1: TOpenDialog
    Left = 424
    Top = 96
  end
  object Ex1: TAdvGridExcelIO
    AdvStringGrid = sg1
    Options.ExportOverwrite = omAlways
    Options.ExportOverwriteMessage = 'File %s already exists'#13'Ok to overwrite ?'
    Options.ExportRawRTF = False
    Options.ExportShowInExcel = True
    UseUnicode = False
    GridStartRow = 0
    GridStartCol = 0
    Version = '3.4.1'
    Left = 336
    Top = 120
  end
end
