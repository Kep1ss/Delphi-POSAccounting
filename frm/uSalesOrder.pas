unit uSalesOrder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls,
  cxButtons, cxDropDownEdit, cxMaskEdit, cxCalendar, cxTextEdit, cxGroupBox,
  uEngine, uComCtrl, uctrlFrm, uOvEdit, dxSkiniMaginary, cxCheckBox,IniFIles,
  strUtils, uTerbilang, ujosprint,Winapi.ShellAPI, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, dxSkinMoneyTwins, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFsalesOrder = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Enobukti: TcxTextEdit;
    DtBukti: TcxDateEdit;
    ENamaCust: TcxTextEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cbPembayaran: TcxComboBox;
    cbTempo: TcxComboBox;
    btnCariSupplier: TcxButton;
    Label11: TLabel;
    Label12: TLabel;
    cbGudang: TcxComboBox;
    sg1: TAdvStringGrid;
    G2: TcxGroupBox;
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
    btnPending: TcxButton;
    btnBukaPending: TcxButton;
    jPrint1: TJPRINTER;
    Label14: TLabel;
    cbsales: TcxComboBox;
    Label16: TLabel;
    Label15: TLabel;
    procedure sg1GetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: string);
    procedure FormCreate(Sender: TObject);
    procedure cbPembayaranPropertiesChange(Sender: TObject);
    procedure btnCariPelangganClick(Sender: TObject);
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
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormResize(Sender: TObject);
    procedure sg1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EScanBarcodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPendingClick(Sender: TObject);
    procedure btnBukaPendingClick(Sender: TObject);
    procedure btnFocusClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }

  public
    function CariIsi(barcode:string;Satuan:string):Extended;
    procedure TampilAwal;
    procedure CreateGrid;
    procedure bersihCell;
    procedure ReplaceData;
    procedure Focus;
    procedure Simpan;
    procedure HitungSubtotal(Arow:Integer);
    function ToFloat(ACol:Integer;ARow:integer):Extended;
    function Posisi(kodebarcode:String):integer;

    procedure bersihkanGrid;
       { Public declarations }
  end;
  

var
  FsalesOrder: TFsalesOrder;
  aList : TStringList;
  sNota       : String;
implementation

{$R *.dfm}

uses udm, uCaripelanggan, uCariBarang, uMainMenu, uBayar, uDlaporan,
  uPendingTransaksi, uCopyNota, uPilihSatuan, upendingsalesorder, uDtrx;

procedure TFsalesOrder.bersihCell;
var
  c:integer;
begin
  for c := 0 to sg1.ColCount -1 do
  sg1.Cells[c,sg1.Row] :='';
end;

procedure TFsalesOrder.bersihkanGrid;
var
  i : integer;
  x : integer;
begin
  for i := 1 to sg1.RowCount -1 do
  for x := 0 to sg1.ColCount -1 do
    sg1.Cells[x,i] := '';
  sg1.RowCount := 2;

end;

procedure TFsalesOrder.btnBaruClick(Sender: TObject);
begin
  TampilAwal;
end;

procedure TFsalesOrder.btnBukaPendingClick(Sender: TObject);
begin
  FpendingSO.Show;
end;

procedure TFsalesOrder.btnCariBarangClick(Sender: TObject);
begin
  FcariBarang.Show;
  FcariBarang.isFormTransaksi := 4;
end;

procedure TFsalesOrder.btnHapusClick(Sender: TObject);
begin

  if MessageDlg('Apakah yakin akan dihapus',mtConfirmation,[Mbyes,Mbno],0)=mrYes then
  begin
  if (sg1.RowCount >= 2)  then
  begin
    if (sg1.Cells[5,sg1.Row] <>'') or (sg1.Cells[2,sg1.Row] <>'') then
    begin
      try
        Bersihcell;
        ReplaceData;
        if (sg1.Row <> sg1.RowCount -1) and (sg1.Cells[1,sg1.RowCount -1] = '') then
        sg1.RowCount :=  sg1.RowCount - 1;
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

procedure TFsalesOrder.btnPendingClick(Sender: TObject);
var
  x : integer;
  idpelanggan,KodeBarang : string;
  notempo : string;

