unit uDataPemakainBarang;

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
  dxSkinXmas2008Blue, cxLabel, dxSkinTheBezier, uctrlFrm;

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

type
  TFdataPemakainBarang = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Dt1: TcxDateEdit;
    Label2: TLabel;
    dt2: TcxDateEdit;
    Label3: TLabel;
    EPencarian: TcxTextEdit;
    G2: TcxGroupBox;
    btnBaru: TcxButton;
    btnTutup: TcxButton;
    btnPrint: TcxButton;
    btnHapus: TcxButton;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    Label4: TLabel;
    cbKasir: TComboBox;
    btnUbah: TcxButton;
    cxlbl1: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure Dt1PropertiesCloseUp(Sender: TObject);
    procedure EPencarianKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure cbKasirChange(Sender: TObject);
    procedure btnUbahClick(Sender: TObject);
  private
    { Private declarations }
  public
    const
      SQLpemakainBarang = ' SELECT                         '+
                      '      p.nobukti,                '+
                      '      p.tgl,                    '+
                      '      p.total,                  '+
                      '      u.username,               '+
                      '      p.keterangan              '+
                      '    FROM                        '+
                      '      pemakainbarang p          '+
                      '      LEFT JOIN m_user u        '+
                      '        ON p.`iduser` = u.`iduser` ';
    SQLdetailPemakain = ' SELECT                               '+
                        '      d.nobukti,                      '+
                        '      d.kodebarang,                   '+
                        '      b.namabarang,                   '+
                        '      d.satuan,                       '+
                        '      d.harga,                        '+
                        '      d.jumlah,                       '+
                        '      d.subtotal,                     '+
                        '      d.isi                           '+
                        '    FROM                              '+
                        '      detailpemakainbarang d          '+
                        '      LEFT JOIN barang b              '+
                        '        ON d.`kodebarang` = b.`kodebarang`  ';




    { Public declarations }
  end;

var
  FdataPemakainBarang: TFdataPemakainBarang;

implementation

{$R *.dfm}

uses uDtrx, uPembelian, udm, uMainMenu, uPenjualan, uProgress, uDlaporan,
  uExportExcel, uPemakainBarang;

procedure TFdataPemakainBarang.btnBaruClick(Sender: TObject);
begin
  FpemakainBarang.Show;
  FpemakainBarang.TampilAwal;
  FpemakainBarang.isEdit := False;
  FpemakainBarang.stat1.Panels[1].Text := setIdKom;
  FpemakainBarang.stat1.Panels[3].Text := Fmain.sbr1.Panels[1].Text;
  FpemakainBarang.stat1.Panels[4].Text := Fmain.sbr1.Panels[2].Text;
  FpemakainBarang.stat1.Panels[5].Text := Fmain.sbr1.Panels[4].Text;
end;

procedure TFdataPemakainBarang.btnHapusClick(Sender: TObject);
begin
 if MessageDlg('Apakah yakin anda akan mengapus data transaksi?',mtWarning,[mbYes,mbNo],0)  =mrYes then
  begin
    ExQry(dm.Q3,'delete from kartustok where nobukti="'+GetVal(dtrx.Qpemakainbarang,'nobukti')+'"',False);
    ExQry(dm.Q3,'delete from saldoakun where nobukti="'+GetVal(dtrx.Qpemakainbarang,'nobukti')+'"',False);
    ExQry(dm.Q3,'delete from pemakainbarang where nobukti="'+GetVal(dtrx.Qpemakainbarang,'nobukti')+'"',False);
    dtrx.Qpemakainbarang.Active := False;
    dtrx.Qpemakainbarang.Active := True;
  end;

end;

procedure TFdataPemakainBarang.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFdataPemakainBarang.btnUbahClick(Sender: TObject);
var
  i : integer;
