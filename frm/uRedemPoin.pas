unit uRedemPoin;

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
  dxSkinXmas2008Blue, dxSkinTheBezier;

type
  TFRedemPoin = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Enobukti: TcxTextEdit;
    sg1: TAdvStringGrid;
    G2: TcxGroupBox;
    btnBaru: TcxButton;
    btnSimpan: TcxButton;
    btnCariBarang: TcxButton;
    btnHapus: TcxButton;
    btnFocus: TcxButton;
    stat1: TStatusBar;
    jPrint1: TJPRINTER;
    Label15: TLabel;
    Label19: TLabel;
    Esubtotal: TcxTextEdit;
    dt1: TDateTimePicker;
    Label3: TLabel;
    Eketerangan: TcxMemo;
    Label11: TLabel;
    Label12: TLabel;
    cbGudang: TcxComboBox;
    Label6: TLabel;
    Label7: TLabel;
    ENamaPelanggan: TcxTextEdit;
    EKodePelanggan: TcxTextEdit;
    Label8: TLabel;
    Label9: TLabel;
    Epoin: TcxTextEdit;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    EConversi: TcxTextEdit;
    Label16: TLabel;
    ENilaiPoin: TcxTextEdit;
    Label17: TLabel;
    Label18: TLabel;
    EjumlahTukar: TcxTextEdit;
    Label20: TLabel;
    ENilaiTukarPoin: TcxTextEdit;
    cCashBack: TCheckBox;
    procedure sg1GetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: string);
    procedure FormCreate(Sender: TObject);
    procedure btnCariBarangClick(Sender: TObject);
    procedure sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg1KeyPress(Sender: TObject; var Key: Char);
    procedure sg1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnHapusClick(Sender: TObject);
    procedure sg1GetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure btnBaruClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sg1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFocusClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EConversiKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EjumlahTukarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cCashBackClick(Sender: TObject);
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
    procedure bersihkanGrid;
    function CheckStok(kodebarang:string;qty:Integer):Boolean;
    { Public declarations }
  end;



var
  FRedemPoin: TFRedemPoin;
  aList : TStringList;
  sNota       : String;
implementation

{$R *.dfm}

uses udm, uCaripelanggan, uCariBarang, uMainMenu, uPilihSatuan, uDtrx,
  uDlaporan;

procedure TFRedemPoin.bersihCell;
var
  c:integer;
begin
  for c := 0 to sg1.ColCount -1 do
  sg1.Cells[c,sg1.Row] :='';
end;

procedure TFRedemPoin.bersihkanGrid;
var
  i : integer;
  x : integer;
begin
  for i := 1 to sg1.RowCount -1 do
  for x := 0 to sg1.ColCount -1 do
    sg1.Cells[x,i] := '';
  sg1.RowCount := 2;

end;

procedure TFRedemPoin.btnBaruClick(Sender: TObject);
begin
  TampilAwal;
end;

procedure TFRedemPoin.btnCariBarangClick(Sender: TObject);
begin

   ExQry(dm.Qcaribarang,FcariBarang._SQLCaribarang+' GROUP BY b.kodebarang',True);
   FcariBarang.Show;
  FcariBarang.isFormTransaksi := 10;
end;

procedure TFRedemPoin.btnHapusClick(Sender: TObject);
begin

  if MessageDlg('Apakah yakin akan dihapus',mtConfirmation,[Mbyes,Mbno],0)=mrYes then
  begin
  if (sg1.RowCount >= 2)  then
  begin
    if (sg1.Cells[6,sg1.Row] <>'') or (sg1.Cells[2,sg1.Row] <>'') then
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

