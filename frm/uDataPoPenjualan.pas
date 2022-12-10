unit uDataPoPenjualan;

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
  dxSkinMoneyTwins,uctrlFrm, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;


 const
  UM_CHECK = WM_USER + 10000;
type
  TFDataPoPenjualan = class(TForm)
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
    btnHapus: TcxButton;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    btnSudahDiproses: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure Dt1PropertiesCloseUp(Sender: TObject);
    procedure EPencarianKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
    procedure btnPickingLIstClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure btnTerjualClick(Sender: TObject);
    procedure btnSudahDiprosesClick(Sender: TObject);
  private
    { Private declarations }
  public
    const
      SQLpenjualanA = ' SELECT                                   '+
                      '      p.nomerpo,                          '+
                      '      p.tgljual,                          '+
                      '      p.idpelanggan,                      '+
                      '     pl.namapelanggan,                    '+
                      '      p.total,                            '+
                      '      p.diskon,                           '+
                      '      p.grandtotal,                       '+
                      '      pg.namalengkap,                      '+
                      '      p.stts                      '+
                      '    FROM                                  '+
                      '      popenjualan p LEFT JOIN popenjualandetil d ON d.nomerpo=p.nomerpo   '+
                      '      LEFT JOIN pelanggan pl                            '+
                      '        ON pl.`idpelanggan` = p.`idpelanggan`           '+
                      '      LEFT JOIN m_user pg                               '+
                      '       ON pg.iduser=p.`iduser`    ';
    _SQLDetailJual = ' SELECT                                  '+
                     '     d.iddetil,                          '+
                     '     d.nomerpo,                       '+
                     '     d.kodebarang,                       '+
                     '     b.namabarang,                       '+
                     '     d.satuan,                           '+
                     '     d.harga,                            '+
                     '     d.hpp,                              '+
                     '     d.jumlah,                           '+
                     '     d.subtotal,'+
                     '     d.isi                                '+
                     '   FROM                                  '+
                     '     popenjualandetil d                    '+
                     '     LEFT JOIN barang b                  '+
                     '       ON d.`kodebarang` = b.`kodebarang` ';


    

    { Public declarations }


  end;

var
  FDataPoPenjualan: TFDataPoPenjualan;

implementation

{$R *.dfm}

uses uDtrx, udm, uMainMenu,uPoPenjualan, uDlaporan;

procedure TFDataPoPenjualan.btnBaruClick(Sender: TObject);
begin
  FpoPenjualan.Show;
  FpoPenjualan.TampilAwal;
  FpoPenjualan.isEdit := False;
  FpoPenjualan.stat1.Panels[1].Text := setIdKom;
  FpoPenjualan.stat1.Panels[3].Text := Fmain.sbr1.Panels[1].Text;
  FpoPenjualan.stat1.Panels[4].Text := Fmain.sbr1.Panels[2].Text;
  FpoPenjualan.stat1.Panels[5].Text := Fmain.sbr1.Panels[4].Text;
end;

procedure TFDataPoPenjualan.btnHapusClick(Sender: TObject);
begin
 if MessageDlg('Apakah yakin anda akan mengapus data transaksi?',mtWarning,[mbYes,mbNo],0)  =mrYes then
  begin
    ExQry(dm.Q3,'delete from popenjualan where nomerpo="'+GetVal(dtrx.QpoPenjualan,'nomerpo')+'"',False);
    dtrx.QpoPenjualan.Active := False;
    dtrx.QpoPenjualan.Active := True;
  end;

end;

procedure TFDataPoPenjualan.btnPickingLIstClick(Sender: TObject);
var
  I :integer;
  str : string;
begin
 Str := '';
    for I := 0 to DBGridEh1.SelectedRows.Count -1 do
      begin
        DBGridEh1.DataSource.Dataset.GotoBookmark(TBookmark(DBGridEh1.SelectedRows[i]));
       Str:= str +'"'+ DBGridEh1.DataSource.DataSet.FieldByName('').AsString+'",';
      end;



  Delete(str,length(str),1);


  if str <> '' then begin

  ExQry(Dlaporan.Ldetpacking,' select dj.nomerpo,dj.kodebarang,b.kodebarcode,b.namabarang,'+
                             ' dj.satuan,sum(dj.jumlah) as jumlah,'+
                             ' dj.subtotal from penjualandetil dj left join barang b '+
                             ' on b.kodebarang=dj.kodebarang  left join penjualan p on dj.nomerpo=p.nomerpo '+
                             ' where  p.nomerpo in ('+str+') '+
                             ' Group by dj.kodebarang',True);

   ExQry(Dlaporan.Lpacking,' SELECT                             '+
                           '     p.nomerpo,                  '+
                           '     p.tgljual,                     '+
                           '     p.idpelanggan,                 '+
                           '     pl.idjenispelanggan,           '+
                           '     pl.namapelanggan,              '+
                           '     pl.poin,                       '+
                           '     pl.alamat,                     '+
                           '     pl.kota,                       '+
                           '     pl.notelpon,                   '+
                           '     p.pembayaran,                  '+
                           '     p.total,                       '+
                           '    p.diskon,                       '+
                           '     p.grandtotal,                  '+
                           '     pg.namalengkap,                '+
                           '     p.nontunai,                    '+
                           '     p.bayar,                       '+
                           '     p.kembali,                     '+
                           '     p.komputerid,                  '+
                           '     k.namakomputer,                '+
                           '     p.ppn,                         '+
                           '     s.namasales                    '+
                           '   FROM                             '+
                           '     penjualan p                    '+
                           '     LEFT JOIN pelanggan pl         '+
                           '       ON pl.`idpelanggan` = p.`idpelanggan`  '+
                           '     LEFT JOIN m_user pg                      '+
                           '      ON pg.iduser=p.`iduser` left join komputer k on '+
                           '      k.komputerid=p.komputerid LEFT JOIN sales s on '+
                           '    s.idsales=p.idsales '+
                           '    where  p.nomerpo in ('+str+') ',True);

   Dlaporan.Fr1.LoadFromFile(ExtractFilePath(Application.ExeName)+'rpt\lpackinglist.fr3');
   FMemo(Dlaporan.Fr1,'Lno').Text := FormatDateTime('yymmdd',now)+'/PL/'+FormatDateTime('hhnnss',now)+'0001';
   Fmemo(Dlaporan.Fr1,'Ltanggal').Text := Tanggal(Dt1.Date);
   FMemo(Dlaporan.Fr1,'Lno2').Text := FormatDateTime('yymmdd',now)+'/PL/'+FormatDateTime('hhnnss',now)+'0001';
   Fmemo(Dlaporan.Fr1,'Ltgl2').Text := Tanggal(Dt1.Date);
   Dlaporan.Fr1.ShowReport();
  end else
  begin
    Error('SILAHKAN PILIH FAKTUR TERLEBIH DAHULU');
  end;
