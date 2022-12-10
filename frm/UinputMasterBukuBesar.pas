unit UinputMasterBukuBesar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,MyAccess, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinVisualStudio2013Light,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.Menus,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.StdCtrls, cxButtons,
  cxGroupBox, cxMaskEdit, cxDropDownEdit, cxTextEdit, cxPC, dxBevel, uEngine,
  uOvEdit, uComCtrl, dxSkiniMaginary, dxSkinMoneyTwins, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinVisualStudio2013Dark, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFinputMasterBukuBesar = class(TForm)
    dxbvl1: TdxBevel;
    Label1: TLabel;
    pg1: TcxPageControl;
    tb1: TcxTabSheet;
    tb2: TcxTabSheet;
    tb3: TcxTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ENoMaster: TcxTextEdit;
    ENamaMaster: TcxTextEdit;
    cbjenis: TcxComboBox;
    G1: TcxGroupBox;
    btnBaru: TcxButton;
    btnUbah: TcxButton;
    btnHapus: TcxButton;
    btnTutup: TcxButton;
    btnSimpan: TcxButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1nomasterakun: TcxGridDBColumn;
    cxGrid1DBTableView1namamasterakun: TcxGridDBColumn;
    cxGrid1DBTableView1jenisakun: TcxGridDBColumn;
    Label8: TLabel;
    Label9: TLabel;
    Enosub: TcxTextEdit;
    Label10: TLabel;
    Label11: TLabel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cbMaster: TcxComboBox;
    Label12: TLabel;
    Label13: TLabel;
    ENamaSub: TcxTextEdit;
    cxGridDBTableView1nomasterakun: TcxGridDBColumn;
    cxGridDBTableView1nosubmaster: TcxGridDBColumn;
    cxGridDBTableView1namasubmaster: TcxGridDBColumn;
    cxGridDBTableView1akunsubmaster: TcxGridDBColumn;
    Label14: TLabel;
    Label15: TLabel;
    cbsubmaster: TcxComboBox;
    EkodeAkun: TcxTextEdit;
    Enamaakun: TcxTextEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    cxGridDBTableView2kodeakunperkiraan: TcxGridDBColumn;
    cxGridDBTableView2namaakunperkiraan: TcxGridDBColumn;
    cxGridDBTableView2akunsubmaster: TcxGridDBColumn;
    procedure btnBaruClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnUbahClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbMasterPropertiesChange(Sender: TObject);
    procedure pg1PageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure cbsubmasterPropertiesChange(Sender: TObject);
  private
    procedure aktif(Q : array of TMyQuery);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FinputMasterBukuBesar: TFinputMasterBukuBesar;

implementation

{$R *.dfm}

uses udm;

function GenCode:String;
var
  kode:string;
  jml:integer;

begin

  ExQry(dm.Q1,'select MAX(nomasterakun) as noakun from m_bukubesar ',True);

   if StrToFloatDef(dm.Q1.Fields[0].AsString,0)=0  then
      jml := 1
   else
      jml := dm.Q1.Fields[0].AsInteger+ 1;

  kode := IntToStr(jml);
  Result := Kode;
end;

function getIdSub(id:String):String;
var
  jml  : Integer;
  Kode : string;
begin

  ExQry(dm.Q1,'select max(Right(nosubmaster,2)) as '+
                ' jum from m_subbukubesar where nomasterakun="'+id+'"',True);

  if StrToFloatDef(dm.Q1.Fields[0].AsString,0)=0  then jml := 1 else

   jml := dm.Q1.Fields[0].AsInteger+ 1;

  kode := IntToStr(jml);
  kode:= Copy('00'+kode,length('00'+kode)-1,2);
  Result := Kode;
end;

function GetNoAkun(id:String):String;
var
  jml  : Integer;
  Kode : string;
begin

  ExQry(dm.Q1,'select max(Right(kodeakunperkiraan,3)) as '+
                ' jum from m_akunperkiraan where akunsubmaster="'+id+'"',True);

  if StrToFloatDef(dm.Q1.Fields[0].AsString,0)=0  then jml := 1 else

   jml := dm.Q1.Fields[0].AsInteger+ 1;
  //ShowMessage(IntTOStr(jml));
  kode := IntToStr(jml);
  kode:= Copy('000'+kode,length('000'+kode)-2,3);
  Result := Kode;
end;


procedure TFinputMasterBukuBesar.aktif(Q: array of TMyQuery);
var
  i : Integer;
begin
  for I := Low(Q) to High(Q) do
  begin
    Q[i].Active := False;
    Q[i].Active := True;
  end;

end;

procedure TFinputMasterBukuBesar.btnBaruClick(Sender: TObject);
begin
  case pg1.ActivePageIndex of
  0 : begin
        ENoMaster.Clear;
        ENamaMaster.Clear;
        cbjenis.ItemIndex := 0;
        ENamaMaster.SetFocus;
        ENoMaster.Text := GenCode;
      end;
  1 : begin
        cbMaster.Text :='';
        Enosub.Clear;
        ENamaSub.Clear;
        ENamaSub.SetFocus;
      end;
  2 : begin
        cbsubmaster.Text :='';
        EkodeAkun.Text :='';
        Enamaakun.Clear;
        Enamaakun.SetFocus;
      end;
  end;
end;