procedure TFRedemPoin.btnSimpanClick(Sender: TObject);
begin
  if NOT CheckEdit(Self) then begin
  if ENilaiTukarPoin.AsFLoat < Esubtotal.AsFLoat then begin
     Warning('Nilai poin yang ditukarkan lebih kecil dari Harga barang');

     if MessageDlg('Apakah akan melanjutkan proses penukaran POIN ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        Simpan;

  end else
    Simpan;
  end;
end;

procedure TFRedemPoin.btnFocusClick(Sender: TObject);
begin
  Focus;
end;



function TFRedemPoin.CariIsi(barcode, Satuan: string): Extended;
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






procedure TFRedemPoin.cCashBackClick(Sender: TObject);
begin
  Esubtotal.Text :=  ENilaiPoin.Text;
end;

function TFRedemPoin.CheckStok(kodebarang: string; qty: Integer): Boolean;
var
  Stok : Integer;
begin
  ExQry(dm.Q1,FcariBarang._SQLCaribarang+' WHERE  b.kodebarang="'+kodebarang+'" GROUP BY b.kodebarang',True);
  Stok := GetValInt(dm.Q1,'STOK');

  if Stok < qty then
     Result := False else
  Result := True;

end;

procedure TFRedemPoin.CreateGrid;
var
  c,r :integer;
begin
  with sg1 do
  begin
    for c:=0 to ColCount do
    for r:=0 to RowCount do
    Cells[c,r]:='';

    ColCount    := 9;
    RowCount    := 2 ;



    Cells[0,0]  := 'NO';
    Cells[1,0]  := 'KODE BARANG';
    Cells[2,0]  := 'NAMA BARANG';
    Cells[3,0]  := 'HARGA';
    Cells[4,0]  := 'SATUAN';
    Cells[5,0]  := 'QTY';
    Cells[6,0]  := 'SUBTOTAL ';
    Cells[7,0]  := 'Isi ';
    Cells[8,0]  := 'kodebarang ';

    ColWidths[0]:= 50;
    ColWidths[1]:= 200;
    ColWidths[2]:= 350;
    ColWidths[3]:= 100;
    ColWidths[4]:= 60;
    ColWidths[5]:= 70;
    ColWidths[6]:= 120;
    ColWidths[7]:= 0;
    ColWidths[8]:= 0;

    ColumnSize.StretchColumn := 2;
    ColumnSize.Stretch       := True;

 end;

end;

procedure TFRedemPoin.EConversiKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ENilaiPoin.Text := Format('%.0n',[Epoin.AsFLoat * Econversi.AsFLoat]);
end;

procedure TFRedemPoin.EjumlahTukarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ENilaiTukarPoin.Text := Format('%.0n',[EjumlahTUkar.AsFLoat * Econversi.AsFLoat]);
end;

procedure TFRedemPoin.Focus;
begin
  sg1.SetFocus;
  sg1.Options := sg1.Options + [goEditing];
  sg1.Options := sg1.Options - [goRowSelect];
  sg1.Row := sg1.RowCount -1;
  sg1.Col :=1;
  bersihCell;
end;

procedure TFRedemPoin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  aList.Free;
end;

procedure TFRedemPoin.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 if MessageDlg('Yakin menutup program?',
       mtConfirmation,[mbYes,mbNo],0)=mrYes then begin
    CanClose := True;

 end ELSE
 CanClose := False;
end;

procedure TFRedemPoin.FormCreate(Sender: TObject);
begin
  isiCmb(dm.Q1,'lokasi',['idlokasi','namalokasi'],cbGudang);
  EConversi.isRupiah := True;
  CreateGrid;
end;

procedure TFRedemPoin.FormShow(Sender: TObject);
begin
  aList := TStringLIst.Create;
  stat1.Panels[3].Text := Fmain.sbr1.Panels[1].Text;
  dt1.Date := now;

end;




procedure TFRedemPoin.HitungSubtotal(AROW:Integer);
var
  Harga , Jumlah , DiskonPersen,SubTotal,Diskon2,Diskon3 : Real;
  isiJual : Real;
  hargaDiskon1,HargaDiskon2,HargaDiskon3,FixHarga : Real;
begin
  with sg1 do begin
    Jumlah       := StrToFloatDef(koma(Cells[5,aRow]),0);
    Harga        := StrToFloatDef(nilai(Cells[3,aRow]),0);
    if CheckStok(sg1.Cells[8,aRow],StrToIntDef(koma(Cells[5,aRow]),0)) = False then
    begin
            Error('Stok tidak mencukupi');

            sg1.Cells[5,aRow] := '0';
            isiJual           := CariIsi(Cells[1,aRow],Cells[4,aRow]) * 1;
            Cells[6,aRow]     := GetRupiah(FloatToStr(0));
            Cells[7,aRow]     := GetRupiah(FloatToStr(0));
            Exit;
    end;
    isiJual      := CariIsi(Cells[1,aRow],Cells[4,aRow]) * Jumlah;

    SubTotal     := Harga * Jumlah;

    Cells[6,aRow] := GetRupiah(FloatToStr(Subtotal));
    Cells[7,aRow] := GetRupiah(FloatToStr(isiJual));
  end;
end;

procedure TFRedemPoin.HitungTotal;
var
  Total : Real;
begin
  Esubtotal.Text := GetRupiah(SumGrid(sg1,6));

end;

function TFRedemPoin.Posisi(kodebarcode: String;stn:string): integer;
var
  i:integer;
  hasil : integer;
begin
  for i := 1 to sg1.RowCount-1  do begin
    if (sg1.Cells[1,i] = kodebarcode) and (sg1.Cells[4,i] = stn) then begin
      hasil  := i;

      Break;
    end else
      hasil  := 0;
  end;
  Result := hasil;
end;








procedure TFRedemPoin.ReplaceData;
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

  end;
end;

procedure TFRedemPoin.sg1GetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow > 0 then begin
    if ACol in [3,6] then
       HAlign := taRightJustify
    else if ACOl in [4, 5 ] then
       HAlign := taCenter;
  end;

end;

procedure TFRedemPoin.sg1GetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: string);
begin
  if (ACol in [3,5,6]) then
      begin
        isFloat := True;
        FloatFormat :='%.0n';
      end
  else
       isFloat := False;
