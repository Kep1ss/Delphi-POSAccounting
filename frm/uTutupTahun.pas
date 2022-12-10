unit uTutupTahun;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinSharp, Vcl.ComCtrls,
  Vcl.StdCtrls, cxButtons,dateutils, uComCtrl, uEngine,
  dxSkinVisualStudio2013Blue, dxSkiniMaginary, dxSkinMoneyTwins,
  dxSkinOffice2010Blue, dxSkinOffice2016Colorful, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  TFtutupTahun = class(TForm)
    btn1: TcxButton;
    btn2: TcxButton;
    Label1: TLabel;
    dtp1: TDateTimePicker;
    pb1: TProgressBar;
    Lproses1: TLabel;
    Lproses: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure dtp1CloseUp(Sender: TObject);
  private
  function GetNoAkun(id:String):String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FtutupTahun: TFtutupTahun;

implementation

{$R *.dfm}

uses udm;

function TFtutupTahun.GetNoAkun(id:String):String;
var
  jml  : Integer;
  Kode : string;
  tglkemarin : TDate;
begin


  tglkemarin := EncodeDate(YearOf(dtp1.Date),MonthOf(dtp1.Date)-1,1);

  ExQry(dm.Q4,'select kodeakunperkiraan,max(Right(kodeakunperkiraan,3)) as '+
                ' jum from m_akunperkiraan where akunsubmaster="'+id+'" '+
                ' AND namaakunperkiraan '+
                ' LIKE "%'+UPPERCASE(FormatDateTime('yyyy',tglkemarin))+'%"',True);


     if dm.Q4.Fields[0].AsString = '' then
     begin
          if StrToIntDef(GetVal(dm.Q4,'jum'),0)=0  then jml := 1 else
           jml := GetValInt(dm.Q4,'jum') + 1;

          kode := IntToStr(jml);
          kode:= Copy('000'+kode,length('000'+kode)-2,3);
          Result := id+'.'+Kode;
     end else
        Result := dm.Q4.Fields[0].AsString;

end;


procedure TFtutupTahun.btn1Click(Sender: TObject);
var
  i : integer;

  NextKode : String;
  tglTutup : TDate;
