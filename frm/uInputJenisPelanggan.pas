unit uInputJenisPelanggan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxTextEdit, dxBevel, uComCtrl, uOvEdit, uctrlFrm, uEngine,
  dxSkinVisualStudio2013Light, cxMemo, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxSkiniMaginary, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFinputJenisPelanggan = class(TForm)
    dxbvl1: TdxBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    EnamaJenisPelanggan: TcxTextEdit;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    cxgGrid1DBTableView1jenis: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
  private
    procedure TampilanAwal;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FinputJenisPelanggan: TFinputJenisPelanggan;
  aList     : TStringList;

implementation
  uses
    udm, uInputPelanggan;

{$R *.dfm}

{ TFInputsatuan }

procedure TFinputJenisPelanggan.btnSimpanClick(Sender: TObject);
begin
  if not CheckEdit(Self) then begin
     addParam('jenis',EnamaJenisPelanggan.Text,aList,'str');


     OpenTable(dm.Q1,['jenis'],'jenispelanggan where jenis="'+EnamaJenisPelanggan.Text+'"');
    if dm.Q1.IsEmpty then
       exeDb(dm.Q1,'jenispelanggan',aList)
    else
       updatedb(dm.Q1,'jenispelanggan',aList,'jenis','"'+EnamaJenisPelanggan.Text+'"');


    TampilanAwal;
    isiCmb(dm.Q1,'jenispelanggan',['idjenispelanggan','jenis'],FinputPelanggan.cbJenisPelanggan);
  end;
end;

procedure TFinputJenisPelanggan.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFinputJenisPelanggan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearText(Self);
  aList.Free;
end;

procedure TFinputJenisPelanggan.FormShow(Sender: TObject);
begin
  aList := TStringList.Create;
  EnamaJenisPelanggan.SetFocus;
end;

procedure TFinputJenisPelanggan.TampilanAwal;
begin
  ClearText(Self);
  EnamaJenisPelanggan.SetFocus;
  ExQry(dm.QJenisPelanggan,'SELECT * FROM jenispelanggan',True);
end;

end.
