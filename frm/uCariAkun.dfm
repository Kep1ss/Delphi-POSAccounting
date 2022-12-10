object FcariAkun: TFcariAkun
  Left = 0
  Top = 0
  Caption = 'Cari Akun'
  ClientHeight = 359
  ClientWidth = 485
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxgrd1: TcxGrid
    Left = 8
    Top = 46
    Width = 470
    Height = 305
    TabOrder = 0
    object cxgrd1DBTableView1: TcxGridDBTableView
      OnDblClick = cxgrd1DBTableView1DblClick
      OnKeyDown = cxgrd1DBTableView1KeyDown
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dm.DMasterAkunPerkiraan
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxgrd1DBTableView1kodeakunperkiraan: TcxGridDBColumn
        Caption = 'No Akun'
        DataBinding.FieldName = 'kodeakunperkiraan'
      end
      object cxgrd1DBTableView1namaakunperkiraan: TcxGridDBColumn
        Caption = 'Nama Akun Perkiraan'
        DataBinding.FieldName = 'namaakunperkiraan'
      end
    end
    object GGrid1Level1: TcxGridLevel
      GridView = cxgrd1DBTableView1
    end
  end
  object EPencarian: TcxTextEdit
    Left = 8
    Top = 16
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsItalic]
    Style.IsFontAssigned = True
    TabOrder = 1
    Text = 'Ketik No AKun atau nama akun'
    OnEnter = EPencarianEnter
    OnExit = EPencarianExit
    Width = 469
  end
end
