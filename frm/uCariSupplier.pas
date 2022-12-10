unit uCariSupplier;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFcariSupplier = class(TForm)
    G1: TcxGroupBox;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    Label1: TLabel;
    EPencarian: TcxTextEdit;
    G2: TcxGroupBox;
    btnTutup: TcxButton;
    btnBaru: TcxButton;
    cxgGrid1DBTableView1kodesupplier: TcxGridDBColumn;
    cxgGrid1DBTableView1namasupplier: TcxGridDBColumn;
    cxgGrid1DBTableView1alamat: TcxGridDBColumn;
    cxgGrid1DBTableView1kota: TcxGridDBColumn;
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
    isFormSUpplier : integer;
  end;


var
  FcariSupplier: TFcariSupplier;

implementation

{$R *.dfm}

uses uInputSupplier, uPembelian, uBayarHutang, uDtrx, UPOPembelian,
  uReturBeliNew, uPoPembelianBarangBaru;

procedure TFcariSupplier.btnBaruClick(Sender: TObject);
begin
  if not Assigned(Finputsupplier) then
  Application.CreateForm(TFinputsupplier,Finputsupplier);
  Finputsupplier.Show;
  Finputsupplier.EkodeSupplier.Text := GetCode(dm.Q2,'m_supplier','kodesupplier','SP');
  Finputsupplier.idSupplier := '';
  Finputsupplier.CanEdit := True;
end;

procedure TFcariSupplier.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFcariSupplier.cxgGrid1DBTableView1DblClick(Sender: TObject);
begin

  case isFormSUpplier of
  0: begin
        with FpembelianBarang do begin
        ESupplier.Text      := GetVal(dm.QSupplier,'namasupplier');
        EkodeSupplier.Text  := GetVal(dm.QSupplier,'kodesupplier');
        Focus;


        end;
     end;
  1: begin
       with FbayarHutang do begin
        ESupplier.Text        := GetVal(dm.QSupplier,'namasupplier');
        EkodeSupplier.Text    := GetVal(dm.QSupplier,'kodesupplier');
        Eketerangan.SetFocus;

        ExQry(dtrx.Qhutang,SQLHUTang+' WHERE namasupplier="'+GetVal(dm.QSupplier,'namasupplier')+'" '+
                                     ' AND lunas=False',True);
        EjumlahHutang.Text     := Format('%.2n',[SumCxGrid]);
        Eterbilang.Text       := MyTerbilang(SumCxGrid);
       end;
     end;
  2: begin
        with FpoPembelianBarang do begin
          ESupplier.Text    := GetVal(dm.QSupplier,'namasupplier');
          EkodeSupplier.Text:= GetVal(dm.QSupplier,'kodesupplier');
          
        end;
     end;
  3: begin
        with Freturbelinew do begin
          ESupplier.Text    := GetVal(dm.QSupplier,'namasupplier');
          EkodeSupplier.Text:= GetVal(dm.QSupplier,'kodesupplier');

        end;
     end;
  end;
  Close;
end;

procedure TFcariSupplier.cxgGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
     cxgGrid1DBTableView1.OnDblClick(Sender);
end;

procedure TFcariSupplier.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case Key of
   VK_RETURN : OpenTable(dm.QSupplier,['*'],'m_supplier where namasupplier like"%'+EPencarian.Text+'%"');
   VK_DOWN   : cxgrd1.SetFocus;
  end;


end;

procedure TFcariSupplier.FormCreate(Sender: TObject);
begin
  EPencarian.isCari := True;
end;

procedure TFcariSupplier.FormShow(Sender: TObject);
begin
  EPencarian.SetFocus;
  OpenTable(dm.QSupplier,['*'],'m_supplier');
end;

end.