procedure TFinputMasterBukuBesar.btnHapusClick(Sender: TObject);
begin
  case pg1.ActivePageIndex of
  0 : begin
        DelDb(dm.Q1,'m_bukubesar',GetVal(dm.QMasterAkun,'namamasterakun'),
             'idmasterakun',GetVal(dm.QMasterAkun,'idmasterakun'));

        dm.QMasterAkun.Active := false;
        dm.QMasterAkun.Active := True;
      end;
  1 : begin
        DelDb(dm.Q1,'m_subbukubesar',GetVal(dm.QSubMasterAkun,'namasubmaster'),
             'idsubmaster',GetVal(dm.QSubMasterAkun,'idsubmaster'));

        dm.QSubMasterAkun.Active := false;
        dm.QSubMasterAkun.Active := True;
      end;
  2 : begin
        DelDb(dm.Q1,'m_akunperkiraan',GetVal(dm.QMasterAkunPerkiraan,'namaakunperkiraan'),
             'idakunperkiraan',GetVal(dm.QMasterAkunPerkiraan,'idakunperkiraan'));

        dm.QMasterAkunPerkiraan.Active := false;
        dm.QMasterAkunPerkiraan.Active := True;
      end;
  end;
end;

procedure TFinputMasterBukuBesar.btnSimpanClick(Sender: TObject);
begin
  case pg1.ActivePageIndex of
  0 : begin
        with dm.QMasterAkun do begin
          Active := True;
          if Locate('nomasterakun',ENoMaster.Text,[]) = True then
             Edit
          else
             Append;
             FieldByName('nomasterakun').AsString   := ENoMaster.Text;
             FieldByName('namamasterakun').AsString := ENamaMaster.Text;
             FieldByName('jenisakun').AsString      := cbjenis.Text;
             Post;

             btnBaru.Click;
        end;
      end;
  1 : begin
        with dm.QSubMasterAkun do
        begin
          Active := True;
          if Locate('akunsubmaster',GetIdcmb(cbmaster)+Enosub.Text,[])=True then
             Edit
          else
            Append;
            FieldByName('nomasterakun').AsString     := GetIdcmb(cbmaster);
            FieldByName('nosubmaster').AsString      := Enosub.Text;
            FieldByName('namasubmaster').AsString    := ENamaSub.Text;
            FieldByName('akunsubmaster').AsString    := GetIdcmb(cbmaster)+Enosub.Text;
            Post;

            btnBaru.Click;
        end;
      end;

  2 : begin
        with dm.QMasterAkunPerkiraan do
        begin
          Active := True;
        if Locate('kodeakunperkiraan',EkodeAkun.Text,[])=True then
          Edit
        else
         Append;
         FieldByName('kodeakunperkiraan').AsString := EkodeAkun.Text;
         FieldByName('namaakunperkiraan').AsString := Enamaakun.Text;
         FieldByName('akunsubmaster').AsString     := GetIdcmb(cbsubmaster);
         Post;
        end;
        btnBaru.Click;
      end;
  end;

end;

procedure TFinputMasterBukuBesar.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFinputMasterBukuBesar.btnUbahClick(Sender: TObject);
begin
  case pg1.ActivePageIndex of
  0 : begin
        ENoMaster.Text    := dm.QMasterAkun.FieldByName('nomasterakun').AsString;
        ENamaMaster.Text  := dm.QMasterAkun.FieldByName('namamasterakun').AsString;
        if dm.QMasterAkun.FieldByName('jenisakun').AsString = 'A' then
           cbjenis.ItemIndex := 0 else
           cbjenis.ItemIndex := 1;
      end;
  1 : begin
        cbMaster.ItemIndex := idxCmb(cbMaster,GetValInt(dm.QSubMasterAkun,'nomasterakun'));
        Enosub.Text        := GetVal(dm.QSubMasterAkun,'nosubmaster');
        ENamaSub.Text      := GetVal(dm.QSubMasterAkun,'namasubmaster');
      end;
  2 : begin
        cbsubmaster.ItemIndex := idxCmb(cbsubmaster,GetValInt(dm.QMasterAkunPerkiraan,'akunsubmaster'));
        EkodeAkun.Text        := GetVal(dm.QMasterAkunPerkiraan,'kodeakunperkiraan');
        Enamaakun.Text        := GetVal(dm.QMasterAkunPerkiraan,'namaakunperkiraan');
      end;
  end;
end;

procedure TFinputMasterBukuBesar.cbMasterPropertiesChange(Sender: TObject);
begin
  EnoSub.Text  :=   getIdSub(GetIdcmb(cbmaster));
end;

procedure TFinputMasterBukuBesar.cbsubmasterPropertiesChange(Sender: TObject);
begin

   EkodeAkun.Text  := GetIdcmb(cbsubmaster)+'.'+GetNoaKun(GetIdcmb(cbsubmaster));
end;

procedure TFinputMasterBukuBesar.FormCreate(Sender: TObject);
begin
  isiCmb(dm.Q1,'m_bukubesar',['nomasterakun','namamasterakun'],cbMaster);
  isiCmb(dm.Q1,'m_subbukubesar',['akunsubmaster','namasubmaster'],cbsubmaster);
end;

procedure TFinputMasterBukuBesar.FormShow(Sender: TObject);
begin
  pg1.ActivePageIndex := 0;
  btnBaru.Click;
  aktif([dm.QMasterAkun,dm.QSubMasterAkun,dm.QMasterAkunPerkiraan]);
end;

procedure TFinputMasterBukuBesar.pg1PageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  AllowChange := True;
  isiCmb(dm.Q1,'m_bukubesar',['nomasterakun','namamasterakun'],cbMaster);
  isiCmb(dm.Q1,'m_subbukubesar',['akunsubmaster','namasubmaster'],cbsubmaster);
end;

end.
