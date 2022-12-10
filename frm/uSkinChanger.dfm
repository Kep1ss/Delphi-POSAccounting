object FPilhSkin: TFPilhSkin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Skin Changer'
  ClientHeight = 129
  ClientWidth = 605
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dxRibbon1: TdxRibbon
    Left = 0
    Top = 0
    Width = 605
    Height = 126
    BarManager = dxMn1
    ColorSchemeName = 'Blue'
    Contexts = <>
    TabOrder = 4
    TabStop = False
    ExplicitLeft = -8
    ExplicitWidth = 447
    object dxRibbon1Tab1: TdxRibbonTab
      Active = True
      Caption = 'Pilih Skins'
      Groups = <
        item
          ToolbarName = 'dxGMn1Bar1'
        end>
      Index = 0
    end
  end
  object dxlytlkndflst1: TdxLayoutLookAndFeelList
    Left = 336
    Top = 152
  end
  object cxImg1: TcxImageList
    FormatVersion = 1
    DesignInfo = 5767336
  end
  object dxMn1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 176
    Top = 152
    DockControlHeights = (
      0
      0
      0
      0)
    object dxGMn1Bar1: TdxBar
      Caption = 'Pilih Skins'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 481
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxsknchsrglrytm2'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxsknchsrglrytm2: TdxSkinChooserGalleryItem
      Caption = 'New Skin Chooser'
      Category = 0
      Visible = ivAlways
      GalleryOptions.ColumnCount = 10
      GalleryInRibbonOptions.AlwaysShowItemCaption = True
      GalleryInMenuOptions.RowCount = 10
      ItemLinks = <>
      OnSkinChanged = dxsknchsrglrytm2SkinChanged
    end
  end
  object dxskncntrlr1: TdxSkinController
    Kind = lfFlat
    NativeStyle = False
    SkinName = 'TheAsphaltWorld'
    Left = 264
    Top = 128
  end
end
