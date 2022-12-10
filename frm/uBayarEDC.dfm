object FbayarEDC: TFbayarEDC
  Left = 0
  Top = 0
  Caption = 'Pilih Mesin EDC'
  ClientHeight = 182
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 23
    Top = 13
    Width = 75
    Height = 19
    Caption = 'Mesin EDC'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 122
    Top = 13
    Width = 6
    Height = 19
    Caption = ':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 47
    Width = 83
    Height = 19
    Caption = 'Kartu Debet'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 122
    Top = 47
    Width = 6
    Height = 19
    Caption = ':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 24
    Top = 74
    Width = 62
    Height = 19
    Caption = 'No Kartu'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 122
    Top = 74
    Width = 6
    Height = 19
    Caption = ':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lst1: TListBox
    Left = 130
    Top = 13
    Width = 222
    Height = 130
    ItemHeight = 13
    ScrollWidth = 1
    TabOrder = 1
    Visible = False
    OnKeyDown = lst1KeyDown
  end
  object EMesinEDC: TcxTextEdit
    Left = 130
    Top = 10
    ParentFont = False
    Properties.ReadOnly = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 0
    OnEnter = EMesinEDCEnter
    OnKeyDown = EMesinEDCKeyDown
    Width = 222
  end
  object EKartuDebet: TcxTextEdit
    Left = 131
    Top = 42
    ParentFont = False
    Properties.ReadOnly = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 2
    OnEnter = EKartuDebetEnter
    OnKeyDown = EKartuDebetKeyDown
    Width = 222
  end
  object btnOk: TButton
    Left = 72
    Top = 149
    Width = 225
    Height = 25
    Caption = 'Terapkan Ke Pembayaran [ Space ]'
    TabOrder = 4
    OnClick = btnOkClick
  end
  object ENokartu: TcxTextEdit
    Left = 131
    Top = 69
    ParentFont = False
    Properties.ReadOnly = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 3
    Width = 222
  end
end
