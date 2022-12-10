unit uCariPembelianCabang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinSharp,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxTextEdit, cxLabel, dxBevel, uComCtrl, uctrlFrm, uEngine, uOvEdit,
  dxSkiniMaginary, cxCurrencyEdit, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, dxSkinMoneyTwins, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, DBAccess, MyAccess, Vcl.ComCtrls,
  Vcl.StdCtrls, MemDS, cxGroupBox, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFCariPebembelianCabang = class(TForm)
    cxGroupBox2: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    EPencarian: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxgrd1: TcxGrid;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1DBTableView1nobukti: TcxGridDBColumn;
    cxgGrid1DBTableView1tgl: TcxGridDBColumn;
    cxgGrid1DBTableView1refnota: TcxGridDBColumn;
    cxgGrid1DBTableView1pembayaran: TcxGridDBColumn;
    cxgGrid1DBTableView1namasupplier: TcxGridDBColumn;
    cxgGrid1DBTableView1total: TcxGridDBColumn;
    cxgGrid1Level1: TcxGridLevel;
    QCabang: TMyQuery;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Label1: TLabel;
    dt1: TDateTimePicker;
    DCabang: TMyDataSource;
    cxGrid1DBTableView1nama: TcxGridDBColumn;
    cxGrid1DBTableView1var_database: TcxGridDBColumn;
    DPembelian: TMyDataSource;
    QPembelian: TMyQuery;
    procedure cxgGrid1DBTableView1DblClick(Sender: TObject);
    procedure EPencarianKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxgGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure dt1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;




var
  FCariPebembelianCabang: TFCariPebembelianCabang;

implementation

{$R *.dfm}

uses uDtrx, udm, uReturBeliNew, uPembelian;

procedure TFCariPebembelianCabang.cxgGrid1DBTableView1DblClick(Sender: TObject);
var
  i         : Integer;
  KodeSupplier : String;
  hrg , hargaBeli: Real;
  isiBeli  : Real;
  persen1,persen2,persen3,persen4,persen5 : Real;
  HargaJual1,hargajual2,hargajual3,hargajual4,hargajual5 : real;
  laba1,laba2,laba3,laba4,laba5 , ppn: real;
