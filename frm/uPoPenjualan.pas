unit uPoPenjualan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls,
  cxButtons, cxDropDownEdit, cxMaskEdit, cxCalendar, cxTextEdit, cxGroupBox,
  uEngine, uComCtrl, uctrlFrm, uOvEdit, dxSkiniMaginary, cxCheckBox,IniFIles,
  strUtils, uTerbilang, ujosprint,Winapi.ShellAPI, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful,System.DateUtils, cxMemo, dxSkinMoneyTwins,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  TFpoPenjualan = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Enobukti: TcxTextEdit;
    ENamaCust: TcxTextEdit;
    btnCariSupplier: TcxButton;
    sg1: TAdvStringGrid;
    G2: TcxGroupBox;
    ETotal: TcxTextEdit;
    EkodeCust: TcxTextEdit;
    btnBaru: TcxButton;
    btnSimpan: TcxButton;
    btnCariPelanggan: TcxButton;
    btnCariBarang: TcxButton;
    btnHapus: TcxButton;
    Label13: TLabel;
    EScanBarcode: TcxTextEdit;
    btnFocus: TcxButton;
    stat1: TStatusBar;
    jPrint1: TJPRINTER;
    Label16: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Esubtotal: TcxTextEdit;
    Edisc: TcxTextEdit;
    EdiscRp: TcxTextEdit;
    EGrandTotal: TcxTextEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    E2: TcxTextEdit;
    E3: TcxTextEdit;
    lbl5: TLabel;
    m1: TcxMemo;
    lbl6: TLabel;
    lbl7: TLabel;
    dt1: TDateTimePicker;
    procedure sg1GetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: string);
    procedure FormCreate(Sender: TObject);
    procedure btnCariPelangganClick(Sender: TObject);
    procedure btnCariBarangClick(Sender: TObject);
    procedure sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg1KeyPress(Sender: TObject; var Key: Char);
    procedure sg1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnHapusClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure sg1GetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure btnBaruClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sg1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EScanBarcodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure btnBukaPendingClick(Sender: TObject);
    procedure btnFocusClick(Sender: TObject);
    procedure btnCopyNotaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CInvoiceKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdiscPropertiesChange(Sender: TObject);
    procedure E2PropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

  public
    isEdit : boolean;
    function CariIsi(barcode:string;Satuan:string):Extended;
    procedure TampilAwal;
    procedure CreateGrid;
    procedure bersihCell;
    procedure ReplaceData;
    procedure Focus;
    procedure Simpan;
    procedure HitungTotal;
    procedure HitungSubtotal(Arow:Integer);
    function ToFloat(ACol:Integer;ARow:integer):Extended;
    function Posisi(kodebarcode:String;stn:string):integer;
    function  GetHarga(kdBarcode:string;satuan:String) : Extended;
    function  cekQty(kodebarcode:String;jml:real;stn:string):Real;
    procedure bersihkanGrid;
    function RataKanan(pjg : Integer;txt:string): string;
    function Header(txt : string):string;
    function Sparator(txt : string):string;
    function vItems(Hrg:string;qty:string;stn:string;subt:string):String;
    function vTotal(lbl:string;vValue:string):string;
    procedure BukaLaci;
    { Public declarations }
  end;


var
  FpoPenjualan: TFpoPenjualan;
  aList : TStringList;
  sNota       : String;
  Grosir,Partai : Boolean;
implementation

{$R *.dfm}

uses udm, uCaripelanggan, uCariBarang, uMainMenu, uBayar, uDlaporan,
  uPendingTransaksi, uCopyNota, uPilihSatuan, uDtrx, uSalesOrder,
  uPasswordAdmin, uCariSales;

procedure TFpoPenjualan.bersihCell;
var
  c:integer;
begin
  for c := 0 to sg1.ColCount -1 do
  sg1.Cells[c,sg1.Row] :='';
end;

procedure TFpoPenjualan.bersihkanGrid;
var
  i : integer;
  x : integer;
begin
  for i := 1 to sg1.RowCount -1 do
  for x := 0 to sg1.ColCount -1 do
    sg1.Cells[x,i] := '';
  sg1.RowCount := 2;

end;

procedure TFpoPenjualan.btnBaruClick(Sender: TObject);
begin
  TampilAwal;
end;

procedure TFpoPenjualan.btnBukaPendingClick(Sender: TObject);
begin
  FpendingTransaksi.Show;
end;

