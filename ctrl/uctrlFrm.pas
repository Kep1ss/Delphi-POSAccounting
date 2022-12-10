unit uctrlFrm;

interface
uses
  Classes, cxTextEdit,cxButtons,Windows, SysUtils,cxCalendar, Forms, Dialogs, udm,
  uComCtrl,MEnus;

  type
    TForm = class (forms.TForm)
    private
      btnBaru   : TcxButton;
      btnPenjualanNew   : TcxButton;
      btnUbah   : TcxButton;
      btnCariBarang   : TcxButton;
      btnHapus  : TcxButton;
      btnTutup  : TcxButton;
      btnPrint  : TcxButton;
      btnSetting: TcxButton;
      btnGantiKasir : TcxButton;
      btnSimpan : TcxButton;
      btnRefresh : TcxButton;
      btnSupplier:TcxButton;
      btnCariPelanggan:TcxButton;
      EScanBarcode : TcxTextEdit;
      EBiayaLain : TcxTextEdit;
      btnFocus  : TcxButton;
      btnPending: TcxButton;
      btnbukaPending : TcxButton;
      btnCopyNota : TcxButton;
      ESales      : TcxTextedit;
      EPPn        : TcxTextEdit;
      T1        : TMenuItem;
      U1        : TMenuItem;
      H1        : TMenuItem;
      Epencarian : TcxTextEdit;

      procedure SetTanggal;
      procedure KeyUpHook(Sender: TObject; var Key: Word; Shift: TShiftState);
  protected

    public
      aPathRpt : String;
      apathExe : string;
      constructor Create(AOwner : TComponent);override;
    end;

implementation

{ TForm }


constructor TForm.Create(AOwner: TComponent);
begin
  inherited;
  KeyPreview        := True;
  btnBaru           := TcxButton(FindComponent('btnBaru'));
  btnPenjualanNew   := TcxButton(FindComponent('btnPenjualanNew'));
  btnUbah           := TcxButton(FindComponent('btnUbah'));
  btnCariBarang     := TcxButton(FindComponent('btnCariBarang'));
  btnHapus          := TcxButton(FindComponent('btnHapus'));
  btnPrint          := TcxButton(FindComponent('btnPrint'));
  btnTutup          := TcxButton(FindComponent('btnTutup'));
  btnSetting        := TcxButton(FindComponent('btnSetting'));
  btnSimpan         := TcxButton(FindComponent('btnSimpan'));
  btnSupplier       := TcxButton(FindComponent('btnSupplier'));
  btnCariPelanggan  := TcxButton(FindComponent('btnCariPelanggan'));
  btnRefresh        := TcxButton(FindComponent('btnRefres'));
  btnFocus          := TcxButton(FindComponent('btnFocus'));
  btnPending        := TcxButton(FindComponent('btnPending'));
  btnbukaPending    := TcxButton(FindComponent('btnBukaPending'));
  btnCopyNota       := TcxButton(FindComponent('btnCopyNota'));


  T1                := TMenuItem(FindComponent('T1'));
  U1                := TMenuItem(FindComponent('U1'));
  H1                := TMenuItem(FindComponent('H1'));
  Epencarian        := TcxTextEdit(FindComponent('Epencarian'));
  EPPn              := TcxTextEdit(FindComponent('EPpn'));
  EBiayaLain        := TcxTextEdit(FindComponent('EBiayaLain'));
  EscanBarcode      := TcxTextEdit(FindComponent('EScanBarcode'));
  ESales            := TcxTextEdit(FindComponent('ESales'));
  btnGantiKasir     := TcxButton(FindComponent('btnGantiKasir'));
  OnKeyUp           := KeyUpHook;
  aPathRpt          := ExtractFilePath(ParamStr(0))+'rpt';
  apathExe          := ExtractFilePath(ParamStr(0));
  FormatSettings.ThousandSeparator  := '.';
  FormatSettings.DecimalSeparator   := ',';
  SetTanggal;

  if Assigned(dm) then begin

      if dm.con1.Connected = True then begin

          with dm.Q1 do begin
            Close;
            SQL.Text := ' SELECT * FROM hakakes where iduser="'+setIdUser+'"';
            Open;

            while not Eof do begin

              if Self.Caption = TRIM(FieldByName('akses').AsString) then
              begin
                if btnBaru <> nil then begin
                    if FieldByName('tambah').AsBoolean = True then
                       btnBaru.Enabled := True else
                       btnBaru.Enabled := False;
                    if T1 <> nil then
                       T1.Enabled  := btnBaru.Enabled;
                end;
                if btnUbah <> nil then begin

                    if FieldByName('ubah').AsBoolean = True then
                       btnUbah.Enabled := True else
                       btnUbah.Enabled := False;
                    if U1 <> nil then
                       U1.Enabled  := btnUbah.Enabled;
                end;
               if btnHapus <> nil then begin
                    if FieldByName('hapus').AsBoolean = True then
                       btnHapus.Enabled := True else
                       btnHapus.Enabled := False;
                    if H1 <> nil then
                       H1.Enabled  := btnHapus.Enabled;
                end;
                if (btnSetting <> nil) and (btnUbah <> nil) and (btnBaru <> nil) then
                      btnSetting.Enabled := btnUbah.Enabled and btnBaru.Enabled;
              end;

              Next;
              end;
          end;
      end;
  end;
