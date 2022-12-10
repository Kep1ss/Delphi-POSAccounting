unit uSettingAkes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinVisualStudio2013Light, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, cxGroupBox, Vcl.ImgList, uEngine,
  dxSkinMcSkin, dxSkiniMaginary, dxSkinMoneyTwins, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful,uComCtrl, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  Data.DB, MemDS, DBAccess, MyAccess, cxCheckBox;

type
  TFsetingAkses = class(TForm)
    il1: TImageList;
    G1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    L1: TLabel;
    L2: TLabel;
    G2: TcxGroupBox;
    sg1: TAdvStringGrid;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    Q1: TMyQuery;
    Q2: TMyQuery;
    C1: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sg1CheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btnTutupClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sg1CanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure C1Click(Sender: TObject);
  private
    aList : TStringList;

    Procedure CreateGrid;
    { Private declarations }
  public
    idUser      : string;
    varDatabase  : String;
    { Public declarations }
  end;

var
  FsetingAkses: TFsetingAkses;


implementation

{$R *.dfm}

uses uTokoManager;

procedure TFsetingAkses.btnSimpanClick(Sender: TObject);
var
  i : integer;
  cView , cTambah,cUbah,cHapus : Boolean;
  tmbh,ubh,hps : String;
  idUserDB : String;
begin

  ExQry(Q1,'delete from hakakes where iduser="'+iduser+'"',False);
  ExQry(Q2,'SELECT iduser FROM '+VarDataBase+'.m_user WHERE username="'+L1.Caption+'"',True);
  idUserDB := Q2.FieldByName('iduser').AsString;
  ExQry(Q1,'delete from '+varDatabase+'.hakakes where iduser="'+idUserDB+'"',False);
  for I := 1 to sg1.RowCount -1 do begin
    sg1.GetCheckBoxState(2,i,cView);
    sg1.GetCheckBoxState(3,i,cTambah);
    sg1.GetCheckBoxState(4,i,cUbah);
    sg1.GetCheckBoxState(5,i,cHapus);
    if cTambah = True then tmbh := '1' else tmbh := '0';
    if cUbah = True then ubh    := '1' else ubh  := '0';
    if cHapus = True then hps   := '1' else hps  := '0';


    addParam('iduser',idUser,aList,'str');
    addParam('menu',sg1.Cells[0,i],aList,'str');
    addParam('submenu',sg1.Cells[1,i],aList,'str');
    addParam('tampil',IntTostr(Integer(cView)),aList,'str');
    addParam('tambah',tmbh,aList,'str');
    addParam('ubah',ubh,aList,'str');
    addParam('hapus',hps,aList,'str');
    exeDb(Q1,'hakakes',aList);


    addParam('iduser',idUserDB,aList,'str');
    addParam('menu',sg1.Cells[0,i],aList,'str');
    addParam('submenu',sg1.Cells[1,i],aList,'str');
    addParam('tampil',IntTostr(Integer(cView)),aList,'str');
    addParam('tambah',tmbh,aList,'str');
    addParam('ubah',ubh,aList,'str');
    addParam('hapus',hps,aList,'str');
    exeDb(Q1,''+VarDataBase+'.hakakes',aList);
  end;
  Informasi('Seting berhasil disimpan');
end;

procedure TFsetingAkses.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFsetingAkses.C1Click(Sender: TObject);
var
  i : integer;
begin
  if C1.Checked = True then begin
     for i := 1 to sg1.RowCount -1 do begin
        sg1.SetCheckBoxState(2,i,true);
        sg1.SetCheckBoxState(3,i,true);
        sg1.SetCheckBoxState(4,i,true);
        sg1.SetCheckBoxState(5,i,true);
     end;

  end else begin
    for i := 1 to sg1.RowCount -1 do begin
        sg1.SetCheckBoxState(2,i,false);
        sg1.SetCheckBoxState(3,i,false);
        sg1.SetCheckBoxState(4,i,false);
        sg1.SetCheckBoxState(5,i,false);
     end;
  end;

end;

procedure TFsetingAkses.CreateGrid;
begin
  with sg1 do begin
    ColCount := 6;
    Cells[0,0] :='Menu';
    Cells[1,0] :='Sub Menu';
    Cells[2,0] :='Tampil';
    Cells[3,0] :='Tambah';
    Cells[4,0] :='Ubah';
    Cells[5,0] :='Hapus';

    ColWidths[0] := 150;
    ColWidths[1] := 200;
    ColWidths[2] := 80;
    ColWidths[3] := 80;
    ColWidths[4] := 80;
    ColWidths[5] := 80;
    RowCOunt :=2;
  end;
end;

procedure TFsetingAkses.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  aList.Free;
end;

procedure TFsetingAkses.FormCreate(Sender: TObject);

begin
  CreateGrid;
end;

procedure TFsetingAkses.FormShow(Sender: TObject);
var
  i,x,c,d : integer;
  Sm : string;
begin
  c:=1;
  CreateGrid;
  sg1.RowCount := 2;

  ExQry(Q1,'SELECT * FROM mastermenu',True);
  d := 1;

  while Q1.Eof = False do begin
     sg1.Cells[0,d] := Q1.FieldByName('menu').AsString;
     sg1.Cells[1,d] := Q1.FieldByName('submenu').AsString;
     sg1.AddCheckBox(2, d, false, false);
     Sm             := sg1.Cells[1,d];
     if Q1.FieldByName('submenu').AsString <> '' then
     begin
      if  (sm <> 'Ganti Password') and (sm <> 'Setting')
        and (sm<> 'Backup Database') and (sm<> 'Restore Database')
        and (sm <> 'Ganti Skins')and (sm <> 'Bantuan Sistem') then begin
         sg1.AddCheckBox(3, d, false, false);
         sg1.AddCheckBox(4, d, false, false);
         sg1.AddCheckBox(5, d, false, false);
      end;

     end;
     Q1.Next;
     Inc(d);
     sg1.RowCount := sg1.RowCount + 1;

  end;



  OpenTable(Q1,['*'],'hakakes where iduser="'+iduser+'"');
  if not Q1.IsEmpty then begin
     for I := 1 to sg1.RowCount -1 do begin
       if (GetVal(Q1,'menu') = sg1.Cells[0,i]) then
        sg1.SetCheckBoxState(2,i,Q1.FieldByName('tampil').AsBoolean);

       if (GetVal(Q1,'submenu') = sg1.Cells[1,i]) then begin
          sg1.SetCheckBoxState(3,i,Q1.FieldByName('tambah').AsBoolean);
          sg1.SetCheckBoxState(4,i,Q1.FieldByName('ubah').AsBoolean);
          sg1.SetCheckBoxState(5,i,Q1.FieldByName('hapus').AsBoolean);
        end;
        Q1.Next;
     end;
  end;


  aList := TStringList.Create;
end;

procedure TFsetingAkses.sg1CanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
  CanEdit := ACol in [2,3,4,5];
end;

procedure TFsetingAkses.sg1CheckBoxClick(Sender: TObject; ACol, ARow: Integer;
  State: Boolean);
  var
    i : integer;
    idx : string;
    Cek  : Boolean;

begin
  if ACol = 2 then begin
    idx     := Copy(sg1.Cells[0,ARow],0,1);
    sg1.GetCheckBoxState(2,ARow,Cek);
    for i := 1 to sg1.RowCount -1 do begin
      if (idx = Copy(sg1.Cells[1,i],0,1)) and (idx <> '')  then begin
        sg1.SetCheckBoxState(2,i,Cek);
      end;

    end;
  end;


end;

end.
