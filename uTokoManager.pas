unit uTokoManager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxMaskEdit, cxDropDownEdit, Vcl.StdCtrls,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, DBAccess, MyAccess,
  MemDS, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxButtons,
  cxTextEdit, cxLabel, cxPC, DAScript, MyScript, dxSkinsForm;

type
  TFTokoManager = class(TForm)
    con1: TMyConnection;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxlbl1: TcxLabel;
    cxlbl2: TcxLabel;
    cxlbl3: TcxLabel;
    cxlbl4: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    ENamaToko: TcxTextEdit;
    EAlamat: TcxTextEdit;
    EKota: TcxTextEdit;
    ETelepon: TcxTextEdit;
    btn1: TcxButton;
    btnHapus: TcxButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    QToko: TMyQuery;
    DToko: TMyDataSource;
    cxGrid1DBTableView1nama: TcxGridDBColumn;
    cxGrid1DBTableView1alamat: TcxGridDBColumn;
    cxGrid1DBTableView1kota: TcxGridDBColumn;
    cxGrid1DBTableView1notelepon: TcxGridDBColumn;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    EuserName: TcxTextEdit;
    Epassword: TcxTextEdit;
    cbLevel: TcxComboBox;
    btnTambah2: TcxButton;
    btnUbah2: TcxButton;
    btnHapus2: TcxButton;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    Label1: TLabel;
    Label3: TLabel;
    cb1: TcxComboBox;
    DUser: TMyDataSource;
    QUser: TMyQuery;
    cxGridDBTableView1username: TcxGridDBColumn;
    cxGridDBTableView1password: TcxGridDBColumn;
    cxGridDBTableView1nama: TcxGridDBColumn;
    Q1: TMyQuery;
    Q2: TMyQuery;
    cxGridDBTableView1level: TcxGridDBColumn;
    MyScript1: TMyScript;
    sx1: TcxStyleRepository;
    cxstyl1: TcxStyle;
    cxstyl2: TcxStyle;
    btn2: TcxButton;
    dxSkinController1: TdxSkinController;
    procedure btn1Click(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnHapusClick(Sender: TObject);
    procedure cxPageControl1Change(Sender: TObject);
    procedure btnTambah2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxGridDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnUbah2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btnHapus2Click(Sender: TObject);
  private
    { Private declarations }
    idToko : string;
    idUser : String;
  public
    { Public declarations }
  end;

var
  FTokoManager: TFTokoManager;

implementation

{$R *.dfm}

uses uEngine, uSettingAkes;

procedure TFTokoManager.btn1Click(Sender: TObject);
var
  ls : TStringList;
  namadatabse : String;
begin
  ls := TStringList.Create;

  try
    if ENamaToko.Text <> '' then begin

      with Q1 do begin
        Close;
        SQL.Text := 'SELECT nama FROM toko WHERE nama="'+ENamaToko.Text+'" ';
        Open;

        if Q1.IsEmpty = False then begin
           MessageBox(Handle,'Toko Sudah Ada','Error',MB_ICONERROR);
           Exit;

        end else begin
           Q2.Close;
           Q2.SQL.Text := 'INSERT INTO toko (nama,alamat,kota,notelepon,var_database) '+
                          'VALUES(:nama,:alamat,:kota,:notelepon,:var_database)';
           Q2.ParamByName('nama').AsString      := ENamaToko.Text;
           Q2.ParamByName('alamat').AsString    := EAlamat.Text;
           Q2.ParamByName('kota').AsString      := EKota.Text;
           Q2.ParamByName('notelepon').AsString := ETelepon.Text;
           Q2.ParamByName('var_database').AsString := LOWerCase(StringReplace(ENamaToko.Text,' ','_',[rfReplaceAll]));
           Q2.ExecSQL;

           QToko.Active := False;
           QToko.Active := True;
        end;
        namadatabse := LOWerCase(StringReplace(ENamaToko.Text,' ','_',[rfReplaceAll]));
        ls.LoadFromFile(ExtractFilePath(Application.ExeName)+'dbtemp\template.sql');
        MyScript1.Connection := con1;
        MyScript1.SQL.Clear;
        MyScript1.SQL.Add('CREATE DATABASE IF NOT EXISTS '+namadatabse+'; USE '+namadatabse+';') ;
        MyScript1.SQL.Add(ls.Text);
        MyScript1.Execute;
        con1.Connected := False;
        SetKoneksi2(con1);
        ExQry(Q1,'INSERT INTO '+namadatabse+'.profile(`idprofil`,`nama`,`alamat`,`kota`,`notelepon`,`fax`,`npwp`,`dirbackup`,`gudangbeli`,`gudangterima`,`gudangjual`,`footernota`,`Footernota2`,`footernota3`,`printerstruk`,`printerinvoice`,`minpoin`,`stokmin`) values '+
        '(1,"'+ENamaToko.Text+'","'+Ealamat.Text+'",'+
        ' "'+EKota.Text+'","'+ETelepon.Text+'",'+
        ' "-","-","D:\\",2,2,2,"-","-","-","EPSON TM-T82 Receipt",'+
        ' "EPSON TM-T82 Receipt",100000.00,1)',False);

        MessageDlg('Toko Berhasil Dibuat',mtInformation,[mbOK],0);
        QToko.Active := False;
        QToko.Active := True;
        ENamaToko.Clear;
        EAlamat.Clear;
        EKota.Clear;
        ETelepon.Clear;
      end;
    end else begin
      MessageDlg('Silahkan Isi Nama Toko Dahulu',mtError,[mbOK],0);
    end;
  finally
    ls.Free;
  end;
end;

procedure TFTokoManager.btn2Click(Sender: TObject);
begin
  FsetingAkses.idUser       := QUser.FieldByName('id').AsString;
  FsetingAkses.varDatabase  := QUser.FieldByName('var_database').AsString;
  FsetingAkses.L1.Caption   := QUser.FieldByName('username').AsString;
  FsetingAkses.L2.Caption   := QUser.FieldByName('level').AsString;
  FsetingAkses.ShowModal;
end;

procedure TFTokoManager.btnHapus2Click(Sender: TObject);
var
  namadb : String;
begin
  if MessageDlg('Yakin user dihapus?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    namadb := QUser.FieldByName('var_database').AsString;
    ExQry(Q1,'DELETE FROM karyawan WHERE username="'+QUser.FieldByName('username').AsString+'"',False);
    ExQry(Q1,'DELETE FROM '+namadb+'.m_user WHERE username="'+QUser.FieldByName('username').AsString+'"',False);

    QUser.Active := False;
    QUser.Active := True;
  end;
end;

procedure TFTokoManager.btnHapusClick(Sender: TObject);
var
  NamaDatabase : String;
begin
  if MessageDlg('Yakin toko akan dihapus?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    NamaDatabase := Qtoko.FieldByName('var_database').AsString;
    QToko.Delete;
    MyScript1.SQL.Clear;
    MyScript1.SQL.Add('DROP DATABASE IF EXISTS '+NamaDatabase+'; ');
    MyScript1.Execute;
    SetKoneksi2(con1);
  end;
end;

procedure TFTokoManager.btnTambah2Click(Sender: TObject);
var
  namadatabase : String;

begin

      with Q1 do begin
        Close;
        SQL.Text := 'SELECT username FROM karyawan WHERE username="'+EuserName.Text+'" ';
        Open;

        if Q1.IsEmpty = False then begin
           MessageBox(Handle,'User Name Sudah Ada','Error',MB_ICONERROR);
           Exit;

        end else begin

           Q2.Close;
           Q2.SQL.Text := 'SELECT var_database FROM toko where nama="'+cb1.Text+'"';
           Q2.Open;

           namadatabase := Q2.FieldByName('var_database').AsString;

           Q2.Close;
           Q2.SQL.Text := 'INSERT INTO karyawan (username,password,level,var_database) '+
                          'VALUES(:username,MD5(:password),:level,:var_database)';
           Q2.ParamByName('username').AsString      := EuserName.Text;
           Q2.ParamByName('password').AsString      := Epassword.Text;
           Q2.ParamByName('level').AsString         := cbLevel.Text;
           Q2.ParamByName('var_database').AsString  := namadatabase;
           Q2.ExecSQL;


           Q2.Close;
           Q2.SQL.Text := 'INSERT INTO '+namadatabase+'.m_user (username,namalengkap,'+
           'level,pwd,showharga,editharga,gudang_beli,gudang_jual,kas_penjualan,'+
           'kas_pembelian) '+
           'VALUES(:username,:namalengkap,:level,MD5(:pwd),'+
           ':showharga,:editharga,:gudangbeli,:gudang_jual,'+
           ':kas_penjualan,:kas_pembelian)';
           Q2.ParamByName('username').AsString      := EuserName.Text;
           Q2.ParamByName('namalengkap').AsString   := EuserName.Text;
           Q2.ParamByName('level').AsString         := cbLevel.Text;
           Q2.ParamByName('pwd').AsString           := Epassword.Text;
           Q2.ParamByName('showharga').AsBoolean    := True;
           Q2.ParamByName('editharga').AsBoolean    := True;
           Q2.ParamByName('gudangbeli').AsInteger   := 2;
           Q2.ParamByName('gudang_jual').AsInteger  := 2;
           Q2.ParamByName('kas_penjualan').AsString  := '101.003 | KAS PENJUALAN';
           Q2.ParamByName('kas_pembelian').AsString  := '102.008 | BANK BCA';

           Q2.ExecSQL;

           Quser.Active := False;
           Quser.Active := True;
        end;


      end;

end;

procedure TFTokoManager.btnUbah2Click(Sender: TObject);
var
  namadatabase : string;
begin
   Q2.Close;
   Q2.SQL.Text := 'SELECT var_database FROM toko where nama="'+cb1.Text+'"';
   Q2.Open;

   namadatabase := Q2.FieldByName('var_database').AsString;

   Q2.Close;
   Q2.SQL.Text := ' UPDATE karyawan SET '+
                  ' username=:username,password=MD5(:password),level=:level,'+
                  ' var_database=:var_database '+
                  ' WHERE id="'+idToko+'" ';
   Q2.ParamByName('username').AsString      := EuserName.Text;
   Q2.ParamByName('password').AsString      := Epassword.Text;
   Q2.ParamByName('level').AsString         := cbLevel.Text;
   Q2.ParamByName('var_database').AsString  := namadatabase;
   Q2.ExecSQL;

   QUser.Active := False;
   QUser.Active := True;
   idUser       := '';
end;

procedure TFTokoManager.cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  ENamaToko.Text  := QToko.FieldByName('nama').AsString;
  EAlamat.Text    := QToko.FieldByName('alamat').AsString;
  EKota.Text      := QToko.FieldByName('kota').AsString;
  ETelepon.Text   := QToko.FieldByName('notelepon').AsString;
  idToko          := QToko.FieldByName('id').AsString;

end;

procedure TFTokoManager.cxGridDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  EuserName.Text    := QUser.FieldByName('username').AsString;
  cbLevel.ItemIndex := cbLevel.Properties.Items.IndexOf(Quser.FieldByName('level').AsString);
  cb1.ItemIndex     := cb1.Properties.Items.IndexOf(Quser.FieldByName('nama').AsString);
  idUser            := QUser.FieldByName('id').AsString;
end;

procedure TFTokoManager.cxPageControl1Change(Sender: TObject);
begin
  with Q1 do begin
    Close;
    SQL.Text := 'SELECT nama,var_database FROM toko ';
    Open;
      cb1.Properties.Items.Clear;
    while not Eof do begin
      cb1.Properties.Items.Add(Fields[0].AsString);
      Next;

    end;
  end;
  QUser.Active := True;
end;

procedure TFTokoManager.FormCreate(Sender: TObject);
begin
  SetKoneksi2(con1);
end;

procedure TFTokoManager.FormShow(Sender: TObject);
begin
  idToko := '';
  idUser :='';
  QToko.Active := True;
end;

end.
