unit uSetSaldoAwal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,DateUtils,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.StdCtrls, cxButtons, Vcl.ComCtrls, uEngine, uComCtrl,
  cxControls, cxContainer, cxEdit, cxTextEdit, uOvEdit, cxMaskEdit,
  cxDropDownEdit, dxSkinTheBezier;

type
  TFSaldoAwal = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    dt1: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    EKasir: TcxTextEdit;
    ESaldoAwal: TcxTextEdit;
    Label7: TLabel;
    Label8: TLabel;
    cbAkun: TcxComboBox;
    procedure btnSimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSaldoAwal: TFSaldoAwal;

implementation

{$R *.dfm}

uses uMainMenu, udm;

procedure TFSaldoAwal.btnSimpanClick(Sender: TObject);
var
  SaldoAkhir : Real;
  Selisih    : Real;
  SaldoAwal  : Real;
begin

  if cbAkun.Text = '' then begin
     Error('Kas Belum Dipilih');
     Exit;

  end else begin
        ExQry(dm.Q1,'SELECT SUM(s_awal+debet-kredit) as SaldoAkhir FROM saldoakun  '+
        ' WHERE month(tgl)="'+IntToStr(MonthOf(now))+'" AND YEAR(tgl)="'+IntToStr(YearOf(now))+'" '+
        ' AND noakun="'+Copy(cbAkun.Text,1,7)+'"',True);

        SaldoAkhir := GetValF(dm.Q1,'saldoakhir');
        SaldoAwal  := StrToFloatDef(nilai(EsaldoAwal.Text),0);

        Selisih    := SaldoAkhir - SaldoAwal;

        if Selisih < 0 then begin
           PostingJurnal(dm.Q2,Copy(cbAkun.Text,1,7),FormatDateTime('ddmmyyhhnnss',now),'Saldo Awal Kasir',now,Abs(Selisih),Abs(Selisih),Abs(Selisih),'D');
           PostingJurnal(dm.Q2,'301.001',FormatDateTime('ddmmyyhhnnss',now),'Saldo Awal Kasir',now,Abs(Selisih),Abs(Selisih),Abs(Selisih),'K');
        end
        else begin
            PostingJurnal(dm.Q2,Copy(cbAkun.Text,1,7),FormatDateTime('ddmmyyhhnnss',now),'Saldo Awal Kasir',now,Abs(Selisih),Abs(Selisih),Abs(Selisih),'K');
            PostingJurnal(dm.Q2,'301.001',FormatDateTime('ddmmyyhhnnss',now),'Saldo Awal Kasir',now,Abs(Selisih),Abs(Selisih),Abs(Selisih),'D');
        end;
        ExQry(dm.Q2,'SELECT iduser FROM saldoawalkasir WHERE iduser="'+Fmain.sbr1.Panels[1].Text+'" '+
                      ' AND tgl="'+Tanggal(now)+'"',True);

        if (dm.Q2.IsEmpty) then begin

           ExQry(dm.Q4,'INSERT INTO saldoawalkasir(tgl,iduser,saldo) VALUES ("'+Tanggal(now)+'",'+
           '"'+Fmain.sbr1.Panels[1].Text+'","'+StrToDecimal(FloatToStr(saldoawal))+'")',False);

        end else if (dm.Q2.IsEmpty = False) then begin
              ExQry(dm.Q4,'UPDATE saldoawalkasir SET saldo="'+StrToDecimal(FloatToStr(saldoawal))+'" '+
              ' WHERE iduser="'+Fmain.sbr1.Panels[1].Text+'" AND tgl="'+Tanggal(Now)+'" ',False);

        end;
        ShowMessage('Saldo Bershasil Disimpan');
        Close;
  end;
end;

procedure TFSaldoAwal.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFSaldoAwal.FormCreate(Sender: TObject);
begin
  ESaldoAwal.isRupiah := True;
end;

procedure TFSaldoAwal.FormShow(Sender: TObject);
begin
  dt1.Date          := Now;
  Ekasir.Text       := Fmain.sbr1.Panels[2].Text;
  EsaldoAwal.Text   := '0';

  ExQry(dm.Q2,'SELECT kodeakunperkiraan,namaakunperkiraan '+
  ' FROM m_akunperkiraan WHERE akunsubmaster in ("102","101")',True);
    cbAKun.Properties.Items.Clear;
  while not dm.Q2.Eof do begin
    cbAKun.Properties.Items.Add(
    GetVal(dm.Q2,'kodeakunperkiraan')+' | '+
    GetVal(dm.Q2,'namaakunperkiraan'));
    dm.Q2.Next;
  end;
end;

end.
