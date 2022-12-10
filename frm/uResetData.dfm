object FresetData: TFresetData
  Left = 0
  Top = 0
  Caption = 'Reset Data'
  ClientHeight = 281
  ClientWidth = 302
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object mmo1: TMemo
    Left = 8
    Top = 8
    Width = 281
    Height = 186
    BorderStyle = bsNone
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object btnReset: TButton
    Left = 22
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Reset Data'
    TabOrder = 1
    OnClick = btnResetClick
  end
  object btnTutup: TButton
    Left = 184
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Tutup'
    TabOrder = 2
    OnClick = btnTutupClick
  end
  object CheckBox1: TCheckBox
    Left = 26
    Top = 200
    Width = 97
    Height = 17
    Caption = 'Reset Transaksi'
    TabOrder = 3
  end
  object CheckBox2: TCheckBox
    Left = 129
    Top = 200
    Width = 130
    Height = 17
    Caption = 'Reset Master Barang'
    TabOrder = 4
  end
  object Button1: TButton
    Left = 103
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Sync Stok'
    TabOrder = 5
    OnClick = Button1Click
  end
  object cbBulan: TComboBox
    Left = 22
    Top = 223
    Width = 101
    Height = 21
    TabOrder = 6
    Items.Strings = (
      'JANUARI'
      'FEBRUARI'
      'MARET'
      'APRIL'
      'MEI'
      'JUNI'
      'JULI'
      'AGUSTUS'
      'SEPTEMBER'
      'OKTOBER'
      'NOVEMBER'
      'DESEMBER')
  end
  object dtTahun: TDateTimePicker
    Left = 143
    Top = 223
    Width = 114
    Height = 21
    Date = 44838.948676701390000000
    Format = 'yyyy'
    Time = 44838.948676701390000000
    TabOrder = 7
  end
end