begin

  with FpembelianBarang do
      begin
        ClearText(Self);
        KosongKanGrid;

        Enobukti.Text       := GetCode(dm.Q1,'pembelian','nobukti','PB'+setIdKom);
        DtBukti.Date        := QPembelian.FieldByName('tgl').AsDateTime;
        KodeSupplier        := GetVal(QPembelian,'kodesupplier');
        ESupplier.Text      := GetVal(QPembelian,'namasupplier');
        EKodeSupplier.Text  := KodeSupplier;
        if GetVal(QPembelian,'pembayaran') = 'CASH' then cbPembayaran.ItemIndex := 0
        else cbPembayaran.ItemIndex := 1;
        ETotal.Text         := GetRupiah(GetVal(QPembelian,'total'));
     

        ExQry(dm.Q2,' SELECT                                  '+
                     '     d.iddetilbeli,                      '+
                     '     d.nobukti,                          '+
                     '     d.kodebarang,                       '+
                     '     b.kodebarcode,                       '+
                     '     b.namabarang,                       '+
                     '     d.satuan,                           '+
                     '     d.harga,                            '+
                     '     d.hargaecer,                        '+
                     '     d.hargagrosir,                      '+
                     '     d.hargapartai,                      '+
                     '     d.hargapartai4,                      '+
                     '     d.hargapartai5,                      '+
                     '     d.jumlah,                           '+
                     '     d.diskonpersen,                     '+
                     '     d.diskonrupiah,                     '+
                     '     d.diskon2,                     '+
                     '     d.diskon3,                     '+
                     '     d.ppn,                              '+
                     '     d.subtotal,                         '+
                     '     d.isi                               '+
                     '   FROM                                  '+
                     '     '+GetVal(QCabang,'var_database')+'.detailbeli d '+
                     '     LEFT JOIN '+GetVal(QCabang,'var_database')+'.barang b '+
                     '       ON d.`kodebarang` = b.`kodebarang` where '+
                     '     d.nobukti="'+GetVal(QPembelian,'nobukti')+'"',True);

        sg1.RowCount        := dm.Q2.RecordCount +2;
        i                   := 0;
        while dm.Q2.Eof = False do
        begin
          laba1 := 0;
          laba2 := 0;
          laba3 := 0;
          laba4 := 0;
          laba5 := 0;


          ExQry(dm.Q5,'SELECT kodebarang FROM barang WHERE namabarang="'+GetVal(dm.Q2,'namabarang')+'"',True);

          if dm.Q5.IsEmpty then begin
             MessageDlg('Barang tidak ditemukan dimaster barang',mtInformation,[mbOK],0);

          end else begin

                sg1.Cells[0,i+1] := IntToStr(dm.Q2.RecNo);
                sg1.Cells[1,i+1] := GetVal(dm.Q2,'kodebarcode');
                sg1.Cells[2,i+1] := GetVal(dm.Q2,'namabarang');
                isiBeli          := CariIsi(GetVal(dm.Q2,'kodebarang'),GetVal(dm.Q2,'satuan'));
                hrg              := GetValF(dm.Q2,'harga') ;

                sg1.Cells[3,i+1] := GetVal(dm.Q2,'satuan');
                sg1.Cells[4,i+1] := GetVal(dm.Q2,'jumlah');
                sg1.Cells[5,i+1] := FloatToStr(hrg);
                sg1.Cells[6,i+1] := GetVal(dm.Q2,'ppn');

                if GetValF(dm.Q2,'ppn') > 0 then
                ppn              :=  GetValF(dm.Q2,'harga') * GetValF(dm.Q2,'ppn') / 100;
                sg1.Cells[7,i+1] := Format('%.0n',[getValf(dm.Q2,'harga') + ppn]);


                hargaBeli  := hrg / isiBeli;
                HargaJual1 := GetValF(dm.Q2,'hargaecer');
                HargaJual2 := GetValF(dm.Q2,'hargagrosir');
                hargajual3 := GetValF(dm.Q2,'hargapartai');
                hargajual4 := GetValF(dm.Q2,'hargapartai4');
                hargajual5 := GetValF(dm.Q2,'hargapartai5');

                if HargaJual1 > 0 then

                laba1 := hargajual1 - (hargaBeli + ppn) ;
                if hargajual2 > 0 then
                laba2 := hargajual2 - (hargaBeli + ppn);
                if hargajual3 > 0 then
                laba3 := hargajual3 - (hargaBeli + ppn);
                if hargajual4 > 0 then
                laba4 := hargajual4 - (hargaBeli + ppn);
                if hargajual5 > 0 then
                laba3 := hargajual5 - (hargaBeli + ppn);


                persen1 := (laba1 / (hargaBeli + ppn)) * 100;
                persen2 := (laba2 / (hargaBeli + ppn)) * 100;
                persen3 := (laba3 / (hargaBeli + ppn)) * 100;
                sg1.Cells[8,i+1] := Format('%.2n',[persen1]);
                sg1.Cells[9,i+1] := GetVal(dm.Q2,'hargaecer');
                sg1.Cells[10,i+1] := Format('%.2n',[persen2]);
                sg1.Cells[11,i+1] := GetVal(dm.Q2,'hargagrosir');
                sg1.Cells[12,i+1]:= Format('%.2n',[persen3]);
                sg1.Cells[13,i+1]:= GetVal(dm.Q2,'hargapartai');

                sg1.Cells[14,i+1] := GetVal(dm.Q2,'diskonpersen');;
                sg1.Cells[15,i+1] := GetVal(dm.Q2,'diskon2');
                sg1.Cells[16,i+1] := GetVal(dm.Q2,'diskon3');
                sg1.Cells[17,i+1] := GetVal(dm.Q2,'subtotal');
                sg1.Cells[18,i+1] := GetVal(dm.Q2,'isi');
                sg1.Cells[19,i+1] := GetVal(dm.Q2,'kodebarang');
          end;
          inc(i);
          dm.Q2.Next;
        end;

         HitungTotal;

      end;
      Close;
