object FTokoManager: TFTokoManager
  Left = 0
  Top = 0
  Caption = 'Toko Manager'
  ClientHeight = 489
  ClientWidth = 776
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 776
    Height = 489
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = cxTabSheet2
    Properties.CustomButtons.Buttons = <>
    Properties.Style = 9
    LookAndFeel.Kind = lfOffice11
    OnChange = cxPageControl1Change
    ClientRectBottom = 489
    ClientRectRight = 776
    ClientRectTop = 20
    object cxTabSheet1: TcxTabSheet
      Caption = 'Data Cabang'
      ImageIndex = 0
      object cxlbl1: TcxLabel
        Left = 24
        Top = 16
        Caption = 'Nama Toko'
      end
      object cxlbl2: TcxLabel
        Left = 24
        Top = 43
        Caption = 'Alamat'
      end
      object cxlbl3: TcxLabel
        Left = 24
        Top = 68
        Caption = 'Kota'
      end
      object cxlbl4: TcxLabel
        Left = 24
        Top = 95
        Caption = 'No Telepon'
      end
      object cxLabel1: TcxLabel
        Left = 96
        Top = 16
        Caption = ':'
      end
      object cxLabel2: TcxLabel
        Left = 96
        Top = 38
        Caption = ':'
      end
      object cxLabel3: TcxLabel
        Left = 96
        Top = 60
        Caption = ':'
      end
      object cxLabel4: TcxLabel
        Left = 96
        Top = 82
        Caption = ':'
      end
      object ENamaToko: TcxTextEdit
        Left = 112
        Top = 16
        TabOrder = 8
        Width = 281
      end
      object EAlamat: TcxTextEdit
        Left = 112
        Top = 42
        TabOrder = 9
        Width = 577
      end
      object EKota: TcxTextEdit
        Left = 112
        Top = 67
        TabOrder = 10
        Width = 137
      end
      object ETelepon: TcxTextEdit
        Left = 112
        Top = 94
        TabOrder = 11
        Width = 153
      end
      object btn1: TcxButton
        Left = 29
        Top = 136
        Width = 75
        Height = 25
        Caption = 'Tambah'
        TabOrder = 12
        OnClick = btn1Click
      end
      object btnHapus: TcxButton
        Left = 112
        Top = 136
        Width = 75
        Height = 25
        Caption = 'Hapus'
        TabOrder = 13
        OnClick = btnHapusClick
      end
      object cxGrid1: TcxGrid
        Left = 29
        Top = 176
        Width = 732
        Height = 265
        TabOrder = 14
        LookAndFeel.SkinName = 'Foggy'
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          OnCellClick = cxGrid1DBTableView1CellClick
          DataController.DataSource = DToko
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
          Styles.Content = cxstyl1
          Styles.Header = cxstyl2
          object cxGrid1DBTableView1nama: TcxGridDBColumn
            Caption = 'NAMA'
            DataBinding.FieldName = 'nama'
            Width = 250
          end
          object cxGrid1DBTableView1alamat: TcxGridDBColumn
            Caption = 'ALAMAT'
            DataBinding.FieldName = 'alamat'
            Width = 250
          end
          object cxGrid1DBTableView1kota: TcxGridDBColumn
            Caption = 'KOTA'
            DataBinding.FieldName = 'kota'
            Width = 150
          end
          object cxGrid1DBTableView1notelepon: TcxGridDBColumn
            Caption = 'TELEPON'
            DataBinding.FieldName = 'notelepon'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Data User'
      ImageIndex = 1
      object Label2: TLabel
        Left = 24
        Top = 16
        Width = 52
        Height = 13
        Caption = 'User Name'
        Transparent = True
      end
      object Label5: TLabel
        Left = 24
        Top = 43
        Width = 25
        Height = 13
        Caption = 'Level'
        Transparent = True
      end
      object Label6: TLabel
        Left = 176
        Top = 15
        Width = 4
        Height = 13
        Caption = ':'
        Transparent = True
      end
      object Label9: TLabel
        Left = 176
        Top = 42
        Width = 4
        Height = 13
        Caption = ':'
        Transparent = True
      end
      object Label10: TLabel
        Left = 24
        Top = 70
        Width = 46
        Height = 13
        Caption = 'Password'
        Transparent = True
      end
      object Label12: TLabel
        Left = 176
        Top = 69
        Width = 4
        Height = 13
        Caption = ':'
        Transparent = True
      end
      object Label1: TLabel
        Left = 24
        Top = 97
        Width = 23
        Height = 13
        Caption = 'Toko'
        Transparent = True
      end
      object Label3: TLabel
        Left = 176
        Top = 96
        Width = 4
        Height = 13
        Caption = ':'
        Transparent = True
      end
      object EuserName: TcxTextEdit
        Left = 192
        Top = 12
        TabOrder = 0
        Width = 234
      end
      object Epassword: TcxTextEdit
        Tag = 1
        Left = 192
        Top = 66
        Properties.EchoMode = eemPassword
        Properties.PasswordChar = '*'
        TabOrder = 1
        Width = 121
      end
      object cbLevel: TcxComboBox
        Left = 192
        Top = 39
        Properties.Items.Strings = (
          'ADMIN'
          'SUPER ADMIN'
          'KASIR')
        TabOrder = 2
        Width = 121
      end
      object btnTambah2: TcxButton
        Left = 28
        Top = 160
        Width = 75
        Height = 25
        Caption = 'Tambah'
        TabOrder = 3
        OnClick = btnTambah2Click
      end
      object btnUbah2: TcxButton
        Left = 111
        Top = 160
        Width = 75
        Height = 25
        Caption = 'Ubah'
        TabOrder = 4
        OnClick = btnUbah2Click
      end
      object btnHapus2: TcxButton
        Left = 192
        Top = 160
        Width = 75
        Height = 25
        Caption = 'Hapus'
        TabOrder = 5
        OnClick = btnHapus2Click
      end
      object cxGrid2: TcxGrid
        Left = 29
        Top = 208
        Width = 732
        Height = 233
        TabOrder = 6
        object cxGridDBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          OnCellClick = cxGridDBTableView1CellClick
          DataController.DataSource = DUser
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
          Styles.Content = cxstyl1
          Styles.Header = cxstyl2
          object cxGridDBTableView1username: TcxGridDBColumn
            Caption = 'USER NAME'
            DataBinding.FieldName = 'username'
            Width = 200
          end
          object cxGridDBTableView1password: TcxGridDBColumn
            Caption = 'PASSWORD'
            DataBinding.FieldName = 'password'
            Width = 150
          end
          object cxGridDBTableView1level: TcxGridDBColumn
            Caption = 'LEVEL'
            DataBinding.FieldName = 'level'
            Width = 150
          end
          object cxGridDBTableView1nama: TcxGridDBColumn
            Caption = 'TOKO'
            DataBinding.FieldName = 'nama'
            Width = 150
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
      object cb1: TcxComboBox
        Left = 192
        Top = 93
        Properties.Items.Strings = (
          'ADMIN'
          'SUPER ADMIN'
          'KASIR')
        TabOrder = 7
        Width = 121
      end
      object btn2: TcxButton
        Left = 273
        Top = 160
        Width = 104
        Height = 25
        Caption = 'Seting Hak Akses'
        TabOrder = 8
        OnClick = btn2Click
      end
    end
  end
  object con1: TMyConnection
    Port = 3308
    LoginPrompt = False
    Left = 480
    Top = 32
  end
  object QToko: TMyQuery
    Connection = con1
    SQL.Strings = (
      'SELECT * FROM toko')
    Left = 360
    Top = 112
  end
  object DToko: TMyDataSource
    DataSet = QToko
    Left = 416
    Top = 112
  end
  object DUser: TMyDataSource
    DataSet = QUser
    Left = 528
    Top = 112
  end
  object QUser: TMyQuery
    Connection = con1
    SQL.Strings = (
      'select '
      ' u.id,'
      ' u.username,'
      ' u.password,'
      ' u.level,'
      ' t.nama,u.var_database from'
      ' karyawan u left join toko t on t.var_database=u.var_database')
    Left = 472
    Top = 112
  end
  object Q1: TMyQuery
    Connection = con1
    Left = 584
    Top = 112
  end
  object Q2: TMyQuery
    Connection = con1
    Left = 632
    Top = 112
  end
  object MyScript1: TMyScript
    Connection = con1
    Left = 320
    Top = 136
  end
  object sx1: TcxStyleRepository
    Left = 464
    Top = 240
    PixelsPerInch = 96
    object cxstyl1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxstyl2: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
  object dxSkinController1: TdxSkinController
    Kind = lfStandard
    NativeStyle = False
    SkinName = 'TheAsphaltWorld'
    Left = 104
    Top = 200
  end
end
