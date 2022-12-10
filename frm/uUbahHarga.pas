unit uUbahHarga;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMcSkin,
  Vcl.Menus, cxTextEdit, Vcl.StdCtrls, cxButtons, cxGroupBox, uComCtrl, uctrlFrm, uEngine, uOvEdit,
  dxSkiniMaginary, dxSkinOffice2010Blue, dxSkinOffice2016Colorful,
  dxSkinMoneyTwins, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  TFubahHargaBeli = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    G2: TcxGroupBox;
    G3: TcxGroupBox;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    EKodeBarang: TcxTextEdit;
    ENamaBarang: TcxTextEdit;
    EHargaBeli: TcxTextEdit;
    EHargaEcer: TcxTextEdit;
    EHargaGrosir: TcxTextEdit;
    EHargaPartai: TcxTextEdit;
    EH5: TcxTextEdit;
    EH4: TcxTextEdit;
    Label17: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Ekodebarcode: TcxTextEdit;
    procedure btnTutupClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    alist : TStringList;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FubahHargaBeli: TFubahHargaBeli;


implementation

{$R *.dfm}

uses udm, uPembelian;

procedure TFubahHargaBeli.btnSimpanClick(Sender: TObject);
begin
  if MessageDlg('Apakah yakin akan mengubah harga?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    addParam('tgl',frmTgl(now),alist,'date');
    addParam('kodebarang',EKodeBarang.Text,alist,'str');
    addParam('hargabeli',EHargaBeli.isAngka,alist,'str');
    addParam('hargaecer',EHargaEcer.isAngka,alist,'str');
    addParam('hargagrosir',EHargaGrosir.isAngka,alist,'str');
    addParam('hargapartai',EHargaPartai.isAngka,alist,'str');
    addParam('hargapartai4',EH4.isAngka,alist,'str');
    addParam('hargapartai5',EH5.isAngka,alist,'str');

    exeDb(dm.Q1,'historyhargabarang',alist);

    FpembelianBarang.sg1.Cells[3,FpembelianBarang.sg1.Row] := EHargaBeli.isAngka;
    FpembelianBarang.HitungSubtotal(FpembelianBarang.sg1.Row);
    FpembelianBarang.HitungTotal;
    Informasi('Data berhasil disimpan');
    Close;
  end;
end;

procedure TFubahHargaBeli.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFubahHargaBeli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  alist.Free;
end;

procedure TFubahHargaBeli.FormCreate(Sender: TObject);
begin
  EHargaBeli.isRupiah := True;
  EHargaEcer.isRupiah := True;
  EHargaGrosir.isRupiah := True;
  EHargaPartai.isRupiah := True;
  EH4.isRupiah := True;
  EH5.isRupiah := True;


end;

procedure TFubahHargaBeli.FormShow(Sender: TObject);
begin
  alist := TStringList.Create;
end;

end.
