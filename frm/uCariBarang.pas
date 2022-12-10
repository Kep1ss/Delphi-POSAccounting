unit uCariBarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMetropolis,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxGroupBox,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit, uComCtrl, uctrlFrm, udm,
  uEngine, uOvEdit, dxSkiniMaginary, cxCurrencyEdit, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful,System.DateUtils, cxCalc, dxSkinMoneyTwins,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolisDark, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, DBAccess, MyAccess, MemDS, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFcariBarang = class(TForm)
    G1: TcxGroupBox;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    Label1: TLabel;
    EPencarian: TcxTextEdit;
    G2: TcxGroupBox;
    btnTutup: TcxButton;
    btnBaru: TcxButton;
    cxgGrid1DBTableView1namabarang: TcxGridDBColumn;
    cxgGrid1DBTableView1hargaecer: TcxGridDBColumn;
    cStok: TcxGridDBColumn;
    chargabeli: TcxGridDBColumn;
    QsatuanHarga: TMyQuery;
    DMultiSatuan: TMyDataSource;
    Label2: TLabel;
    cxGroupBox1: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxgrdbclmnGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1satuan: TcxGridDBColumn;
    cxGrid1DBTableView1isi: TcxGridDBColumn;
    cHargaBeli2: TcxGridDBColumn;
    cxGrid1DBTableView1harga: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxg1: TcxGrid;
    GhargaPromo: TcxGridTableView;
    GhargaPromoColumn1: TcxGridColumn;
    GhargaPromoColumn2: TcxGridColumn;
    GhargaPromoColumn3: TcxGridColumn;
    cxgL: TcxGridLevel;
    cxgGrid1DBTableView1kodebarcode: TcxGridDBColumn;
    bkp: TcxGridDBColumn;
    procedure btnTutupClick(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
    procedure cxgGrid1DBTableView1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxgGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EPencarianKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxgrdbclmnGrid1DBTableView1Column1GetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
    procedure cxgGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxgGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
  public
    isFormTransaksi : Integer;
    const

    _SQLCaribarang =' SELECT                '+
                   '   b.idbarang,          '+
                   '   b.kodebarang,        '+
                   '   b.kodebarcode,       '+
                   '   b.namabarang,        '+
                   '   k.idkategori,        '+
                   '   k.namakategori,      '+
                   '   m.satuan,            '+
                   '   m.harga,            '+
                   '   b.satuanjual,        '+
                   '   b.satuanbeli,        '+
                   '   b.minimalorder,        '+
                   '   b.isi,               '+
                   '   b.stokmin,           '+
                   '   b.stokmax,           '+
                   '   b.hargabeli,         '+
                   '   b.margin,            '+
                   '   b.hargaecer,             '+
                   '   m.hargagrosir,       '+
                   '   m.hargapartai,       '+
                   '   m.hargapartai4,       '+
                   '   m.hargapartai5,       '+
                   '   b.diskonpersen,      '+
                   '   b.diskonrupiah,      '+
                   '   b.hargapromo,      '+
                   '   b.tglawal,      '+
                   '   b.tglakhir,      '+
                   '   b.hargapromo2,      '+
                   '   b.tglawal2,      '+
                   '   b.tglakhir2,      '+
                   '   b.hargapromo3,      '+
                   '   b.tglawal3,      '+
                   '   b.tglakhir3,      '+
                   '   b.ppn,                '+
                   '   b.bkp,                '+
                   '   b.stok as STOK,       '+
                   '   h.hargabeli as hargarata                '+
                   ' FROM                   '+
                   '   barang b             '+
                   '   LEFT JOIN kategori k '+
                   '     ON b.`idkategori` = k.idkategori '+
                   '   LEFT JOIN multisatuan m '+
                   '    ON m.kodebarang=b.kodebarang '+
                   '   LEFT JOIN hargabelirata h ON h.kodebarang=b.kodebarang';

    { Public declarations }
  end;


var
  FcariBarang: TFcariBarang;

implementation

{$R *.dfm}

uses  UinputDatabarang,uPembelian, uPenjualan, uMutasiBarang, UPOPembelian,
  uSalesOrder, uReturBeliNew, uReturPenjualannew, uMainMenu, uSuratJalan,
  uPemakainBarang, uPoPenjualan, uRedemPoin, uPoPembelianBarangBaru;

procedure TFcariBarang.btnBaruClick(Sender: TObject);
begin
  if not Assigned(FinputBarang) then
  Application.CreateForm(TFinputBarang, FinputBarang);
  Finputbarang.Show;
  FinputBarang.TampilanAwal;
end;

procedure TFcariBarang.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFcariBarang.cxgGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
      if (AViewInfo.GridRecord.Values[bkp.Index] = True) then
     ACanvas.Brush.Color := $0042D263;
end;

procedure TFcariBarang.cxgGrid1DBTableView1DblClick(Sender: TObject);
var
 pas : Integer;
 hrg , ppn: Real;
 isiBeli,isijual : Real;

 jml :Real;
 SisaStok : Real;

 persen1,persen2,persen3 : Real;
 HargaJual1,hargajual2,hargajual3 : real;
 laba1,laba2,laba3 : real;
begin


  case isFormTransaksi of
  0: begin
          With FpembelianBarang,dm do
          begin
              ExQry(dm.QBarang,_SQLCaribarang+' WHERE b.kodebarang="'+GetVal(dm.Qcaribarang,'kodebarang')+'"',True);

              sg1.Cells[0,sg1.Row] := IntToStr(sg1.Row);
              sg1.Cells[1,sg1.Row] := GetVal(dm.QBarang,'kodebarcode');
              sg1.Cells[19,sg1.Row] := GetVal(dm.QBarang,'kodebarang');
              sg1.Cells[2,sg1.Row] := GetVal(dm.QBarang,'namabarang');
              isiBeli              := CariIsi(GetVal(dm.QBarang,'kodebarang'),GetVal(QSatuanHarga,'satuan'));
              hrg                  := GetValF(dm.QBarang,'hargabeli');
              sg1.Cells[3,sg1.Row] := GetVal(dm.QBarang,'satuanjual');
              sg1.Cells[4,sg1.Row] := '1';
              sg1.Cells[5,sg1.Row] := FloatTostr(hrg);
              if hrg > 0 then begin

                  HargaJual1 := GetValF(dm.QBarang,'harga');
                  HargaJual2 := GetValF(dm.QBarang,'hargagrosir');
                  hargajual3 := GetValF(dm.QBarang,'hargapartai');

                  laba1 := hargajual1 - hrg;
                  laba2 := hargajual2 - hrg;
                  laba3 := hargajual3 - hrg;


                  persen1 := (laba1 / hrg) * 100;
                  persen2 := (laba2 / hrg) * 100;
                  persen3 := (laba3 / hrg) * 100;

                  if HargaJual1 > 0 then
                  sg1.Cells[8,sg1.Row] := Format('%.2n',[persen1]);
                  sg1.Cells[9,sg1.Row] := GetVal(dm.QBarang,'harga');
                  if HargaJual2 > 0 then
                  sg1.Cells[10,sg1.Row] := Format('%.2n',[persen2]);
                  sg1.Cells[11,sg1.Row] := GetVal(dm.QBarang,'hargagrosir');
                  if HargaJual3 > 0 then
                  sg1.Cells[12,sg1.Row]:= Format('%.2n',[persen3]);
                  sg1.Cells[13,sg1.Row]:= GetVal(dm.QBarang,'hargapartai');


                  sg1.Cells[14,sg1.Row] := '';
                  sg1.Cells[15,sg1.Row] := '';
                  sg1.Cells[16,sg1.Row] := '';
              end;

              pas    := Posisi(UPPERCASE(GetVal(Qbarang,'kodebarang')),UPPERCASE(GetVal(QSatuanHarga,'satuan')));

             if (pas <> 0) and (pas <> sg1.Row) then begin

                 sg1.Cells[4,pas]  := FloatToStr(StrToFloatDef(sg1.Cells[4,pas],0)+1);

                 HitungSubtotal(pas);

              if  sg1.Cells[1,sg1.Row +1] <>'' then begin
                  BersihCell;
                  ReplaceData;
                  sg1.RowCount    := sg1.RowCount -1;
                  Focus;
                end else
                if (sg1.Row = sg1.RowCount -2) and (sg1.Cells[1,sg1.RowCount -1]='')  then begin
                  BersihCell;
                  sg1.RowCount    := sg1.RowCount -1;
                  Focus;
                end else
                if sg1.Cells[1,sg1.Row]=sg1.Cells[1,sg1.RowCount -1] then
                  BersihCell;

               Focus;
            end else
            begin
              HitungSubtotal(sg1.Row);

              if sg1.Cells[1,sg1.RowCount-1 ] <>'' then
              sg1.RowCount := sg1.RowCount + 1;

              Focus;
            end;
            HitungTotal;
          end;
        Close;
      end;
  1: begin
       With FpenjualanBarang,dm do
          begin
            ExQry(dm.QBarang,_SQLCaribarang+' WHERE b.kodebarang="'+GetVal(dm.Qcaribarang,'kodebarang')+'"',True);
            if (GetValF(dm.Qcaribarang,'stok') < GetValF(QsatuanHarga,'isi')) and (not isMinus) then begin

              Error('STOK TIDAK MENCUKUPI !!, SILAHKAN MELAKUKAN PEMBELIAN');
              Exit;
            end else
            begin
                QsatuanHarga.RecNo := 1;
                if GetVal(Qbarang,'kodebarang') <> '' then begin

                  sg1.Cells[0,sg1.Row] := IntToStr(sg1.Row);
                  sg1.Cells[10,sg1.Row] := GetVal(Qbarang,'kodebarang');
                  sg1.Cells[11,sg1.Row] := GetVal(Qbarang,'hargarata');
                  sg1.Cells[12,sg1.Row] := GetVal(Qbarang,'namakategori');
                  sg1.Cells[13,sg1.Row] := GetVal(Qbarang,'bkp');
                  sg1.Cells[1,sg1.Row] := GetVal(Qbarang,'kodebarcode');
                  sg1.Cells[2,sg1.Row] := GetVal(Qbarang,'namabarang');
                  isijual              := GetValF(QsatuanHarga,'isi');
                  hrg                  := GetHarga(GetVal(QBarang,'kodebarang'),GetVal(QsatuanHarga,'satuan'));
                  sg1.Cells[3,sg1.Row] := Format('%.2n',[hrg]);
                  sg1.Cells[4,sg1.Row] := '1';
                  sg1.Cells[5,sg1.Row] := '';
                  sg1.Cells[6,sg1.Row] :=  '';
                  sg1.Cells[7,sg1.Row] := GetVal(QsatuanHarga,'satuan');
                  pas    := Posisi(UPPERCASE(GetVal(Qbarang,'kodebarang')),UPPERCASE(GetVal(QsatuanHarga,'satuan')));

                if (pas <> 0) and (pas <> sg1.Row) then begin
                     //  isijual           := CariIsi(GetVal(Qbarang,'kodebarcode'),GetVal(Qbarang,'satuanjual'));
                       sg1.Cells[4,pas]  := FloatToStr(StrToFloatDef(sg1.Cells[4,pas],0)+1);

                       HitungSubtotal(pas);
                       sg1.Cells[9,pas] := FloatTOStr(isijual * StrToFloatDef(koma(sg1.Cells[4,pas]),0));

                    if  sg1.Cells[1,sg1.Row +1] <>'' then begin
                        BersihCell;
                        ReplaceData;
                        sg1.RowCount    := sg1.RowCount -1;
                        Focus;
                    end else
                    if (sg1.Row = sg1.RowCount -2) and (sg1.Cells[1,sg1.RowCount -1]='')  then begin
                        BersihCell;
                        sg1.RowCount    := sg1.RowCount -1;
                        Focus;
                    end else
                      if sg1.Cells[1,sg1.Row]=sg1.Cells[1,sg1.RowCount -1] then
                        BersihCell;

                     Focus;
                end else
                begin
                  HitungSubtotal(sg1.Row);

                  if sg1.Cells[1,sg1.RowCount-1 ] <>'' then
                  sg1.RowCount := sg1.RowCount + 1;

                  Focus;
                end;
              end;
              HitungTotal;
            end;
          end;
            Close;

      end;
  2: begin
       with FMutasiBarang do begin
         ExQry(dm.QBarang,_SQLCaribarang+' WHERE b.kodebarang="'+GetVal(dm.Qcaribarang,'kodebarang')+'"',True);
         if (cbGudangAwal.ItemIndex = -1) or (cbGudangAKir.ItemIndex = -1) then Error('Silahkan tentukan gudang') else
         begin
          if GetValF(dm.Qcaribarang,'stok') < 1 then begin

              Error('STOK TIDAK MENCUKUPI !!, SILAHKAN MELAKUKAN PEMBELIAN');
              Exit;
            end else begin
              pas   := CheckItem(GetVal(dm.QBarang,'kodebarang'));
              ExQry(dm.Q1,'select SUM(saldoawal+masuk-keluar) as saldoakhir from kartustok WHERE '+
              ' kodebarang="'+GetVal(dm.QBarang,'kodebarang')+'" '+
              ' AND Month(tgl)="'+IntToStr(MonthOf(now))+'" AND YEAR(tgl)="'+IntToStr(YearOf(Now))+'" '+
              ' AND idgudang="'+GetIdcmb(cbGudangAwal)+'" ',True);
              SisaStok := GetValF(dm.Q1,'saldoakhir');
               with cgtKodeBarang.DataController do begin
                 if  pas > 0 then begin
                   Jml                          := StrToFloatDef(VarToStr(Values[pas-1,4]),0);
                   Values[pas -1,4]             := FloatToStr( Jml + 1 );

                   Values[pas -1,5]             := FloatToStr(GetValF(dm.Qbarang,'isi') * jml);

                   cxg1.SetFocus;
                   cgtKodeBarang.Controller.FocusedColumnIndex :=0;
                 end else
                 begin
                    if GetVal(dm.Qbarang,'kodebarang') <>'' then begin

                     Values[FocusedRecordIndex,0] := GetVal(dm.Qbarang,'kodebarang');
                     Values[FocusedRecordIndex,1] := GetVal(dm.Qbarang,'namabarang');
                     Values[FocusedRecordIndex,2] := GetVal(dm.Qbarang,'satuanjual');
                     Values[FocusedRecordIndex,3] := FloatToStr(SisaStok);
                     Values[FocusedRecordIndex,4] := '1';
                     if GetValf(dm.Qbarang,'isi') = 0 then
                     Values[FocusedRecordIndex,5] := 1 else
                     Values[FocusedRecordIndex,5] := GetVal(dm.Qbarang,'isi');
                    cxg1.SetFocus;

                    cgtKodeBarang.Controller.FocusedColumnIndex :=4;
                    end;
                  end;
               end;
            end;
          end;
       end;
       Close;
     end;
  3 : begin
        ExQry(dm.QBarang,_SQLCaribarang+' WHERE b.kodebarang="'+GetVal(dm.Qcaribarang,'kodebarang')+'"',True);
          with FpoPembelianBarang,dm do begin

              sg1.Cells[0,sg1.Row] := IntToStr(sg1.Row);
              sg1.Cells[1,sg1.Row] := GetVal(dm.QBarang,'kodebarcode');
              sg1.Cells[14,sg1.Row] := GetVal(dm.QBarang,'kodebarang');
              sg1.Cells[2,sg1.Row] := GetVal(dm.QBarang,'namabarang');
              isiBeli              := CariIsi(GetVal(dm.QBarang,'kodebarcode'),GetVal(dm.QBarang,'satuanbeli'));
              hrg                  := GetValF(dm.QBarang,'hargabeli') * isiBeli;
              sg1.Cells[3,sg1.Row] := GetVal(dm.QBarang,'satuanbeli');
              sg1.Cells[4,sg1.Row] := GetVal(dm.QBarang,'stok');
              sg1.Cells[5,sg1.Row] := GetVal(dm.QBarang,'minimalorder');
              sg1.Cells[6,sg1.Row] := FloatTostr(hrg);
              sg1.Cells[7,sg1.Row] := GetVal(dm.QBarang,'ppn');

              if GetValF(dm.QBarang,'ppn') > 0 then
              ppn                  := GetValF(dm.QBarang,'hargabeli') * GetValF(dm.QBarang,'ppn') / 100;

              sg1.Cells[8,sg1.Row] := Format('%.2n',[getValf(dm.QBarang,'hargabeli')+ppn]);

              pas    := Posisi(UPPERCASE(GetVal(Qbarang,'kodebarcode')),UPPERCASE(GetVal(Qbarang,'satuanbeli')));

             if (pas <> 0) and (pas <> sg1.Row) then begin

                 sg1.Cells[5,pas]  := FloatToStr(StrToFloatDef(sg1.Cells[5,pas],0)+1);

                 HitungSubtotal(pas);

              if  sg1.Cells[1,sg1.Row +1] <>'' then begin
                  BersihCell;
                  ReplaceData;
                  sg1.RowCount    := sg1.RowCount -1;
                  Focus;
                end else
                if (sg1.Row = sg1.RowCount -2) and (sg1.Cells[1,sg1.RowCount -1]='')  then begin
                  BersihCell;
                  sg1.RowCount    := sg1.RowCount -1;
                  Focus;
                end else
                if sg1.Cells[1,sg1.Row]=sg1.Cells[1,sg1.RowCount -1] then
                  BersihCell;

               Focus;
            end else
            begin
              HitungSubtotal(sg1.Row);

              if sg1.Cells[1,sg1.RowCount-1 ] <>'' then
              sg1.RowCount := sg1.RowCount + 1;

              Focus;
            end;
            HitungTotal;
        end;
        Close;
      end;
  4 : begin
        ExQry(dm.QBarang,_SQLCaribarang+' WHERE b.kodebarang="'+GetVal(dm.Qcaribarang,'kodebarang')+'"',True);
        With FsalesORder,dm do
          begin
             pas    := Posisi(UPPERCASE(GetVal(Qbarang,'kodebarcode')));

             if (pas <> 0) and (pas <> sg1.Row) then begin
                 sg1.Cells[4,pas]  := FloatToStr(StrToFloatDef(sg1.Cells[4,pas],0)+1);

                 HitungSubtotal(pas);

              if  sg1.Cells[1,sg1.Row +1] <>'' then begin
                  BersihCell;
                  ReplaceData;
                  sg1.RowCount    := sg1.RowCount -1;
                  Focus;
                end else
                if (sg1.Row = sg1.RowCount -2) and (sg1.Cells[1,sg1.RowCount -1]='')  then begin
                  BersihCell;
                  sg1.RowCount    := sg1.RowCount -1;
                  Focus;
                end else
                if sg1.Cells[1,sg1.Row]=sg1.Cells[1,sg1.RowCount -1] then
                  BersihCell;

               Focus;
            end else
            begin
              if GetVal(Qbarang,'kodebarcode') <> '' then begin

                sg1.Cells[0,sg1.Row] := IntToStr(sg1.Row);
                sg1.Cells[1,sg1.Row] := GetVal(Qbarang,'kodebarcode');
                sg1.Cells[2,sg1.Row] := GetVal(Qbarang,'namabarang');
                sg1.Cells[3,sg1.Row] := GetVal(Qbarang,'satuanjual');
                sg1.Cells[4,sg1.Row] := '1';
                HitungSubtotal(sg1.Row);


                if sg1.Cells[1,sg1.RowCount-1 ] <>'' then
                sg1.RowCount := sg1.RowCount + 1;

                Focus;
              end;
            end;
          end;
        Close;
      end;
    5: begin
          ExQry(dm.QBarang,_SQLCaribarang+' WHERE b.kodebarang="'+GetVal(dm.Qcaribarang,'kodebarang')+'"',True);
          With Freturbelinew,dm do

          begin

               pas    := Posisi(UPPERCASE(GetVal(Qbarang,'kodebarcode')));

               if (pas <> 0) and (pas <> sg1.Row) then begin
                   isiBeli           := GetValF(Qbarang,'isi');

                   sg1.Cells[8,pas]  := FloatToStr(StrToFloatDef(sg1.Cells[8,pas],0)+1);

                   HitungSubtotal(pas);
                   sg1.Cells[10,pas] := FloatTOStr(isibeli * StrToFloatDef(koma(sg1.Cells[8,pas]),0));

                if  sg1.Cells[1,sg1.Row +1] <>'' then begin
                    BersihCell;
                    ReplaceData;
                    sg1.RowCount    := sg1.RowCount -1;
                    Focus;
                  end else
                  if (sg1.Row = sg1.RowCount -2) and (sg1.Cells[1,sg1.RowCount -1]='')  then begin
                    BersihCell;
                    sg1.RowCount    := sg1.RowCount -1;
                    Focus;
                  end else
                  if sg1.Cells[1,sg1.Row]=sg1.Cells[1,sg1.RowCount -1] then
                    BersihCell;

                 Focus;
              end else
              begin

                sg1.Cells[0,sg1.Row] := IntToStr(sg1.Row);
                sg1.Cells[1,sg1.Row] := GetVal(Qbarang,'kodebarcode');
                sg1.Cells[2,sg1.Row] := GetVal(Qbarang,'namabarang');
                sg1.Cells[3,sg1.Row] := GetVal(Qbarang,'satuanjual');
       //         isiBeli              := GetValF(Qbarang,'isi');
                hrg                  := GetValF(Qbarang,'hargabeli');
                sg1.Cells[4,sg1.Row] := GetRupiah(FloatTostr(hrg));
                sg1.Cells[5,sg1.Row] := '';

                sg1.Cells[6,sg1.Row] := '';
                sg1.Cells[7,sg1.Row] := '';

                sg1.Cells[8,sg1.Row] := '1';
                HitungSubtotal(sg1.Row);
                sg1.Cells[10,sg1.Row]:= '1';


                if sg1.Cells[1,sg1.RowCount-1 ] <>'' then
                sg1.RowCount := sg1.RowCount + 1;

                Focus;
              end;
              HitungTotal;

          end;
        Close;
      end;
    6: begin
      ExQry(dm.QBarang,_SQLCaribarang+' WHERE b.kodebarang="'+GetVal(dm.Qcaribarang,'kodebarang')+'"',True);
       With FreturJualNew,dm do
          begin
             pas    := Posisi(UPPERCASE(GetVal(Qbarang,'kodebarcode')));

             if (pas <> 0) and (pas <> sg1.Row) then begin
               //  isijual           := CariIsi(GetVal(Qbarang,'kodebarcode'),GetVal(Qbarang,'satuanjual'));
                 sg1.Cells[8,pas]  := FloatToStr(StrToFloatDef(sg1.Cells[8,pas],0)+1);

                 HitungSubtotal(pas);
               //  sg1.Cells[9,pas] := FloatTOStr(isibeli * StrToFloatDef(koma(sg1.Cells[7,pas]),0));

              if  sg1.Cells[1,sg1.Row +1] <>'' then begin
                  BersihCell;
                  ReplaceData;
                  sg1.RowCount    := sg1.RowCount -1;
                  Focus;
                end else
                if (sg1.Row = sg1.RowCount -2) and (sg1.Cells[1,sg1.RowCount -1]='')  then begin
                  BersihCell;
                  sg1.RowCount    := sg1.RowCount -1;
                  Focus;
                end else
                if sg1.Cells[1,sg1.Row]=sg1.Cells[1,sg1.RowCount -1] then
                  BersihCell;

               Focus;
            end else
            begin
              if GetVal(Qbarang,'kodebarcode') <> '' then begin

                sg1.Cells[0,sg1.Row] := IntToStr(sg1.Row);
                sg1.Cells[1,sg1.Row] := GetVal(Qbarang,'kodebarcode');
                sg1.Cells[2,sg1.Row] := GetVal(Qbarang,'namabarang');
              //  isijual              := CariIsi(GetVal(Qbarang,'kodebarcode'),GetVal(Qbarang,'satuanjual'));
                hrg                  := GetValF(Qbarang,'hargaecer');
                sg1.Cells[3,sg1.Row] := GetRupiah(FloatTostr(hrg));
                sg1.Cells[4,sg1.Row] := '';
                sg1.Cells[5,sg1.Row] := '';
                sg1.Cells[6,sg1.Row] := '';
                sg1.Cells[7,sg1.Row] := GetVal(Qbarang,'satuanjual');
                sg1.Cells[8,sg1.Row] := '1';
                HitungSubtotal(sg1.Row);
              //  sg1.Cells[9,sg1.Row]:= FLoatToStr(isijual);


                if sg1.Cells[1,sg1.RowCount-1 ] <>'' then
                sg1.RowCount := sg1.RowCount + 1;

                Focus;
              end;
            end;
            HitungTotal;
          end;
        Close;
      end;
    7: begin
       ExQry(dm.QBarang,_SQLCaribarang+' WHERE b.kodebarang="'+GetVal(dm.Qcaribarang,'kodebarang')+'"',True);
       With FSuratJalan,dm do

          begin
             pas    := Posisi(UPPERCASE(GetVal(Qbarang,'kodebarcode')));

             if (pas <> 0) and (pas <> sg1.Row) then begin
               //  isijual           := CariIsi(GetVal(Qbarang,'kodebarcode'),GetVal(Qbarang,'satuanjual'));
                 sg1.Cells[4,pas]  := FloatToStr(StrToFloatDef(sg1.Cells[4,pas],0)+1);


              if  sg1.Cells[1,sg1.Row +1] <>'' then begin
                  BersihCell;
                  ReplaceData;
                  sg1.RowCount    := sg1.RowCount -1;
                  Focus;
                end else
                if (sg1.Row = sg1.RowCount -2) and (sg1.Cells[1,sg1.RowCount -1]='')  then begin
                  BersihCell;
                  sg1.RowCount    := sg1.RowCount -1;
                  Focus;
                end else
                if sg1.Cells[1,sg1.Row]=sg1.Cells[1,sg1.RowCount -1] then
                  BersihCell;

               Focus;
            end else
            begin
              if GetVal(Qbarang,'kodebarcode') <> '' then begin

                sg1.Cells[0,sg1.Row] := IntToStr(sg1.Row);
                sg1.Cells[1,sg1.Row] := GetVal(Qbarang,'kodebarcode');
                sg1.Cells[2,sg1.Row] := GetVal(Qbarang,'namabarang');
                sg1.Cells[3,sg1.Row] := GetVal(Qbarang,'satuanjual');
                sg1.Cells[4,sg1.Row] := '1';

                if sg1.Cells[1,sg1.RowCount-1 ] <>'' then
                sg1.RowCount := sg1.RowCount + 1;

                Focus;
              end;
            end;

          end;
        Close;
      end;
    8: begin
       ExQry(dm.QBarang,_SQLCaribarang+' WHERE b.kodebarang="'+GetVal(dm.Qcaribarang,'kodebarang')+'"',True);
       With FpemakainBarang,dm do
          begin
            if GetValF(dm.Qcaribarang,'stok') < 1 then begin

              Error('STOK TIDAK MENCUKUPI !!, SILAHKAN MELAKUKAN PEMBELIAN');
              Exit;
            end else
            begin

                if GetVal(Qbarang,'kodebarcode') <> '' then begin



                  sg1.Cells[0,sg1.Row] := IntToStr(sg1.Row);
                  sg1.Cells[8,sg1.Row] := GetVal(Qbarang,'kodebarang');
                  sg1.Cells[1,sg1.Row] := GetVal(Qbarang,'kodebarcode');
                  sg1.Cells[2,sg1.Row] := GetVal(Qbarang,'namabarang');
                  isijual              := CariIsi(GetVal(Qbarang,'kodebarcode'),GetVal(Qbarang,'satuanjual'));
                  sg1.Cells[3,sg1.Row] := GetValR(Qbarang,'hargabeli');
                  sg1.Cells[4,sg1.Row] := GetVal(Qbarang,'satuanjual');
                  sg1.Cells[5,sg1.Row] := '1';
                  sg1.Cells[6,sg1.Row] := GetValR(Qbarang,'hargabeli');
                  sg1.Cells[7,sg1.Row] := FloatToStr(isijual);
                  pas    := Posisi(UPPERCASE(GetVal(Qbarang,'kodebarcode')),UPPERCASE(GetVal(Qbarang,'satuanjual')));

                if (pas <> 0) and (pas <> sg1.Row) then begin
                     //  isijual           := CariIsi(GetVal(Qbarang,'kodebarcode'),GetVal(Qbarang,'satuanjual'));
                       sg1.Cells[5,pas]  := FloatToStr(StrToFloatDef(sg1.Cells[5,pas],0)+1);

                       HitungSubtotal(pas);
                       sg1.Cells[7,pas] := FloatTOStr(isijual * StrToFloatDef(koma(sg1.Cells[5,pas]),0));

                    if  sg1.Cells[1,sg1.Row +1] <>'' then begin
                        BersihCell;
                        ReplaceData;
                        sg1.RowCount    := sg1.RowCount -1;
                        Focus;
                    end else
                    if (sg1.Row = sg1.RowCount -2) and (sg1.Cells[1,sg1.RowCount -1]='')  then begin
                        BersihCell;
                        sg1.RowCount    := sg1.RowCount -1;
                        Focus;
                    end else
                      if sg1.Cells[1,sg1.Row]=sg1.Cells[1,sg1.RowCount -1] then
                        BersihCell;

                     Focus;
                end else
                begin
                  HitungSubtotal(sg1.Row);

                  if sg1.Cells[1,sg1.RowCount-1 ] <>'' then
                  sg1.RowCount := sg1.RowCount + 1;

                  Focus;
                end;
              end;
              HitungTotal;
            end;
          end;
            Close;

      end;
    9: begin
       ExQry(dm.QBarang,_SQLCaribarang+' WHERE b.kodebarang="'+GetVal(dm.Qcaribarang,'kodebarang')+'"',True);
       With FpoPenjualan,dm do
          begin

                if GetVal(Qbarang,'kodebarcode') <> '' then begin

                  sg1.Cells[0,sg1.Row] := IntToStr(sg1.Row);
                  sg1.Cells[10,sg1.Row] := GetVal(Qbarang,'kodebarang');
                  sg1.Cells[1,sg1.Row] := GetVal(Qbarang,'kodebarcode');
                  sg1.Cells[2,sg1.Row] := GetVal(Qbarang,'namabarang');
                  isijual              := CariIsi(GetVal(Qbarang,'kodebarcode'),GetVal(Qbarang,'satuanjual'));

                  sg1.Cells[3,sg1.Row] := GetValR(Qbarang,'hargaecer');
                  sg1.Cells[4,sg1.Row] := '';
                  sg1.Cells[5,sg1.Row] := '';
                  sg1.Cells[6,sg1.Row] := GetVal(Qbarang,'satuanjual');
                  sg1.Cells[7,sg1.Row] := '1';
                  pas    := Posisi(UPPERCASE(GetVal(Qbarang,'kodebarcode')),UPPERCASE(GetVal(Qbarang,'satuanjual')));

                if (pas <> 0) and (pas <> sg1.Row) then begin
                     //  isijual           := CariIsi(GetVal(Qbarang,'kodebarcode'),GetVal(Qbarang,'satuanjual'));
                       sg1.Cells[7,pas]  := FloatToStr(StrToFloatDef(sg1.Cells[7,pas],0)+1);

                       HitungSubtotal(pas);
                       sg1.Cells[9,pas] := FloatTOStr(isijual * StrToFloatDef(koma(sg1.Cells[7,pas]),0));

                    if  sg1.Cells[1,sg1.Row +1] <>'' then begin
                        BersihCell;
                        ReplaceData;
                        sg1.RowCount    := sg1.RowCount -1;
                        Focus;
                    end else
                    if (sg1.Row = sg1.RowCount -2) and (sg1.Cells[1,sg1.RowCount -1]='')  then begin
                        BersihCell;
                        sg1.RowCount    := sg1.RowCount -1;
                        Focus;
                    end else
                      if sg1.Cells[1,sg1.Row]=sg1.Cells[1,sg1.RowCount -1] then
                        BersihCell;

                     Focus;
                end else
                begin
                  HitungSubtotal(sg1.Row);
                //  sg1.Cells[9,sg1.Row]:= FLoatToStr(isijual);


                  if sg1.Cells[1,sg1.RowCount-1 ] <>'' then
                  sg1.RowCount := sg1.RowCount + 1;

                  Focus;
                end;
              end;
              HitungTotal;

          end;
            Close;

      end;
      10: begin
      ExQry(dm.QBarang,_SQLCaribarang+' WHERE b.kodebarang="'+GetVal(dm.Qcaribarang,'kodebarang')+'"',True);
       With FRedemPoin,dm do
          begin
            if GetValF(dm.Qcaribarang,'stok') < 1 then begin

              Error('STOK TIDAK MENCUKUPI !!, SILAHKAN MELAKUKAN PEMBELIAN');
              Exit;
            end else
            begin

                if GetVal(Qbarang,'kodebarcode') <> '' then begin



                  sg1.Cells[0,sg1.Row] := IntToStr(sg1.Row);
                  sg1.Cells[8,sg1.Row] := GetVal(Qbarang,'kodebarang');
                  sg1.Cells[1,sg1.Row] := GetVal(Qbarang,'kodebarcode');
                  sg1.Cells[2,sg1.Row] := GetVal(Qbarang,'namabarang');
                  isijual              := CariIsi(GetVal(Qbarang,'kodebarcode'),GetVal(Qbarang,'satuanjual'));
                  sg1.Cells[3,sg1.Row] := GetValR(Qbarang,'hargapartai');
                  sg1.Cells[4,sg1.Row] := GetVal(Qbarang,'satuanjual');
                  sg1.Cells[5,sg1.Row] := '1';
                  sg1.Cells[6,sg1.Row] := GetValR(Qbarang,'hargapartai');
                  sg1.Cells[7,sg1.Row] := FloatToStr(isijual);
                  pas    := Posisi(UPPERCASE(GetVal(Qbarang,'kodebarcode')),UPPERCASE(GetVal(Qbarang,'satuanjual')));

                if (pas <> 0) and (pas <> sg1.Row) then begin
                       sg1.Cells[5,pas]  := FloatToStr(StrToFloatDef(sg1.Cells[5,pas],0)+1);

                       HitungSubtotal(pas);
                       sg1.Cells[7,pas] := FloatTOStr(isijual * StrToFloatDef(koma(sg1.Cells[5,pas]),0));

                    if  sg1.Cells[1,sg1.Row +1] <>'' then begin
                        BersihCell;
                        ReplaceData;
                        sg1.RowCount    := sg1.RowCount -1;
                        Focus;
                    end else
                    if (sg1.Row = sg1.RowCount -2) and (sg1.Cells[1,sg1.RowCount -1]='')  then begin
                        BersihCell;
                        sg1.RowCount    := sg1.RowCount -1;
                        Focus;
                    end else
                      if sg1.Cells[1,sg1.Row]=sg1.Cells[1,sg1.RowCount -1] then
                        BersihCell;

                     Focus;
                end else
                begin
                  HitungSubtotal(sg1.Row);

                  if sg1.Cells[1,sg1.RowCount-1 ] <>'' then
                  sg1.RowCount := sg1.RowCount + 1;

                  Focus;
                end;
              end;
              HitungTotal;
            end;
          end;
            Close;

      end;
    end;
end;

procedure TFcariBarang.cxgGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
    stts : String;
    hargamulti : String;
begin
  ExQry(dm.Q1,'SELECT * FROM hargaperpelanggan WHERE kodebarang="'+GetVal(dm.Qcaribarang,'kodebarang')+'" '+
                      ' AND kodepelanggan="'+FPenjualanBarang.EkodeCust.Text+'"',True);

    if dm.Q1.IsEmpty = False  then begin
       ExQry(QsatuanHarga,'SELECT s.kodebarang,s.satuan,s.isi,s.harga,(b.hargabeli * s.isi) as hargabeli FROM '+
       ' hargaperpelanggan s LEFT JOIN barang b ON b.kodebarang=s.kodebarang '+
       ' WHERE s.kodepelanggan="'+FPenjualanBarang.EkodeCust.Text+'" '+
       ' AND s.kodebarang="'+GetVal(dm.Qcaribarang,'kodebarang')+'" ORDER BY s.isi ASC',True);


    end else begin

        ExQry(dm.Q2,'SELECT idjenispelanggan FROM pelanggan WHERE kodepelanggan="'+FPenjualanBarang.EkodeCust.Text+'"',True);
          stts := GetVal(dm.Q2,'idjenispelanggan');

          if stts = '4' then hargamulti :='harga'
          else
          if stts = '5' then hargamulti :='hargagrosir'
          else
          if stts = '6' then hargamulti:='hargapartai'
          else
          if stts = '7' then hargamulti:='hargapartai4'
          else
          if stts = '8' then hargamulti:='hargapartai5' else
          hargamulti := 'harga';


        ExQry(QsatuanHarga,'SELECT s.kodebarang,s.satuan,s.isi,s.'+hargamulti+' as harga,(b.hargabeli * s.isi) as hargabeli FROM multisatuan s left join barang b '+
        ' ON b.kodebarang=s.kodebarang WHERE b.kodebarang="'+GetVal(dm.Qcaribarang,'kodebarang')+'" '+
        ' ORDER BY s.isi ASC',True);

    end;

    with GhargaPromo.DataController do begin
        RecordCount := 0;
        RecordCount := 3;
        if GetValF(dm.Qcaribarang,'hargapromo') > 0 then begin

          Values[0,0] := GetValR(dm.Qcaribarang,'hargapromo');
          Values[0,1] := GetVal(dm.Qcaribarang,'tglawal');
          Values[0,2] := GetVal(dm.Qcaribarang,'tglakhir');
        end;
        if GetValF(dm.Qcaribarang,'hargapromo2') > 0 then begin
          Values[1,0] := GetValR(dm.Qcaribarang,'hargapromo2');
          Values[1,1] := GetVal(dm.Qcaribarang,'tglawal2');
          Values[1,2] := GetVal(dm.Qcaribarang,'tglakhir2');
        end;
        if GetValF(dm.Qcaribarang,'hargapromo3') > 0 then begin
          Values[2,0] := GetValR(dm.Qcaribarang,'hargapromo3');
          Values[2,1] := GetVal(dm.Qcaribarang,'tglawal3');
          Values[2,2] := GetVal(dm.Qcaribarang,'tglakhir3');
        end;
     end;
end;

procedure TFcariBarang.cxgGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
     cxgGrid1DBTableView1.OnDblClick(Sender);

  IF (Key = VK_UP ) AND (dm.Qcaribarang.RecNo <= 1) then
      EPencarian.SetFocus;

end;

procedure TFcariBarang.cxgrdbclmnGrid1DBTableView1Column1GetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
  var
  AIndex: Integer;
begin
  AIndex := TcxGridTableView(Sender.GridView).DataController.GetRowIndexByRecordIndex(ARecordIndex, False);
  AText := IntToStr(AIndex + 1);
end;

procedure TFcariBarang.cxGrid1DBTableView1DblClick(Sender: TObject);
  var
    isiJual , Hrg , IsiBeli,PPn: Real;
    Hargabeli , Hargajual1,Hargajual2,hargajual3 :Real;
    Laba1,Laba2,Laba3 ,Persen1,Persen2,Persen3 : Real;
    pas : integer;
begin
   if isFormTransaksi =  1 then begin
              if QsatuanHarga.IsEmpty = False then begin


                 With FpenjualanBarang,dm do
                 begin
                  //      ExQry(dm.QBarang,_SQLCaribarang+' WHERE b.kodebarang="'+GetVal(dm.Qcaribarang,'kodebarang')+'"',True);
                  //      if (GetValF(dm.Qcaribarang,'stok') < 1) and (not isMinus) then begin

                 //         Error('STOK TIDAK MENCUKUPI !!, SILAHKAN MELAKUKAN PEMBELIAN');
                 //         Exit;
                 //       end else
                        begin

                            if GetVal(Qbarang,'kodebarang') <> '' then begin

                              sg1.Cells[0,sg1.Row] := IntToStr(sg1.Row);
                              sg1.Cells[10,sg1.Row] := GetVal(Qbarang,'kodebarang');
                              sg1.Cells[11,sg1.Row] := GetVal(Qbarang,'hargarata');
                              sg1.Cells[12,sg1.Row] := GetVal(Qbarang,'namakategori');
                              sg1.Cells[13,sg1.Row] := GetVal(Qbarang,'bkp');
                              sg1.Cells[1,sg1.Row] := GetVal(Qbarang,'kodebarcode');
                              sg1.Cells[2,sg1.Row] := GetVal(Qbarang,'namabarang');
                              isijual              := GetValF(QsatuanHarga,'isi');
                              hrg                  := GetValF(QsatuanHarga,'harga');
                              sg1.Cells[3,sg1.Row] := Format('%.2n',[hrg]);
                              sg1.Cells[4,sg1.Row] := '1';
                              sg1.Cells[5,sg1.Row] := '';
                              sg1.Cells[6,sg1.Row] :=  '';
                              sg1.Cells[7,sg1.Row] := GetVal(QsatuanHarga,'satuan');
                              pas    := Posisi(UPPERCASE(GetVal(Qbarang,'kodebarang')),UPPERCASE(GetVal(QsatuanHarga,'satuan')));

                            if (pas <> 0) and (pas <> sg1.Row) then begin
                                 //  isijual           := CariIsi(GetVal(Qbarang,'kodebarcode'),GetVal(Qbarang,'satuanjual'));
                                   sg1.Cells[4,pas]  := FloatToStr(StrToFloatDef(sg1.Cells[4,pas],0)+1);

                                   HitungSubtotal(pas);
                                   sg1.Cells[9,pas] := FloatTOStr(isijual * StrToFloatDef(koma(sg1.Cells[7,pas]),0));

                                if  sg1.Cells[1,sg1.Row +1] <>'' then begin
                                    BersihCell;
                                    ReplaceData;
                                    sg1.RowCount    := sg1.RowCount -1;
                                    Focus;
                                end else
                                if (sg1.Row = sg1.RowCount -2) and (sg1.Cells[1,sg1.RowCount -1]='')  then begin
                                    BersihCell;
                                    sg1.RowCount    := sg1.RowCount -1;
                                    Focus;
                                end else
                                  if sg1.Cells[1,sg1.Row]=sg1.Cells[1,sg1.RowCount -1] then
                                    BersihCell;

                                 Focus;
                            end else
                            begin
                              HitungSubtotal(sg1.Row);

                              if sg1.Cells[1,sg1.RowCount-1 ] <>'' then
                              sg1.RowCount := sg1.RowCount + 1;

                              Focus;
                            end;
                          end;
                          HitungTotal;
                        end;
                 end;
                 Close;



         end;
   end else if isFormTransaksi = 0 then begin
        if QsatuanHarga.IsEmpty = False then begin

           With FpembelianBarang,dm do
                begin
                    ExQry(dm.QBarang,_SQLCaribarang+' WHERE b.kodebarang="'+GetVal(dm.Qcaribarang,'kodebarang')+'"',True);
                    sg1.Cells[0,sg1.Row] := IntToStr(sg1.Row);

                    sg1.Cells[0,sg1.Row] := IntToStr(sg1.Row);
                    sg1.Cells[1,sg1.Row] := GetVal(dm.QBarang,'kodebarcode');
                    sg1.Cells[14,sg1.Row] := GetVal(dm.QBarang,'kodebarang');
                    sg1.Cells[15,sg1.Row] := GetVal(dm.QBarang,'bkp');
                    sg1.Cells[2,sg1.Row] := GetVal(dm.QBarang,'namabarang');
                    isiBeli              := GetValInt(QsatuanHarga,'isi');
                    hrg                  := GetValF(QsatuanHarga,'hargabeli');
                    sg1.Cells[3,sg1.Row] := GetVal(QsatuanHarga,'satuan');
                    sg1.Cells[3,sg1.Row] := GetVal(QSatuanHarga,'satuan');
                    sg1.Cells[4,sg1.Row] := '1';
                    sg1.Cells[5,sg1.Row] := FloatTostr(hrg);
                    sg1.Cells[6,sg1.Row] := GetValR(dm.QBarang,'hargaecer');
                    sg1.Cells[7,sg1.Row] := GetValR(dm.QBarang,'hargagrosir');
                    sg1.Cells[8,sg1.Row] := GetValR(dm.QBarang,'hargapartai');
                    sg1.Cells[9,sg1.Row] := '';
                    sg1.Cells[10,sg1.Row] := '';
                    sg1.Cells[11,sg1.Row] := '';


                    pas    := Posisi(UPPERCASE(GetVal(Qbarang,'kodebarang')),UPPERCASE(GetVal(QsatuanHarga,'satuan')));

                   if (pas <> 0) and (pas <> sg1.Row) then begin

                       sg1.Cells[4,pas]  := FloatToStr(StrToFloatDef(sg1.Cells[4,pas],0)+1);

                       HitungSubtotal(pas);

                    if  sg1.Cells[1,sg1.Row +1] <>'' then begin
                        BersihCell;
                        ReplaceData;
                        sg1.RowCount    := sg1.RowCount -1;
                        Focus;
                      end else
                      if (sg1.Row = sg1.RowCount -2) and (sg1.Cells[1,sg1.RowCount -1]='')  then begin
                        BersihCell;
                        sg1.RowCount    := sg1.RowCount -1;
                        Focus;
                      end else
                      if sg1.Cells[1,sg1.Row]=sg1.Cells[1,sg1.RowCount -1] then
                        BersihCell;

                     Focus;
                  end else
                  begin
                    HitungSubtotal(sg1.Row);

                    if sg1.Cells[1,sg1.RowCount-1 ] <>'' then
                    sg1.RowCount := sg1.RowCount + 1;

                    Focus;
                  end;
                  HitungTotal;
                end;
              Close;

         end;

   end;

end;

procedure TFcariBarang.EPencarianKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case isFormTransaksi of

 0 : begin

        case Key of

         VK_RETURN : ExQry(dm.Qcaribarang,_SQLCaribarang+' where (b.namabarang like"%'+EPencarian.Text+'%" '+
         ' or b.kodebarcode="'+Epencarian.Text+'" '+
         '  or  b.kodebarang like"%'+Epencarian.Text+'%" ) GROUP BY b.kodebarang',True);
         VK_DOWN   : cxgrd1.SetFocus;

        end;
      end;
 1 : begin
       case Key of
         VK_RETURN : ExQry(dm.Qcaribarang,_SQLCaribarang+' where ( b.namabarang like"%'+EPencarian.Text+'%" '+
         ' or b.kodebarcode="'+Epencarian.Text+'"  or '+
         ' b.kodebarang like"%'+Epencarian.Text+'%" )  GROUP BY b.kodebarang',True);
         VK_DOWN   : cxgrd1.SetFocus;
        end;
     end;
 2 : begin
        case Key of
         VK_RETURN : ExQry(dm.Qcaribarang,_SQLCaribarang+' where ( b.namabarang like"%'+EPencarian.Text+'%" '+
         ' or b.kodebarcode="'+Epencarian.Text+'"  or '+
         ' b.kodebarang like"%'+Epencarian.Text+'%" )  GROUP BY b.kodebarang ',True);
         VK_DOWN   : cxgrd1.SetFocus;
        end;
     end;
 3 : begin
       case Key of
         VK_RETURN : ExQry(dm.Qcaribarang,_SQLCaribarang+' where b.namabarang like"%'+EPencarian.Text+'%" '+
         ' or b.kodebarcode="'+Epencarian.Text+'" '+
         '  or  b.kodebarang like"%'+Epencarian.Text+'%" ',True);
         VK_DOWN   : cxgrd1.SetFocus;
        end;
     end;
 4 : begin
         case Key of
         VK_RETURN : ExQry(dm.Qcaribarang,_SQLCaribarang+' where ( b.namabarang like"%'+EPencarian.Text+'%" '+
         ' or b.kodebarcode="'+Epencarian.Text+'"  or '+
         ' b.kodebarang like"%'+Epencarian.Text+'%" )  GROUP BY b.kodebarang ',True);
         VK_DOWN   : cxgrd1.SetFocus;
        end;
     end;
 5 : begin
       case Key of
         VK_RETURN : ExQry(dm.Qcaribarang,_SQLCaribarang+' where ( b.namabarang like"%'+EPencarian.Text+'%" '+
         ' or b.kodebarcode="'+Epencarian.Text+'"  or '+
         ' b.kodebarang like"%'+Epencarian.Text+'%" ) GROUP BY b.kodebarang',True);
         VK_DOWN   : cxgrd1.SetFocus;
        end;
    end;
 6 : begin
       case Key of
         VK_RETURN : ExQry(dm.Qcaribarang,_SQLCaribarang+' where ( b.namabarang like"%'+EPencarian.Text+'%" '+
         ' or b.kodebarcode="'+Epencarian.Text+'"  or '+
         ' b.kodebarang like"%'+Epencarian.Text+'%" ) GROUP BY b.kodebarang ',True);
         VK_DOWN   : cxgrd1.SetFocus;
        end;
    end;
 7 : begin
       case Key of
         VK_RETURN : ExQry(dm.Qcaribarang,_SQLCaribarang+' where (b.namabarang like"%'+EPencarian.Text+'%" '+
         ' or b.kodebarcode="'+Epencarian.Text+'"   or '+
         ' b.kodebarang like"%'+Epencarian.Text+'%" ) GROUP BY b.kodebarang ',True);
         VK_DOWN   : cxgrd1.SetFocus;
        end;
    end;
 8 : begin
       case Key of
         VK_RETURN : ExQry(dm.Qcaribarang,_SQLCaribarang+' where (b.namabarang like"%'+EPencarian.Text+'%" '+
         ' or b.kodebarcode="'+Epencarian.Text+'" or '+
         ' b.kodebarang like"%'+Epencarian.Text+'%") GROUP BY b.kodebarang ',True);
         VK_DOWN   : cxgrd1.SetFocus;
        end;
    end;
 9 : begin
       case Key of
         VK_RETURN : ExQry(dm.Qcaribarang,_SQLCaribarang+' where (b.namabarang like"%'+EPencarian.Text+'%" '+
         ' or b.kodebarcode="'+Epencarian.Text+'"  or '+
         ' b.kodebarang like"%'+Epencarian.Text+'%" ) GROUP BY b.kodebarang',True);
         VK_DOWN   : cxgrd1.SetFocus;
        end;
    end;
 10 : begin
       case Key of
         VK_RETURN : ExQry(dm.Qcaribarang,_SQLCaribarang+' where (b.namabarang like"%'+EPencarian.Text+'%" '+
         ' or b.kodebarcode="'+Epencarian.Text+'"  or '+
         ' b.kodebarang like"%'+Epencarian.Text+'%" ) GROUP BY b.kodebarang ',True);
         VK_DOWN   : cxgrd1.SetFocus;
        end;
    end;
 end;
end;

procedure TFcariBarang.FormCreate(Sender: TObject);
begin
  EPencarian.isCari := True;
end;

procedure TFcariBarang.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    isiJual , Hrg , IsiBeli,PPn: Real;
    Hargabeli , Hargajual1,Hargajual2,hargajual3 :Real;
    Laba1,Laba2,Laba3 ,Persen1,Persen2,Persen3 : Real;
    pas : integer;
    Urut : Integer;
begin
   if isFormTransaksi =  1 then begin

         if Key in [49,50,51,52,53] then begin

              if QsatuanHarga.IsEmpty = False then begin
                 case Key of
                 49 : Urut := 1;
                 50 : Urut := 2;
                 51 : Urut := 3;
                 52 : Urut := 4;
                 53 : Urut := 5;

                 end;


                 With FpenjualanBarang,dm do
                 begin
                        ExQry(dm.QBarang,_SQLCaribarang+' WHERE b.kodebarang="'+GetVal(dm.Qcaribarang,'kodebarang')+'"',True);
                      //  if (GetValF(dm.Qcaribarang,'stok') < 1) and (not isMinus) then begin

                      //    Error('STOK TIDAK MENCUKUPI !!, SILAHKAN MELAKUKAN PEMBELIAN');
                     //     Exit;
                     //   end else
                        begin
                            QsatuanHarga.RecNo := Urut;
                            if GetVal(Qbarang,'kodebarang') <> '' then begin

                              sg1.Cells[0,sg1.Row] := IntToStr(sg1.Row);
                              sg1.Cells[10,sg1.Row] := GetVal(Qbarang,'kodebarang');
                              sg1.Cells[11,sg1.Row] := GetVal(Qbarang,'hargarata');
                              sg1.Cells[12,sg1.Row] := GetVal(Qbarang,'namakategori');
                              sg1.Cells[13,sg1.Row] := GetVal(Qbarang,'bkp');
                              sg1.Cells[1,sg1.Row] := GetVal(Qbarang,'kodebarcode');
                              sg1.Cells[2,sg1.Row] := GetVal(Qbarang,'namabarang');
                              isijual              := GetValF(QsatuanHarga,'isi');
                              hrg                  := GetValF(QsatuanHarga,'harga');
                              sg1.Cells[3,sg1.Row] := Format('%.2n',[hrg]);
                              sg1.Cells[4,sg1.Row] := '1';
                              sg1.Cells[5,sg1.Row] := '';
                              sg1.Cells[6,sg1.Row] :=  '';
                              sg1.Cells[7,sg1.Row] := GetVal(QsatuanHarga,'satuan');
                              pas    := Posisi(UPPERCASE(GetVal(Qbarang,'kodebarang')),UPPERCASE(GetVal(QsatuanHarga,'satuan')));

                            if (pas <> 0) and (pas <> sg1.Row) then begin
                                 //  isijual           := CariIsi(GetVal(Qbarang,'kodebarcode'),GetVal(Qbarang,'satuanjual'));
                                   sg1.Cells[4,pas]  := FloatToStr(StrToFloatDef(sg1.Cells[4,pas],0)+1);

                                   HitungSubtotal(pas);
                                   sg1.Cells[9,pas] := FloatTOStr(isijual * StrToFloatDef(koma(sg1.Cells[7,pas]),0));

                                if  sg1.Cells[1,sg1.Row +1] <>'' then begin
                                    BersihCell;
                                    ReplaceData;
                                    sg1.RowCount    := sg1.RowCount -1;
                                    Focus;
                                end else
                                if (sg1.Row = sg1.RowCount -2) and (sg1.Cells[1,sg1.RowCount -1]='')  then begin
                                    BersihCell;
                                    sg1.RowCount    := sg1.RowCount -1;
                                    Focus;
                                end else
                                  if sg1.Cells[1,sg1.Row]=sg1.Cells[1,sg1.RowCount -1] then
                                    BersihCell;

                                 Focus;
                            end else
                            begin
                              HitungSubtotal(sg1.Row);

                              if sg1.Cells[1,sg1.RowCount-1 ] <>'' then
                              sg1.RowCount := sg1.RowCount + 1;

                              Focus;
                            end;
                          end;
                          HitungTotal;
                        end;
                 end;
                 Close;


              end;
         end;
   end else if isFormTransaksi = 0 then begin
         if Key in [49,50,51,52,53] then begin

              if QsatuanHarga.IsEmpty = False then begin
                 case Key of
                 49 : Urut := 1;
                 50 : Urut := 2;
                 51 : Urut := 3;
                 52 : Urut := 4;
                 53 : Urut := 5;

                 end;

                 QsatuanHarga.RecNo   := Urut;
                 With FpembelianBarang,dm do
                      begin
                          ExQry(dm.QBarang,_SQLCaribarang+' WHERE b.kodebarang="'+GetVal(dm.Qcaribarang,'kodebarang')+'"',True);

                          sg1.Cells[0,sg1.Row] := IntToStr(sg1.Row);
                          sg1.Cells[1,sg1.Row] := GetVal(dm.QBarang,'kodebarcode');
                          sg1.Cells[14,sg1.Row] := GetVal(dm.QBarang,'kodebarang');
                          sg1.Cells[15,sg1.Row] := GetVal(dm.QBarang,'bkp');
                          sg1.Cells[2,sg1.Row] := GetVal(dm.QBarang,'namabarang');
                          isiBeli              := GetValInt(QsatuanHarga,'isi');
                          hrg                  := GetValF(QsatuanHarga,'hargabeli');
                          hrg                  := GetValF(dm.QBarang,'hargabeli') * isiBeli;
                          sg1.Cells[3,sg1.Row] := GetVal(QSatuanHarga,'satuan');
                          sg1.Cells[4,sg1.Row] := '1';
                          sg1.Cells[5,sg1.Row] := FloatTostr(hrg);
                          sg1.Cells[5,sg1.Row] := FloatTostr(hrg);
                          sg1.Cells[6,sg1.Row] := GetValR(dm.QBarang,'hargaecer');
                          sg1.Cells[7,sg1.Row] := GetValR(dm.QBarang,'hargagrosir');
                          sg1.Cells[8,sg1.Row] := GetValR(dm.QBarang,'hargapartai');
                          sg1.Cells[9,sg1.Row] := '';
                          sg1.Cells[10,sg1.Row] := '';
                          sg1.Cells[11,sg1.Row] := '';


                          pas    := Posisi(UPPERCASE(GetVal(Qbarang,'kodebarcode')),UPPERCASE(GetVal(Qbarang,'satuanbeli')));

                         if (pas <> 0) and (pas <> sg1.Row) then begin

                             sg1.Cells[4,pas]  := FloatToStr(StrToFloatDef(sg1.Cells[4,pas],0)+1);

                             HitungSubtotal(pas);

                          if  sg1.Cells[1,sg1.Row +1] <>'' then begin
                              BersihCell;
                              ReplaceData;
                              sg1.RowCount    := sg1.RowCount -1;
                              Focus;
                            end else
                            if (sg1.Row = sg1.RowCount -2) and (sg1.Cells[1,sg1.RowCount -1]='')  then begin
                              BersihCell;
                              sg1.RowCount    := sg1.RowCount -1;
                              Focus;
                            end else
                            if sg1.Cells[1,sg1.Row]=sg1.Cells[1,sg1.RowCount -1] then
                              BersihCell;

                           Focus;
                        end else
                        begin
                          HitungSubtotal(sg1.Row);

                          if sg1.Cells[1,sg1.RowCount-1 ] <>'' then
                          sg1.RowCount := sg1.RowCount + 1;

                          Focus;
                        end;
                        HitungTotal;
                      end;
                    Close;
              end;
         end;

   end;

end;

procedure TFcariBarang.FormShow(Sender: TObject);

begin
  cxgrd1.SetFocus;
  EPencarian.Clear;
  EPencarian.SetFocus;

  ExQry(dm.Q1,'SELECT * FROM m_user WHERE username="'+FMain.sbr1.Panels[2].Text+'"',True);

  ShowHarga := GetValBol(dm.Q1,'showHarga');
  chargabeli.Visible := SHowHarga;

end;



end.
