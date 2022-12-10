unit uGantiBarcode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uctrlFrm, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkiniMaginary,
  dxSkinMoneyTwins, dxSkinOffice2010Blue, dxSkinOffice2016Colorful,
  Vcl.StdCtrls, cxButtons, uEngine, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFBarcodeBarang = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EkodeBarang: TEdit;
    EnamaBarang: TEdit;
    EbarcodeLama: TEdit;
    EbarcodeBaru: TEdit;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    procedure btn2Click(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBarcodeBarang: TFBarcodeBarang;

implementation

{$R *.dfm}

uses udm, uPenjualan;

procedure TFBarcodeBarang.btn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFBarcodeBarang.btnSimpanClick(Sender: TObject);
begin
  if EbarcodeBaru.Text <> '' then begin
     ExQry(dm.Q1,'UPDATE barang SET kodebarcode="'+EbarcodeBaru.Text+'" '+
     ' WHERE kodebarang="'+EkodeBarang.Text+'"',False);

     ExQry(dm.Q1,'UPDATE multisatuan SET kodebarcode="'+EbarcodeBaru.Text+'" '+
     ' WHERE kodebarang="'+EkodeBarang.Text+'" '+
     ' AND satuan="'+FPenjualanBarang.sg1.Cells[7,FPenjualanBarang.sg1.Row]+'"',False);

     FPenjualanBarang.sg1.Cells[1,FPenjualanBarang.sg1.Row] :=EbarcodeBaru.Text;

     Close;

  end;
end;

procedure TFBarcodeBarang.btnTutupClick(Sender: TObject);
begin
  Close;
end;

end.