end;

procedure TFDataPoPenjualan.btnSudahDiprosesClick(Sender: TObject);
begin
  if MessageDlg('Update Status Sudah diproses?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    ExQry(dm.Q1,'Update popenjualan SET stts="SUDAH DIPROSES" WHERE nomerpo="'+getVal(dtrx.QpoPenjualan,'nomerpo')+'"',False);
    Dt1PropertiesCloseUp(Sender);
  end;
end;

procedure TFDataPoPenjualan.btnTerjualClick(Sender: TObject);
const
  rekap = ' SELECT                                       '+
          '        p.tgljual,                                '+
          '        pd.kodebarang,                        '+
          '        b.kodebarcode,                        '+
          '        b.namabarang,                         '+
          '        pd.harga,                         '+
          '        b.satuanjual AS satuan,               '+
          '        SUM(pd.jumlah) AS jumlah,             '+
          '        SUM(pd.harga * pd.jumlah) AS subtotal '+
          '      FROM                                    '+
          '        penjualan p                           '+
          '        LEFT JOIN penjualandetil pd           '+
          '          ON p.`nomerpo` = pd.`nomerpo`       '+
          '        LEFT JOIN barang b                    '+
          '          ON b.`kodebarang` = pd.`kodebarang` ';

begin
  with Dlaporan.QrekapitulasiBarang do begin
    Close;
    SQL.Text := rekap + ' WHERE pd.iddetil > 1';
    SQL.Add(' AND p.tgljual>="'+Tanggal(dt1.Date)+'" AND p.tgljual<="'+Tanggal(dt2.Date)+'"');
    SQL.Add(' GROUP BY b.kodebarang ');
    Open;
  end;
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frRekapitulasiBarang.fr3');
  FMemo(Dlaporan.Fr1,'Lperiode').Text := 'Periode : '+FormatDateTime('dd-mm-yyyy',dt1.Date)+' s/d '+FormatDateTime('dd-mm-yyyy',dt2.Date);
  Dlaporan.Fr1.ShowReport();
end;

procedure TFDataPoPenjualan.btnTutupClick(Sender: TObject);
begin
  Close;
end;


procedure TFDataPoPenjualan.DBGridEh1CellClick(Column: TColumnEh);
begin
    ExQry(dtrx.QpoPenjualanDetail,_SQLDetailJual+' WHERE d.nomerpo='''+dtrx.QpoPenjualan.FieldByName('nomerpo').AsString+'''',True);

end;

procedure TFDataPoPenjualan.Dt1PropertiesCloseUp(Sender: TObject);

begin

  ExQry(dtrx.QpoPenjualan,SQLpenjualana+' WHERE p.tgljual>="'+Tanggal(dt1.Date)+'" AND p.tgljual<="'+Tanggal(dt2.Date)+'" GROUP BY p.nomerpo',True);
end;

procedure TFDataPoPenjualan.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
  if Key = 13 then begin


  ExQry(dtrx.Qpopenjualan,SQLpenjualana+' WHERE (p.nomerpo like"%'+EPencarian.Text+'%" '+
                                     ' or pl.namapelanggan like"%'+EPencarian.Text+'%" ) GROUP BY p.nomerpo',True);
  end;
end;

procedure TFDataPoPenjualan.FormCreate(Sender: TObject);
begin
  FDataPoPenjualan := Self;
  SetTanggal(Self);
end;

procedure TFDataPoPenjualan.FormShow(Sender: TObject);

begin
   ExQry(dtrx.QpoPenjualan,SQLpenjualana+' WHERE p.tgljual>="'+Tanggal(dt1.Date)+'" AND p.tgljual<="'+Tanggal(dt2.Date)+'" GROUP BY p.nomerpo',True);


end;

{ ThExport }

end.