end;

procedure TFCariPebembelianCabang.cxgGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
     cxgGrid1DBTableView1.OnDblClick(Sender);
end;

procedure TFCariPebembelianCabang.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  ExQry(QPembelian,'SELECT                           '+
                   '       p.idpembelian,            '+
                   '       p.nobukti,                '+
                   '       p.tgl,                    '+
                   '       p.pembayaran,             '+
                   '       p.idsupplier,             '+
                   '       p.refnota,                '+
                   '       s.kodesupplier,           '+
                   '       s.namasupplier,           '+
                   '       p.nopo,                   '+
                   '       p.iduser,                 '+
                   '       p.total,                  '+
                   '       p.ppn,                    '+
                   '       p.diskon,                 '+
                   '       p.grandtotal              '+
                   '     FROM                        '+
                   '       '+GetVal(QCabang,'var_database')+'.pembelian p               '+
                   '       LEFT JOIN '+GetVal(QCabang,'var_database')+'.m_supplier s        '+
                   '         ON s.`idsupplier` = p.`idsupplier` '+
                   '     WHERE p.tgl="'+Tanggal(Dt1.Date)+'"',True  );
end;

procedure TFCariPebembelianCabang.dt1Change(Sender: TObject);
begin
  ExQry(QPembelian,'SELECT                           '+
                   '       p.idpembelian,            '+
                   '       p.nobukti,                '+
                   '       p.tgl,                    '+
                   '       p.pembayaran,             '+
                   '       p.idsupplier,             '+
                   '       p.refnota,                '+
                   '       s.kodesupplier,           '+
                   '       s.namasupplier,           '+
                   '       p.nopo,                   '+
                   '       p.iduser,                 '+
                   '       u.namalengkap,            '+
                   '       p.total,                  '+
                   '       p.ppn,                    '+
                   '       p.diskon,                 '+
                   '       p.grandtotal              '+
                   '     FROM                        '+
                   '       '+GetVal(QCabang,'var_database')+'.pembelian p               '+
                   '       LEFT JOIN '+GetVal(QCabang,'var_database')+'.m_supplier s        '+
                   '         ON s.`idsupplier` = p.`idsupplier` '+
                   '     WHERE p.tgl="'+Tanggal(Dt1.Date)+'"',True  );
end;

procedure TFCariPebembelianCabang.EPencarianKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
   VK_RETURN : ExQry(QPembelian,'SELECT                           '+
                   '       p.idpembelian,            '+
                   '       p.nobukti,                '+
                   '       p.tgl,                    '+
                   '       p.pembayaran,             '+
                   '       p.idsupplier,             '+
                   '       p.refnota,                '+
                   '       s.kodesupplier,           '+
                   '       s.namasupplier,           '+
                   '       p.nopo,                   '+
                   '       p.iduser,                 '+
                   '       u.namalengkap,            '+
                   '       p.total,                  '+
                   '       p.ppn,                    '+
                   '       p.diskon,                 '+
                   '       p.grandtotal              '+
                   '     FROM                        '+
                   '       '+GetVal(QCabang,'var_database')+'.pembelian p               '+
                   '       LEFT JOIN '+GetVal(QCabang,'var_database')+'.m_supplier s        '+
                   '         ON s.`idsupplier` = p.`idsupplier` '+
                   '     WHERE p.tgl="'+Tanggal(Dt1.Date)+'" '+
                   '     AND (p.nobukti LIKE "%'+Epencarian.Text+'%" '+
                   '     OR s.namasupplier LIKE "%'+EPencarian.Text+'%")',True  );
   VK_DOWN   : cxgrd1.SetFocus;
  end;
end;

procedure TFCariPebembelianCabang.FormShow(Sender: TObject);
begin
   QCabang.Close;
   QCabang.SQL.Text := ' SELECT * FROM tokomanager.toko ';
   QCabang.Open;

   dt1.Date :=Now;
end;

end.