procedure TFpoPenjualan.btnCariBarangClick(Sender: TObject);
begin

   ExQry(dm.Qcaribarang,FcariBarang._SQLCaribarang+'  GROUP BY b.kodebarang',True);
   FcariBarang.Show;
   FcariBarang.isFormTransaksi := 9;
end;

procedure TFpoPenjualan.btnHapusClick(Sender: TObject);
begin

  if MessageDlg('Apakah yakin akan dihapus',mtConfirmation,[Mbyes,Mbno],0)=mrYes then
  begin
  if (sg1.RowCount >= 2)  then
  begin
    if (sg1.Cells[9,sg1.Row] <>'') or (sg1.Cells[2,sg1.Row] <>'') then
    begin
      try
        Bersihcell;
        ReplaceData;
        if (sg1.Row <> sg1.RowCount -1) and (sg1.Cells[1,sg1.RowCount -1] = '') then
        sg1.RowCount :=  sg1.RowCount -1;
        HitungTotal;
        Focus;
      except
        Peringatan('Tidak ada data transaksi');
      end;
    end else
    Peringatan('Data yang dipilih kosong');
  end;
  end else
  exit;
end;


procedure TFpoPenjualan.btnSimpanClick(Sender: TObject);
begin
  if sg1.Cells[1,1] = '' then begin
    Error('Belum ada transaksi');
  end else
    Simpan;

end;

procedure TFpoPenjualan.btnCariPelangganClick(Sender: TObject);
begin
  Fcaripelanggan.Show;
  ExQry(dm.Qpelanggan,Fcaripelanggan.sqlPelanggan,True);
  Fcaripelanggan.isFormPelanggan := 4;
end;

procedure TFpoPenjualan.btnCopyNotaClick(Sender: TObject);
begin
  FCopyNota.Show;
end;

procedure TFpoPenjualan.btnFocusClick(Sender: TObject);
begin
  Focus;
end;

procedure TFpoPenjualan.btnTutupClick(Sender: TObject);
begin
  FpasswordAdmin.Show;
  FpasswordAdmin.isFOrmPassword := 1;

end;

procedure TFpoPenjualan.BukaLaci;

var
  Path : String;
begin
  Path := ExtractFilePath(Application.ExeName)+'buka.exe';

  ShellExecute(handle,'Open',
    pChar(Path),
    nil,nil,SW_hide);


end;

function TFpoPenjualan.CariIsi(barcode, Satuan: string): Extended;
begin
  ExQry(dm.Q1,'select mt.isi from multisatuan mt LEFT JOIN '+
  ' barang b ON b.kodebarang=mt.kodebarang '+
  ' WHERE mt.satuan="'+satuan+'" AND b.kodebarcode="'+barcode+'"',True);

  if dm.Q1.IsEmpty then
     Result :=   1
  else
  begin
    Result := dm.Q1.Fields[0].AsFloat;
  end;
end;


function TFpoPenjualan.cekQty(kodebarcode: String; jml: real;stn:String): Real;
var
  harga : Real;
begin
      harga := GetHarga(kodebarcode,stn);
      ExQry(dm.Q3,'select q.harga,q.qtyawal,q.qtyakhir,b.satuanjual From multiqty q LEFT '+
      ' JOIN barang b ON b.kodebarang=q.kodebarang where q.kodebarang="'+kodebarcode+'"',True);


      if not dm.Q3.IsEmpty then begin

        while not dm.Q3.Eof do begin
          if stn = GetVal(dm.Q3,'satuanjual') then begin

            if (jml >= GetValF(dm.Q3,'qtyawal')) and (jml < GetValF(dm.Q3,'qtyakhir')) then  begin
               Result := GetValF(dm.Q3,'harga');
               Break;

            end else
            Result := harga;
          end;
          dm.Q3.Next;
        end;

        end else
        Result := harga;

end;


procedure TFpoPenjualan.CInvoiceKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    Focus;
end;

procedure TFpoPenjualan.CreateGrid;
var
  c,r :integer;
begin
  with sg1 do
  begin
    for c:=0 to ColCount do
    for r:=0 to RowCount do
    Cells[c,r]:='';

    ColCount    := 11;
    RowCount    := 2 ;



    Cells[0,0]  := 'NO';
    Cells[1,0]  := 'KODE BARANG';
    Cells[2,0]  := 'NAMA BARANG';
    Cells[3,0]  := 'HARGA';
    Cells[4,0]  := 'DISC(%)';
    Cells[5,0]  := 'DISC(Rp)';
    Cells[6,0]  := 'SATUAN';
    Cells[7,0]  := 'QTY';
    Cells[8,0]  := 'SUBTOTAL ';
    Cells[9,0]  := 'Isi ';
    Cells[10,0]  := 'kodebarang ';

    ColWidths[0]:= 50;
    ColWidths[1]:= 200;
    ColWidths[2]:= 350;
    ColWidths[3]:= 100;
    ColWidths[4]:= 60;
    ColWidths[5]:= 60;
    ColWidths[6]:= 60;
    ColWidths[7]:= 70;
    ColWidths[8]:= 120;
    ColWidths[9]:= 0;
    ColWidths[10]:= 0;

 end;

