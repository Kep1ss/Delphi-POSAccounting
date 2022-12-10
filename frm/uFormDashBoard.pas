unit uFormDashBoard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkiniMaginary,
  cxGroupBox, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxCurrencyEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  Vcl.ExtCtrls, Vcl.StdCtrls,DateUtils, uDlaporan, cxCheckBox,
  dxSkinOffice2010Blue, dxSkinOffice2016Colorful, Vcl.Menus, cxButtons,
  dxSkinMoneyTwins,cxGridExportLink,Winapi.ShellAPI, uctrlFrm, MemDS, DBAccess,
  MyAccess, dxSkinFoggy, dxSkinGlassOceans, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
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
  TFFormDashBoard = class(TForm)
    G1: TcxGroupBox;
    G2: TcxGroupBox;
    G3: TcxGroupBox;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    cxg1: TcxGrid;
    cxgGrid1DBTableView11: TcxGridDBTableView;
    cxgGrid1Level11: TcxGridLevel;
    cxg2: TcxGrid;
    cxgGrid1DBTableView1fakturjual: TcxGridDBColumn;
    cxgGrid1DBTableView1piutang: TcxGridDBColumn;
    cxgGrid1DBTableView1tgltempo: TcxGridDBColumn;
    cxgGrid1DBTableView1kekurangan: TcxGridDBColumn;
    cxgGrid1DBTableView1namapelanggan: TcxGridDBColumn;
    cxgGrid1DBTableView11nobukti: TcxGridDBColumn;
    cxgGrid1DBTableView11tgltempo: TcxGridDBColumn;
    cxgGrid1DBTableView11hutang: TcxGridDBColumn;
    cxgGrid1DBTableView11kekurangan: TcxGridDBColumn;
    cxgGrid1DBTableView11namasupplier: TcxGridDBColumn;
    tmr1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxgGrid1DBTableView12: TcxGridDBTableView;
    cxgGrid1Level12: TcxGridLevel;
    cxg3: TcxGrid;
    cxgGrid1DBTableView12kodebarang: TcxGridDBColumn;
    cxgGrid1DBTableView12stokmin: TcxGridDBColumn;
    cxgGrid1DBTableView12stok: TcxGridDBColumn;
    cxgGrid1DBTableView12namabarang: TcxGridDBColumn;
    cxgGrid1DBTableView12namakategori: TcxGridDBColumn;
    cxgGrid1DBTableView12PERINGATAN: TcxGridDBColumn;
    G4: TcxGroupBox;
    CTAMPIL: TcxCheckBox;
    btnCetak: TcxButton;
    Gpesan: TcxGroupBox;
    Label4: TLabel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    QPesanan: TMyQuery;
    dsPesanan: TDataSource;
    cxGridDBTableView1nomerpo: TcxGridDBColumn;
    cxGridDBTableView1namapelanggan: TcxGridDBColumn;
    cxGridDBTableView1kodebarang: TcxGridDBColumn;
    cxGridDBTableView1namabarang: TcxGridDBColumn;
    cxGridDBTableView1jumlah: TcxGridDBColumn;
    cxGridDBTableView1stok: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure cxgGrid1DBTableView12CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure CTAMPILClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCetakClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFormDashBoard: TFFormDashBoard;

implementation

{$R *.dfm}

uses uDtrx, uEngine, uComCtrl, udm;



procedure TFFormDashBoard.btnCetakClick(Sender: TObject);
begin
  ExportGridToExcel(apathExe+'template\LapStokLimit.xls',
  cxg3,true,True,True);
  ShellExecute(handle,'open',PChar(apathExe+'template\LapStokLimit.xls'),nil,nil, SW_NORMAL);
end;

procedure TFFormDashBoard.CTAMPILClick(Sender: TObject);
begin
  with dm.Q1 do begin
    Close;
    SQL.Text := ' UPDATE barang SET warningiflimit=:warning WHERE kodebarang=:kodebarang';
    ParamByName('warning').AsBoolean := CTAMPIL.Checked;
    ParamByName('kodebarang').AsString := GetVal(Dlaporan.Qstoklimit,'kodebarang');
    ExecSQL;
  end;
  Dlaporan.Qstoklimit.Active := False;
  Dlaporan.Qstoklimit.Active := True;
end;

procedure TFFormDashBoard.cxgGrid1DBTableView12CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
 // OpenTable(dm.Q1,['warningiflimit'],'barang WHERE kodebarang="'+GetVal(Dlaporan.Qstoklimit,'kodebarang')+'"');

  CTAMPIL.Checked := GetValBol(Dlaporan.Qstoklimit,'PERINGATAN');
end;

procedure TFFormDashBoard.FormCreate(Sender: TObject);
begin
  FFormDashBoard := Self;
end;

procedure TFFormDashBoard.FormShow(Sender: TObject);
var
  tgl1,tgl2 : TDateTime;
  TotalStok , StokMin : Real;
