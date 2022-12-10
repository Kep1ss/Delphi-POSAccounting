unit uDataSuratJalan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMcSkin,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxGroupBox, uComCtrl,
  dxSkiniMaginary, cxCurrencyEdit, uEngine,activex,System.Win.ComObj,MyAccess, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, cxCheckBox, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  dxSkinMoneyTwins, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

  type
    ThExport =  class(TThread)
      private
        FfProgress  : TProgressBar;
        FQ          : TMyQuery;
        FForm       : TForm;
        Flabel      : TLabel;

      procedure ExportToExCell;
      protected
        procedure Execute;Override;
      public

        Constructor Create(FQ1:TMyQuery;aProgress:TProgressBar;AAForm : TForm;AAlabel : TLabel);
        property Progress : TProgressBar Read FfProgress write FfProgress;
        property query : TMyQuery read FQ write FQ;
        property aForm : TForm read FForm write FForm;
        property aLabel : TLabel read Flabel write Flabel;
    end;
 const
  UM_CHECK = WM_USER + 10000;
type
  TFdataSuratJalan = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Dt1: TcxDateEdit;
    Label2: TLabel;
    dt2: TcxDateEdit;
    Label3: TLabel;
    EPencarian: TcxTextEdit;
    G2: TcxGroupBox;
    btnTutup: TcxButton;
    btnPrint: TcxButton;
    btnCetak: TcxButton;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    pm1: TPopupMenu;
    U1: TMenuItem;
    U2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure cxgGrid1DBTableView1DataControllerDetailExpanding(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var AAllow: Boolean);
    procedure Dt1PropertiesCloseUp(Sender: TObject);
    procedure EPencarianKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
    procedure cxgGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnTutupClick(Sender: TObject);
    procedure btnCetakClick(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
  private
    { Private declarations }
  public
    const
      SQLpenjualanA = ' SELECT                                            '+
                     '     p.fakturjual,                                 '+
                     '     p.tgljual,                                    '+
                     '     p.idpelanggan,                                '+
                     '     p.nomerso,                                '+
                     '     pl.namapelanggan,                             '+
                     '     (CASE WHEN p.pembayaran=0 THEN "CASH" ELSE "KREDIT" END) AS pembayaran,                                 '+
                     '     p.total,                                      '+
                     '     p.diskon,                                     '+
                     '     p.grandtotal,                                 '+
                     '     pg.namalengkap,                               '+
                     '     s.namasales,                                  '+
                     '     s.kodesales,                                  '+
                     '     p.tglkirim,                                   '+
                     '     p.kirim,                                   '+
                     '     p.ppn,                                   '+
                     '     p.bayar,                                      '+
                     '     p.kembali                                     '+
                     '   FROM                                            '+
                     '     penjualan p                                   '+
                     '     LEFT JOIN pelanggan pl                        '+
                     '       ON pl.`idpelanggan` = p.`idpelanggan`       '+
                     '     LEFT JOIN m_user pg                           '+
                     '      ON pg.iduser=p.`iduser`                      '+
                     '     LEFT JOIN sales s                             '+
                     '      ON p.idsales=s.idsales';

    _SQLDetailJual = ' SELECT                                  '+
                     '     d.iddetil,                          '+
                     '     d.fakturjual,                       '+
                     '     d.kodebarang,                       '+
                     '     b.namabarang,                       '+
                     '     d.satuan,                           '+
                     '     d.harga,                            '+
                     '     d.hpp,                              '+
                     '     d.jumlah,                           '+
                     '     d.diskonpersen,                     '+
                     '     d.diskonrupiah,                     '+
                     '     d.subtotal,                         '+
                     '     d.isi,                              '+
                     '     d.idgudang,                         '+
                     '     l.namalokasi                        '+
                     '   FROM                                  '+
                     '     penjualandetil d                    '+
                     '     LEFT JOIN barang b                  '+
                     '       ON d.`kodebarang` = b.`kodebarang`'+
                     '     LEFT JOIN lokasi l                  '+
                     '       ON l.`idlokasi` = d.`idgudang` ';




    { Public declarations }

    procedure Check(AGridView: TcxGridDBTableView);
    procedure UmCheck(var Message: TMessage); message UM_CHECK;
  end;

var
  FdataSuratJalan: TFdataSuratJalan;

implementation

{$R *.dfm}

uses uDtrx, uPembelian, udm, uMainMenu, uPenjualan, uProgress, uDlaporan,
  uExportExcel, uSuratJalan;

procedure TFdataSuratJalan.btnBaruClick(Sender: TObject);
begin
  FSuratJalan.Show;
  FSuratJalan.TampilAwal;
  FSuratJalan.stat1.Panels[1].Text := setIdKom;
  FSuratJalan.stat1.Panels[3].Text := Fmain.sbr1.Panels[1].Text;
  FSuratJalan.stat1.Panels[4].Text := Fmain.sbr1.Panels[2].Text;
  FSuratJalan.stat1.Panels[5].Text := Fmain.sbr1.Panels[4].Text;
end;

procedure TFdataSuratJalan.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFdataSuratJalan.Check(AGridView: TcxGridDBTableView);

begin

end;

procedure TFdataSuratJalan.btnCetakClick(Sender: TObject);


begin
 ExQry(Dlaporan.Qpenjualan,SQLpenjualanA+' WHERE fakturjual="'+GetVal(dtrx.Qpenjualan,'fakturjual')+'"',True);


    Dlaporan.Fr1.LoadFromFile(ExtractFilePath(Application.ExeName)+'rpt\frSuratJalan.fr3');
  //  FMemo(Dlaporan.Fr1,'Lterbilang').Text:= MyTerbilang(Dlaporan.Qpenjualan.FieldByName('grandtotal').AsFloat);
    Dlaporan.Fr1.PrepareReport(True);
    Dlaporan.Fr1.PrintOptions.ShowDialog := True;
    Dlaporan.Fr1.PrintOptions.Printer    := PrinterInvoice;
    if CheckAuto = True then
     Dlaporan.Fr1.Print else
     Dlaporan.Fr1.ShowReport();

end;
procedure TFdataSuratJalan.cxgGrid1DBTableView1DataControllerDetailExpanding(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var AAllow: Boolean);
begin
  AAllow := True;
  dtrx.QDetailjual.Active := False;
  dtrx.QDetailjual.Active := True;
end;

procedure TFdataSuratJalan.cxgGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);


