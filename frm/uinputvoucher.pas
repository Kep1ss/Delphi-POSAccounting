unit uinputvoucher;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxTextEdit, dxBevel, uComCtrl, uOvEdit, uctrlFrm, uEngine,
  dxSkiniMaginary, dxSkinOffice2010Blue, dxSkinOffice2016Colorful, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxCalendar, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
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
  TFinputVoucher = class(TForm)
    dxbvl1: TdxBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EKodeVoucher: TcxTextEdit;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    Label10: TLabel;
    Label12: TLabel;
    EnamaVoucher: TcxTextEdit;
    Enominal: TcxTextEdit;
    dt1: TcxDateEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
  private
    procedure TampilanAwal;
    { Private declarations }
  public
   idVoucher : string;
    { Public declarations }
  end;

var
  FinputVoucher: TFinputVoucher;
  aList     : TStringList;

implementation
  uses
    udm,
  uDatavoucher;

{$R *.dfm}

{ TFInputvoucher }

procedure TFinputVoucher.btnSimpanClick(Sender: TObject);
begin
  if not CheckEdit(Self) then begin
     addParam('kodevoucher',Ekodevoucher.Text,aList,'str');
     addParam('namavoucher',EnamaVOucher.Text,aList,'str');
     addParam('nominal',Enominal.isangka,aList,'str');
     addParam('tglexpired',frmtgl(dt1.date),aList,'date');

     OpenTable(dm.Q1,['idvoucher'],'voucher where idvoucher="'+idvoucher+'"');
    if dm.Q1.IsEmpty then
       exeDb(dm.Q1,'voucher',aList)
    else
       updatedb(dm.Q1,'voucher',aList,'idvoucher','"'+idvoucher+'"');

    ExQry(dm.Qvoucher,_SQLvoucher,True);
    TampilanAwal;

    if FDatavoucher.CanEdit  then
      Close;

  end;
end;

procedure TFinputVoucher.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFinputVoucher.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearText(Self);
  aList.Free;
end;

procedure TFinputVoucher.FormShow(Sender: TObject);
begin
  aList := TStringList.Create;
  Ekodevoucher.SetFocus;
end;

procedure TFinputVoucher.TampilanAwal;
begin
  ClearText(Self);
  EkodeVoucher.SetFocus;
  FDatavoucher.LoadData;
end;

end.
