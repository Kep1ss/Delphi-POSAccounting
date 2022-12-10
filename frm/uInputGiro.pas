unit uInputGiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinSharp,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxMaskEdit, cxDropDownEdit, Vcl.ComCtrls,
  cxTextEdit,uEngine,uComCtrl,uOvEdit,uctrlFrm, dxSkinGlassOceans,
  dxSkinLiquidSky, dxSkinOffice2010Blue, dxSkinOffice2016Colorful,
  dxSkiniMaginary, dxSkinMoneyTwins, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinLilian, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  TFinputGiro = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ENoBukti: TcxTextEdit;
    dt1: TDateTimePicker;
    ENogiro: TcxTextEdit;
    EBank: TcxTextEdit;
    Ekota: TcxTextEdit;
    ENominal: TcxTextEdit;
    dt2: TDateTimePicker;
    cbgiro: TcxComboBox;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    Label17: TLabel;
    Label18: TLabel;
    Eketerangan: TcxTextEdit;
    procedure btnTutupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure dt2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dt1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetAwal;
  end;

var
  FinputGiro: TFinputGiro;

implementation

{$R *.dfm}

uses udm, UBayarPiutang, uDtrx;

procedure TFinputGiro.btnSimpanClick(Sender: TObject);
var
  lst         : TStringList;
  idPelanggan : String;
  bayar       : real;
  piutang     : real;

begin
  if not CheckEdit(self) then begin
     lst := TStringList.Create;

     try

       ExQry(dm.Q1,'SELECT p.idpelanggan From pelanggan p LEFt JOIN piutang pp '+
       ' ON pp.kodepelanggan=p.kodepelanggan WHERE '+
       ' p.kodepelanggan="'+GetVal(dtrx.Qpiutang,'kodepelanggan')+'"',True);

       idPelanggan := GetVal(dm.Q1,'idpelanggan');


              bayar   := ENominal.AsFLoat;
              ExQry(dm.Q1,SQLpiutang+' WHERE s.kodepelanggan="'+GetVal(dtrx.Qpiutang,'kodepelanggan')+'"  AND lunas=False',True);
              repeat
                piutang := GetValF(dm.Q1,'kekurangan');
                if bayar  >= piutang then begin

                  addParam('nobukti',Enobukti.Text,lst,'str');
                  addParam('nopiutang',GetVal(dm.Q1,'fakturjual'),lst,'str');
                  addParam('nominal',FloatTostr(piutang),lst,'str');

                  exeDb(dm.Q3,'detailbayargiro',lst);

                  Bayar    := Bayar - piutang;
                  dm.Q1.Next;


                end else
                begin


                  addParam('nobukti',Enobukti.Text,lst,'str');
                  addParam('nopiutang',GetVal(dm.Q1,'fakturjual'),lst,'str');
                  addParam('nominal',FloatTostr(Bayar),lst,'str');

                  exeDb(dm.Q3,'detailbayargiro',lst);

                  Bayar := 0;
                end;

              until Bayar = 0;
           addParam('nobukti',     ENoBukti.Text,lst,'str');
           addParam('tglterima',   frmTgl(dt1.Date),lst,'date');
           addParam('nogiro',      ENogiro.Text,lst,'str');
           addParam('namabank',    EBank.Text,lst,'str');
           addParam('kota',        Ekota.Text,lst,'str');
           addParam('tglcair',     frmTgl(dt2.Date),lst,'date');
           addParam('nominal',     ENominal.isAngka,lst,'str');
           addParam('idpelanggan', idPelanggan,lst,'str');
           addParam('keterangan',  Eketerangan.Text,lst,'str');
           addParam('noakun',      Trim(Copy(cbgiro.Text,1,7)),lst,'str');
           OpenTable(dm.Q2,['idgiro'],'datagiro WHERE nobukti="'+ENoBukti.Text+'"');

           if dm.Q2.IsEmpty  then
              exeDb(dm.Q1,'datagiro',lst)
           else
              updatedb(dm.Q1,'datagiro',lst,'idgiro',GetVal(dm.Q2,'idgiro'));

           Informasi('Data Berhasil disimpan');
           FbayarPiutang.LNOGIRO.Caption := 'NO GIRO : '+ENogiro.Text;
           FbayarPiutang.cbAKun.Text     := cbgiro.Text;
           SetAwal;
           Close;
     finally
       lst.Free;
     end;

  end;
end;

procedure TFinputGiro.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFinputGiro.dt1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
     ENogiro.SetFocus;
end;

procedure TFinputGiro.dt2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
     cbgiro.SetFocus;
end;

procedure TFinputGiro.FormCreate(Sender: TObject);
begin
  ENominal.isRupiah := True;
  dt1.Date := now;
  dt2.Date := now;
end;

procedure TFinputGiro.SetAwal;
begin
  ClearText(Self);
  ENoBukti.Text := GetCode(dm.Q1,'datagiro','nobukti','GM');
  ExQry(dm.Q2,'SELECT kodeakunperkiraan,namaakunperkiraan '+
  ' FROM m_akunperkiraan WHERE akunsubmaster in ("102","101")',True);
  cbgiro.Properties.Items.Clear;
  while not dm.Q2.Eof do begin
    cbgiro.Properties.Items.Add(
    GetVal(dm.Q2,'kodeakunperkiraan')+' | '+
    GetVal(dm.Q2,'namaakunperkiraan'));
    dm.Q2.Next;
  end;
end;

end.
