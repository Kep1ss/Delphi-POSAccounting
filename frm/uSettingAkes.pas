unit uSettingAkes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinVisualStudio2013Light, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, cxGroupBox, Vcl.ImgList, uMainMenu, uEngine,
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
  cxCheckBox;

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
    CheckBox1: TCheckBox;
    c1: TCheckBox;
    C2: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sg1CheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btnTutupClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure C2Click(Sender: TObject);
  private
    aList : TStringList;
    Procedure CreateGrid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FsetingAkses: TFsetingAkses;
  idUser      : string;

implementation

{$R *.dfm}

uses udm;

procedure TFsetingAkses.btnSimpanClick(Sender: TObject);
var

  i : integer;
  cView , cTambah,cUbah,cHapus : Boolean;
  tmbh,ubh,hps : String;

begin
  ExQry(dm.Q1,'UPDATE m_user SET '+
  ' ShowHarga="'+BolStr(CheckBox1.Checked)+'", '+
  ' editharga="'+BolStr(C1.Checked)+'" WHERE '+
  ' iduser="'+iduser+'"',False);
  ExQry(dm.Q1,'delete from hakakes where iduser="'+iduser+'"',False);
  for I := 1 to sg1.RowCount -1 do begin
    sg1.GetCheckBoxState(3,i,cView);
    sg1.GetCheckBoxState(4,i,cTambah);
    sg1.GetCheckBoxState(5,i,cUbah);
    sg1.GetCheckBoxState(6,i,cHapus);
    addParam('iduser',idUser,aList,'str');
    addParam('menu',Copy(sg1.Cells[0,i],2,Length(sg1.Cells[0,i])),aList,'str');
    addParam('submenu',Copy(sg1.Cells[1,i],Pos('-',sg1.Cells[1,i])+1,Length(sg1.Cells[1,i])),aList,'str');
    addParam('akses',sg1.Cells[2,i],alist,'str');
    addParam('tampil',IntTostr(Integer(cView)),aList,'str');
    addParam('tambah',IntTostr(Integer(cTambah)),aList,'str');
    addParam('ubah',IntTostr(Integer(cUbah)),aList,'str');
    addParam('hapus',IntTostr(Integer(cHapus)),aList,'str');
    exeDb(dm.Q1,'hakakes',aList);
  end;
  Informasi('Seting berhasil disimpan');
end;

procedure TFsetingAkses.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFsetingAkses.C2Click(Sender: TObject);
var
  i : integer;
begin
  if C2.Checked = True then begin
     for i := 1 to sg1.RowCount -1 do begin
        sg1.SetCheckBoxState(3,i,true);
        sg1.SetCheckBoxState(4,i,true);
        sg1.SetCheckBoxState(5,i,true);
        sg1.SetCheckBoxState(6,i,true);
     end;

  end else begin
    for i := 1 to sg1.RowCount -1 do begin
        sg1.SetCheckBoxState(3,i,false);
        sg1.SetCheckBoxState(4,i,false);
        sg1.SetCheckBoxState(5,i,false);
        sg1.SetCheckBoxState(6,i,false);
     end;
  end;

end;

procedure TFsetingAkses.CreateGrid;
begin
  with sg1 do begin
    ColCount := 7;
    Cells[0,0] :='Master Menu';
    Cells[1,0] :='Sub Menu';
    Cells[2,0] :='Akses';
    Cells[3,0] :='Tampil';
    Cells[4,0] :='Tambah';
    Cells[5,0] :='Ubah';
    Cells[6,0] :='Hapus';

    ColWidths[0] := 150;
    ColWidths[1] := 200;
    ColWidths[2] := 100;
    ColWidths[3] := 80;
    ColWidths[4] := 80;
    ColWidths[5] := 80;
    ColWidths[6] := 80;
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
  i,x,c,d,z,b : integer;
  Sm : string;
begin
  c:=1;
  sg1.RowCount := 2;
  aList := TStringList.Create;
  for x := 0 to Fmain.dxRibbon1.TabCount -1 do begin
    sg1.Cells[0,c] := IntToStr(x+1)+' '+Fmain.dxRibbon1.Tabs[x].Caption;
    sg1.RowCount     := sg1.RowCount +1;
    d := c + 1;
    for z := 0 to Fmain.dxRibbon1.Tabs[x].Groups.Count -1 do begin
      if Fmain.dxRibbon1.Tabs[x].Groups[z].Caption <> 'Ganti Skins' then begin
      sg1.Cells[1,d]   := Fmain.dxRibbon1.Tabs[x].Groups[z].Caption;
      b := d + 1;



        for i := 0 to Fmain.dxRibbon1.Tabs[x].Groups[z].ToolBar.ItemLinks.Count -1 do begin
          sg1.Cells[2,b]   := Fmain.dxRibbon1.Tabs[x].Groups[z].ToolBar.ItemLinks[i].Caption;
          sg1.RowCount     := sg1.RowCount +1;
          Inc(b);
        end;
        d := b;
        sg1.RowCount     := sg1.RowCount +1;
      end;

    end;

   c := b;
  end;

  sg1.Options := sg1.Options + [goRowSelect, goEditing];
  sg1.ShowSelection := false;
  for i := 1 to sg1.RowCount - 1 do begin
     if (sg1.Cells[0,i] <> '') or (sg1.Cells[2,i] <> '') then

      sg1.AddCheckBox(3, i, false, false);
      Sm := Trim(Copy(sg1.Cells[2,i],Pos('-',sg1.Cells[2,i])+1,Length(sg1.Cells[2,i])));
      if (sg1.Cells[2,i] <> '') and (sm <> 'Ganti Password') and (sm <> 'Setting')
        and (sm<> 'Backup Database') and (sm<> 'Restore Database')
        and (sm <> 'Ganti Skins')and (sm <> 'Bantuan Sistem') then begin
         sg1.AddCheckBox(4, i, false, false);
         sg1.AddCheckBox(5, i, false, false);
         sg1.AddCheckBox(6, i, false, false);
      end;

  end;

  OpenTable(dm.Q1,['*'],'hakakes where iduser="'+iduser+'"');
  if not dm.Q1.IsEmpty then begin
     for I := 1 to sg1.RowCount -1 do begin
       if (Trim(GetVal(dm.Q1,'menu')) =
        Trim(Copy(sg1.Cells[0,i],3,Length(sg1.Cells[0,i])))) then
        sg1.SetCheckBoxState(3,i,dm.Q1.FieldByName('tampil').AsBoolean);

       if (Trim(GetVal(dm.Q1,'akses')) =
        Trim(Copy(sg1.Cells[2,i],Pos('-',sg1.Cells[2,i])+1,Length(sg1.Cells[2,i])))) then begin
          sg1.SetCheckBoxState(4,i,dm.Q1.FieldByName('tambah').AsBoolean);
          sg1.SetCheckBoxState(5,i,dm.Q1.FieldByName('ubah').AsBoolean);
          sg1.SetCheckBoxState(6,i,dm.Q1.FieldByName('hapus').AsBoolean);
        end;
        dm.Q1.Next;
     end;
  end;


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
