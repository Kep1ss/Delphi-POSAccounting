unit uCariSales;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMetropolis,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxGroupBox,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit, uComCtrl, uctrlFrm, udm,
  uEngine, uOvEdit, dxSkiniMaginary, uTerbilang, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, dxSkinMoneyTwins, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolisDark,
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
  TFcariSales = class(TForm)
    G1: TcxGroupBox;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    Label1: TLabel;
    EPencarian: TcxTextEdit;
    G2: TcxGroupBox;
    btnTutup: TcxButton;
    btnBaru: TcxButton;
    cxgGrid1DBTableView1kodesales: TcxGridDBColumn;
    cxgGrid1DBTableView1namasales: TcxGridDBColumn;
    cxgGrid1DBTableView1kota: TcxGridDBColumn;
    cxgGrid1DBTableView1notelpon: TcxGridDBColumn;
    procedure btnTutupClick(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
    procedure EPencarianKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxgGrid1DBTableView1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxgGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    isFormSales : integer;
  end;


var
  FcariSales: TFcariSales;

implementation

{$R *.dfm}

uses  uDtrx, uInputSales, uPenjualan, uSuratJalan;

procedure TFcariSales.btnBaruClick(Sender: TObject);
begin
    if not  Assigned(FinputSales) then
    Application.CreateForm(TFinputSales,FinputSales);
    FinputSales.Show;
    FinputSales.TampilanAwal;

end;

procedure TFcariSales.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFcariSales.cxgGrid1DBTableView1DblClick(Sender: TObject);
begin

 case isFormSales of
 0 : begin
       with FPenjualanBarang do begin
         ESales.Text := GetVal(dm.Qsales,'namasales');
         E1.Text     := GetVal(dm.Qsales,'kodesales');

         Focus;
        end;
    end;
 1 : begin
       with FSuratJalan do begin
         ESales.Text := GetVal(dm.Qsales,'namasales');
         E1.Text     := GetVal(dm.Qsales,'kodesales');
        end;
     end;
 end;


  Close;
end;

procedure TFcariSales.cxgGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
     cxgGrid1DBTableView1.OnDblClick(Sender);
end;

procedure TFcariSales.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case Key of
   VK_RETURN : OpenTable(dm.QSupplier,['*'],'m_supplier where namasupplier like"%'+EPencarian.Text+'%"');
   VK_DOWN   : cxgrd1.SetFocus;
  end;


end;

procedure TFcariSales.FormCreate(Sender: TObject);
begin
  EPencarian.isCari := True;
end;

procedure TFcariSales.FormShow(Sender: TObject);
begin
  EPencarian.SetFocus;
end;

end.
