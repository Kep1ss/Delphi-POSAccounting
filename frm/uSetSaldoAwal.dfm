object FSaldoAwal: TFSaldoAwal
  Left = 0
  Top = 0
  Caption = 'FSaldoAwal'
  ClientHeight = 159
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 38
    Height = 13
    Caption = 'Tanggal'
  end
  object Label2: TLabel
    Left = 92
    Top = 16
    Width = 4
    Height = 13
    Caption = ':'
  end
  object Label3: TLabel
    Left = 16
    Top = 40
    Width = 23
    Height = 13
    Caption = 'Kasir'
  end
  object Label4: TLabel
    Left = 92
    Top = 40
    Width = 4
    Height = 13
    Caption = ':'
  end
  object Label5: TLabel
    Left = 16
    Top = 89
    Width = 52
    Height = 13
    Caption = 'Saldo Awal'
  end
  object Label6: TLabel
    Left = 92
    Top = 89
    Width = 4
    Height = 13
    Caption = ':'
  end
  object Label7: TLabel
    Left = 16
    Top = 65
    Width = 39
    Height = 13
    Caption = 'Dari Kas'
  end
  object Label8: TLabel
    Left = 92
    Top = 65
    Width = 4
    Height = 13
    Caption = ':'
  end
  object dt1: TDateTimePicker
    Left = 101
    Top = 13
    Width = 116
    Height = 21
    Date = 44208.328149907410000000
    Time = 44208.328149907410000000
    Enabled = False
    TabOrder = 0
  end
  object btnSimpan: TcxButton
    Left = 72
    Top = 122
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 1
    OnClick = btnSimpanClick
  end
  object btnTutup: TcxButton
    Left = 153
    Top = 122
    Width = 75
    Height = 25
    Caption = 'Tutup'
    TabOrder = 2
    OnClick = btnTutupClick
  end
  object EKasir: TcxTextEdit
    Left = 100
    Top = 37
    TabOrder = 3
    Width = 234
  end
  object ESaldoAwal: TcxTextEdit
    Left = 100
    Top = 86
    TabOrder = 4
    Width = 234
  end
  object cbAkun: TcxComboBox
    Left = 101
    Top = 62
    Properties.Items.Strings = (
      'CASH'
      'KREDIT')
    TabOrder = 5
    Width = 233
  end
end
