unit uInputSupplier;

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
  dxSkinXmas2008Blue, dxSkinTheBezier, cxCheckBox;

type
  TFinputsupplier = class(TForm)
    dxbvl1: TdxBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EnamaSupplier: TcxTextEdit;
    Ekota: TcxTextEdit;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    EAlamat: TcxMemo;
    Enamapemilik: TcxTextEdit;
    Enotelpon: TcxTextEdit;
    Enorekening: TcxTextEdit;
    Label29: TLabel;
    Label38: TLabel;
    Enamabank: TcxTextEdit;
    Label14: TLabel;
    Label15: TLabel;
    EkodeSupplier: TcxTextEdit;
    cPajak: TcxCheckBox;
    Label16: TLabel;
    Label17: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
  private
    procedure TampilanAwal;
    { Private declarations }
  public
    idSupplier : String;
    CanEdit : Boolean;
    { Public declarations }
  end;

var
  Finputsupplier: TFinputsupplier;
  aList     : TStringList;

implementation
  uses
    udm, uSupplier;

{$R *.dfm}

{ TFInputUser }

procedure TFinputsupplier.btnSimpanClick(Sender: TObject);
begin
  if not CheckEdit(Self) then begin
     addParam('kodesupplier', EkodeSupplier.Text,aList,'str');
     addParam('namasupplier', EnamaSupplier.Text,aList,'str');
     addParam('namapemilik',  Enamapemilik.Text,aList,'str');
     addParam('alamat',       EAlamat.Text,aList,'str');
     addParam('kota',         Ekota.Text,aList,'str');
     addParam('notelpon' ,    Enotelpon.Text,aList,'str');
     addParam('norek',        Enorekening.Text,aList,'str');
     addParam('namabank',     Enamabank.Text,aList,'str');
     addParam('ispajak',        BolStr(cPajak.Checked), aList,'str');


     OpenTable(dm.Q1,['idsupplier'],'m_supplier where idsupplier="'+idSupplier+'"');
    if dm.Q1.IsEmpty then
       exeDb(dm.Q1,'m_supplier',aList)
    else
       updatedb(dm.Q1,'m_supplier',aList,'idsupplier','"'+idSupplier+'"');

    ExQry(dm.QSupplier,_SQLSupplier,True);
    TampilanAwal;
    if CanEdit then
       Close;
  end;
end;

procedure TFinputsupplier.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFinputsupplier.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearText(Self);
  aList.Free;
end;

procedure TFinputsupplier.FormShow(Sender: TObject);
begin
  aList := TStringList.Create;
  EnamaSupplier.SetFocus;
end;

procedure TFinputsupplier.TampilanAwal;
begin
  ClearText(Self);
  if Assigned(FdataSupplier) then
  FdataSupplier.LoadData;
  idSupplier := '';
    Finputsupplier.EkodeSupplier.Text := GetCode(dm.Q2,'m_supplier','kodesupplier','SP');
end;

end.
