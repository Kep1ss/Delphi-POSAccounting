unit uBayar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMcSkin,
  Vcl.ExtCtrls, cxTextEdit, Vcl.StdCtrls, uComCtrl, uctrlFrm, uEngine, uOvEdit,
  dxSkiniMaginary, dxSkinOffice2010Blue, dxSkinOffice2016Colorful,
  dxSkinLiquidSky, dxSkinMoneyTwins, Vcl.Menus, cxButtons, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLondonLiquidSky,
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
  TFbayar = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Etotal: TcxTextEdit;
    Edisc: TcxTextEdit;
    EdiscRp: TcxTextEdit;
    EGrandTotal: TcxTextEdit;
    Label7: TLabel;
    Label8: TLabel;
    Ebayar: TcxTextEdit;
    Label9: TLabel;
    Label10: TLabel;
    Ekembali: TcxTextEdit;
    Label11: TLabel;
    Label12: TLabel;
    ETUnai: TcxTextEdit;
    Label15: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    EnominalVoucer: TcxTextEdit;
    Label16: TLabel;
    Label17: TLabel;
    Epersensucharge: TcxTextEdit;
    Label19: TLabel;
    Label20: TLabel;
    ETotalNonTUnai: TcxTextEdit;
    ENominalSurcharge: TcxTextEdit;
    btnBayarEDC: TcxButton;
    Label18: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Lmesin: TLabel;
    Lkartu: TLabel;
    shp1: TShape;
    Label24: TLabel;
    Label25: TLabel;
    cbKas: TComboBox;
    shp2: TShape;
    shp3: TShape;
    Label29: TLabel;
    Label30: TLabel;
    ETotalPiutang: TcxTextEdit;
    Label31: TLabel;
    Label32: TLabel;
    ETotalHarusBayar: TcxTextEdit;
    Label33: TLabel;
    Label34: TLabel;
    EbayarPiutang: TcxTextEdit;
    shp4: TShape;
    Label35: TLabel;
    Label36: TLabel;
    EBiayaLain: TcxTextEdit;
    Label37: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Epelanggan: TcxTextEdit;
    Label28: TLabel;
    Label38: TLabel;
    EPoin: TcxTextEdit;
    Label39: TLabel;
    Label40: TLabel;
    EBayarPoin: TcxTextEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdiscKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ETUnaiPropertiesChange(Sender: TObject);
    procedure ETUnaiKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EbayarKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EnominalVoucerPropertiesChange(Sender: TObject);
    procedure EbayarPropertiesChange(Sender: TObject);
    procedure btnBayarEDCClick(Sender: TObject);
    procedure EPpnKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EbayarPiutangKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EbayarPiutangExit(Sender: TObject);
    procedure EbayarPiutangKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EBayarPoinKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EBayarPoinKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure HitungGrandTOtal;
  public
    { Public declarations }
    NoKartu:string;
    EnterCounter : integer;
  end;

var
  Fbayar: TFbayar;

implementation

{$R *.dfm}

uses uPenjualan, uPasswordAdmin,udm, uBayarEDC;

procedure TFbayar.btnBayarEDCClick(Sender: TObject);
begin
  FbayarEDC.ShowModal;
end;

procedure TFbayar.EbayarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of

  VK_RETURN : begin
                if (Ebayar.AsFLoat + ETUnai.AsFLoat+EBayarPoin.AsFLoat) < EGrandTotal.AsFLoat then begin
                   Warning('Uang masih kurang');
                   Ebayar.SetFocus;
                   Exit;
                end else begin
                  FPenjualanBarang.Simpan;
                  FPenjualanBarang.Focus;
                  Close;
                end;
             end;
  VK_UP : begin
    ETUnai.SetFocus;
  end;
  end;

end;

procedure TFbayar.EbayarPiutangExit(Sender: TObject);
begin
  if EbayarPiutang.AsFLoat > ETotalPiutang.AsFLoat then
     EbayarPiutang.Text := ETotalPiutang.Text;
end;

procedure TFbayar.EbayarPiutangKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
      VK_DOWN   : EBayarPoin.SetFocus;
      VK_UP     : EnominalVoucer.SetFocus;
      VK_RETURN : ETUnai.SetFocus;

    end;
end;

