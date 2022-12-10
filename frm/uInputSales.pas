unit uInputSales;

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
  TFinputSales = class(TForm)
    dxbvl1: TdxBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EnamaSales: TcxTextEdit;
    Ekota: TcxTextEdit;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    Label10: TLabel;
    Label12: TLabel;
    EAlamat: TcxMemo;
    Enotelpon: TcxTextEdit;
    Label14: TLabel;
    Label15: TLabel;
    EkodeSales: TcxTextEdit;
    Label3: TLabel;
    Label7: TLabel;
    Etarget: TcxTextEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

    { Private declarations }
  public
    idsales : String;
    procedure TampilanAwal;
    { Public declarations }
  end;

var
  FinputSales: TFinputSales;
  aList     : TStringList;

implementation
  uses
    udm, uDataSales;

{$R *.dfm}

{ TFInputUser }

procedure TFinputSales.btnSimpanClick(Sender: TObject);
begin
  if not CheckEdit(Self) then begin
     addParam('kodesales', Ekodesales.Text,aList,'str');
     addParam('namasales', Enamasales.Text,aList,'str');
     addParam('alamat',       EAlamat.Text,aList,'str');
     addParam('kota',         Ekota.Text,aList,'str');
     addParam('notelpon' ,    Enotelpon.Text,aList,'str');
     addParam('target' ,    Etarget.isAngka,aList,'str');


     OpenTable(dm.Q1,['idsales'],'sales where idsales="'+idsales+'"');
    if dm.Q1.IsEmpty then
       exeDb(dm.Q1,'sales',aList)
    else
       updatedb(dm.Q1,'sales',aList,'idsales','"'+idsales+'"');

    ExQry(dm.Qsales,_SQLsales,True);
    TampilanAwal;
    if Assigned(FdataSales) then

    if Fdatasales.CanEdit then
       Close;
  end;
end;

procedure TFinputSales.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFinputSales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearText(Self);
  aList.Free;
end;

procedure TFinputSales.FormCreate(Sender: TObject);
begin
  Etarget.isRupiah := True;
end;

procedure TFinputSales.FormShow(Sender: TObject);
begin
  aList := TStringList.Create;
 
end;

procedure TFinputSales.TampilanAwal;
begin
  ClearText(Self);
  if Assigned(FdataSales) then
  Fdatasales.LoadData;
  Ekodesales.Text := GetCode(dm.Q2,'sales','kodesales','SP');
  idsales := '';
end;

end.