begin

  if Not CheckEdit(Self) then begin

  ExQry(dm.Q1,'select * from pendingso where nosalesorder="'+sNota+'"',True);

  if dm.Q1.IsEmpty = False then
  notempo := sNota else
  notempo := GetCode(dm.Q1,'pendingso','nosalesorder','SS'+setIdKom);

  if sg1.Cells[1,1] ='' then
  begin
    Peringatan('Item salesorder belum dimasukan');
    focus;
  end else
  begin
    idpelanggan := getData(dm.Q2,'pelanggan where kodepelanggan="'+EkodeCust.Text+'"','idpelanggan');
    dm.Q1.Connection.StartTransaction;
    try

      addParam('nosalesorder',   notempo,            aList,'str');
      addParam('tgljual',      frmTgl(DtBukti.Date),     aList,'date');
      addParam('pembayaran',   IntToStr(cbPembayaran.ItemIndex),        aList,'str');
      addParam('idpelanggan',  idpelanggan,              aList,'str');
      addParam('iduser',       stat1.Panels[3].Text,aList,'str');
      addParam('idsales',      getidcmb(cbsales),aList,'str');


      OpenTable(dm.Q2,['idjual'],'pendingso where nosalesorder="'+notempo+'"');
      if Dm.Q2.IsEmpty then
         Post(dm.Q1,'pendingso',alist)
      else
         UpdatePOST(dm.Q1,'pendingso',alist,'idjual',GetVal(dm.Q2,'idjual'));

      ExQry(dm.Q2,'delete from pendingsodetail where nosalesorder="'+notempo+'"',False);
      for x := 1 to sg1.RowCount -1 do
        begin

          if sg1.Cells[5,x] <> '' then
          begin
            if StrToFloatDef(nilai(sg1.Cells[5,x]),0) = 0 then
               sg1.Cells[5,x] := '1';

              openTable(dm.Q2,['kodebarang','hargabeli'],'barang where kodebarcode="'+sg1.cells[1,x]+'"');
              KodeBarang := Getval(dm.Q2,'kodebarang');

              addParam('nosalesorder',  notempo,          aList,'str');
              addParam('kodebarang',  KodeBarang,             Alist,'str');
              addParam('satuan',      sg1.Cells[3,x],         Alist,'str');
              addParam('jumlah',      KomaDatabase(sg1.Cells[4,x]),   Alist,'str');
              addParam('isi',         nilai(sg1.Cells[5,x]), Alist,'str');
              addParam('idgudang',    GetIdcmb(cbGudang),     Alist,'str');

              Post(dm.Q1,'pendingsodetail',aList)

          end else
          if (sg1.Cells[1,x] = '') and (sg1.Cells[5,x]<>'') or (Sg1.Cells[2,x]<>'') then begin
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
  end;
  end;
end;

procedure TFsalesOrder.btnSimpanClick(Sender: TObject);
begin
  if sg1.Cells[1,1] = '' then begin
    Error('Belum ada transaksi');
  end else if NOT CheckEdit(Self) then begin
   if cbPembayaran.ItemIndex = -1 then
  begin
    peringatan(' Pembayaran belum ditentukan');
    cbPembayaran.ItemIndex := 0;
  end else
    begin
         Simpan;
    end;
  end;
end;

procedure TFsalesOrder.btnCariPelangganClick(Sender: TObject);
begin
  Fcaripelanggan.Show;
  Fcaripelanggan.isFormPelanggan := 2;
end;

procedure TFsalesOrder.btnFocusClick(Sender: TObject);
begin
  Focus;
end;





function TFsalesOrder.CariIsi(barcode, Satuan: string): Extended;
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

procedure TFsalesOrder.cbPembayaranPropertiesChange(Sender: TObject);
begin
  case cbPembayaran.ItemIndex of
  0 : cbTempo.ItemIndex := -1;
  1 : cbTempo.ItemIndex := 0;
  end;
end;






procedure TFsalesOrder.CreateGrid;
var
  c,r :integer;
begin
  with sg1 do
  begin
    for c:=0 to ColCount do
    for r:=0 to RowCount do
    Cells[c,r]:='';

    ColCount    := 6;
    RowCount    := 2 ;



    Cells[0,0]  := 'NO';
    Cells[1,0]  := 'KODE BARANG';
    Cells[2,0]  := 'NAMA BARANG';
    Cells[3,0]  := 'SATUAN';
    Cells[4,0]  := 'QTY';
    Cells[5,0]  := 'Isi ';

    ColWidths[0]:= 50;
    ColWidths[1]:= 150;
    ColWidths[2]:= 250;
    ColWidths[3]:= 100;
    ColWidths[4]:= 100;
    ColWidths[5]:= 100;



    AturGrid(sg1,5);
 end;

