object FsettingDatabase: TFsettingDatabase
  Left = 0
  Top = 0
  Caption = 'Setting Database'
  ClientHeight = 228
  ClientWidth = 324
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object L1: TLabel
    Left = 16
    Top = 24
    Width = 32
    Height = 13
    Caption = 'Server'
    Transparent = True
  end
  object L2: TLabel
    Left = 78
    Top = 24
    Width = 4
    Height = 13
    Caption = ':'
    Transparent = True
  end
  object Label1: TLabel
    Left = 16
    Top = 51
    Width = 22
    Height = 13
    Caption = 'User'
    Transparent = True
  end
  object Label2: TLabel
    Left = 78
    Top = 51
    Width = 4
    Height = 13
    Caption = ':'
    Transparent = True
  end
  object Label3: TLabel
    Left = 16
    Top = 78
    Width = 46
    Height = 13
    Caption = 'Password'
    Transparent = True
  end
  object Label4: TLabel
    Left = 78
    Top = 78
    Width = 4
    Height = 13
    Caption = ':'
    Transparent = True
  end
  object Label5: TLabel
    Left = 16
    Top = 105
    Width = 20
    Height = 13
    Caption = 'Port'
    Transparent = True
  end
  object Label6: TLabel
    Left = 78
    Top = 105
    Width = 4
    Height = 13
    Caption = ':'
    Transparent = True
  end
  object Label7: TLabel
    Left = 16
    Top = 132
    Width = 46
    Height = 13
    Caption = 'Database'
    Transparent = True
  end
  object Label8: TLabel
    Left = 78
    Top = 132
    Width = 4
    Height = 13
    Caption = ':'
    Transparent = True
  end
  object Eserver: TcxTextEdit
    Left = 88
    Top = 21
    TabOrder = 1
    Width = 224
  end
  object Euser: TcxTextEdit
    Left = 88
    Top = 48
    TabOrder = 2
    Width = 97
  end
  object EPassword: TcxTextEdit
    Left = 88
    Top = 75
    TabOrder = 3
    Width = 145
  end
  object EPort: TcxTextEdit
    Left = 88
    Top = 102
    TabOrder = 4
    Width = 73
  end
  object EDatabase: TcxTextEdit
    Left = 88
    Top = 129
    TabOrder = 5
    Width = 128
  end
  object btnTest: TcxButton
    Left = 40
    Top = 184
    Width = 97
    Height = 25
    Caption = 'Test Connection'
    TabOrder = 0
    OnClick = btnTestClick
  end
  object btnTutup: TcxButton
    Left = 143
    Top = 184
    Width = 97
    Height = 25
    Caption = 'Close'
    TabOrder = 6
    OnClick = btnTutupClick
  end
end
