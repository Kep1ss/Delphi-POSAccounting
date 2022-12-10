object Fsplash: TFsplash
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 246
  ClientWidth = 467
  Color = clWhite
  DoubleBuffered = True
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
  object img1: TImage
    Left = 0
    Top = 0
    Width = 467
    Height = 202
    Align = alClient
    ExplicitLeft = 8
    ExplicitTop = 53
    ExplicitWidth = 113
    ExplicitHeight = 137
  end
  object Lprogress: TLabel
    Left = 0
    Top = 202
    Width = 467
    Height = 13
    Align = alBottom
    Caption = 'Loading ....'
    ExplicitLeft = 3
    ExplicitTop = 196
    ExplicitWidth = 56
  end
  object Label3: TLabel
    Left = 319
    Top = 8
    Width = 140
    Height = 13
    Caption = 'Email : anabasoft@gmail.com'
  end
  object Label4: TLabel
    Left = 319
    Top = 27
    Width = 120
    Height = 13
    Caption = 'Contact : 081335344967'
  end
  object pb1: TProgressBar
    Left = 0
    Top = 215
    Width = 467
    Height = 31
    Align = alBottom
    Max = 47
    TabOrder = 0
  end
  object tmr1: TTimer
    Left = 384
    Top = 120
  end
end
