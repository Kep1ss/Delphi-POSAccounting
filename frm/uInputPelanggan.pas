unit uInputPelanggan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxTextEdit, cxMemo,dxBevel, uComCtrl, uOvEdit, uctrlFrm, uEngine,
  dxSkiniMaginary, dxSkinOffice2010Blue, dxSkinOffice2016Colorful,
  dxSkinMoneyTwins, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  TFinputPelanggan = class(TForm)
    dxbvl1: TdxBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Enamapelanggan: TcxTextEdit;
    Ekota: TcxTextEdit;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    EAlamat: TcxMemo;
    Enotelpon: TcxTextEdit;
    EmaxPiutang: TcxTextEdit;
    Label29: TLabel;
    Label38: TLabel;
    ETOP: TcxTextEdit;
    Label14: TLabel;
    Label15: TLabel;
    Ekodepelanggan: TcxTextEdit;
    Label3: TLabel;
    Label7: TLabel;
    cbJenisPelanggan: TcxComboBox;
    Label16: TLabel;
    Label17: TLabel;
    EPoin: TcxTextEdit;
    Label18: TLabel;
    Label19: TLabel;
    cbSales: TcxComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

    { Private declarations }
  public
    idpelanggan : String;
    CanEdit : Boolean;
    procedure TampilanAwal;
    { Public declarations }
  end;

var
  FinputPelanggan: TFinputPelanggan;
  aList     : TStringList;

implementation
  uses
    udm, uDatapelanggan, uInputJenisPelanggan;

{$R *.dfm}

{ TFInputUser }

procedure TFinputPelanggan.btnSimpanClick(Sender: TObject);
var
  metode : string;
begin
  if not CheckEdit(Self) then begin

     addParam('kodepelanggan',   Ekodepelanggan.Text,   aList,'str');
     addParam('namapelanggan',   Enamapelanggan.Text,   aList,'str');
     addParam('alamat',          EAlamat.Text,          aList,'str');
     addParam('kota',            Ekota.Text,            aList,'str');
     addParam('notelpon' ,       Enotelpon.Text,        aList,'str');
     addParam('idjenispelanggan',GetIdcmb(cbJenisPelanggan),aList,'str');
     addParam('maxpiutang',      EmaxPiutang.isAngka,   aList,'str');
     addParam('top',             ETOP.isAngka,          aList,'str');
     addParam('poin',            EPoin.isAngka,         aList,'str');
     addParam('idsales',         GetIdcmb(cbSales),     aList,'str');
     OpenTable(dm.Q1,['idpelanggan'],'pelanggan where idpelanggan="'+idpelanggan+'"');
    if dm.Q1.IsEmpty then
       exeDb(dm.Q1,'pelanggan',aList)
    else
       updatedb(dm.Q1,'pelanggan',aList,'idpelanggan','"'+idpelanggan+'"');

    ExQry(dm.Qpelanggan,_SQLpelanggan,True);
    TampilanAwal;
    if CanEdit then
       Close;
  end;
end;

procedure TFinputPelanggan.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFinputPelanggan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearText(Self);
  aList.Free;
end;

procedure TFinputPelanggan.FormCreate(Sender: TObject);
begin
  isiCmb(dm.Q1,'jenispelanggan',['idjenispelanggan','jenis'],cbJenisPelanggan);
  isiCmb(dm.Q1,'sales',['idsales','namasales'],cbSales);
  EmaxPiutang.isRupiah := True;
  ETOP.isPersen        := True;
end;

procedure TFinputPelanggan.FormShow(Sender: TObject);
begin
  aList := TStringList.Create;

end;

procedure TFinputPelanggan.TampilanAwal;
begin
  ClearText(Self);
  if Assigned(FdataPelanggan) then

  Fdatapelanggan.LoadData;
  idpelanggan := '';
  Ekodepelanggan.Text := GetCode(dm.Q2,'pelanggan','kodepelanggan','');
end;

end.