begin
  with FpemakainBarang do begin
     isEdit := True;
        FpemakainBarang.sg1.RowCount :=2;
        ExQry(Dm.Q5,'select tp.nobukti,tp.kodebarang,tp.satuan,b.kodebarang,b.kodebarcode,b.namabarang,'+
        'tp.harga,tp.jumlah,'+
        ' tp.subtotal,tp.isi,tp.idgudang from detailpemakainbarang tp left join barang b on tp.kodebarang=b.kodebarang '+
        ' where tp.nobukti='''+dtrx.Qpemakainbarang.FieldByName('nobukti').AsString+'''',True);
        i:=0;

        FpemakainBarang.cbGudang.ItemIndex := idxCmb(FpemakainBarang.cbGudang,GetValInt(DM.Q5,'idgudang'));
        FpemakainBarang.sg1.RowCount := DM.Q5.RecordCount +2;
        Dm.Q5.First;
        while Dm.Q5.Eof = False do
        begin
             sg1.Cells[0,i+1]:= Inttostr(DM.Q5.RecNo);
             sg1.Cells[1,i+1]:= GetVal(DM.Q5,'kodebarcode');
             sg1.Cells[2,i+1]:= GetVal(DM.Q5,'namabarang');
             sg1.Cells[3,i+1]:= GetValR(DM.Q5,'harga');
             sg1.Cells[4,i+1]:= GetVal(DM.Q5,'satuan');
             sg1.Cells[5,i+1]:= GetVal(DM.Q5,'jumlah');
             sg1.Cells[6,i+1]:= GetValR(DM.Q5,'subtotal');
             sg1.Cells[7,i+1]:= GetValR(DM.Q5,'isi');
             sg1.Cells[8,i+1]:= GetVal(DM.Q5,'kodebarang');
             inc(i);
             Dm.Q5.Next;
          end;

        FpemakainBarang.Enobukti.Text   := GetVal(dtrx.Qpemakainbarang,'nobukti');
        FpemakainBarang.Esubtotal.Text  := GetRupiah(SumGrid(FpemakainBarang.sg1,6));

        FpemakainBarang.dt1.Date       := dtrx.Qpemakainbarang.FieldByName('tgl').AsDateTime;
        FpemakainBarang.Show;
        //FkoreksiNota.Focus;
  end;
end;

procedure TFdataPemakainBarang.cbKasirChange(Sender: TObject);
begin
  ExQry(dtrx.Qpemakainbarang,SQLpemakainBarang+' WHERE p.tgl>="'+Tanggal(dt1.Date)+'" AND '+
  ' p.tgl<="'+Tanggal(dt2.Date)+'" AND pg.namalengkap="'+cbkasir.Text+'"',True);
end;

procedure TFdataPemakainBarang.DBGridEh1CellClick(Column: TColumnEh);
begin
    ExQry(dtrx.Qdetailpemakainbarang,SQLdetailPemakain+' WHERE nobukti='''+dtrx.Qpemakainbarang.FieldByName('nobukti').AsString+'''',True);

end;

procedure TFdataPemakainBarang.Dt1PropertiesCloseUp(Sender: TObject);

begin

  ExQry(dtrx.Qpemakainbarang,SQLpemakainBarang+' WHERE p.tgl>="'+Tanggal(dt1.Date)+'" AND p.tgl<="'+Tanggal(dt2.Date)+'"',True);
end;

procedure TFdataPemakainBarang.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
  if Key = 13 then begin


  ExQry(dtrx.Qpemakainbarang,SQLpemakainBarang+' WHERE (p.nobukti like"%'+EPencarian.Text+'%" '+
                                     ' or u.username like"%'+EPencarian.Text+'%" '+
                                     ' oR p.keterangan LIKE "%'+EPencarian.Text+'%" )',True);
  end;
end;

procedure TFdataPemakainBarang.FormCreate(Sender: TObject);
begin
  FdataPemakainBarang := Self;
  SetTanggal(Self);
end;

procedure TFdataPemakainBarang.FormShow(Sender: TObject);

begin
   ExQry(dtrx.Qpemakainbarang,SQLpemakainBarang+' WHERE p.tgl>="'+Tanggal(dt1.Date)+'" AND p.tgl<="'+Tanggal(dt2.Date)+'"',True);

   OpenTable(dm.Q1,['namalengkap'],'m_user');

   cbKasir.Items.Clear;
   while not dm.Q1.Eof do begin
      cbKasir.Items.Add(GetVal(dm.Q1,'namalengkap'));
      dm.Q1.Next;

   end;
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