end;

procedure TFpoPenjualan.E2PropertiesChange(Sender: TObject);
begin
  HitungTotal;
end;

procedure TFpoPenjualan.EdiscPropertiesChange(Sender: TObject);
begin
  HitungTotal;
end;

procedure TFpoPenjualan.EScanBarcodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
  i : integer;

  status : string;
begin
  case Key of
  VK_RETURN : begin
                 OpenTable(dm.Q1,['kodepelanggan','namapelanggan','idjenispelanggan','poin','maxjmlinvoice'],'pelanggan WHERE kodepelanggan="'+EScanBarcode.Text+'"');
                 if dm.Q1.IsEmpty = False then begin
                    ENamaCust.Text := GetVal(dm.Q1,'namapelanggan')+' POIN : ['+GetValR(dm.Q1,'poin')+']';
                    EkodeCust.Text := GetVal(dm.Q1,'kodepelanggan');
                    status         := GetVal(dm.Q1,'idjenispelanggan');
                    for i := 1  to sg1.RowCount -1 do
                      begin
                        if sg1.Cells[1,i] <> '' then

                        {exQry(dm.Q3,'select hargaecer,hargagrosir,hargapartai,hargapartai4,hargapartai5 '+
                                          'From barang where kodebarcode="'+sg1.Cells[1,i]+'"',True);

                          if (UpperCase(status) ='5') then begin
                           if (dm.Q3.Fields[1].AsFloat <> 0) then
                               sg1.Cells[3,i]    := GetRupiah(dm.Q3.Fields[1].AsString)
                              else
                               sg1.Cells[3,i]    := GetRupiah(dm.Q3.Fields[0].AsString);
                          end else
                          if (UpperCase(status) ='4') then begin
                           if dm.Q3.Fields[0].AsFloat <> 0 then
                              sg1.Cells[3,i]  := GetRupiah(dm.Q3.Fields[0].AsString)
                              else
                              sg1.Cells[3,i]  := GetRupiah(dm.Q3.Fields[0].AsString);
                          end else
                          if UpperCase(status) ='6' then begin
                           if dm.Q3.Fields[2].AsFloat <> 0 then
                              sg1.Cells[3,i]  := GetRupiah(dm.Q3.Fields[2].AsString)
                              else
                              sg1.Cells[3,i]  := GetRupiah(dm.Q3.Fields[0].AsString);
                          end;
                           if UpperCase(status) ='7' then begin
                           if dm.Q3.Fields[3].AsFloat <> 0 then
                              sg1.Cells[3,i]  := GetRupiah(dm.Q3.Fields[3].AsString)
                              else
                              sg1.Cells[3,i]  := GetRupiah(dm.Q3.Fields[0].AsString);
                          end;
                           if UpperCase(status) ='8' then begin
                           if dm.Q3.Fields[4].AsFloat <> 0 then
                              sg1.Cells[3,i]  := GetRupiah(dm.Q3.Fields[4].AsString)
                              else
                              sg1.Cells[3,i]  := GetRupiah(dm.Q3.Fields[0].AsString);
                          end;      }

                        HitungSubtotal(i);


                    end;
                    HitungTotal;
                    Focus;
                 end else
                 begin
                   btnCariPelanggan.Click;
                 end;

              end;
  end;

end;

procedure TFpoPenjualan.Focus;
begin
  sg1.SetFocus;
  sg1.Options := sg1.Options + [goEditing];
  sg1.Options := sg1.Options - [goRowSelect];
  sg1.Row := sg1.RowCount -1;
  sg1.Col :=1;
  bersihCell;
end;

procedure TFpoPenjualan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  aList.Free;
end;

procedure TFpoPenjualan.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 if MessageDlg('Yakin menutup program?',
       mtConfirmation,[mbYes,mbNo],0)=mrYes then begin
    CanClose := True;

 end ELSE
 CanClose := False;
end;