end;

procedure TFsalesOrder.EScanBarcodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
  case Key of
  VK_RETURN : begin
                 OpenTable(dm.Q1,['kodepelanggan','namapelanggan','idjenispelanggan','poin'],'pelanggan WHERE kodepelanggan="'+EScanBarcode.Text+'"');
                 if dm.Q1.IsEmpty = False then begin
                    ENamaCust.Text := GetVal(dm.Q1,'namapelanggan')+' POIN : ['+GetValR(dm.Q1,'poin')+']';
                    EkodeCust.Text := GetVal(dm.Q1,'kodepelanggan');
                 end else
                 begin
                   btnCariPelanggan.Click;
                 end;
                 Focus;
              end;
  end;

end;

procedure TFsalesOrder.Focus;
begin
  sg1.SetFocus;
  sg1.Options := sg1.Options + [goEditing];
  sg1.Options := sg1.Options - [goRowSelect];
  sg1.Row := sg1.RowCount -1;
  sg1.Col :=1;
  bersihCell;
end;

procedure TFsalesOrder.FormActivate(Sender: TObject);
begin
  Focus;
end;

procedure TFsalesOrder.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := True;
end;

procedure TFsalesOrder.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 if MessageDlg('Yakin menutup program?',
       mtConfirmation,[mbYes,mbNo],0)=mrYes then begin
    CanClose := True;
    aList.Free;
 end ELSE
 CanClose := False;
end;

procedure TFsalesOrder.FormCreate(Sender: TObject);
begin
  isiCmb(dm.Q1,'lokasi',['idlokasi','namalokasi'],cbGudang);
  isiCmb(dm.Q1,'sales',['idsales','namasales'],cbSales);
  FsalesOrder := Self;
 // AturGrid(sg1,8);
end;

procedure TFsalesOrder.FormResize(Sender: TObject);
begin
  if sg1.Cells[0,0] ='' then begin
     CreateGrid;
     AturGrid(sg1,5);
  end;
end;

procedure TFsalesOrder.FormShow(Sender: TObject);
begin
  aList := TStringLIst.Create;
  OpenTable(dm.Q1,['gudangjual'],'profile where idprofil=1');
  cbGudang.ItemIndex := idxCmb(cbGudang,dm.Q1.Fields[0].AsInteger);
  stat1.Panels[1].Text := setIdKom;
  stat1.Panels[3].Text := Fmain.sbr1.Panels[1].Text;
  stat1.Panels[4].Text := Fmain.sbr1.Panels[2].Text;
  stat1.Panels[5].Text := Fmain.sbr1.Panels[4].Text;
  Focus;
end;


procedure TFsalesOrder.HitungSubtotal(AROW:Integer);
var
   Jumlah  : Real;
  isiJual : Real;
begin
  with sg1 do begin
    Jumlah       := StrToFloatDef(nilai(Cells[4,aRow]),0);
    isiJual      := CariIsi(Cells[1,aRow],Cells[3,aRow]) * Jumlah;

    Cells[5,aRow] := GetRupiah(FloatToStr(isiJual));
  end;
end;


function TFsalesOrder.Posisi(kodebarcode: String): integer;
var
  i:integer;
  hasil : integer;
begin
  for i := 1 to sg1.RowCount-1  do begin
    if sg1.Cells[1,i] = kodebarcode then begin
      hasil  := i;

      Break;
    end else
      hasil  := 0;
  end;
  Result := hasil;
end;





procedure TFsalesOrder.ReplaceData;
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


  end;
end;

procedure TFsalesOrder.sg1GetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow > 0 then begin
    if ACol in [3,4,5] then
       HAlign := taRightJustify
    else if ACOl in [ 4 ] then
       HAlign := taCenter;
  end;

end;

procedure TFsalesOrder.sg1GetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: string);
begin
  if (ACol in [4,5]) then
      begin
        isFloat := True;
        FloatFormat :='%.0n';
      end
  else
       isFloat := False;
