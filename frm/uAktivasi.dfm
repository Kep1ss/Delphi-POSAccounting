object FAktivasi: TFAktivasi
  Left = 0
  Top = 0
  Caption = 'Aktivasi Cashey POS v8'
  ClientHeight = 165
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 11
    Width = 93
    Height = 13
    Caption = 'Hardware Product  '
    Visible = False
  end
  object Label2: TLabel
    Left = 16
    Top = 46
    Width = 61
    Height = 13
    Caption = 'Hardware ID'
    Visible = False
  end
  object Label3: TLabel
    Left = 128
    Top = 11
    Width = 4
    Height = 13
    Caption = ':'
    Visible = False
  end
  object Label4: TLabel
    Left = 128
    Top = 46
    Width = 4
    Height = 13
    Caption = ':'
    Visible = False
  end
  object Label5: TLabel
    Left = 14
    Top = 30
    Width = 66
    Height = 13
    Caption = 'Serial Number'
  end
  object Label6: TLabel
    Left = 128
    Top = 30
    Width = 4
    Height = 13
    Caption = ':'
  end
  object Label7: TLabel
    Left = 14
    Top = 62
    Width = 47
    Height = 13
    Caption = 'Serial Key'
  end
  object EhwProduct: TEdit
    Left = 143
    Top = 8
    Width = 274
    Height = 21
    Enabled = False
    TabOrder = 0
    Visible = False
  end
  object EHwId: TEdit
    Left = 143
    Top = 43
    Width = 274
    Height = 21
    Enabled = False
    TabOrder = 1
    Visible = False
  end
  object EserialNumb: TEdit
    Left = 143
    Top = 27
    Width = 272
    Height = 21
    TabOrder = 2
  end
  object Es1: TEdit
    Left = 14
    Top = 91
    Width = 93
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    MaxLength = 4
    ParentFont = False
    TabOrder = 3
  end
  object Es2: TEdit
    Left = 113
    Top = 91
    Width = 93
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    MaxLength = 4
    ParentFont = False
    TabOrder = 4
  end
  object Es3: TEdit
    Left = 212
    Top = 91
    Width = 93
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    MaxLength = 4
    ParentFont = False
    TabOrder = 5
  end
  object Es4: TEdit
    Left = 311
    Top = 91
    Width = 93
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    MaxLength = 4
    ParentFont = False
    TabOrder = 6
  end
  object btn1: TButton
    Left = 16
    Top = 129
    Width = 75
    Height = 25
    Caption = 'Activate'
    TabOrder = 7
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 97
    Top = 129
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 8
    OnClick = btn2Click
  end
end