begin
  ExQry(dtrx.Qhutang,' SELECT                                   '+
                     '     h.nobukti,                           '+
                     '     h.tglinput,                          '+
                     '     h.tgltempo,                          '+
                     '     h.hutang,                            '+
                     '     h.dibayar,                           '+
                     '     h.kekurangan,                        '+
                     '     h.lunas,                             '+
                     '     s.namasupplier                       '+
                     '   FROM                                   '+
                     '     hutang h                             '+
                     '     LEFT JOIN pembelian p                '+
                     '     ON p.`nobukti` = h.`nobukti`         '+
                     '     LEFT JOIN m_supplier s               '+
                     '   ON s.`idsupplier` = p.`idsupplier` WHERE '+
                     '  h.tgltempo="'+Tanggal(Now)+'" and lunas=False',True);
    ExQry(dtrx.Qpiutang,' SELECT                                        '+
                        '         h.fakturjual,                         '+
                        '         h.tglinput,                           '+
                        '         h.piutang,                            '+
                        '         h.tgltempo,                           '+
                        '         h.dibayar,                            '+
                        '         h.kekurangan,                         '+
                        '         h.lunas,                              '+
                        '         s.namapelanggan                       '+
                        '       FROM                                    '+
                        '         piutang h                             '+
                        '         LEFT JOIN penjualan p                 '+
                        '         ON p.`fakturjual` = h.`fakturjual`    '+
                        '         LEFT JOIN pelanggan s                 '+
                        '         ON s.`idpelanggan` = p.`idpelanggan`  '+
                        '       WHERE h.tgltempo<="'+tanggal(Now)+'" and lunas=false',True);

    ExQry(Dlaporan.Qstoklimit,' SELECT                                            '+
                              '      b.kodebarang,b.namabarang,k.namakategori,    '+
                              '      b.stokmin,b.warningiflimit as "PERINGATAN",   '+
                              '      b.stok                          '+
                              '    FROM                                           '+
                              '      barang b left join kategori                  '+
                              '      k on k.idkategori=b.idkategori               '+
                              '        WHERE b.warningiflimit=True                  '+
                              '     AND b.stok <= b.stokmin  ',True);

     tgl1 := EncodeDate(YearOf(now),MonthOf(now),1);
     tgl2 := EncodeDate(YearOf(now),MonthOf(now),DayOf(EndOfTheMonth(Now)));

     ExQry(QPesanan,'SELECT                                          '+
                 '     po.`nomerpo`,                              '+
                 '     pl.namapelanggan,                          '+
                 '     p.`kodebarang`,                            '+
                 '     b.namabarang,                              '+
                 '     p.`jumlah`,                                '+
                 '     SUM(                                       '+
                 '       ks.saldoawal + ks.masuk - ks.keluar      '+
                 '     ) AS stok                                  '+
                 '   FROM                                         '+
                 '     popenjualandetil p                         '+
                 '     LEFT JOIN barang b                         '+
                 '       ON b.`kodebarang` = p.`kodebarang`       '+
                 '     LEFT JOIN kartustok ks                     '+
                 '       ON ks.`kodebarang` = p.`kodebarang`      '+
                 '     LEFT JOIN popenjualan po                   '+
                 '       ON po.`nomerpo` = p.`nomerpo`            '+
                 '     LEFT JOIN pelanggan pl                     '+
                 '       ON pl.`idpelanggan` = po.`idpelanggan`   '+
                 '   WHERE MONTH(ks.tgl)="'+IntToStr(MOnthOf(now))+'" '+
                 '   AND YEAR(ks.tgl)="'+IntToStr(YearOf(now))+'" '+
                 '   AND po.stts="BELUM DIPROSES" GROUP BY p.`kodebarang` ',True);
     Gpesan.Visible := QPesanan.FieldByName('stok').AsInteger > 0;

     G1.Visible := Dlaporan.Qstoklimit.IsEmpty = False;
     G3.Visible := dtrx.Qhutang.IsEmpty  = False;
     G2.Visible := dtrx.Qpiutang.IsEmpty = False;

     if G3.Visible = False then G2.Align := alClient;
     if G2.Visible = False then G3.Align := alClient;
     if ( G2.Visible = False ) and ( G3.Visible = False) then G1.Align := alClient;



end;

procedure TFFormDashBoard.tmr1Timer(Sender: TObject);
begin
  if G1.Visible = TRue then begin
     if Label1.Caption = 'STOK BARANG LIMIT !!! SILAHKAN LAKUKAN PEMBELIAN' then
        Label1.Caption := '' else
        Label1.Caption := 'STOK BARANG LIMIT !!! SILAHKAN LAKUKAN PEMBELIAN';

  end;
  if G2.Visible = True then begin
     if Label2.Caption = 'PIUTANG PELANGGAN TELAH JATUH TEMPO !!!, LAKUKAN PENAGIHAN !' then
        Label2.Caption := '' else
        Label2.Caption := 'PIUTANG PELANGGAN TELAH JATUH TEMPO !!!, LAKUKAN PENAGIHAN !';
  end;
  if G3.Visible = True then begin
  if Label3.Caption = 'HUTANG TELAH JATUH TEMPO, LAKUKAN PEMBAYARAN !!!' then
        Label3.Caption := '' else
        Label3.Caption := 'HUTANG TELAH JATUH TEMPO, LAKUKAN PEMBAYARAN !!!';
  end;
  if Gpesan.Visible = True then begin
  if Label4.Caption = 'BARANG PESANAN SUDAH DATANG !!!' then
        Label4.Caption := '' else
        Label4.Caption := 'BARANG PESANAN SUDAH DATANG !!!';
  end;

end;

end.