end;

procedure TFsalesOrder.sg1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 pas : Integer;
 hrg : Real;
 isiBeli,jml,qty : Real;
 ppn : Real;
begin
  if  (Sg1.Col = 1) and (key = 13)  then BEGIN
       if COPY(sg1.Cells[1,sg1.Row],1,1) = '+' then begin
          jml := StrToFloatDef(StringReplace(sg1.Cells[1,sg1.Row],'+','',[RfReplaceAll]),0);
          sg1.Cells[4,sg1.Row -1] := KomaDatabase(FloatToStr(jml));

          HitungSubtotal(sg1.Row -1);;
          bersihCell;
       end else begin
       if (sg1.Cells[1,sg1.Row] <> '') then begin

            ExQry(dm.Q1,FcariBarang._SQLCaribarang+' WHERE b.kodebarcode="'+sg1.Cells[1,Sg1.Row]+'"',True);

            if Dm.Q1.IsEmpty then begin
               ExQry(dm.QBarang,FcariBarang._SQLCaribarang+' WHERE b.namabarang like"%'+sg1.Cells[1,sg1.Row]+'%" or b.kodebarcode like"%'+sg1.Cells[1,sg1.Row]+'"',True);
               FcariBarang.Show;
               FcariBarang.isFormTransaksi := 4;

            end else begin

               pas    := Posisi(UPPERCASE(GetVal(dm.Q1,'kodebarcode')));

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

                  sg1.Cells[0,sg1.Row] := IntToStr(sg1.Row);
                  sg1.Cells[1,sg1.Row] := GetVal(dm.Q1,'kodebarcode');
                  sg1.Cells[2,sg1.Row] := GetVal(dm.Q1,'namabarang');
                  sg1.Cells[3,sg1.Row] := GetVal(dm.Q1,'satuanjual');
                  sg1.Cells[4,sg1.Row] := '1';
                  HitungSubtotal(sg1.Row);


                  if sg1.Cells[1,sg1.RowCount -1] <>'' then
                  begin
                    sg1.RowCount := sg1.RowCount + 1;
                    Focus;
                    BersihCell;
                  end;

                  Focus;
                end;

            end;
          end else
          begin

            ExQry(dm.QBarang,FcariBarang._SQLCaribarang+' WHERE b.namabarang like"%'+sg1.Cells[1,sg1.Row]+'%"',True);
                 FcariBarang.Show;
                 FcariBarang.isFormTransaksi := 4;
          end;
      end;
    end;
end;

