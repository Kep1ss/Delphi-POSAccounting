object Fbackupdatabase: TFbackupdatabase
  Left = 0
  Top = 0
  Caption = '.:: Backup Database ::.'
  ClientHeight = 143
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sGroupBox1: TsGroupBox
    Left = 0
    Top = 0
    Width = 315
    Height = 143
    Align = alClient
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    ExplicitHeight = 116
    object sLabel1: TsLabel
      Left = 16
      Top = 19
      Width = 77
      Height = 26
      Caption = 'Tentukan '#13'Direktori Backup'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object Label1: TLabel
      Left = 24
      Top = 64
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label2: TLabel
      Left = 62
      Top = 64
      Width = 4
      Height = 13
      Caption = '/'
    end
    object Label3: TLabel
      Left = 72
      Top = 64
      Width = 6
      Height = 13
      Caption = '0'
    end
    object sEdit1: TsEdit
      Left = 99
      Top = 24
      Width = 142
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      SkinData.SkinSection = 'EDIT'
      BoundLabel.ParentFont = False
    end
    object sBitBtn1: TsBitBtn
      Left = 18
      Top = 111
      Width = 75
      Height = 25
      Caption = 'Backup'
      TabOrder = 2
      OnClick = sBitBtn1Click
      SkinData.SkinSection = 'BUTTON'
    end
    object sBitBtn2: TsBitBtn
      Left = 99
      Top = 111
      Width = 75
      Height = 25
      Caption = 'Tutup'
      TabOrder = 3
      OnClick = sBitBtn2Click
      SkinData.SkinSection = 'BUTTON'
    end
    object sBitBtn3: TsBitBtn
      Left = 246
      Top = 22
      Width = 59
      Height = 25
      Caption = 'Browse'
      TabOrder = 0
      OnClick = sBitBtn3Click
      SkinData.SkinSection = 'BUTTON'
    end
    object pb1: TProgressBar
      Left = 24
      Top = 80
      Width = 281
      Height = 17
      TabOrder = 4
    end
  end
  object fd: TRzSelectFolderDialog
    Left = 208
    Top = 56
  end
end