end;

procedure TForm.KeyUpHook(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_F1 : begin
            if btnBaru <> nil then btnBaru.Click;
            //
          end;
  VK_INSERT : begin
                if btnPenjualanNew <> nil then btnPenjualanNew.Click;

              end;
  VK_F2 : begin
            if (btnUbah <> nil)  then
             btnUbah.Click;

             if btnFocus <> nil then btnFocus.Click;
          end;
  VK_F3 : begin
            if btnSetting <> nil then  btnSetting.Click;
            if EScanBarcode <> nil then EScanBarcode.SetFocus;
          end;
  VK_DELETE : if btnHapus <>  nil then btnHapus.Click;
  VK_ESCAPE : Close;
  VK_F4     : begin
                if btnPrint <> nil then btnPrint.Click;
                if EBiayaLain <> nil then EBiayaLain.SetFocus;

              end;
  VK_F5     : begin
                if btnRefresh <> nil then btnRefresh.Click;
                if btnCariBarang <> nil then btnCariBarang.Click;


              end;
  VK_F6     : if btnbukaPending <> nil then btnbukaPending.Click;
  VK_F7     : if btnCopyNota <> nil then btnCopyNota.Click;
  VK_F8     : if btnSimpan <> nil then btnSimpan.Click;
  VK_F9     : if btnPending <> nil then btnPending.Click;
  VK_F11    : if btnGantiKasir <> nil then  btnGantiKasir.Click;
  VK_F12    : if ESales <> nil  then ESales.SetFocus;



  end;
  if (Key = 70) and (Shift = [ssCtrl]) then
  begin
    if Epencarian <> nil then Epencarian.SetFocus;

  end;
  if (Key = 83) and (Shift = [ssCtrl]) then
  begin
    if btnSimpan <> nil then btnSimpan.Click;
  end;
  if (Key = 82) and (Shift = [ssCtrl]) then
  begin
    if btnCariBarang <> nil then btnCariBarang.Click;
  end;
  if (Key = 68) and (Shift = [ssCtrl]) then
  begin
    if btnSupplier <> nil then btnSupplier.Click;
  end;
  if (Key = 67) and (Shift = [ssCtrl]) then
  begin
    if btnCariPelanggan <> nil then btnCariPelanggan.Click;
  end;

  //if (Key = 71) and (Shift = [ssCtrl]) then
  //begin
  //  FsetingLImitasi.Show;

 // end;
end;

procedure TForm.SetTanggal;
var
  i : integer;
begin
  for i := 0 to ComponentCount -1 do
    begin
      if Components[i] is TcxDateEdit then
         TcxDateEdit(Components[i]).Date := now;
    end;
end;

end.
