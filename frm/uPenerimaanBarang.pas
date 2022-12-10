unit uPenerimaanBarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMcSkin,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, dxBevel, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridDBTableView, cxGrid, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, Vcl.StdCtrls, cxGroupBox, uComCtrl, uctrlFrm, uEngine,
  uOvEdit, cxCalc, cxCurrencyEdit, Vcl.Menus, cxButtons, cxMemo, cxVariants,dxSkinSharp,
  cxLabel, dxSkiniMaginary, dxSkinOffice2010Blue, DateUtils,dxSkinOffice2016Colorful,
  dxSkinMoneyTwins, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;
type
  TFpenerimaanBarang = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ENobukti: TcxTextEdit;
    dtbukti: TcxDateEdit;
    Label8: TLabel;
    Label9: TLabel;
    Eketerangan: TcxTextEdit;
    Label10: TLabel;
    G3: TcxGroupBox;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    EKodeSupplier: TcxTextEdit;
    Label7: TLabel;
    Label11: TLabel;
    ENoOrder: TcxTextEdit;
    Label6: TLabel;
    ESupplier: TcxTextEdit;
    Label5: TLabel;
    Label12: TLabel;
    ENoOrderBeli: TcxTextEdit;
    btnCariBeli: TcxButton;
    sg1: TAdvStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure cxgrd2TableView1Editing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure btnBaruClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure cxgrd2TableView1InitEdit(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
    procedure btnCariBeliClick(Sender: TObject);
    procedure sg1GetEditorProp(Sender: TObject; ACol, ARow: Integer;
      AEditLink: TEditLink);
    procedure sg1GetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    aList : TStringList;
    { Private declarations }
  public
    procedure TampilAwal;
    procedure BuatGrid;
    function CariIsi(barcode:string;Satuan:string):Extended;
    procedure bersihCell;

    function GetHargaBeli(kodebarang: string; HargaBaru       : Real;   JumlahBaru      : Real;
  var saldolama: Real): Real;
    { Public declarations }
  end;



var
  FpenerimaanBarang: TFpenerimaanBarang;

  txt : string;

implementation

{$R *.dfm}

uses uDtrx, udm, uCariSupplier, uCariBarang, uCaripembelian;

{ TFreturPembelian }

procedure TFpenerimaanBarang.bersihCell;
var
  i : integer;
begin
  with sg1 do begin
  for i := 0 to ColCount -1 do
      Cells[Row,i] := '';
  end;

end;

procedure TFpenerimaanBarang.btnBaruClick(Sender: TObject);
begin
  TampilAwal;
end;

procedure TFpenerimaanBarang.btnCariBeliClick(Sender: TObject);
begin
  FcariPembelian.isCariPembelian := 1;
  FcariPembelian.Show;
  ExQry(dtrx.QPembelian,_SQLCariBelior +' LEFT JOIN detailbeli dt '+
                     ' ON dt.`nobukti`=p.`nobukti` WHERE dt.jumlah <> dt.`masuk` '+
                     ' GROUP BY p.`nobukti`',True);
end;

procedure TFpenerimaanBarang.btnSimpanClick(Sender: TObject);
var
  i : Integer;
  KodeBarang    :String;
  idSupplier    : string;
  idgudang      : string;
  Hargabeli,harga,Subtotal,FixHarga  ,PPN, HargaSetelahPPN   : Real;
  Diskon1,DIskon2,Diskon3,Jumlah : Real;
  HargaDiskon1,HargaDiskon2,HargaDiskon3:Real;
  SaldoLama     : real;
  kredit        : Boolean;
begin
  if NOT CheckEdit(Self) then
  begin
    

    addParam('nobukti',ENobukti.Text,aList,'str');
    addParam('tgl',frmTgl(DtBukti.Date),aList,'date');
    addParam('nobuktibeli',ENoOrder.Text,aList,'str');
    addParam('nobuktiorder',ENoOrderbeli.Text,aList,'str');
    addParam('keterangan',Eketerangan.Text,aList,'str');

    exeDb(dm.Q1,'penerimaanbarang',aList);



    with sg1 do begin
      for I := 1 to RowCount -1 do   begin
        if (Cells[5,i] <> '') AND (Cells[8,i]<>'') then begin
          idgudang := getData(dm.Q5,'lokasi WHERE namalokasi="'+Cells[8,i]+'"','idlokasi');
          addParam('nobukti',ENobukti.Text,aList,'str');
          addParam('kodebarang',Cells[0,i],aList,'str');
          addParam('satuan',Cells[2,i],aList,'str');
          addParam('jmlorder',nilai(Cells[3,i]),aList,'str');
          addParam('masuk',nilai(Cells[5,i]),aList,'str');
          addParam('harga',StrToDecimal(Cells[9,i]),aList,'str');
          addParam('kekurangan',nilai(Cells[6,i]),aList,'str');
          addParam('isi',nilai(Cells[7,i]),aList,'str');
          addParam('idgudang',idgudang,aList,'str');

          exeDb(dm.Q1,'penerimaandetail',aList);

          ExQry(dm.Q4,'UPDATE detailbeli SET masuk=masuk+"'+Nilai(Cells[5,i])+'" '+
          ' WHERE kodebarang="'+Cells[0,i]+'" AND nobukti="'+ENoOrder.Text+'"',False);

          Harga        := CellF(Cells[9,i]);
          PPN          := CellF(Cells[13,i]);
          Jumlah       := StrToFloatDef(koma(Cells[5,i]),0);

          Diskon1      := StrToFloatDef(koma(Cells[10,i]),0);
          Diskon2      := StrToFloatDef(nilai(Cells[11,i]),0);
          Diskon3      := StrToFloatDef(nilai(Cells[12,i]),0);

          hargaDiskon1 := (Harga * Diskon1 / 100);
          FixHarga     := Harga - hargaDiskon1;
          hargaDiskon2 := (FixHarga * Diskon2 / 100);
          FixHarga     := FixHarga - hargaDiskon2;
          hargaDiskon3 := (FixHarga * Diskon3 / 100);
          FixHarga     := FixHarga - hargaDiskon3;

          HargaSetelahPPN := FixHarga + (FixHarga * PPN /100);

          Subtotal     := HargaSetelahPPN * Jumlah;

          ExQry(dm.Q5,' SELECT kodebarang FROM hargabelirata WHERE kodebarang="'+Cells[0,i]+'" ',True);
          hargabeli := GetHargaBeli(Cells[0,i],HargaSetelahPPN,Jumlah,SaldoLama);




          if dm.Q5.IsEmpty then begin
            ExQry(dm.Q3,'INSERT INTO hargabelirata (kodebarang,hargabeli) VALUES ( '+
            '"'+Cells[0,i]+'","'+StrTODecimal(Format('%.4n',[hargabeli]))+'")',False);
          end
          else begin
           ExQry(dm.Q3,'UPDATE hargabelirata SET hargabeli="'+StrToDecimal(Format('%.4n',[hargabeli]))+'" WHERE '+
           ' kodebarang="'+Cells[0,i]+'" ',False);
          end;

          PostingKartuStok(DM.Q5,Enobukti.Text,
                               DtBukti.Date,Cells[0,i],
                               idgudang,Cells[2,i],
                               HargaSetelahPPN,'MASUK',
                               CellF(nilai(Cells[5,i])),
                               'PEMBELIAN NO BUKTI ['+Enobukti.Text+']');



          PostingJurnal(dm.Q1,'103.001',Enobukti.Text,'PEMBELIAN NO BUKTI ['+Enobukti.Text+']',
                      DtBukti.Date,Subtotal,'D');
          PostingJurnal(dm.Q1,'103.002',Enobukti.Text,'PEMBELIAN NO BUKTI ['+Enobukti.Text+']',
                      DtBukti.Date,Subtotal,'K');
        end;


      end;

    end;

    Informasi('Data Berhasil disimpan');
    TampilAwal;
  end;

end;

procedure TFpenerimaanBarang.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFpenerimaanBarang.BuatGrid;
var
  i,x : integer;

begin


 with sg1 do
  begin

      ColCount := 14;
      RowCount := 2;

      for i := 0 to ColCount -1 do
      for x := 0 to RowCount -1 do
        Cells[i,x] := '';

      Cells[0,0] := 'Kode Barang';
      Cells[1,0] := 'Nama Barang';
      Cells[2,0] := 'Satuan';
      Cells[3,0] := 'Jumlah Order';
      Cells[4,0] := 'Sudah Diterima';
      Cells[5,0] := 'Masuk';
      Cells[6,0] := 'Kekurangan';
      Cells[7,0] := 'Isi';
      Cells[8,0] := 'Gudang';
      Cells[9,0] := 'harga';
      Cells[10,0] := 'disk1';
      Cells[11,0] := 'disk2';
      Cells[12,0] := 'disk3';
      Cells[13,0] := 'ppn';

      ColWidths[0] := 120;
      ColWidths[1] := 300;
      ColWidths[2] := 70;
      ColWidths[3] := 100;
      ColWidths[4] := 120;
      ColWidths[5] := 80;
      ColWidths[6] := 120;
      ColWidths[7] := 80;
      ColWidths[8] := 100;
      ColWidths[9] := 0;
      ColWidths[10] := 0;
      ColWidths[11] := 0;
      ColWidths[12] := 0;
      ColWidths[13] := 0;

      ColumnSize.StretchColumn := 1;
      ColumnSize.Stretch := True;



  end;
end;



function TFpenerimaanBarang.CariIsi(barcode, Satuan: string): Extended;
begin
    ExQry(dm.Q5,'select mt.isi from multisatuan mt '+
  ' WHERE mt.satuan="'+satuan+'" AND (mt.kodebarcode="'+barcode+'" or mt.kodebarang="'+barcode+'")',True);

  if dm.Q5.IsEmpty then begin
     ExQry(dm.Q4,'SELECT isi FROM barang WHERE satuanbeli="'+satuan+'" AND (kodebarcode="'+barcode+'" or kodebarang="'+barcode+'")',TRue);
     Result :=   dm.Q4.Fields[0].AsFloat;
  end
  else
  begin
    Result := dm.Q5.Fields[0].AsFloat;
  end;

end;

procedure TFpenerimaanBarang.cxgrd2TableView1Editing(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
begin
   AAllow := (Sender.Controller.FocusedItem.Index in [ 4]);

end;

procedure TFpenerimaanBarang.cxgrd2TableView1InitEdit(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit);
begin
  AEdit.Style.Color := clYellow;
end;

procedure TFpenerimaanBarang.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  aList.Free;
end;

procedure TFpenerimaanBarang.FormCreate(Sender: TObject);
begin
  FpenerimaanBarang := Self;

  BuatGrid;
  sg1.ControlLook.DropDownAlwaysVisible := True;
end;

procedure TFpenerimaanBarang.FormShow(Sender: TObject);
begin
  alist := TStringList.Create;
   setTanggal(Self);

end;



function TFpenerimaanBarang.GetHargaBeli(kodebarang: string; HargaBaru       : Real;   JumlahBaru      : Real;
  var saldolama: Real): Real;
var
  HargaLama       : Real;
  StokLama        : Real;
  HargaRata_rata  : Real;
begin
  ExQry(dm.Q1,'   SELECT hargabeli from hargabelirata WHERE kodebarang="'+kodeBarang+'" LIMIT 1 ',True);

  HargaLama := GetValF(dm.Q1,'hargabeli');

  ExQry(dm.Q1,  ' SELECT  SUM(ks.saldoawal + ks.masuk - ks.keluar) as stok '+
                ' FROM kartustok ks WHERE ks.kodebarang="'+kodeBarang+'" '+
                '  AND MONTH(tgl)="'+intTOStr(MonthOf(now))+'" '+
                ' AND YEAR(tgl)="'+intToStr(YearOf(now))+'"',True);

  StokLama  := GetValF(dm.Q1,'stok');
  saldolama := StokLama;
  if ( saldolama + JumlahBaru > 0)  then

  HargaRata_rata := ((HargaLama * StokLama) + (HargaBaru * JumlahBaru)) / ( StokLama + JumlahBaru ) else
  HargaRata_rata := HargaBaru;


  Result         := HargaRata_rata;
end;



procedure TFpenerimaanBarang.sg1GetEditorProp(Sender: TObject; ACol,
  ARow: Integer; AEditLink: TEditLink);
begin
    with sg1 do
    case acol of
    8 : begin
        ClearComboString;

        OpenTable(dm.Q2,['idlokasi','namalokasi'],'lokasi');

        while dm.Q2.Eof = False do begin
          Combobox.Items.Add(dm.Q2.Fields[1].AsString);
          dm.Q2.Next;

        end;
        Combobox.ItemIndex := 0;

    end;
   end;
end;

procedure TFpenerimaanBarang.sg1GetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  if ACol in [8] then
    AEditor := edComboList;
end;

procedure TFpenerimaanBarang.sg1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    isi : Real;
begin
  if sg1.Col = 5 then begin

    if CellF(sg1.Cells[3,sg1.Row]) - CellF(sg1.Cells[4,sg1.Row]) < CellF(sg1.Cells[5,sg1.Row]) then
    begin
      Error('Jumlah input melebihi jumlah kekurangan');
      sg1.Cells[5,sg1.Row] := FloatToStr(CellF(sg1.Cells[3,sg1.Row]) - CellF(sg1.Cells[4,sg1.Row]));
      Exit;
    end else begin
      isi := CariIsi(sg1.Cells[0,sg1.Row],sg1.Cells[2,sg1.Row]);
      sg1.Cells[7,sg1.Row] := GetRupiah(FloatToStr(isi * CellF(sg1.Cells[5,sg1.Row])));
      sg1.Cells[6,sg1.Row] := GetRupiah(FloatToStr(CellF(sg1.Cells[3,sg1.Row]) - CellF(sg1.Cells[4,sg1.Row]) -CellF(sg1.Cells[5,sg1.Row])));
    end;
  end;
end;

procedure TFpenerimaanBarang.sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if ACol in [5,8] then
     sg1.Options := sg1.Options + [goEditing] else
     sg1.Options := sg1.Options - [goEditing];


end;



procedure TFpenerimaanBarang.TampilAwal;
begin
  ClearText(Self);
  ENobukti.Text := GetCode(dm.Q1,'penerimaanbarang','nobukti','TB'+setIdKom);
  BuatGrid;
  OpenTable(dm.Q1,['*'],'profile');

end;

end.
