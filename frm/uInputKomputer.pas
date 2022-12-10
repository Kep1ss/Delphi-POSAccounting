unit uInputKomputer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxTextEdit, dxBevel, uComCtrl, uOvEdit, uctrlFrm, uEngine,
  dxSkinVisualStudio2013Light, cxMemo, dxSkinMcSkin, dxSkiniMaginary,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFinputKomputer = class(TForm)
    dxbvl1: TdxBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    EnamaKomputer: TcxTextEdit;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
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
  FinputKomputer: TFinputKomputer;
  aList     : TStringList;

implementation
  uses
    udm,
  uDataKomputerKasir, uInputDataBarang;

{$R *.dfm}

{ TFInputkomputer }

procedure TFinputKomputer.btnSimpanClick(Sender: TObject);
begin
  if not CheckEdit(Self) then begin
     addParam('namakomputer',EnamaKomputer.Text,aList,'str');


     OpenTable(dm.Q1,['namakomputer'],'komputer where namakomputer="'+Enamakomputer.Text+'"');
    if dm.Q1.IsEmpty then
       exeDb(dm.Q1,'komputer',aList)
    else
       updatedb(dm.Q1,'komputer',aList,'namakomputer','"'+Enamakomputer.Text+'"');


    TampilanAwal;

    if Assigned(FdataMasterKomputer) then
    if FdataMasterKomputer.CanEdit  then
      Close;
  end;

end;

procedure TFinputKomputer.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFinputKomputer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearText(Self);
  aList.Free;
end;

procedure TFinputKomputer.FormShow(Sender: TObject);
begin
  aList := TStringList.Create;
  Enamakomputer.SetFocus;
end;

procedure TFinputKomputer.TampilanAwal;
begin
  ClearText(Self);
  Enamakomputer.SetFocus;
  if Assigned(FdataMasterKomputer) then
  FdataMasterKomputer.LoadData;
end;

end.