procedure TFsalesOrder.sg1KeyPress(Sender: TObject; var Key: Char);
begin
  if sg1.Col in [4,5]  then begin

     if not (key in['0'..'9',#13,#8,#10,',','.']) then
        key:=#0;
  end;

end;

procedure TFsalesOrder.sg1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if sg1.Col in [4]  then begin
     HitungSubtotal(sg1.Row);


   end;

   case KEy of
   VK_RETURN : if sg1.Col in [2..2] then sg1.Col := sg1.Col + 1 else Focus;
   VK_INSERT : begin
                 if sg1.Cells[1,sg1.Row] = '' then
                    Warning('Silahkan pilih item barang dulu!!')
                 else
                    begin
                      ExQry(dm.QMultiSatuan,'SELECT * FROM multisatuan mt left join barang b '+
                      ' ON b.kodebarang=mt.kodebarang WHERE b.kodebarcode="'+sg1.Cells[1,sg1.Row]+'"',True);
                      if DM.QMultiSatuan.IsEmpty then
                         Warning('Tidak ada multi satuan')
                      else
                         FpilihSatuan.Show;
                         FpilihSatuan.IsFormSatuan := 1;
                    end;
               end;
   end;
   if (Key = 66) and (Shift = [ssCtrl]) then
   begin
      sg1.Options  := sg1.Options + [goRowSelect];
      sg1.Options  := sg1.Options - [goEditing];
      sg1.Row      := 1;
      sg1.Col      := 1;
   end;

end;

procedure TFsalesOrder.sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
   if ACol in [1,4] then
    sg1.Options := sg1.Options +[GoEditing]
  else
    sg1.Options := sg1.Options -[goEditing];
end;

procedure TFsalesOrder.Simpan;
var
  x : integer;
  idpelanggan,KodeBarang : string;
  procedure DeleteHold;
  begin
    ExQry(dm.Q1,'DELETE FROM pendingso where nosalesorder="'+sNota+'"',False);
    ExQry(dm.Q1,'DELETE FROM pendingsodetail where nosalesorder="'+sNota+'"',False);
    dtrx.QpendingSO.Active := False;
    dtrx.QpendingSO.Active := True;
    sNota :='';
  end;
begin


    idpelanggan := getData(dm.Q2,'pelanggan where kodepelanggan="'+EkodeCust.Text+'"','idpelanggan');
    dm.Q1.Connection.StartTransaction;
    try

      addParam('nosalesorder',   Enobukti.Text,            aList,'str');
      addParam('tgl',      frmTgl(DtBukti.Date),     aList,'date');
      addParam('pembayaran',   IntToStr(cbPembayaran.ItemIndex),        aList,'str');
      addParam('idpelanggan',  idpelanggan,              aList,'str');
      addParam('iduser',       stat1.Panels[3].Text,aList,'str');
      addParam('idsales',      GetIdcmb(cbsales),aList,'str');
      addParam('komputerid',   setIdKom,aList,'str');

      OpenTable(dm.Q2,['idsalesorder'],'salesorder where nosalesorder="'+Enobukti.Text+'"');
      if Dm.Q2.IsEmpty then
         Post(dm.Q1,'salesorder',alist)
      else
         UpdatePOST(dm.Q1,'salesorder',alist,'idsalesorder',GetVal(dm.Q2,'idsalesorder'));

      for x := 1 to sg1.RowCount -1 do
        begin

          if (sg1.Cells[1,x] <> '') and (sg1.Cells[2,x]<>'') then
          begin


              openTable(dm.Q2,['kodebarang','hargabeli'],'barang where kodebarcode="'+sg1.cells[1,x]+'"');
              KodeBarang := Getval(dm.Q2,'kodebarang');
              addParam('nosalesorder',     Enobukti.Text,          aList,'str');
              addParam('kodebarang',  KodeBarang,             Alist,'str');
              addParam('satuan',      sg1.Cells[3,x],         Alist,'str');
              addParam('jumlah',      koma(sg1.Cells[4,x]),   Alist,'str');
              addParam('isi',         nilai(sg1.Cells[5,x]), Alist,'str');
              addParam('idgudang',    GetIdcmb(cbGudang),     Alist,'str');

              OpenTable(dm.Q2,['iddetailsales'],
              'detailsalesorder WHERE kodebarang="'+kodebarang+'" '+
              'AND nosalesorder="'+Enobukti.Text+'"');

              if dm.Q2.IsEmpty then
                 Post(dm.Q1,'detailsalesorder',aList)
              else
                 updatePOST(dm.Q1,'detailsalesorder',aList,'iddetailsales',GetVal(dm.Q2,'iddetailsales'));




          end else
          if (sg1.Cells[1,x] = '') and (sg1.Cells[5,x]<>'') or (Sg1.Cells[2,x]<>'') then begin
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
    
    DeleteHold;
    TampilAwal;
end;



procedure TFsalesOrder.TampilAwal;
begin
  ClearText(Self);

  Enobukti.Text  := GetCode(dm.Q1,'salesorder','nosalesorder','SS'+setIdKom);
  setTanggal(Self);
  bersihkanGrid;
  cbPembayaran.ItemIndex := 0;
  sNota :='';
  OpenTable(dm.Q1,['kodepelanggan','namapelanggan'],'pelanggan WHERE namapelanggan="UMUM"');
  if dm.Q1.IsEmpty then begin
    Warning('Data pelanggan umum masih kosong harap di isi dulu');
    FsalesOrder.Close;

  end else
  begin
    ENamaCust.Text := GetVal(dm.Q1,'namapelanggan');
    EkodeCust.Text := GetVal(dm.Q1,'kodepelanggan');

  end;
end;

function TFsalesOrder.ToFloat(ACol, ARow: integer): Extended;
begin
if not ACOl in [3] then
    Result := StrToFloatDef(koma(sg1.Cells[aCol,aRow]),0)
  else
    Result := StrToFloatDef(nilai(sg1.Cells[aCol,aRow]),0);
end;



end.