procedure TFpoPenjualan.FormCreate(Sender: TObject);
begin

  FpoPenjualan := Self;
  CreateGrid;
 // AturGrid(sg1,8);
end;

procedure TFpoPenjualan.FormResize(Sender: TObject);
begin

    // AturGrid(sg1,9);
  AturGridx(sg1,2);
end;

procedure TFpoPenjualan.FormShow(Sender: TObject);
begin
  aList := TStringLIst.Create;
  stat1.Panels[3].Text := Fmain.sbr1.Panels[1].Text;
  AturGridx(sg1,2);
  Focus;
end;

function TFpoPenjualan.GetHarga(kdBarcode: string;satuan:string): Extended;
var
  qry   : string;
  stts  : string;
begin

  qry   := 'SELECT idjenispelanggan from pelanggan where kodepelanggan="'+Ekodecust.Text+'"';
  ExQry(dm.Q3,qry,True);
  stts  := dm.Q3.Fields[0].AsString;

  qry   := ' SELECT hargaecer,hargagrosir,hargapartai,hargapartai4,hargapartai5 FROM barang where '+
           ' kodebarang="'+kdBarcode+'" ';

  ExQry(dm.Q2,qry,True);

  if GetValF(dm.Q2,'hargagrosir') > 0 then
     Grosir := True else Grosir := False;
  if GetValF(dm.Q2,'hargapartai') > 0 then
  Partai := True else Partai := False;

  if (UpperCase(stts) ='5') then begin
     if (dm.Q2.Fields[1].AsFloat <> 0) then
        Result    := dm.Q2.Fields[1].AsFloat
     else
        Result    := dm.Q2.Fields[0].AsFloat;
  end else
  if (UpperCase(stts) ='4') then begin
     if dm.Q2.Fields[0].AsFloat <> 0 then
        Result := dm.Q2.Fields[0].AsFloat
     else
        Result := dm.Q2.Fields[0].AsFloat;

    // ShowMessage(dm.Q2.Fields[0].AsString);
  end else
  if UpperCase(stts) ='6' then begin
     if dm.Q2.Fields[2].AsFloat <> 0 then
        Result := dm.Q2.Fields[2].AsFloat
     else begin

        Result := dm.Q2.Fields[0].AsFloat;
     end;
  end;

 { if not ( StrToIntDef(stts,0) in [4,5,6,7,8]) then
     Result := dm.Q2.Fields[0].AsFloat;}

end;


function TFpoPenjualan.Header(txt: string): string;
var
  i : integer;
  jmltext : Integer;
  Lebar   : Integer;
  Sisa    : Integer;
  Hasil   : String;

begin
  Lebar   := 40;
  jmltext := Length(txt);


  Sisa := Lebar - jmltext;
  Sisa := Sisa div 2;


  Hasil := '';
  for i:= 1 to Sisa do begin
    Hasil := Hasil +' ';
  end;
  Result := Hasil + txt + Hasil;

end;

procedure TFpoPenjualan.HitungSubtotal(AROW:Integer);
var
  Harga , Jumlah ,SubTotal : Real;
  isiJual : Real;
  HargaNormal : Real;
  SelisihDiskon : Real;
  stts : string;
  hDiskon : Real;