begin



        MessageBox(Handle,' PERINGATAN !!!, SEBELUM MELAKUKAN PROSES TUTUP BUKU '+#13+
               ' HARAP PERIKSA TERLEBIH DAHULU LAPORAN LABA RUGI DAN NERACA '+#13+
               ' APAKAH SUDAH BENAR','Warning',MB_ICONWARNING);

        if MessageDlg('Lanjutkan Proses Tutup Buku ??',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        begin

           pb1.Max := dm.Q1.RecordCount;
           pb1.Position := 0;
           i := 1;
           Lproses1.Caption := 'Menghitung saldo akhir akun ... ';


           NextKode := GetNoAkun('303');

           ExQry(dm.Q5,'DELETE FROM m_akunperkiraan WHERE kodeakunperkiraan="'+NExtKode+'"',False);
           ExQry(dm.Q5,'INSERT INTO m_akunperkiraan ( kodeakunperkiraan,namaakunperkiraan,akunsubmaster) VALUES ( '+
           '"'+NextKode+'" ,"LABA RUGI THN. '+UPPERCASE(FOrmatDateTIme('yyyy',dtp1.Date))+'","303")',FAlse);

             ExQry(dm.Q2,' SELECT                                                       '+
                         '       SUM(nominal) as totallabarugi                          '+
                         '     FROM                                                     '+
                         '     tutupbulan                                               '+
                         '     WHERE noakun LIKE "%L%" '+
                         '     AND YEAR(tgl)="'+IntToStr(YearOf(dtp1.Date))+'"           ',True);

             with dm.Q4 do begin
               Close;
               SQL.Text := ' INSERT INTO tutuptahun(thn,noakun,nominal) VALUES '+
                           ' (:tgl,:noakun,:nominal)';
               ParamByName('tgl').AsDate      := dtp1.Date;
               ParamByName('noakun').AsString := NextKode;
               ParamByName('nominal').AsFloat := GetValF(dm.Q2,'totallabarugi');
               ExecSQL;
             end;

             with dm.Q5 do begin
               Close;
               SQL.Text := ' INSERT INTO saldoakun(noakun,nobukti,keterangan,tgl,s_awal,s_akhir) '+
                           ' VALUES (:noakun,:nobukti,:keterangan,:tgl,:s_awal,:s_akhir)';
               ParamByName('noakun').AsString     := NextKode;
               ParamByName('nobukti').AsString    := GetCode(dm.Q1,'saldoakun','nobukti','TBT');
               ParamByName('keterangan').AsString := 'SALDO AWAL TAHUN "'+INTTOSTR(YearOf(dtp1.Date)+1)+'"';
               ParamByName('tgl').AsDate          := dtp1.Date + 1;
               ParamByName('s_awal').AsFloat      := GetValF(dm.Q2,'totallabarugi');
               ParamByName('s_akhir').AsFloat     := GetValF(dm.Q2,'totallabarugi');
               ExecSQL;

             end;
             ExQry(dm.Q2,'SELECT kodeakunperkiraan FROM m_akunperkiraan WHERE akunsubmaster in ("302","404")',True);

             while not dm.Q2.Eof  do begin

               ExQry(dm.Q4,'UPDATE saldoakun SET s_awal=0,s_akhir=0 WHERE noakun="'+GetVal(dm.Q2,'kodeakunperkiraan')+'" '+
                           ' AND tgl="'+Tanggal(dtp1.Date+1)+'"',False)  ;


               dm.Q2.Next;
             end;
             Lproses.Caption := IntToStr(i)+'/'+ IntToStr(dm.Q1.RecordCount);
             pb1.Position    := pb1.Max;

             Application.ProcessMessages;

        end;

end;

procedure TFtutupTahun.btn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFtutupTahun.dtp1CloseUp(Sender: TObject);
begin
  ExQry(dm.Q2,'SELECT * FROM tutuptahun WHERE YEAR(thn)="'+IntToStr(YearOf(dtp1.Date))+'"',True);

  if dm.Q2.IsEmpty = False then begin
     MessageBox(Handle,'Proses tutup tahun sudah dilakukan','Warning',MB_ICONERROR);
      Exit;
      btn1.Enabled := False;
  end else begin
  if MonthOf(dtp1.Date) <> MonthOf(EndOfTheYear(dtp1.Date)) then begin

    MessageBox(Handle,'Tanggal tutup buku harus di akkhir tahun','Warning',MB_ICONERROR);
    Exit;
    btn1.Enabled := False;
  end else if DayOf(dtp1.Date) <> DayOf(EndOfTheMonth(dtp1.Date)) then begin

    MessageBox(Handle,'Tanggal tutup buku harus di akkhir Bulan','Warning',MB_ICONERROR);
    Exit;
    btn1.Enabled := False;
  end else begin
    ExQry(dm.Q1,'SELECT tgl from tutupbulan WHERE MONTH(tgl)="'+IntToStr(MonthOf(dtp1.Date))+'" '+
    ' AND YEAR(tgl)="'+IntTOStr(YearOf(dtp1.Date))+'"',True);

    if dm.Q1.IsEmpty  then begin

      MessageBox(Handle,PChar('PROSES TUTUP BUKU DI BULAN '+IntToStr(MonthOf(dtp1.Date))+' TAHUN '+IntTOStr(YearOf(dtp1.Date))+' BELUM DILAKUKAN'),'ERROR',MB_ICONERROR);
      btn1.Enabled := False;
      Exit;
    end else
    begin
      btn1.Enabled := True;
    end;
  end;
  end;
end;

procedure TFtutupTahun.FormShow(Sender: TObject);
begin
  dtp1.Date := Now;
end;

end.