procedure TFbayar.EbayarPiutangKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EbayarPiutang.AsFLoat > ETotalPiutang.AsFLoat then
     EbayarPiutang.Text := ETotalPiutang.Text;
end;

procedure TFbayar.EBayarPoinKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin


  case Key of
      VK_DOWN   : ETUnai.SetFocus;
      VK_UP     : EnominalVoucer.SetFocus;
      VK_RETURN : ETUnai.SetFocus;

    end;
end;

procedure TFbayar.EBayarPoinKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if EBayarPoin.AsFLoat > EPoin.AsFLoat then begin
     Error('Poin tidak mencukupi');
     Exit;
  end else begin
     Ekembali.Text := Format('%.0n',[(EBayarPoin.AsFLoat+ETunai.AsFLoat+EBayar.AsFLoat) - EGrandtotal.AsFLoat]);
  end;
end;

procedure TFbayar.EbayarPropertiesChange(Sender: TObject);
var
  NonTUnai , suCharge,TOtalNontunai,NOminalSucharge : Real;
begin
  if FPenjualanBarang.cbPembayaran.ItemIndex = 0 then begin


           Ekembali.Text := GetRupiah(FloatToStr((ETUnai.AsFLoat+Ebayar.AsFLoat+EBayarPoin.AsFLoat) - EGrandTotal.AsFLoat));
           NonTUnai      := Ebayar.AsFLoat;
           suCharge      := StrToFloatDef(Epersensucharge.Text,0);
           NOminalSucharge := NonTUnai * suCharge / 100;
           ENominalSurcharge.Text := Format('%.0n',[NOminalSucharge]);
           TOtalNontunai := NonTUnai + NOminalSucharge;
           ETotalNonTUnai.Text :=Format('%.0n',[TOtalNonTunai]);

  end else begin

           Ekembali.Text := GetRupiah(FloatToStr( EGrandTotal.AsFLoat - (ETUnai.AsFLoat+Ebayar.AsFLoat+EBayarPoin.AsFLoat)));
           NonTUnai      := Ebayar.AsFLoat;
           suCharge      := StrToFloatDef(Epersensucharge.Text,0);
           NOminalSucharge := NonTUnai * suCharge / 100;
           ENominalSurcharge.Text := Format('%.0n',[NOminalSucharge]);
           TOtalNontunai := NonTUnai + NOminalSucharge;
           ETotalNonTUnai.Text :=Format('%.0n',[TOtalNonTunai]);

  end;
end;

procedure TFbayar.EdiscKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  HitungGrandTOtal;
end;

procedure TFbayar.EnominalVoucerPropertiesChange(Sender: TObject);
begin
  HitungGrandTOtal;
end;

procedure TFbayar.EPpnKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  HitungGrandTOtal;
end;

procedure TFbayar.ETUnaiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of

  VK_RETURN : begin

                if EnterCounter = 0 then begin
                    EnterCounter := 1;
                    if FPenjualanBarang.cbPembayaran.ItemIndex = 0 then
                    begin
                        if ETUnai.AsFLoat + Ebayar.AsFLoat > 0 then begin

                              if (ETUnai.AsFLoat + Ebayar.AsFLoat + EBayarPoin.AsFLoat) < EGrandTotal.AsFLoat then begin
                                   Error('Pembayaran masih kurang');
                                   ETUnai.SetFocus;
                                   Exit;
                              end else begin
                                FPenjualanBarang.Simpan;
                                Close;
                              end;
                        end else begin
                           ETUnai.Text := EGrandTotal.Text;
                           FPenjualanBarang.Simpan;
                           Close;
                        end;
                    end else begin
                        FPenjualanBarang.Simpan;
                        Close;
                    end;

                end else
                  Key := 0;
              end;
  VK_DOWN   : Ebayar.SetFocus;
  VK_UP     : EBayarPoin.SetFocus;

  end;
end;