var
  AView: TcxGridDBTableView;
begin
  AView := Sender as TcxGridDBTableView;
  PostMessage(Handle, UM_CHECK, Integer(AView), 0);
end;



procedure TFdataSuratJalan.DBGridEh1CellClick(Column: TColumnEh);
begin
    ExQry(dtrx.QdetailJual,_SQLDetailJual+' WHERE fakturjual='''+dtrx.Qpenjualan.FieldByName('fakturjual').AsString+'''',True);

end;

procedure TFdataSuratJalan.Dt1PropertiesCloseUp(Sender: TObject);

begin

  ExQry(dtrx.Qpenjualan,SQLpenjualanA+' WHERE p.tgljual>="'+Tanggal(dt1.Date)+'" '+
  ' AND p.tgljual<="'+Tanggal(dt2.Date)+'" AND p.kirim=TRUE',True);
end;

procedure TFdataSuratJalan.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
  if Key = 13 then begin


  ExQry(dtrx.Qpenjualan,SQLpenjualanA+' WHERE p.fakturjual like"%'+EPencarian.Text+'%" '+
                                     ' or pl.namapelanggan like"%'+EPencarian.Text+'%"',True);
  end;
end;

procedure TFdataSuratJalan.FormCreate(Sender: TObject);
begin
  FdataSuratJalan := Self;
  SetTanggal(Self);
end;

procedure TFdataSuratJalan.FormShow(Sender: TObject);

begin
   ExQry(dtrx.Qpenjualan,SQLpenjualanA+' WHERE p.tgljual>="'+Tanggal(dt1.Date)+'" '+
   ' AND p.tgljual<="'+Tanggal(dt2.Date)+'" AND p.kirim=TRUE',True);
end;

procedure TFdataSuratJalan.UmCheck(var Message: TMessage);
begin
  Check(TcxGridDBTableView(Message.WParam));
end;

{ ThExport }

constructor ThExport.Create(FQ1: TMyQuery; aProgress: TProgressBar;
  AAForm: TForm; AAlabel: TLabel);
begin
  FfProgress    := aProgress;
  FQ            := FQ1;
  FForm         := AAForm;
  Flabel        := AAlabel;
  FreeOnTerminate := True;
  Inherited Create(False);
end;

procedure ThExport.Execute;
begin
  inherited;
  Synchronize( ExportToEXcell);

end;

procedure ThExport.ExportToExCell;
var
   XlApp,Xlbook,XLsheet : Variant;

   i,x ,j          : Integer;

begin
  Coinitialize(nIL);
  Try
    Xlapp     := CreateOLEObject('Excel.Application');
    Xlbook    := Xlapp.WorkBooks.add;
    XlSheet   := XLbook.worksheets.Add;

    FForm.Show;
    for  i := 0 to FQ.Fields.Count  -1 do
    begin
      XLsheet.Cells[2,i+1].Value := UPPERCASE(FQ.Fields[i].Fieldname);
      XLSheet.Cells[2,i+1].ColumnWidth := length(FQ.Fields[i].Fieldname) + 10;
      XLsheet.Cells[2,i+1].Value := FQ.Fields[i].FieldName;
      XLsheet.Cells[2,i+1].Interior.Color := clgray;
      XLsheet.Cells[2,i+1].Borders.Weight := 2;
    end;

    FQ.First;
    x:=1;
    FfProgress.Position:=0;
    FfProgress.Max := FQ.RecordCount;

    while not FQ.Eof do
    begin

      for j := 0 to FQ.FieldCount -1 do
      begin
          if StrToFloatDef(nilai(FQ.Fields[j].AsString),0) <> 0 then
          XlSheet.Cells[2+x,j+1].value := ''''+GetRupiah(FQ.Fields[j].AsString);
          XlSheet.Cells[2+x,j+1].value := ''''+FQ.Fields[j].AsString;
          XLsheet.Cells[2+x,j+1].Borders.Weight := 2;
      end;
      FfProgress.Position :=x;
      FQ.Next;
      inc(x);
      Application.ProcessMessages;
      Flabel.Caption := FloatToStr(Round((x / FQ.RecordCount) * 100)) +' % ';
    end;

    FForm.Close;
    XlApp.Visible := True;

  finally
    CoUninitialize ;
    FfProgress.Position:=0;
  End;
end;
end.
