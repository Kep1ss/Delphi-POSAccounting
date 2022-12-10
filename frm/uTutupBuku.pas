unit uTutupBuku;

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
  dxSkinXmas2008Blue, dxSkinTheBezier;

type
  TFtutupBUku = class(TForm)
    btn1: TcxButton;
    btn2: TcxButton;
    Label1: TLabel;
    dtp1: TDateTimePicker;
    pb1: TProgressBar;
    Lproses1: TLabel;
    Lproses: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure dtp1CloseUp(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    function GetNoAkun(id:String):String;
    procedure RunUpdate;
  public
    { Public declarations }
    isAuto : Boolean;
  end;

var
  FtutupBUku: TFtutupBUku;

implementation

{$R *.dfm}

uses udm;

function TFtutupBUku.GetNoAkun(id:String):String;
var
  jml  : Integer;
  Kode : string;
  tglkemarin : TDate;
begin



  ExQry(dm.Q4,'select kodeakunperkiraan,max(Right(kodeakunperkiraan,3)) as '+
                ' jum from m_akunperkiraan where akunsubmaster="'+id+'" '+
                ' AND namaakunperkiraan '+
                ' LIKE "%'+UPPERCASE(FormatDateTime('mmmm',dtp1.Date))+'%"',True);


      if StrToIntDef(GetVal(dm.Q4,'jum'),0)=0  then jml := 2 else
       jml := GetValInt(dm.Q4,'jum') + 1;

      kode := IntToStr(MonthOf(dtp1.Date)+1);
      kode:= Copy('000'+kode,length('000'+kode)-2,3);
      Result := id+'.'+Kode;

end;


procedure TFtutupBUku.RunUpdate;
var
  i : integer;
  Stok , Harga,TotalStok : Real;
  NextKode : String;
  tglTutup : TDate;
  nobukti ,Kode, NoBuktiSaldo : String;
  LabaRugi : Real;
  PendapatanBKP,BiayaBKP,LabaBkp : Real;
  alist : TStringList;
  tgl1 , tgl2  : TDate;
  AkunLaba : String;
begin

   alist := TStringList.Create;

    try
        tgl1 := EncodeDate(YearOf(dtp1.Date),MonthOf(dtp1.Date),1);
        tgl2 := EncodeDate(YearOf(dtp1.Date),MonthOf(dtp1.Date),DayOf(EndOfTheMonth(dtp1.Date)));
        ExQry(dm.Q1,' CALL sp_labarugi("'+Tanggal(tgl1)+'","'+Tanggal(tgl2)+'")',True);

        LabaRugi      := GetValF(dm.Q1,'Pendapatan') - GetValF(dm.Q1,'Biaya');
        PendapatanBKP := GetValF(dm.Q1,'PendapatanBkp');
        BiayaBKP      := GetValF(dm.Q1,'BiayaBkp');
        LabaBkp       := PendapatanBKP - BiayaBKP;

        Kode := GetCode(dm.Q1,'saldoakun','nobukti','');
        ExQry(dm.Q1,'DELETE FROM saldoakun WHERE noakun="302.001" '+
        ' AND YEAR(tgl)="'+IntToStr(YearOf(tgl1))+'" '+
        ' AND MONTH(tgl)="'+IntToStr(MOnthOf(tgl1))+'"',False);

        addParam('noakun',     '302.001',                aList,'str');
        addParam('nobukti',    kode,                     aList,'str');
        addParam('tgl',        frmTgl(tgl2),              aList,'date');
        if LabaRugi < 0 then begin
        addParam('debet',      StrToDecimal(FloatToStr(Abs(LabaRugi))),    aList,'str');
        addParam('kredit',     '0',    aList,'str');
        end else begin
        addParam('debet',      '0',    aList,'str');
        addParam('kredit',     StrToDecimal(FloatToStr(Abs(LabaRugi))),    aList,'str');
        end;
        addParam('s_akhir',    StrToDecimal(FloatToStr(Abs(LabaRugi))),      aList,'str');
        addParam('nominalbkp', StrToDecimal(FloatToStr(Abs(LabaBkp))),   aList,'str');
        addParam('nominalnonbkp',StrToDecimal(FloatToStr(Abs(LabaRugi-LabaBkp))),    aList,'str');

        exeDb(dm.Q2,'saldoakun',aList);
    finally
      alist.Free;
    end;


    ExQry(dm.Q1,'SELECT tgl FROM kartustok '+
    ' WHERE keterangan LIKE "%PROSES TUTUP STOK BULAN%" '+
    ' AND MONTH(tgl)="'+IntToStr(MonthOf(dtp1.Date) + 1)+'" '+
    ' AND YEAR(tgl)="'+IntToStr(YearOf(dtp1.Date))+'" ',False);


    if dm.Q1.IsEmpty then begin

      OpenTable(dm.Q1,['kodebarang','satuanjual'],'barang');

      i := 1;
      pb1.Max := dm.Q1.RecordCount;
      pb1.Position := 0;
      Lproses1.Caption := 'Sedang menghitung stok ...';
      nobukti  := GetCode(dm.Q5,'kartustok','nobukti','');
        while not dm.Q1.Eof do begin
            ExQry(dm.Q3,'SELECT * from lokasi',True);
            while dm.Q3.Eof = False  do begin
              ExQry(dm.Q2,'SELECT r.hargabeli,SUM(s.saldoawal + s.masuk - s.keluar) as stok FROM kartustok s'+
              ' LEFT JOIN hargabelirata r ON r.kodebarang=s.kodebarang '+
              ' WHERE s.kodebarang="'+getval(dm.Q1,'kodebarang')+'" '+
              ' AND MONTH(s.tgl)="'+intToStr(MonthOF(dtp1.date))+'" '+
              ' AND YEAR(s.tgl)="'+IntToStr(YearOf(dtp1.date))+'" '+
              ' AND s.idgudang="'+Getval(dm.Q3,'idlokasi')+'" GROUP BY '+
              ' s.kodebarang,s.idgudang ORDER BY s.idkartustok ASC',True);

                dm.Q4.Close;
                dm.Q4.SQL.Text := ' INSERT INTO kartustok ( '+
                                '      nobukti,           '+
                                '      tgl,               '+
                                '      kodebarang,        '+
                                '      hargabeli,        '+
                                '      idgudang,          '+
                                '      satuan,            '+
                                '      saldoawal,             '+
                                '      saldoakhir,keterangan '+
                                '    )                       '+
                                '    VALUES                  '+
                                '      (                     '+
                                '        :nobukti,        '+
                                '        :tgl,          '+
                                '        :kodebarang,     '+
                                '        :hargabeli,     '+
                                '        :idgudang,       '+
                                '        :satuan,         '+
                                '        :saldoawal,            '+
                                '        :saldoakhir,:keterangan '+
                                '      ) ';
                dm.Q4.ParamByName('nobukti').AsString     := nobukti;
                dm.Q4.ParamByName('tgl').AsDate           := dtp1.date + 1;
                dm.Q4.ParamByName('kodebarang').AsString  := GetVal(dm.Q1,'kodebarang');
                dm.Q4.ParamByName('idgudang').AsString    := GetVal(dm.Q3,'idlokasi');
                dm.Q4.ParamByName('satuan').AsString      := GetVal(dm.Q1,'satuanjual');
                dm.Q4.ParamByName('hargabeli').AsFloat    := GetValF(dm.Q2,'hargabeli');
                dm.Q4.ParamByName('saldoawal').AsFloat    := GetValF(dm.Q2,'stok');
                dm.Q4.ParamByName('saldoakhir').AsFloat   := GetValF(dm.Q2,'stok');
                dm.Q4.ParamByName('keterangan').AsString  := 'PROSES TUTUP STOK BULAN '+IntToStr(MonthOf(dtp1.date));
                dm.Q4.ExecSQL;

                
                dm.Q3.Next;
            end;
            Inc(i);
            Lproses.Caption := IntToStr(i)+'/'+ IntToStr(dm.Q1.RecordCount);
            pb1.Position    := i;
            Application.ProcessMessages;
            dm.Q1.Next;

        end;
    end;{ else begin
       OpenTable(dm.Q1,['kodebarang','satuanjual'],'barang');

      i := 1;
      pb1.Max := dm.Q1.RecordCount;
      pb1.Position := 0;
      Lproses1.Caption := 'Sedang menghitung stok ...';
      nobukti  := GetCode(dm.Q5,'kartustok','nobukti','');
        while not dm.Q1.Eof do begin
            ExQry(dm.Q3,'SELECT * from lokasi',True);
            while dm.Q3.Eof = False  do begin
              ExQry(dm.Q2,'SELECT r.hargabeli,SUM(s.saldoawal + s.masuk - s.keluar) as stok FROM kartustok s'+
              ' LEFT JOIN history_harga_rata2 r ON r.kodebarang=s.kodebarang '+
              ' AND MONTH(s.tgl)=MONTH(r.tgl) and YEAR(s.tgl)=YEAR(r.tgl) '+
              ' WHERE s.kodebarang="'+getval(dm.Q1,'kodebarang')+'" '+
              ' AND MONTH(s.tgl)="'+intToStr(MonthOF(dtp1.date))+'" '+
              ' AND YEAR(s.tgl)="'+IntToStr(YearOf(dtp1.date))+'" '+
              ' AND s.idgudang="'+Getval(dm.Q3,'idlokasi')+'" GROUP BY '+
              ' s.kodebarang,s.idgudang ORDER BY s.idkartustok ASC',True);

                dm.Q4.Close;
                dm.Q4.SQL.Text := 'UPDATE kartustok SET '+
                ' saldoawal=:saldoawal,saldoakhir=:saldoakhir '+
                ' WHERE tgl=:tgl AND idgudang=:idgudang AND kodebarang=:kodebarang '+
                ' AND tgl=:tgl '+
                ' AND keterangan LIKE "%PROSES TUTUP STOK BULAN%" ';

                dm.Q4.ParamByName('tgl').AsDate           := dtp1.date + 1;
                dm.Q4.ParamByName('kodebarang').AsString  := GetVal(dm.Q1,'kodebarang');
                dm.Q4.ParamByName('idgudang').AsString    := GetVal(dm.Q3,'idlokasi');
                dm.Q4.ParamByName('saldoawal').AsFloat    := GetValF(dm.Q2,'stok');
                dm.Q4.ParamByName('saldoakhir').AsFloat   := GetValF(dm.Q2,'stok');

                dm.Q4.ExecSQL;

            //    ShowMessage('OKE');

                ExQry(dm.Q4,'SELECT hargabeli FROM history_harga_rata2'+
                ' WHERE kodebarang="'+GetVal(dm.Q1,'kodebarang')+'" '+
                ' AND tgl="'+Tanggal(dtp1.Date + 1)+'"',True);

                if dm.Q4.IsEmpty then

                    ExQry(dm.Q5,'INSERT INTO history_harga_rata2 (tgl,kodebarang,hargabeli) '+
                    ' VALUES ("'+Tanggal(dtp1.Date +1)+'","'+GetVal(dm.Q1,'kodebarang')+'","'+StrToDecimal(GetVal(dm.Q2,'hargabeli'))+'")',False);


                dm.Q3.Next;
            end;
            Inc(i);
            Lproses.Caption := IntToStr(i)+'/'+ IntToStr(dm.Q1.RecordCount);
            pb1.Position    := i;
            Application.ProcessMessages;
            dm.Q1.Next;

        end;
    end;         }









     NextKode :=GetNoAkun('302');

     ExQry(dm.Q6,'SELECT * FROM m_akunperkiraan WHERE kodeakunperkiraan="'+NextKode+'"',True);
     if dm.Q6.IsEmpty then
     ExQry(dm.Q5,'INSERT INTO m_akunperkiraan ( kodeakunperkiraan,namaakunperkiraan,akunsubmaster) VALUES ( '+
     '"'+NextKode+'" ,"LABA RUGI BULAN '+UPPERCASE(FOrmatDateTIme('mmmm',dtp1.Date))+'","302")',False);

     OpenTable(dm.Q1,['kodeakunperkiraan','namaakunperkiraan'],'m_akunperkiraan WHERE akunsubmaster REGEXP "10|20|30"');
     pb1.Max := dm.Q1.RecordCount;
     pb1.Position := 0;
     i := 1;
     Lproses1.Caption := 'Menghitung saldo akhir akun ... ';

     NoBuktiSaldo := GetCode(dm.Q5,'saldoakun','nobukti','TBK');
     while not dm.Q1.Eof do begin

          if GetVal(dm.Q1,'namaakunperkiraan') <> 'LABA RUGI BULAN '+UPPERCASE(FOrmatDateTIme('mmmm',dtp1.Date))+'' then begin

           ExQry(dm.Q2,' SELECT                                                       '+
                         '       SUM(                                                      '+
                         '         CASE                                                 '+
                         '           WHEN bb.jenisakun = "A"                            '+
                         '           THEN (s.s_awal+s.debet-s.kredit)  '+
                         '           ELSE (s.s_awal +s.kredit - s.debet)  '+
                         '         END                                                  '+
                         '      ) AS saldoakhir,                                        '+
                         ' SUM(CASE WHEN bb.jenisakun = "A" THEN IF(s.kredit > 0,- s.`nominalbkp`, s.nominalbkp ) ELSE IF(s.debet > 0,- s.`nominalbkp`, s.nominalbkp )  END  ) AS nominalbkp, '+
                         ' SUM(CASE WHEN bb.jenisakun = "A" THEN IF(s.kredit > 0,- s.`nominalnonbkp`, s.nominalnonbkp ) ELSE IF(s.debet > 0,- s.`nominalnonbkp`, s.nominalnonbkp )  END  ) AS nominalnonbkp '+
                         '     FROM                                                     '+
                         '       m_akunperkiraan ak                                     '+
                         '       LEFT JOIN saldoakun s                                  '+
                         '         ON s.`noakun` = ak.`kodeakunperkiraan`               '+
                         '       LEFT JOIN m_subbukubesar ms                            '+
                         '         ON ms.akunsubmaster = ak.`akunsubmaster`             '+
                         '       LEFT JOIN m_bukubesar bb                               '+
                         '         ON bb.`nomasterakun` = ms.`nomasterakun`             '+
                         '     WHERE MONTH(s.tgl)="'+IntTOStr(monthof(dtp1.Date))+'"  '+
                         '     AND YEAR(s.tgl)="'+IntToStr(YearOf(dtp1.Date))+'" AND '+
                         '     noakun="'+GetVal(dm.Q1,'kodeakunperkiraan')+'" '+
                         '    GROUP BY noakun',True);

            ExQry(dm.Q6,'SELECT * FROM tutupbulan WHERE tgl="'+Tanggal(dtp1.Date)+'" '+
            ' AND (noakun="'+GetVal(dm.Q1,'kodeakunperkiraan')+'"  OR '+
            ' noakun="'+'L|'+IntToStr(MonthOf(dtp1.Date))+' '+IntToStr(YearOf(dtp1.Date))+' | '+GetVal(dm.Q1,'kodeakunperkiraan')+'" )'+
            ' ',True);

            if dm.Q6.IsEmpty then begin

                  with dm.Q3 do begin
                     Close;
                     SQL.Text := ' INSERT INTO tutupbulan(tgl,noakun,nominal,nominalbkp,nominalnonbkp) VALUES '+
                                 ' (:tgl,:noakun,:nominal,:nominalbkp,:nominalnonbkp)';
                     ParamByName('tgl').AsDate      := dtp1.Date;
                     if GetVal(dm.Q1,'kodeakunperkiraan') ='302.001' then
                     ParamByName('noakun').AsString := 'L|'+IntToStr(MonthOf(dtp1.Date))+' '+IntToStr(YearOf(dtp1.Date))+' | '+GetVal(dm.Q1,'kodeakunperkiraan')
                     else
                     ParamByName('noakun').AsString := GetVal(dm.Q1,'kodeakunperkiraan');
                     ParamByName('nominal').AsFloat := GetValF(dm.Q2,'saldoakhir');
                     ParamByName('nominalbkp').AsFloat  := GetValF(dm.Q2,'nominalbkp');
                     ParamByName('nominalnonbkp').AsFloat:= GetValF(dm.Q2,'nominalnonbkp');
                     ExecSQL;
                   end;
            end else begin
               with dm.Q3 do begin
                     Close;
                     SQL.Text := ' UPDATE tutupbulan '+
                     ' SET nominal=:nominal,nominalbkp=:nominalbkp,nominalnonbkp=:nominalnonbkp '+
                     ' WHERE noakun=:noakun AND tgl=:tgl ';
                     ParamByName('tgl').AsDate      := dtp1.Date;
                     if GetVal(dm.Q1,'kodeakunperkiraan') ='302.001' then
                     ParamByName('noakun').AsString := 'L|'+IntToStr(MonthOf(dtp1.Date))+' '+IntToStr(YearOf(dtp1.Date))+' | '+GetVal(dm.Q1,'kodeakunperkiraan')
                     else
                     ParamByName('noakun').AsString := GetVal(dm.Q1,'kodeakunperkiraan');
                     ParamByName('nominal').AsFloat := GetValF(dm.Q2,'saldoakhir');
                     ParamByName('nominalbkp').AsFloat  := GetValF(dm.Q2,'nominalbkp');
                     ParamByName('nominalnonbkp').AsFloat:= GetValF(dm.Q2,'nominalnonbkp');
                     ExecSQL;
                   end;
            end;

            ExQry(dm.Q6,'SELECT s.* FROM saldoakun s '+
            ' LEFT JOIN m_akunperkiraan m ON s.noakun=m.kodeakunperkiraan '+
            ' WHERE  s.noakun="'+GetVal(dm.Q1,'kodeakunperkiraan')+'" '+
            ' AND s.tgl="'+Tanggal(dtp1.Date+1)+'" '+
            ' AND s.keterangan LIKE "%SALDO AWAL BULAN %" ',True);




            if dm.Q6.IsEmpty then begin

                 with dm.Q4 do begin

                   Close;
                   SQL.Text := ' INSERT INTO saldoakun(noakun,nobukti,keterangan,tgl,s_awal,nominalbkp,nominalnonbkp,s_akhir) '+
                               ' VALUES (:noakun,:nobukti,:keterangan,:tgl,:s_awal,:nominalbkp,:nominalnonbkp,:s_akhir)';
                   if GetVal(dm.Q1,'kodeakunperkiraan') = '302.001' then begin
                      ExQry(dm.Q5,'SELECT kodeakunperkiraan FROM m_akunperkiraan WHERE namaakunperkiraan="LABA RUGI BULAN '+UPPERCASE(FOrmatDateTIme('mmmm',dtp1.Date))+'"',True);
                      if dm.Q5.IsEmpty then
                        ParamByName('noakun').AsString     := NextKode
                      else begin
                        ExQry(dm.Q7,'DELETE FROM saldoakun where noakun="'+GetVal(dm.Q5,'kodeakunperkiraan')+'" '+
                        ' AND tgl="'+Tanggal(dtp1.Date +1)+'" ',False);
                        ParamByName('noakun').AsString     := GetVal(dm.Q5,'kodeakunperkiraan');
                        AkunLaba                           := GetVal(dm.Q5,'kodeakunperkiraan');
                      end;
                   end else
                   ParamByName('noakun').AsString         := GetVal(dm.Q1,'kodeakunperkiraan');
                   ParamByName('nobukti').AsString        := nobuktiSaldo;
                   ParamByName('keterangan').AsString     := 'SALDO AWAL BULAN "'+INTTOSTR(MonthOf(dtp1.Date)+1)+'" THN "'+INTTOSTR(YearOf(dtp1.Date))+'"';
                   ParamByName('tgl').AsDate              := dtp1.Date + 1;
                   ParamByName('s_awal').AsFloat          := GetValF(dm.Q2,'saldoakhir');
                   ParamByName('nominalbkp').AsFloat      := GetValF(dm.Q2,'nominalbkp');
                   ParamByName('nominalnonbkp').AsFloat   := GetValF(dm.Q2,'nominalnonbkp');
                   ParamByName('s_akhir').AsFloat         := GetValF(dm.Q2,'saldoakhir');
                   ExecSQL;



                 end;
            end else begin

                    if GetVal(dm.Q1,'kodeakunperkiraan') <>  'LABA RUGI BULAN '+UPPERCASE(FOrmatDateTIme('mmmm',dtp1.Date)) then begin
                    with dm.Q4 do begin

                       Close;
                       SQL.Text := ' UPDATE saldoakun SET '+
                       ' s_awal=:s_awal, '+
                       ' nominalbkp=:nominalbkp, '+
                       ' nominalnonbkp=:nominalnonbkp, '+
                       ' s_akhir=:s_akhir WHERE '+
                       ' noakun=:noakun AND tgl=:tgl AND '+
                       ' keterangan LIKE "%SALDO AWAL BULAN%" ';
                       if GetVal(dm.Q1,'kodeakunperkiraan') = '302.001' then begin
                          ExQry(dm.Q5,'SELECT kodeakunperkiraan FROM m_akunperkiraan WHERE namaakunperkiraan="LABA RUGI BULAN '+UPPERCASE(FOrmatDateTIme('mmmm',dtp1.Date))+'"',True);

                         if dm.Q5.IsEmpty then
                            ParamByName('noakun').AsString     := NextKode
                          else
                            ParamByName('noakun').AsString     := GetVal(dm.Q5,'kodeakunperkiraan');
                       end else
                       ParamByName('noakun').AsString          := GetVal(dm.Q1,'kodeakunperkiraan');
                       ParamByName('tgl').AsDate               := dtp1.Date + 1;
                       ParamByName('s_awal').AsFloat           := GetValF(dm.Q2,'saldoakhir');
                       ParamByName('nominalbkp').AsFloat       := GetValF(dm.Q2,'nominalbkp');
                       ParamByName('nominalnonbkp').AsFloat    := GetValF(dm.Q2,'nominalnonbkp');
                       ParamByName('s_akhir').AsFloat          := GetValF(dm.Q2,'saldoakhir');
                       ExecSQL;
                    end;


                  end;

          end;
     end;
       Lproses.Caption := IntToStr(i)+'/'+ IntToStr(dm.Q1.RecordCount);
       pb1.Position    := i;
       Application.ProcessMessages;
       dm.Q1.Next;
       inC(i);

     end;

     if (MonthOf(dtp1.Date) = MonthOf(EndOfTheYear(dtp1.Date))) then begin
           pb1.Max := dm.Q1.RecordCount;
         pb1.Position := 0;
         i := 1;
         Lproses1.Caption := 'Menghitung saldo akhir akun ... ';


         NextKode := GetNoAkun('303');

         ExQry(dm.Q4,'SELECT * FROM m_akunperkiraan WHERE kodeakunperkiraan="'+NextKode+'" ',True);
         if dm.Q4.IsEmpty then

         ExQry(dm.Q5,'INSERT INTO m_akunperkiraan ( kodeakunperkiraan,namaakunperkiraan,akunsubmaster) VALUES ( '+
         '"'+NextKode+'" ,"LABA RUGI THN. '+UPPERCASE(FOrmatDateTIme('yyyy',dtp1.Date))+'","303")',FAlse);

           ExQry(dm.Q2,' SELECT                                                       '+
                       '       SUM(nominal) as totallabarugi,SUM(nominalbkp) as totalnominalbkp,SUM(nominalnonbkp) as totalnominalnonbkp '+
                       '     FROM                                                     '+
                       '     tutupbulan                                               '+
                       '     WHERE noakun LIKE "%L%" '+
                       '     AND YEAR(tgl)="'+IntToStr(YearOf(dtp1.Date))+'"           ',True);


           ExQry(dm.Q6,'SELECT * FROM tutuptahun WHERE tgl="'+Tanggal(dtp1.Date)+'" '+
           ' AND noakun="'+NextKode+'" ',True);

           if dm.Q6.IsEmpty then begin

               with dm.Q4 do begin
                 Close;
                 SQL.Text := ' INSERT INTO tutuptahun(thn,noakun,nominal,nominalbkp,nominalnonbkp) VALUES '+
                             ' (:tgl,:noakun,:nominal,:nominalbkp,:nominalnonbkp)';
                 ParamByName('tgl').AsDate      := dtp1.Date;
                 ParamByName('noakun').AsString := NextKode;
                 ParamByName('nominal').AsFloat := GetValF(dm.Q2,'totallabarugi');
                 ParamByName('nominalbkp').AsFloat  := GetValF(dm.Q2,'totalnominalbkp');
                 ParamByName('nominalnonbkp').AsFloat:= GetValF(dm.Q2,'totalnominalnonbkp');
                 ExecSQL;
               end;
           end else begin
               with dm.Q4 do begin
                 Close;
                 SQL.Text := ' UPDATE tutuptahun '+
                 ' SET nominal=:nominal,nominalbkp=:nominalbkp,nominalnonbkp=:nominalnonbkp '+
                 ' WHERE thn=:tgl AND noakun=:noakun ';
                 ParamByName('tgl').AsDate      := dtp1.Date;
                 ParamByName('noakun').AsString := NextKode;
                 ParamByName('nominal').AsFloat := GetValF(dm.Q2,'totallabarugi');
                 ParamByName('nominalbkp').AsFloat  := GetValF(dm.Q2,'totalnominalbkp');
                 ParamByName('nominalnonbkp').AsFloat:= GetValF(dm.Q2,'totalnominalnonbkp');
                 ExecSQL;
               end;
           end;

           ExQry(dm.Q6,'SELECT * FROM saldoakun WHERE tgl="'+Tanggal(dtp1.Date + 1)+'" '+
           ' AND noakun="'+NextKode+'" ',True);

           if dm.Q6.IsEmpty then begin

               with dm.Q5 do begin
                 Close;
                 SQL.Text := ' INSERT INTO saldoakun(noakun,nobukti,keterangan,tgl,s_awal,nominalbkp,nominalnonbkp,s_akhir) '+
                             ' VALUES (:noakun,:nobukti,:keterangan,:tgl,:s_awal,:nominalbkp,:nominalnonbkp,:s_akhir)';
                 ParamByName('noakun').AsString     := NextKode;
                 ParamByName('nobukti').AsString    := NoBuktiSaldo;
                 ParamByName('keterangan').AsString := 'SALDO AWAL TAHUN "'+INTTOSTR(YearOf(dtp1.Date)+1)+'"';
                 ParamByName('tgl').AsDate          := dtp1.Date + 1;
                 ParamByName('s_awal').AsFloat      := GetValF(dm.Q2,'totallabarugi');
                 ParamByName('s_akhir').AsFloat     := GetValF(dm.Q2,'totallabarugi');
                 ParamByName('nominalbkp').AsFloat  := GetValF(dm.Q2,'totalnominalbkp');
                 ParamByName('nominalnonbkp').AsFloat:= GetValF(dm.Q2,'totalnominalnonbkp');
                 ExecSQL;

               end;
           end else begin
              with dm.Q5 do begin
                 Close;
                 SQL.Text := ' UPDATE saldoakun '+
                 ' SET s_awal=:s_awal,nominalbkp=:nominalbkp,'+
                 ' nominalnonbkp=:nominalnonbkp,'+
                 ' s_akhir=:s_akhir WHERE '+
                 ' noakun=:noakun AND keterangan=:keterangan '+
                 ' AND tgl=:tgl ';
                 ParamByName('noakun').AsString     := NextKode;
                 ParamByName('keterangan').AsString := 'SALDO AWAL TAHUN "'+INTTOSTR(YearOf(dtp1.Date)+1)+'"';
                 ParamByName('tgl').AsDate          := dtp1.Date + 1;
                 ParamByName('s_awal').AsFloat      := GetValF(dm.Q2,'totallabarugi');
                 ParamByName('s_akhir').AsFloat     := GetValF(dm.Q2,'totallabarugi');
                 ParamByName('nominalbkp').AsFloat  := GetValF(dm.Q2,'totalnominalbkp');
                 ParamByName('nominalnonbkp').AsFloat:= GetValF(dm.Q2,'totalnominalnonbkp');
                 ExecSQL;

               end;
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


     btn1.Enabled := False;
end;

procedure TFtutupBUku.btn1Click(Sender: TObject);

begin
      if isAuto = False then begin
        MessageBox(Handle,' PERINGATAN !!!, SEBELUM MELAKUKAN PROSES TUTUP BUKU '+#13+
               ' HARAP PERIKSA TERLEBIH DAHULU LAPORAN LABA RUGI DAN NERACA '+#13+
               ' APAKAH SUDAH BENAR','Warning',MB_ICONWARNING);

        if MessageDlg('Lanjutkan Proses Tutup Buku ??',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        begin
          RunUpdate;
        end;
      end else
         RunUpdate;

end;

procedure TFtutupBUku.btn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFtutupBUku.dtp1CloseUp(Sender: TObject);
begin
if DayOf(dtp1.Date) <> DayOf(EndOfTheMonth(dtp1.Date)) then begin

    MessageBox(Handle,'Tanggal tutup buku harus di akkhir bulan','Warning',MB_ICONERROR);
    Exit;
    btn1.Enabled := False;
  end else begin

      btn1.Enabled := True;

  end;
end;

procedure TFtutupBUku.FormActivate(Sender: TObject);
begin
  if isAuto = True then
     btn1.Click;
end;

end.