begin
  with sg1 do begin
    Jumlah       := StrToFloatDef(koma(Cells[7,aRow]),0);
    HargaNormal  := StrToFloatDef(nilai(Cells[3,aRow]),0);



      OpenTable(dm.Q5,['idjenispelanggan'],'pelanggan WHERE kodepelanggan="'+EkodeCust.Text+'"');
      stts := GetVal(dm.Q5,'idjenispelanggan');

    if (stts = '4')  then begin

        if ((sg1.Col = 7) or (sg1.Col = 1)) and (CellF(sg1.Cells[7,Arow]) <> 1) then

        hDiskon := cekQty(sg1.Cells[10,AROW],Jumlah,sg1.Cells[6,AROW]) else
        hDiskon := GetHarga(sg1.Cells[10,AROW],sg1.Cells[6,0]);
    end else if stts = '5' then begin

       if (Grosir = False) then begin

          if ((sg1.Col = 7) or (sg1.Col = 1)) and (CellF(sg1.Cells[7,Arow]) <> 1) then
          hDiskon := cekQty(sg1.Cells[10,AROW],Jumlah,sg1.Cells[6,AROW]) else
          hDiskon := HargaNormal;
       end else
         hDiskon := GetHarga(sg1.Cells[10,AROW],sg1.Cells[6,0]);

    end else if stts = '6' then begin

       if (Partai = False) then  begin

          if ((sg1.Col = 7) or (sg1.Col = 1)) and (CellF(sg1.Cells[7,Arow]) <> 1) then
          hDiskon := cekQty(sg1.Cells[10,AROW],Jumlah,sg1.Cells[6,AROW]) else
          hDiskon := HargaNormal;
       end else
       hDiskon := GetHarga(sg1.Cells[10,AROW],sg1.Cells[6,0]);

    end;


      { if (sg1.Col = 1 )  then
         Harga        := StrToFloatDef(cekQty(sg1.Cells[10,AROW],Jumlah,sg1.Cells[6,AROW]),0) else
       if (sg1.Col = 7) then
         Harga        := StrToFloatDef(cekQty(sg1.Cells[10,AROW],Jumlah,sg1.Cells[6,AROW]),0)
       else   }

       Harga        := hDiskon;


        if Harga < HargaNormal then begin

           SelisihDiskon := (HargaNormal - Harga);
           SelisihDiskon := SelisihDiskon / HargaNormal;
           Cells[4,aRow] :=  Format('%.2n',[SelisihDIskon]);
           Cells[5,Arow] := Format('%.0n',[HargaNormal - Harga]);
        end else begin

           Cells[4,Arow] := '0';
           Cells[5,Arow] := '0';
        end;






        isiJual      := CariIsi(Cells[1,aRow],Cells[6,aRow]) * Jumlah;
        SubTotal     := Harga * Jumlah;

        Cells[8,aRow] := GetRupiah(FloatToStr(Subtotal));
        Cells[9,aRow] := GetRupiah(FloatToStr(isiJual));

  end;
end;

procedure TFpoPenjualan.HitungTotal;
var
  Total , Diskon, PPn, GrandTotal : Real;
  DiskonPesen,DiskonRUpiah,PPnPersen,PPnRupiah : Real;
begin
  Esubtotal.Text := GetRupiah(SumGrid(sg1,8));

  Total       := Esubtotal.AsFLoat;
  DiskonPesen := Edisc.AsFLoat;

  DiskonRUpiah:= Round(Total * DiskonPesen / 100);

  if DiskonPesen > 0 then
     EdiscRp.Text := GetRupiah(FloatToStr(DiskonRUpiah));


  Diskon      := EdiscRp.AsFLoat;
  PPnPersen   := E2.AsFLoat;

  PPnRupiah   := Round(Total * PPnPersen /100);
  E3.Text     := GetRupiah(FloatToStr(PPnRupiah));

  PPn         := E3.AsFLoat;

  GrandTotal  := Total - Diskon + PPn;

  EGrandTotal.Text := GetRupiah(FloatToStr(GrandTotal));
  ETotal.Text      := GetRupiah(FloatToStr(GrandTotal));

end;

function TFpoPenjualan.Posisi(kodebarcode: String;stn:string): integer;
var
  i:integer;
  hasil : integer;
begin
  for i := 1 to sg1.RowCount-1  do begin
    if (sg1.Cells[1,i] = kodebarcode) and (sg1.Cells[6,i] = stn) then begin
      hasil  := i;

      Break;
    end else
      hasil  := 0;
  end;
  Result := hasil;
end;

function TFpoPenjualan.RataKanan(pjg: Integer; txt: string): string;
var
   i : integer;
   Panjang : Integer;
   mulai  : String;
   sisa : Integer;
begin
  Panjang := Length(txt);
  sisa := pjg - panjang;

  mulai := '';
  for I := 1 to sisa do
    mulai := mulai + ' ';

  Result := mulai + txt;


end;

procedure TFpoPenjualan.ReplaceData;
var
  i:integer;
begin
  for i := sg1.row to sg1.RowCount -1 do
  begin
    sg1.Cells[0,i]:= Inttostr(i);
    sg1.Cells[1,i]:= sg1.Cells[1,i+1];
    sg1.Cells[2,i]:= sg1.Cells[2,i+1];
    sg1.Cells[3,i]:= sg1.Cells[3,i+1];
    sg1.Cells[4,i]:= sg1.Cells[4,i+1];
    sg1.Cells[5,i]:= sg1.Cells[5,i+1];
    sg1.Cells[6,i]:= sg1.Cells[6,i+1];
    sg1.Cells[7,i]:= sg1.Cells[7,i+1];
    sg1.Cells[8,i]:= sg1.Cells[8,i+1];
    sg1.Cells[9,i]:= sg1.Cells[9,i+1];
    sg1.Cells[10,i]:= sg1.Cells[10,i+1];


  end;