procedure TFbayar.ETUnaiPropertiesChange(Sender: TObject);
begin
  if FPenjualanBarang.cbPembayaran.ItemIndex = 0 then begin

        if ETUnai.AsFLoat > 0   then
           Ekembali.Text := GetRupiah(FloatToStr((ETUnai.AsFLoat+Ebayar.AsFLoat+EBayarPoin.AsFLoat) - EGrandTotal.AsFLoat));
   end
   else begin
     if ETUnai.AsFLoat > 0 then begin
        if (ETUnai.AsFLoat+Ebayar.AsFLoat+EBayarPoin.AsFLoat) > EGrandTotal.AsFLoat then
           Error('Transaksi Piutang !!!! '+#13+'Jumlah bayar harus lebih kecil dari nominal piutang')
        else
           Ekembali.Text := GetRupiah(FloatToStr( EGrandTotal.AsFLoat - (ETUnai.AsFLoat+Ebayar.AsFLoat+EBayarPoin.AsFLoat)));
     end;
   end;

    
end;

procedure TFbayar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Ebayar.Text   := '';
  ETUnai.Text   := '';
  Edisc.Text    := '';
  EdiscRp.Text  := '';
  EnominalVoucer.Text     :='';
  Epersensucharge.Text    :='';
  ENominalSurcharge.Text  :='';
  ETotalNonTUnai.Text     :='';
  ETotalPiutang.Text      := '';
  ETotalHarusBayar.Text   := '';
  EbayarPiutang.Text      := '';
  EBayarPoin.Text         := '';
  Epelanggan.Text         := '';
  EPoin.Text              := '';
  EnterCounter := 0;

end;

procedure TFbayar.FormCreate(Sender: TObject);
begin
  Etotal.isRupiah   := True;
  EdiscRp.isRupiah  := True;
  Edisc.isPersen    := True;
  Ebayar.isRupiah   := True;
  ETUnai.isRupiah   := True;
  Ebayar.isCari     := True;
  ETUnai.isCari     := True;
  EBayarPoin.isRupiah := True;
  EnominalVoucer.isRupiah := True;
  EbayarPiutang.isRupiah  := True;
  EBiayaLain.isRupiah := True;
end;

procedure TFbayar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_F10     : begin
                  Edisc.Enabled := True;
                  EdiscRp.Enabled := True;
                  EdiscRp.SetFocus;
                end;

  VK_SPACE   : btnBayarEDC.Click;
  VK_F4     : EBiayaLain.SetFocus;

  end;
end;

procedure TFbayar.FormShow(Sender: TObject);

begin


   cbKas.Enabled := FPenjualanBarang.cbPembayaran.ItemIndex = 0;
   ExQry(dm.Q2,'SELECT kodeakunperkiraan,namaakunperkiraan '+
   ' FROM m_akunperkiraan WHERE akunsubmaster in ("102","101")',True);

    cbKas.Items.Clear;
    while not dm.Q2.Eof do begin
      cbKas.Items.Add(
      GetVal(dm.Q2,'kodeakunperkiraan')+' | '+
      GetVal(dm.Q2,'namaakunperkiraan'));
      dm.Q2.Next;
    end;
     ExQry(dm.QUser,'SELECT * FROM m_user WHERE iduser="'+setIdUser+'"',True);

    cbKas.ItemIndex := cbKas.Items.IndexOf(GetVal(dm.QUser,'kas_penjualan'));
   Fbayar.ETUnai.SetFocus ;
   Edisc.Enabled    := False;
   EdiscRp.Enabled  := False;
   Lmesin.Caption   := '';
   Lkartu.Caption   := '';
end;

procedure TFbayar.HitungGrandTOtal;
var
  Total,Disc,Drp,Grandtotal,Voucher,BiayaLain  : Real;
begin
  Total         := Etotal.AsFLoat;
  Disc          := Edisc.AsFLoat;
  Drp           := Total * disc / 100;
  BiayaLain     := EBiayaLain.AsFLoat;

  Voucher       := EnominalVoucer.AsFLoat;
  if Disc > 0 then
  EdiscRp.Text  := GetRupiah(FloatToStr(drp));
  Grandtotal    := (Total+BiayaLain) - EdiscRp.AsFLoat - Voucher ;
  EGrandTotal.Text := GetRupiah(FloatTostr(Grandtotal));
  FPenjualanBarang.EdiscRp.Text     := EdiscRp.Text;
  FPenjualanBarang.EGrandTotal.Text := EGrandTotal.Text;
  ETotalHarusBayar.Text             := Format('%.0n',[EgrandTotal.AsFLoat + ETotalPiutang.AsFLoat]);
  FPenjualanBarang.ETotal.Text      := EGrandTotal.Text;
end;

end.