end;

procedure TFRedemPoin.sg1KeyDown(Sender: TObject; var Key: Word;
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
          sg1.Cells[5,sg1.Row -1] := Koma(FloatToStr(jml));

          HitungSubtotal(sg1.Row -1);;
          HitungTotal;
          bersihCell;
       end else begin
       if (sg1.Cells[1,sg1.Row] <> '') then begin

            ExQry(dm.Q1,FcariBarang._SQLCaribarang+' WHERE (m.kodebarcode="'+sg1.Cells[1,Sg1.Row]+'" '+
            ' OR b.kodebarcode="'+sg1.Cells[1,Sg1.Row]+'" OR b.kodebarang="'+sg1.Cells[1,Sg1.Row]+'" '+
            ' OR b.namabarang LIKE "%'+sg1.Cells[1,sg1.Row]+'%")',True);

            if Dm.Q1.RecordCount > 1 then begin
               ExQry(dm.Qcaribarang,FcariBarang._SQLCaribarang+' WHERE (b.namabarang like"%'+sg1.Cells[1,sg1.Row]+'%" '+
               ' or b.kodebarcode like"%'+sg1.Cells[1,sg1.Row]+'") GROUP BY b.kodebarang',True);
               FcariBarang.Show;
               FcariBarang.isFormTransaksi := 10;

            end else begin

                sg1.Cells[0,sg1.Row] := IntToStr(sg1.Row);
                sg1.Cells[1,sg1.Row] := GetVal(dm.Q1,'kodebarcode');
                sg1.Cells[8,sg1.Row] := GetVal(dm.Q1,'kodebarang');
                sg1.Cells[2,sg1.Row] := GetVal(dm.Q1,'namabarang');
                sg1.Cells[4,sg1.Row] := GetVal(dm.Q1,'satuan');
                sg1.Cells[3,sg1.Row] := GetValR(dm.Q1,'hargapartai');

                sg1.Cells[7,sg1.Row] := '1';

                pas    := Posisi(UPPERCASE(GetVal(dm.Q1,'kodebarcode')),sg1.Cells[4,sg1.Row]);


                if (pas <> 0) and (pas <> sg1.Row) then begin

                    ppn               := GetValF(dm.Q1,'ppn');
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
            ' or b.kodebarcode like"%'+sg1.Cells[1,sg1.Row]+'") GROUP BY b.kodebarang',True);
            FcariBarang.Show;
            FcariBarang.isFormTransaksi := 10;
          end;
      end;
      HitungTotal;
    end else begin
          if ( sg1.Col in [2..4] ) and (key = 13) then
             begin
              sg1.Row := sg1.Row;
              sg1.Col := sg1.Col + 1
             end
          else If ( sg1.Col in [5] ) and (key = 13) then
              Focus;
    end;


    case KEy of
   VK_INSERT : begin
                 if sg1.Cells[1,sg1.Row] = '' then
                    Warning('Silahkan pilih item barang dulu!!')
                 else
                    begin
                      ExQry(dm.QMultiSatuan,'SELECT s.*,(b.hargabeli * s.isi) as hargabeli FROM multisatuan s left join barang b '+
                      ' ON b.kodebarang=s.kodebarang WHERE b.kodebarang="'+sg1.Cells[8,sg1.Row]+'"',True);
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
   end;
