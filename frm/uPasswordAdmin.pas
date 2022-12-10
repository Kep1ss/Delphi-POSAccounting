unit uPasswordAdmin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uctrlFrm, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,
  dxSkiniMaginary, cxButtons, uComCtrl, uEngine, uOvEdit;

type
  TFpasswordAdmin = class(TForm)
    Label1: TLabel;
    Epassword: TEdit;
    procedure btnBatalDiskonClick(Sender: TObject);
    procedure EpasswordKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    isFOrmPassword : integer;
    { Public declarations }
  end;

var
  FpasswordAdmin: TFpasswordAdmin;

implementation

{$R *.dfm}

uses uBayar, udm, uDlaporan, uPenjualan, uDataPenjualan, uResetData;



procedure TFpasswordAdmin.btnBatalDiskonClick(Sender: TObject);
begin
  CLose;
  Fbayar.Edisc.Text   := '';
  Fbayar.EdiscRp.Text :='';
end;

procedure TFpasswordAdmin.EpasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    ExQry(dm.Q1,'select * from m_user WHERE pwd=md5("'+Epassword.Text+'")',True);

    if dm.Q1.IsEmpty then begin
      Error(' MAAF PASWORD SALAH !!!, SILAHKAN HUBUNGI ADMIN');
      Exit;

    end else
    begin

          case isFOrmPassword of
          0 : begin
               if (GetVal(dm.Q1,'level') = 'ADMIN') or (GetVal(dm.Q1,'level') = 'SUPER ADMIN') then begin

                  Close;
                  FdataPenjualan.btnUbah.Click;
                  end;
              end;
          1 : begin
                 if GetVal(dm.Q1,'level') <> 'SUPER ADMIN' then begin
                       with Dlaporan.Qrekapkasir do begin
                            Close;
                            SQL.Text := ' SELECT                '+
                                        '      p.tgljual,       '+
                                        '      p.grandtotal,    '+
                                        '      p.nontunai,      '+
                                        '      pg.namalengkap,  '+
                                        '      k.namakomputer   '+
                                        '  from                 '+
                                        '    penjualan_2 p                '+
                                        '    left join m_user pg        '+
                                        '    on pg.iduser=p.iduser      '+
                                        '    left join komputer k on    '+
                                        '    k.komputerid=p.komputerid  '+
                                        '  WHERE p.tgljual="'+Tanggal(now)+'" '+
                                        ' AND k.komputerid="'+FPenjualanBarang.stat1.panels[1].Text+'" '+
                                        ' AND p.pembayaran=0';
                            open;
                           end;

                 end else begin
                    with Dlaporan.Qrekapkasir do begin
                            Close;
                            SQL.Text := ' SELECT                '+
                                        '      p.tgljual,       '+
                                        '      p.grandtotal,    '+
                                        '      p.nontunai,      '+
                                        '      pg.namalengkap,  '+
                                        '      k.namakomputer   '+
                                        '  from                 '+
                                        '    penjualan p                '+
                                        '    left join m_user pg        '+
                                        '    on pg.iduser=p.iduser      '+
                                        '    left join komputer k on    '+
                                        '    k.komputerid=p.komputerid  '+
                                        '  WHERE p.tgljual="'+Tanggal(now)+'" '+
                                        ' AND k.komputerid="'+FPenjualanBarang.stat1.panels[1].Text+'" '+
                                        ' AND p.pembayaran=0';
                            open;
                           end;
                 end;

                 Dlaporan.Fr1.LoadFromFile(aPathRpt+'\rekapitulasikasir.fr3');
                 Dlaporan.Fr1.PrepareReport(False);
                 Dlaporan.Fr1.PrintOptions.ShowDialog := True;
                 Dlaporan.Fr1.PrintOptions.Printer    := FPenjualanBarang.PrinterStruk;
                 Dlaporan.Fr1.ShowReport;

            end;
            2 : begin
                 if GetVal(dm.Q1,'level') = 'SUPER ADMIN' then
                 begin
                    with dm.Q4 do begin

                      if FresetData.CheckBox1.Checked then begin
                         CLose;
                         SQL.Text := 'Truncate Table bayarhutang;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table bayar hutang ..');
                         CLose;
                         SQL.Text := 'Truncate Table bayarpiutang;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table bayarpiutang ..');
                         CLose;
                         SQL.Text := 'Truncate Table detailbeli;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table detailbeli ..');
                         CLose;
                         SQL.Text := 'Truncate Table detailjurnalmemorial;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table detailjurnalmemorial ..');
                         CLose;
                         SQL.Text := 'Truncate Table detailmutasi;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table detailmutasi ..');
                         CLose;
                         SQL.Text := 'Truncate Table detailpengeluaranbiaya;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table detailpengeluaranbiaya ..');
                         CLose;
                         SQL.Text := 'Truncate Table detailreturbeli;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table detailreturbeli ..');
                         CLose;
                         SQL.Text := 'Truncate Table detailreturjual;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table detailreturjualg ..');
                         CLose;
                         SQL.Text := 'Truncate Table detailsalesorder;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table detailsalesorder ..');
                         CLose;
                         SQL.Text := 'Truncate Table detailsuratjalan;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table detailsuratjalan ..');
                         CLose;
                         SQL.Text := 'Truncate Table hutang;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table hutang ..');
                         CLose;
                         SQL.Text := 'Truncate Table jurnalmemorial;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table jurnalmemorial ..');
                         CLose;
                         SQL.Text := 'Truncate Table kartustok;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table kartustok ..');
                         CLose;
                         SQL.Text := 'Truncate Table hargabelirata;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table hargabelirata ..');
                         CLose;
                         SQL.Text := 'Truncate Table pendingso;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table pendingso ..');
                         CLose;
                         SQL.Text := 'Truncate Table pendingsodetail;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table pendingsodetail ..');
                         CLose;
                         SQL.Text := 'Truncate Table penerimaanbarang;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table penerimaanbarang..');
                         CLose;
                         SQL.Text := 'Truncate Table penerimaandetail;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table penerimaandetail ..');
                         CLose;
                         SQL.Text := 'Truncate Table pengeluaranbiaya;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table pengeluaranbiaya ..');
                         CLose;
                         SQL.Text := 'Truncate Table penjualan;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table penjualan ..');
                         CLose;
                         SQL.Text := 'Truncate Table penjualandetil;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table penjualandetil ..');
                         CLose;
                         SQL.Text := 'Truncate Table piutang;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table piutang ..');
                         CLose;
                         SQL.Text := 'Truncate Table pobeli;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table pobeli ..');
                         CLose;
                         SQL.Text := 'Truncate Table pobelidetail;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table pobelidetail ..');
                         CLose;
                         SQL.Text := 'Truncate Table rekapjualretur;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table rekapjualretur ..');
                         CLose;
                         SQL.Text := 'Truncate Table returpembelian;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table returpembelian ..');
                         CLose;
                         SQL.Text := 'Truncate Table returpenjualan;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table returpenjualan ..');
                         CLose;
                         SQL.Text := 'Truncate Table saldoakun;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table saldoakun ..');
                         CLose;
                         SQL.Text := 'Truncate Table salesorder;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table salesorder ..');
                         CLose;
                         SQL.Text := 'Truncate Table tutupbulan;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table tutupbulan ..');
                         CLose;
                         SQL.Text := 'Truncate Table tutuptahun;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table tutuptahun ..');
                      end;
                      if FresetData.CheckBox2.Checked then
                      begin
                         CLose;
                         SQL.Text := 'Truncate Table barang;';
                         ExecSQL;
                         CLose;
                         SQL.Text := 'Truncate Table m_supplier;';
                         ExecSQL;
                         CLose;
                         SQL.Text := 'Truncate Table kategori;';
                         ExecSQL;
                         CLose;
                         SQL.Text := 'Truncate Table multisatuan;';
                         ExecSQL;
                         CLose;
                         SQL.Text := 'Truncate Table multiqty;';
                         ExecSQL;
                         CLose;
                         SQL.Text := 'Truncate Table hargabelirata;';
                         ExecSQL;

                         FresetData.mmo1.Lines.Add('Mengosongkan table barang ..');

                         CLose;
                         SQL.Text := 'Truncate Table pelanggan;';
                         ExecSQL;
                         FresetData.mmo1.Lines.Add('Mengosongkan table barang ..');
                      end;

                    end;
                    FresetData.mmo1.Lines.Add('Reset data selesai');
                 end;
            end;
          end;
      CLose;
    end;
  end;
end;

procedure TFpasswordAdmin.FormShow(Sender: TObject);
begin
  Epassword.Clear;
end;

end.
