object FinputGiro: TFinputGiro
  Left = 0
  Top = 0
  Caption = 'Input Cek/Giro'
  ClientHeight = 311
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 46
    Height = 14
    Caption = 'No Bukti'
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 17
    Height = 14
    Caption = 'Tgl'
  end
  object Label3: TLabel
    Left = 16
    Top = 64
    Width = 73
    Height = 14
    Caption = 'No Cek / Giro'
  end
  object Label4: TLabel
    Left = 16
    Top = 88
    Width = 26
    Height = 14
    Caption = 'Bank'
  end
  object Label5: TLabel
    Left = 16
    Top = 112
    Width = 25
    Height = 14
    Caption = 'Kota'
  end
  object Label6: TLabel
    Left = 16
    Top = 136
    Width = 42
    Height = 14
    Caption = 'Nominal'
  end
  object Label7: TLabel
    Left = 16
    Top = 160
    Width = 40
    Height = 14
    Caption = 'Tgl Cair'
  end
  object Label8: TLabel
    Left = 16
    Top = 184
    Width = 53
    Height = 14
    Caption = 'Akun Giro'
  end
  object Label9: TLabel
    Left = 96
    Top = 16
    Width = 4
    Height = 14
    Caption = ':'
  end
  object Label10: TLabel
    Left = 96
    Top = 40
    Width = 4
    Height = 14
    Caption = ':'
  end
  object Label11: TLabel
    Left = 96
    Top = 64
    Width = 4
    Height = 14
    Caption = ':'
  end
  object Label12: TLabel
    Left = 96
    Top = 88
    Width = 4
    Height = 14
    Caption = ':'
  end
  object Label13: TLabel
    Left = 96
    Top = 112
    Width = 4
    Height = 14
    Caption = ':'
  end
  object Label14: TLabel
    Left = 96
    Top = 136
    Width = 4
    Height = 14
    Caption = ':'
  end
  object Label15: TLabel
    Left = 96
    Top = 160
    Width = 4
    Height = 14
    Caption = ':'
  end
  object Label16: TLabel
    Left = 96
    Top = 184
    Width = 4
    Height = 14
    Caption = ':'
  end
  object Label17: TLabel
    Left = 16
    Top = 212
    Width = 56
    Height = 14
    Caption = 'Keteragan'
  end
  object Label18: TLabel
    Left = 96
    Top = 212
    Width = 4
    Height = 14
    Caption = ':'
  end
  object ENoBukti: TcxTextEdit
    Left = 106
    Top = 12
    Enabled = False
    TabOrder = 0
    Width = 175
  end
  object dt1: TDateTimePicker
    Left = 106
    Top = 37
    Width = 186
    Height = 22
    Date = 43387.095951226850000000
    Time = 43387.095951226850000000
    TabOrder = 1
    OnKeyDown = dt1KeyDown
  end
  object ENogiro: TcxTextEdit
    Left = 106
    Top = 61
    TabOrder = 2
    Width = 186
  end
  object EBank: TcxTextEdit
    Left = 106
    Top = 85
    TabOrder = 3
    Width = 287
  end
  object Ekota: TcxTextEdit
    Left = 106
    Top = 109
    TabOrder = 4
    Width = 143
  end
  object ENominal: TcxTextEdit
    Left = 106
    Top = 133
    TabOrder = 5
    Width = 143
  end
  object dt2: TDateTimePicker
    Left = 106
    Top = 158
    Width = 186
    Height = 22
    Date = 43387.095951226850000000
    Time = 43387.095951226850000000
    TabOrder = 6
    OnKeyDown = dt2KeyDown
  end
  object cbgiro: TcxComboBox
    Left = 106
    Top = 181
    TabOrder = 7
    Text = 'cbgiro'
    Width = 333
  end
  object btnSimpan: TcxButton
    Left = 16
    Top = 278
    Width = 84
    Height = 25
    Caption = 'SIMPAN'
    TabOrder = 9
    OnClick = btnSimpanClick
  end
  object btnTutup: TcxButton
    Left = 106
    Top = 278
    Width = 84
    Height = 25
    Caption = 'TUTUP'
    TabOrder = 10
    OnClick = btnTutupClick
  end
  object Eketerangan: TcxTextEdit
    Left = 106
    Top = 209
    TabOrder = 8
    Width = 333
  end
end
