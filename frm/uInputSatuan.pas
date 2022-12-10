unit uInputSatuan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxTextEdit, dxBevel, uComCtrl, uOvEdit, uctrlFrm, uEngine,
  dxSkinVisualStudio2013Light, cxMemo, dxSkinMcSkin, dxSkiniMaginary,
  dxSkinOffice2010Blue, dxSkinOffice2016Colorful, dxSkinMoneyTwins, dxSkinBlack,
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
  TFinputSatuan = class(TForm)
    dxbvl1: TdxBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    EnamaSatuan: TcxTextEdit;
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
    idSatuan : String;
    { Public declarations }
  end;

var
  FinputSatuan: TFinputSatuan;


implementation
  uses
    udm,
  uDatasatuan, uInputDataBarang;

{$R *.dfm}

{ TFInputsatuan }

procedure TFinputSatuan.btnSimpanClick(Sender: TObject);
var
  aList     : TStringList;
begin
  if not CheckEdit(Self) then begin
     aList := TStringList.Create;
     try

           addParam('namasatuan',Enamasatuan.Text,aList,'str');


           OpenTable(dm.Q1,['namasatuan'],'satuan where idsatuan="'+idsatuan+'"');
          if dm.Q1.IsEmpty then
             exeDb(dm.Q1,'satuan',aList)
          else
             updatedb(dm.Q1,'satuan',aList,'idsatuan','"'+idsatuan+'"');


          TampilanAwal;
          if Assigned(FinputBarang) then begin

             with FinputBarang do begin
              isiCmb(dm.Q1,'satuan',['idsatuan','namasatuan'],cbsatuanbeli);
              isiCmb(dm.Q1,'satuan',['idsatuan','namasatuan'],cbSatuanjual);
              isiCmb(dm.Q1,'satuan',['idsatuan','namasatuan'],cbSatuan1);
              isiCmb(dm.Q1,'satuan',['idsatuan','namasatuan'],cbSatuan2);
              isiCmb(dm.Q1,'satuan',['idsatuan','namasatuan'],cbSatuan3);
              isiCmb(dm.Q1,'satuan',['idsatuan','namasatuan'],cbSatuan4);
              isiCmb(dm.Q1,'satuan',['idsatuan','namasatuan'],cbSatuan5);
             end;
          end;

          if Assigned(FDatasatuan) then
          if FDatasatuan.CanEdit  then
            Close;
        finally
          aList.Free;
        end;

  end;

end;

procedure TFinputSatuan.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFinputSatuan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearText(Self);

end;

procedure TFinputSatuan.FormShow(Sender: TObject);
begin

  Enamasatuan.SetFocus;
end;

procedure TFinputSatuan.TampilanAwal;
begin
  ClearText(Self);
  Enamasatuan.SetFocus;
  if Assigned(FDatasatuan) then begin
     dm.QSatuan.Active := False;
     dm.QSatuan.Active := True;
  end;
  idSatuan := '';

end;

end.
