unit uInputKategori;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxTextEdit, dxBevel, uComCtrl, uOvEdit, uctrlFrm, uEngine,
  dxSkinVisualStudio2013Light, cxMemo, dxSkinMcSkin, dxSkiniMaginary,
  dxSkinMoneyTwins, dxSkinOffice2010Blue, dxSkinOffice2016Colorful, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFinputKategori = class(TForm)
    dxbvl1: TdxBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    EKategoriName: TcxTextEdit;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    Label3: TLabel;
    Label4: TLabel;
    EMargin: TcxTextEdit;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
  private
    procedure TampilanAwal;
    { Private declarations }
  public
    idkategori : string;
    { Public declarations }
  end;

var
  FinputKategori: TFinputKategori;


implementation
  uses
    udm,
  uDataKategori, uInputDataBarang;

{$R *.dfm}

{ TFInputKategori }

procedure TFinputKategori.btnSimpanClick(Sender: TObject);
var
  Alist : TStringList;
begin
  if not CheckEdit(Self) then begin
     Alist := TStringList.Create;
     try
         addParam('namakategori',EKategoriname.Text,aList,'str');
         addParam('margin',      StrToDecimal(EMargin.Text),aList,'str');


         OpenTable(dm.Q1,['namakategori'],'Kategori where idkategori="'+idkategori+'"');
        if dm.Q1.IsEmpty then
           exeDb(dm.Q1,'kategori',aList)
        else
           updatedb(dm.Q1,'kategori',aList,'idkategori','"'+idkategori+'"');


        TampilanAwal;

        if  Assigned(FinputBarang) then

        isiCmb(dm.Q1,'kategori',['idkategori','namakategori'],FinputBarang.cbKategori);

       if Assigned(FDataKategori) then
          if FDataKategori.CanEdit  then
            Close;
     finally
       Alist.Free;
     end;


  end;
end;

procedure TFinputKategori.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFinputKategori.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearText(Self);

end;

procedure TFinputKategori.FormShow(Sender: TObject);
begin
  EKategoriname.SetFocus;
end;

procedure TFinputKategori.TampilanAwal;
begin
  ClearText(Self);
  EKategoriname.SetFocus;
  if Assigned(FDataKategori) then begin
     dm.QKategori.Active := False;
     dm.QKategori.Active := True;
  end;

  idkategori := '';
end;

end.