end;

procedure TFpoPenjualan.sg1GetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow > 0 then begin
    if ACol in [3,4,5,8,9] then
       HAlign := taRightJustify
    else if ACOl in [6, 7 ] then
       HAlign := taCenter;
  end;

end;

procedure TFpoPenjualan.sg1GetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: string);
begin
  if (ACol in [3,8,9]) then
      begin
        isFloat := True;
        FloatFormat :='%.0n';
      end
  else
       isFloat := False;
end;

procedure TFpoPenjualan.sg1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 pas : Integer;
 hrg : Real;
 isiJual,jml,qty : Real;
 ppn : Real;
 satuan :String;
begin
  if  (Sg1.Col = 1) and (key = 13)  then BEGIN
       if COPY(sg1.Cells[1,sg1.Row],1,1) = '+' then begin
          jml                     := StrToFloatDef(StringReplace(sg1.Cells[1,sg1.Row],'+','',[rfReplaceAll]),0);
          sg1.Cells[7,sg1.Row -1] := Koma(FloatToStr(jml));


          HitungSubtotal(sg1.Row-1);
          HitungTotal;


          bersihCell;
       end else begin
       if (sg1.Cells[1,sg1.Row] <> '') then begin

            ExQry(dm.Q1,FcariBarang._SQLCaribarang+' WHERE (m.kodebarcode="'+sg1.Cells[1,Sg1.Row]+'" '+
            ' OR b.kodebarcode="'+sg1.Cells[1,Sg1.Row]+'" OR b.kodebarang="'+sg1.Cells[1,Sg1.Row]+'" '+
            ' OR b.namabarang LIKE "%'+sg1.Cells[1,sg1.Row]+'%")',True);

            if Dm.Q1.RecordCount > 1 then begin
               ExQry(dm.Qcaribarang,FcariBarang._SQLCaribarang+' WHERE (namabarang like"%'+sg1.Cells[1,sg1.Row]+'%" '+
               ' or kodebarcode like"%'+sg1.Cells[1,sg1.Row]+'") GROUP BY b.kodebarang',True);
               FcariBarang.Show;
               FcariBarang.isFormTransaksi := 9;

            end else begin

                sg1.Cells[0,sg1.Row] := IntToStr(sg1.Row);
                sg1.Cells[1,sg1.Row] := GetVal(dm.Q1,'kodebarcode');
                sg1.Cells[10,sg1.Row]:= GetVal(dm.Q1,'kodebarang');
                sg1.Cells[2,sg1.Row] := GetVal(dm.Q1,'namabarang');
                sg1.Cells[6,sg1.Row] := GetVal(dm.Q1,'satuan');
                hrg                  := GetValF(dm.Q1,'harga');
                sg1.Cells[3,sg1.Row] := FloatTostr(hrg);
                sg1.Cells[4,sg1.Row] := '';
                sg1.Cells[5,sg1.Row] := '';

                sg1.Cells[7,sg1.Row] := '1';



                pas    := Posisi(UPPERCASE(GetVal(dm.Q1,'kodebarcode')),sg1.Cells[6,sg1.Row]);


                if (pas <> 0) and (pas <> sg1.Row) then begin

                    ppn               := GetValF(dm.Q1,'ppn');
                    sg1.Cells[7,pas]  := FloatToStr(StrToFloatDef(sg1.Cells[7,pas],0)+1);

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

                  if sg1.Cells[1,sg1.RowCount -1] <>'' then
                  begin
                    sg1.RowCount := sg1.RowCount + 1;
                    Focus;
                    BersihCell;
                  end;

                  Focus;
                end;
                HitungTotal;
            end;
          end else
          begin

             ExQry(dm.QcariBarang,FcariBarang._SQLCaribarang+' WHERE (b.namabarang like"%'+sg1.Cells[1,sg1.Row]+'%" '+
            ' or b.kodebarcode like"%'+sg1.Cells[1,sg1.Row]+'")  GROUP BY b.kodebarang',True);
            FcariBarang.Show;
            FcariBarang.isFormTransaksi := 9;
          end;
      end;
      HitungTotal;
    end else begin
          if ( sg1.Col in [2..6] ) and (key = 13) then
             begin
              sg1.Row := sg1.Row;
              sg1.Col := sg1.Col + 1
             end
          else If ( sg1.Col in [7] ) and (key = 13) then
              Focus;
    end;


    case KEy of
   VK_INSERT : begin
                 if sg1.Cells[1,sg1.Row] = '' then
                    Warning('Silahkan pilih item barang dulu!!')
                 else
                    begin
                      ExQry(dm.QMultiSatuan,'SELECT s.*,(b.hargabeli * s.isi) as hargabeli FROM multisatuan s left join barang b '+
                      ' ON b.kodebarang=s.kodebarang WHERE b.kodebarang="'+sg1.Cells[10,sg1.Row]+'"',True);
                      if DM.QMultiSatuan.IsEmpty then
                         Warning('Tidak ada multi satuan')
                      else begin
                         FpilihSatuan.Show;
                         FpilihSatuan.cHargabeli.Visible := False;
                         FpilihSatuan.cHarga.Visible     := True;

                         FpilihSatuan.isFormSatuan := 0;
                      end;
                    end;
               end;
   VK_F10     : Edisc.SetFocus;
   VK_F5      : E2.SetFocus;
   end;
