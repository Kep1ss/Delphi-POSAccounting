unit uDataPelunasanHutang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMcSkin,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxGroupBox, uComCtrl, uctrlFrm,
  uEngine, uOvEdit, cxCalc, cxCurrencyEdit, dxSkinSharp, dxBevel,System.DateUtils, cxLabel,
  dxSkiniMaginary, dxSkinMoneyTwins, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFdataPelunasanHutang = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EPencarian: TcxTextEdit;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    G2: TcxGroupBox;
    btnBaru: TcxButton;
    btnTutup: TcxButton;
    cxgrd1DBTableView1: TcxGridDBTableView;
    cxgrd1DBTableView1kodebarang: TcxGridDBColumn;
    cxgrd1DBTableView1namabarang: TcxGridDBColumn;
    cxgrd1DBTableView1satuan: TcxGridDBColumn;
    cxgrd1DBTableView1harga: TcxGridDBColumn;
    cxgrd1DBTableView1jumlah: TcxGridDBColumn;
    cxgrd1DBTableView1diskonpersen: TcxGridDBColumn;
    cxgrd1DBTableView1diskonrupiah: TcxGridDBColumn;
    cxgrd1DBTableView1ppn: TcxGridDBColumn;
    cxgrd1DBTableView1subtotal: TcxGridDBColumn;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    cxLabel1: TcxLabel;
    dxBevel1: TdxBevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxgGrid1DBTableView1nobukti: TcxGridDBColumn;
    cxgGrid1DBTableView1tgl: TcxGridDBColumn;
    cxgGrid1DBTableView1namasupplier: TcxGridDBColumn;
    cxgGrid1DBTableView1namalengkap: TcxGridDBColumn;
    cxgGrid1DBTableView1keterangan: TcxGridDBColumn;
    cxgGrid1DBTableView1nominal: TcxGridDBColumn;
    cxgGrid1DBTableView1nohutang: TcxGridDBColumn;
    btnHapus: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure EPencarianKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtp1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
  private
    { Private declarations }
  public
    const
      SQLdataPelunasanHutang = ' SELECT                                    '+
                               '     h.nobukti,                            '+
                               '     h.tgl,                                '+
                               '     s.namasupplier,                       '+
                               '     u.namalengkap,                        '+
                               '     h.keterangan,                         '+
                               '     h.nohutang,                            '+
                               '     h.nominal,                            '+
                               '     h.carabayar                            '+
                               '   FROM                                    '+
                               '     bayarhutang h                         '+
                               '     LEFT JOIN m_supplier s                '+
                               '       ON s.`idsupplier` = h.`idsupplier`  '+
                               '     LEFT JOIN m_user u                    '+
                               '       ON u.`iduser` = h.iduser            ';




    { Public declarations }
  end;

var
  FdataPelunasanHutang: TFdataPelunasanHutang;

implementation

{$R *.dfm}

uses uDtrx, udm, uBayarHutang, uPembayaranHutangNew, uBayarTitip;

procedure TFdataPelunasanHutang.btnBaruClick(Sender: TObject);
begin
  if not Assigned(FbayarHutang) then
     Application.CreateForm(TFbayarHutang,FbayarHutang);

     FbayarHutang.TampilanAwal;
     FbayarHutang.ShowModal;
end;

procedure TFdataPelunasanHutang.btnHapusClick(Sender: TObject);
begin
  if MessageDlg('Apakah yakin akan membatalkan Pelunasan?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin

    ExQry(dm.Q3,'SELECT * FROM detailbayarhutang WHERE nobukti="'+GetVal(dtrx.QpelunasanHutang,'nobukti')+'"',True);

    while not dm.Q3.Eof do begin
       ExQry(dm.Q1,'UPDATE hutang set dibayar=dibayar-"'+StrtoDecimal(GetVal(dm.Q3,'nominal'))+'" ,'+
      ' kekurangan=kekurangan+"'+StrtoDecimal(GetVal(dm.Q3,'nominal'))+'",'+
      ' nominalbkp=nominalbkp+"'+StrToDecimal(Getval(dm.Q3,'nominalbkp'))+'",'+
      ' nominalnonbkp=nominalnonbkp+"'+StrToDecimal(GetVal(dm.Q3,'nominalnonbkp'))+'",lunas=False '+
      ' WHERE nobukti="'+GetVal(dm.Q3,'nobuktibeli')+'" ',False);
      dm.Q3.Next;

    end;
    ExQry(dm.Q3,'DELETE FROM detailbayarhutang WHERE nobukti="'+GetVal(dtrx.QpelunasanHutang,'nobukti')+'"',False);
    ExQry(dm.Q1,'DELETE FROM saldoakun WHERE nobukti="'+GetVal(dtrx.QpelunasanHutang,'nobukti')+'" ',False);
    ExQry(dm.Q1,'DELETE FROM bayarhutang WHERE nobukti="'+GetVal(dtrx.QpelunasanHutang,'nobukti')+'" ',False);
    dtp1Change(Sender);
  end;
end;

procedure TFdataPelunasanHutang.btnTutupClick(Sender: TObject);
begin
  close;
end;

procedure TFdataPelunasanHutang.dtp1Change(Sender: TObject);
begin
  ExQry(dtrx.QpelunasanHutang,SQLdataPelunasanHutang+' WHERE h.tgl>="'+Tanggal(dtp1.Date)+'" AND h.tgl<="'+Tanggal(dtp2.Date)+'"',True);
end;

procedure TFdataPelunasanHutang.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
      ExQry(dtrx.QpelunasanHutang,SQLdataPelunasanHutang+' WHERE s.namasupplier Like "%'+Epencarian.Text+'%"',True);

  end;
end;

procedure TFdataPelunasanHutang.FormCreate(Sender: TObject);
begin
  SetTanggal(Self);
end;

procedure TFdataPelunasanHutang.FormShow(Sender: TObject);
begin
  dtp1.Date := EncodeDate(YearOf(now),MonthOf(now),1);
  dtp2.Date := EncodeDate(YearOf(now),MonthOf(now),DayOf(EndOfTheMonth(Now)));
  ExQry(dtrx.QpelunasanHutang,SQLdataPelunasanHutang+' WHERE h.tgl="'+Tanggal(now)+'"',True);
end;

end.
