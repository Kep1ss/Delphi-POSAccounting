unit uInputLokasi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxTextEdit, dxBevel, uComCtrl, uOvEdit, uctrlFrm, uEngine,
  dxSkinVisualStudio2013Light, cxMemo, dxSkiniMaginary, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinVisualStudio2013Dark, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinTheBezier;

type
  TFinputLokasi = class(TForm)
    dxbvl1: TdxBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Enamalokasi: TcxTextEdit;
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
    idLokasi : string;
    { Public declarations }
  end;

var
  FinputLokasi: TFinputLokasi;
  aList     : TStringList;

implementation
  uses
    udm,
  uDatalokasi;

{$R *.dfm}

{ TFInputlokasi }

procedure TFinputLokasi.btnSimpanClick(Sender: TObject);
begin
  if not CheckEdit(Self) then begin

       ExQry(dm.Q2,'SELECT namalokasi FROM lokasi WHERE namalokasi="'+Enamalokasi.Text+'" ',True);

     if (not dm.Q2.IsEmpty) and (not FDatalokasi.CanEdit) then begin
        Error(' Nama gudang sudah digunakan');
        Exit;
     end else begin
         addParam('namalokasi',Enamalokasi.Text,aList,'str');


         OpenTable(dm.Q1,['namalokasi'],'lokasi where idlokasi="'+idlokasi+'"');
        if dm.Q1.IsEmpty then
           exeDb(dm.Q1,'lokasi',aList)
        else
           updatedb(dm.Q1,'lokasi',aList,'idlokasi','"'+idlokasi+'"');

        ExQry(dm.Qlokasi,_SQLlokasi,True);
        TampilanAwal;

        if FDatalokasi.CanEdit  then
          Close;
     end;

  end;
end;

procedure TFinputLokasi.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFinputLokasi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearText(Self);
  aList.Free;
end;

procedure TFinputLokasi.FormShow(Sender: TObject);
begin
  aList := TStringList.Create;
  Enamalokasi.SetFocus;
end;

procedure TFinputLokasi.TampilanAwal;
begin
  ClearText(Self);
  Enamalokasi.SetFocus;
  if Assigned(FdataLokasi) then

  FDatalokasi.LoadData;
  idLokasi := '';

end;

end.