end;

procedure TFpoPenjualan.sg1KeyPress(Sender: TObject; var Key: Char);
begin
  if sg1.Col in [4,5,7,8,9]  then begin

     if not (key in['0'..'9',#13,#8,#10,',','.']) then
        key:=#0;
  end;

end;

procedure TFpoPenjualan.sg1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if sg1.Col in [4,5,7,8,9]  then begin
      HitungSubtotal(sg1.Row);
      HitungTotal;
   end;


   if (Key = 66) and (Shift = [ssCtrl]) then
   begin
      sg1.Options  := sg1.Options + [goRowSelect];
      sg1.Options  := sg1.Options - [goEditing];
      sg1.Row      := 1;
      sg1.Col      := 1;
   end;
   if (Key = 70) and (Shift = [ssCtrl]) then
   begin
      BukaLaci;
   end;

end;

procedure TFpoPenjualan.sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);

begin
   OpenTable(dm.Q1,['editharga'],'m_user WHERE iduser="'+stat1.Panels[3].Text+'"');
   if ACol in [1,3,7] then begin
      if (ACol = 3) and (GetValBol(dm.Q1,'editharga') = False) then
         sg1.Options := sg1.Options -[goEditing] else

      sg1.Options := sg1.Options +[GoEditing];
   end
  else
    sg1.Options := sg1.Options -[goEditing];
end;

procedure TFpoPenjualan.Simpan;
var
  x : integer;
  idpelanggan,KodeBarang : string;
  hpp,hargajual : real;
begin


    idpelanggan := getData(dm.Q2,'pelanggan where kodepelanggan="'+EkodeCust.Text+'"','idpelanggan');
    dm.Q1.Connection.StartTransaction;
    try

      addParam('nomerpo',   Enobukti.Text,            aList,'str');
      addParam('tgljual',      frmTgl(dt1.Date),     aList,'date');

      addParam('idpelanggan',  idpelanggan,              aList,'str');
      addParam('iduser',       stat1.Panels[3].Text,aList,'str');
      addParam('total',        SumGrid(sg1,8),aList,'str');
      addParam('diskon',       nilai(EdiscRp.Text),aList,'str');
      addParam('ppn',          nilai(E2.Text),aList,'str');
      addParam('grandtotal',   EGrandTotal.isAngka,aList,'str');
      addParam('komputerid',   setIdKom,aList,'str');


      OpenTable(dm.Q2,['idjual'],'popenjualan where nomerpo="'+Enobukti.Text+'"');
      if Dm.Q2.IsEmpty then
         Post(dm.Q1,'popenjualan',alist)
      else
         UpdatePOST(dm.Q1,'popenjualan',alist,'idjual',GetVal(dm.Q2,'idjual'));

      hpp := 0;

      if (sg1.Cells[1,sg1.RowCount -1] <> '') and (sg1.Cells[8,sg1.RowCount -1] <> '') then
          sg1.RowCount := sg1.RowCount + 1;

      for x := 1 to sg1.RowCount -1 do
        begin

          if (sg1.Cells[1,x] <> '') and (sg1.Cells[8,x]<>'') then
          begin


              openTable(dm.Q2,['kodebarang','hargabeli'],'barang where kodebarang="'+sg1.cells[10,x]+'"');
              KodeBarang := Getval(dm.Q2,'kodebarang');

              hpp        := hpp + (Getvalf(dm.Q2,'hargabeli') * CellF(sg1.Cells[9,x])) ;
              hargajual  := StrToFloatDef(nilai(sg1.Cells[3,x]),0);
              addParam('nomerpo',  Enobukti.Text,          aList,'str');
              addParam('kodebarang',  KodeBarang,             Alist,'str');
              addParam('satuan',      sg1.Cells[6,x],         Alist,'str');
              addParam('harga',       FloatToStr(hargajual),  Alist,'str');
              addParam('hpp',         FloatToStr(Getvalf(dm.Q2,'hargabeli')),        Alist,'str');
              addParam('jumlah',      KomaDatabase(sg1.Cells[7,x]),   Alist,'str');
              addParam('diskonpersen',KomaDatabase(sg1.Cells[4,x]),   Alist,'str');
              addParam('diskonrupiah',nilai(sg1.Cells[5,x]),   Alist,'str');
              addParam('subtotal',    nilai(sg1.Cells[8,x]),  Alist,'str');
              addParam('isi',         KomaDatabase(sg1.Cells[9,x]), Alist,'str');

              Post(dm.Q1,'popenjualandetil',aList);

          end else
          if (sg1.Cells[1,x] = '') and (sg1.Cells[7,x]<>'') or (Sg1.Cells[2,x]<>'') then begin
            MessageBox(Handle,'Kode Barcode Harus Di Isi !! '+#13+' Silahkan Isi terlebih Dahulu !! '+#13+
                       'Atau batalkan item dengan menekan tombol [ DELETE ]','ERROR',MB_ICONERROR);
            sg1.Row := x;
            sg1.Col := 1;
            dm.Q1.Connection.Rollback;
            Abort;
          end;
        end;
          

          dm.Q1.Connection.Commit;
      except
        dm.Q1.Connection.Rollback;
      end;

    TampilAwal;
    Focus;
    isEdit := False;
end;

function TFpoPenjualan.Sparator(txt: string): string;

var
  I: Integer;
  hasil : String;
begin
  hasil:='';
  for I := 1 to 40 do
     hasil := hasil +txt;
  Result := hasil;


end;

procedure TFpoPenjualan.TampilAwal;
begin
  ClearText(Self);
  CreateGrid;
  AturGridx(sg1,2);
  Enobukti.Text  := GetCode(dm.Q1,'popenjualan','nomerpo','PO'+setIdKom);
  setTanggal(Self);
  bersihkanGrid;
  sNota :='';
  OpenTable(dm.Q1,['kodepelanggan','namapelanggan','alamat'],'pelanggan WHERE namapelanggan="UMUM"');
  if dm.Q1.IsEmpty then begin
    Warning('Data pelanggan umum masih kosong harap di isi dulu');
    FpoPenjualan.Close;

  end else
  begin
    ENamaCust.Text := GetVal(dm.Q1,'namapelanggan');
    EkodeCust.Text := GetVal(dm.Q1,'kodepelanggan');
    m1.Text        := GetVal(dm.Q1,'alamat');
  end;

  OpenTable(dm.Q1,['kodesales','namasales'],'sales WHERE namasales="UMUM"');
  if dm.Q1.IsEmpty then begin
    Warning('Data pelanggan umum masih kosong harap di isi dulu');
    FpoPenjualan.Close;

  end ;
  dt1.Date := now;
end;

function TFpoPenjualan.ToFloat(ACol, ARow: integer): Extended;
begin
if not ACOl in [3] then
    Result := StrToFloatDef(koma(sg1.Cells[aCol,aRow]),0)
  else
    Result := StrToFloatDef(nilai(sg1.Cells[aCol,aRow]),0);
end;

function TFpoPenjualan.vItems(Hrg, qty, stn, subt: string): String;
var


  jml : integer;


  txt : string;
begin


  txt   := DupeString(' ',1) + hrg;

  jml   := 9 - Length(txt);
  txt   := txt + DupeString(' ',jml) + 'X ' + qty;
  jml   := 13 - Length(txt);
  txt   := txt + DupeString(' ',jml)+ stn;
  jml   := 28 - Length(txt);
  txt   := txt + DupeString(' ',jml)+ '='+RataKanan(7,subt);
  Result := txt;


end;

function TFpoPenjualan.vTotal(lbl, vValue: string): string;
var
  i : integer;
  vlbl : Integer;
  jml : integer;

  Lebar : integer;
  hasilJumlah : string;

begin

  vlbl := Length(lbl);

  jml     := (35 - (vlbl + 10));


  hasilJumlah := '';
  for I := 1 to jml do
    hasilJumlah := hasilJumlah +' ';

  hasilJumlah   :=  hasilJumlah +'     =';


  Result := lbl + hasilJumlah +RataKanan(7,vValue);


end;

end.