end;

procedure TFRedemPoin.sg1KeyPress(Sender: TObject; var Key: Char);
begin
  if sg1.Col in [3,5]  then begin

     if not (key in['0'..'9',#13,#8,#10,',','.']) then
        key:=#0;
  end;

end;

procedure TFRedemPoin.sg1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if sg1.Col in [3,5]  then begin
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


end;

procedure TFRedemPoin.sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);

begin
   OpenTable(dm.Q1,['editharga'],'m_user WHERE iduser="'+stat1.Panels[3].Text+'"');
   if ACol in [1,3,5] then begin
      if (ACol = 3) and (GetValBol(dm.Q1,'editharga') = False) then
         sg1.Options := sg1.Options -[goEditing] else

      sg1.Options := sg1.Options +[GoEditing];
   end
  else
    sg1.Options := sg1.Options -[goEditing];
end;

procedure TFRedemPoin.Simpan;
var
  x : integer;
  idpelanggan,KodeBarang,Tempo : string;
  hpp,hargajual : real;
  HargaDiskon   : Real;
  NominalDiskon : Real;
  totalHpp      : Real;

begin

    idpelanggan := getData(dm.Q1,'pelanggan WHERE kodepelanggan="'+EKodePelanggan.Text+'"','idpelanggan');
    dm.Q1.Connection.StartTransaction;
    try
      addParam('nobukti',       Enobukti.Text,            aList,'str');
      addParam('tgl',           frmTgl(dt1.Date),         aList,'date');
      addParam('iduser',        stat1.Panels[3].Text,     aList,'str');
      addParam('id_pelanggan',  idpelanggan,              aList,'str');
      addParam('jmlpoin',       Epoin.Text,               aList,'str');
      addParam('jmltukar',      EjumlahTukar.Text,        aList,'str');
      addParam('keterangan',    Eketerangan.Text,         aList,'str');

       OpenTable(dm.Q2,['id'],'redempoin where nobukti="'+Enobukti.Text+'"');
      if Dm.Q2.IsEmpty then
         Post(dm.Q1,'redempoin',alist)
      else
         UpdatePOST(dm.Q1,'redempoin',alist,'id',GetVal(dm.Q2,'id'));

      if cCashBack.Checked then begin
          ExQry(dm.Q1,'UPDATE pelanggan SET poin=poin-"'+Nilai(EjumlahTukar.Text)+'" WHERE '+
          ' idpelanggan="'+idPelanggan+'"',False);

      end else begin
            ExQry(dm.Q1,'DELETE FROM kartustok WHERE nobukti="'+Enobukti.Text+'"',False);
            ExQry(dm.Q1,'DELETE FROM saldoakun WHERE nobukti="'+Enobukti.Text+'"',False);
            ExQry(dm.Q1,'DELETE FROM detailredempoin WHERE nobukti="'+Enobukti.Text+'"',False);



            if (sg1.Cells[1,sg1.RowCount -1] <> '') and (sg1.Cells[6,sg1.RowCount -1] <> '') then
                sg1.RowCount := sg1.RowCount + 1;

            for x := 1 to sg1.RowCount -1 do
              begin

                if (sg1.Cells[1,x] <> '') and (sg1.Cells[6,x]<>'') then
                begin


                    openTable(dm.Q2,['kodebarang','hargabeli'],'barang where kodebarang="'+sg1.cells[8,x]+'"');
                    KodeBarang := Getval(dm.Q2,'kodebarang');
                    hpp        := GetValF(dm.Q2,'hargabeli');
                //    ShowMessage(kodebarang);
                    addParam('nobukti',     Enobukti.Text,             aList,'str');
                    addParam('kodebarang',  KodeBarang,               Alist,'str');
                    addParam('satuan',      sg1.Cells[4,x],           Alist,'str');
                    addParam('harga',       nilai(sg1.Cells[3,x]),    Alist,'str');
                    addParam('jumlah',      nilai(sg1.Cells[5,x]),    Alist,'str');
                    addParam('subtotal',    nilai(sg1.Cells[6,x]),    Alist,'str');
                    addParam('isi',         nilai(sg1.Cells[7,x]),    Alist,'str');

                    Post(dm.Q1,'detailredempoin',aList);


                    totalHpp := totalHpp + (hpp * CellF(sg1.Cells[5,x]));
                    PostingKartuStok(dm.Q1,Enobukti.Text,
                                    dt1.Date,KodeBarang,GetIdcmb(cbGudang),
                                    sg1.Cells[4,x], hpp,
                                    'KELUAR',CellF(sg1.Cells[5,x]),
                                    'PENUKARAN POIN NO BUKTI ['+Enobukti.Text+']');





                end else
                if (sg1.Cells[1,x] = '') and (sg1.Cells[6,x]<>'') or (Sg1.Cells[2,x]<>'') then begin
                  MessageBox(Handle,'Kode Barcode Harus Di Isi !! '+#13+' Silahkan Isi terlebih Dahulu !! '+#13+
                             'Atau batalkan item dengan menekan tombol [ DELETE ]','ERROR',MB_ICONERROR);
                  sg1.Row := x;
                  sg1.Col := 1;
                  dm.Q1.Connection.Rollback;
                  Abort;
                end;
              end;

              PostingJurnal(dm.Q1,'501.001',
                               Enobukti.Text,
                               'PENUKARAN POIN ['+Enobukti.Text+']',
                               dt1.Date,totalHpp,totalHpp,totalHpp,'D');

               PostingJurnal(dm.Q1,'103.001',
                               Enobukti.Text,
                               'PEMAKAIAN BARANG NO BUKTI ['+Enobukti.Text+']',
                               dt1.Date,totalHpp,totalHpp,totalHpp,'K');

          ExQry(dm.Q1,'UPDATE pelanggan SET poin=poin-"'+Nilai(EjumlahTukar.Text)+'" WHERE '+
          ' idpelanggan="'+idPelanggan+'"',False);
        end;





          dm.Q1.Connection.Commit;


          Dlaporan.QPenukaranPoin.FilterSQL := ' r.nobukti="'+Enobukti.Text+'"';
          Dlaporan.QPenukaranPoin.Filtered  := True;
          Dlaporan.QPenukaranPoin.Active    := True;

          Dlaporan.QDetailPenukaranPoin.Active := False;
          Dlaporan.QDetailPenukaranPoin.Active := True;
          if cCashBack.Checked = False then  begin

          Dlaporan.Fr1.LoadFromFile(aPathRpt+'\buktitukarpoin.fr3');
          Dlaporan.Fr1.PrepareReport;
          Dlaporan.Fr1.ShowReport();
          end;
      except
        dm.Q1.Connection.Rollback;
      end;

    Informasi('Data berhasil proses');
    TampilAwal;
    Focus;
    isEdit := False;
end;



procedure TFRedemPoin.TampilAwal;
begin
  ClearText(Self);
  CreateGrid;
  Enobukti.Text   := GetCode(dm.Q1,'redempoin','nobukti','R'+setIdKom);
  setTanggal(Self);
  sNota           :='';
  dt1.Date        := now;
  OpenTable(dm.Q1,['gudangjual'],'profile where idprofil=1');
  cbGudang.ItemIndex := 1;
  ENamaPelanggan.Text := GetVal(dm.QPelanggan,'namapelanggan');
  EKodePelanggan.Text := GetVal(dm.QPelanggan,'kodepelanggan');
  Epoin.Text          := GetValR(dm.QPelanggan,'poin');
  EConversi.Text      := '1000';
  ENilaiPoin.Text     := Format('%.0n',[Epoin.AsFLoat * Econversi.AsFLoat]);


end;


function TFRedemPoin.ToFloat(ACol, ARow: integer): Extended;
begin
if not ACOl in [3] then
    Result := StrToFloatDef(koma(sg1.Cells[aCol,aRow]),0)
  else
    Result := StrToFloatDef(nilai(sg1.Cells[aCol,aRow]),0);
end;


end.
