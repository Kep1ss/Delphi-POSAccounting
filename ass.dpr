program ass;

uses
  Vcl.Forms,
  ShellAPi,
  Windows,
  System.IniFiles,
  Dialogs,
  System.SysUtils,
  uMainMenu in 'frm\uMainMenu.pas' {Fmain},
  uComCtrl in 'ctrl\uComCtrl.pas',
  uctrlFrm in 'ctrl\uctrlFrm.pas',
  uEngine in 'ctrl\uEngine.pas',
  uOvEdit in 'ctrl\uOvEdit.pas',
  uTerbilang in 'ctrl\uTerbilang.pas',
  uDataKomputerKasir in 'frm\uDataKomputerKasir.pas' {FdataMasterKomputer},
  udm in 'frm\udm.pas' {dm: TDataModule},
  uSetingDatabase in 'frm\uSetingDatabase.pas' {FsettingDatabase},
  uInputJenisPelanggan in 'frm\uInputJenisPelanggan.pas' {FinputJenisPelanggan},
  Uprofile in 'frm\Uprofile.pas' {Fprofile},
  uMasterBukuBesar in 'frm\uMasterBukuBesar.pas' {FmasterBukubesar},
  UinputMasterBukuBesar in 'frm\UinputMasterBukuBesar.pas' {FinputMasterBukuBesar},
  uDataBarang in 'frm\uDataBarang.pas' {Fdatabarang},
  uInputDataBarang in 'frm\uInputDataBarang.pas' {FinputBarang},
  uDataVoucher in 'frm\uDataVoucher.pas' {FDataVoucher},
  uinputvoucher in 'frm\uinputvoucher.pas' {FinputVoucher},
  uDataKategori in 'frm\uDataKategori.pas' {FDataKategori},
  uInputKategori in 'frm\uInputKategori.pas' {FinputKategori},
  uDataLokasi in 'frm\uDataLokasi.pas' {FdataLokasi},
  uInputLokasi in 'frm\uInputLokasi.pas' {FinputLokasi},
  uInputSales in 'frm\uInputSales.pas' {FinputSales},
  uDataSales in 'frm\uDataSales.pas' {FdataSales},
  udataPelanggan in 'frm\udataPelanggan.pas' {FdataPelanggan},
  uInputPelanggan in 'frm\uInputPelanggan.pas' {FinputPelanggan},
  uSalesOrder in 'frm\uSalesOrder.pas' {FsalesOrder},
  uCariBarang in 'frm\uCariBarang.pas' {FcariBarang},
  uCariPelanggan in 'frm\uCariPelanggan.pas' {FcariPelanggan},
  uLaporanFIFO in 'frm\uLaporanFIFO.pas' {FLaporanFIFO},
  uDtrx in 'frm\uDtrx.pas' {dtrx: TDataModule},
  uReturPenjualan in 'frm\uReturPenjualan.pas' {FreturPenjualan},
  uDataMutasiBarang in 'frm\uDataMutasiBarang.pas' {FdataMutasiBarang},
  uDataReturPenjualan in 'frm\uDataReturPenjualan.pas' {FdataReturPenjualan},
  uDataPembelian in 'frm\uDataPembelian.pas' {FdataPembelian},
  uDataReturPembelian in 'frm\uDataReturPembelian.pas' {FdataReturPembelian},
  uReturBeliNew in 'frm\uReturBeliNew.pas' {Freturbelinew},
  uCariSales in 'frm\uCariSales.pas' {FcariSales},
  uDataHutang in 'frm\uDataHutang.pas' {FdataHutang},
  uDataPiutang in 'frm\uDataPiutang.pas' {FdataPiutang},
  uBayarTitip in 'frm\uBayarTitip.pas' {FbayarPiutangTitip},
  uBayarHutang in 'frm\uBayarHutang.pas' {FbayarHutang},
  uStokOpname in 'frm\uStokOpname.pas' {FStokOpname},
  uMutasiBarang in 'frm\uMutasiBarang.pas' {FMutasiBarang},
  uStokAwalBulan in 'frm\uStokAwalBulan.pas' {FprosesStokAwal},
  uUbahHarga in 'frm\uUbahHarga.pas' {FubahHargaBeli},
  uLaporanBarang in 'frm\uLaporanBarang.pas' {FlaporanBarang},
  uDlaporan in 'frm\uDlaporan.pas' {Dlaporan: TDataModule},
  uPrintBrosurBarang in 'frm\uPrintBrosurBarang.pas' {FDesignBrosurBarang},
  uJurnalMemorial in 'frm\uJurnalMemorial.pas' {FJurnalMemorial},
  uTransaksiJurnalMemorial in 'frm\uTransaksiJurnalMemorial.pas' {FtransaksiJurnal},
  uTransaksiPengeluaranBiaya in 'frm\uTransaksiPengeluaranBiaya.pas' {FtransaksiPengeluaranBiaya},
  uPengeluaranBiaya in 'frm\uPengeluaranBiaya.pas' {FpengeluaranBiaya},
  uCariAkun in 'frm\uCariAkun.pas' {FcariAkun},
  uLapPiutang in 'frm\uLapPiutang.pas' {FlapPiutang},
  uLapPembelian in 'frm\uLapPembelian.pas' {FlapPembelian},
  UcetakBarcode in 'frm\UcetakBarcode.pas' {FcetakBarcode},
  uSetingLimitasi in 'frm\uSetingLimitasi.pas' {FsetingLImitasi},
  uLogin in 'frm\uLogin.pas' {Flogin},
  UPOPembelian in 'frm\UPOPembelian.pas' {ForderPembelian},
  uCariDataStokOpname in 'frm\uCariDataStokOpname.pas' {FCariDataStokOpname},
  uDataTransaksiStokOpname in 'frm\uDataTransaksiStokOpname.pas' {FdataStokOpname},
  uCariPenjualanCabang in 'frm\uCariPenjualanCabang.pas' {FCariPenjualanCabang},
  uDataOrderPembelian in 'frm\uDataOrderPembelian.pas' {FdataOrderPembelian},
  uDataPenerimaanBarang in 'frm\uDataPenerimaanBarang.pas' {FDataPenerimaanBarang},
  uDataSalesOrder in 'frm\uDataSalesOrder.pas' {FdataSalesOrder},
  uPasswordAdmin in 'frm\uPasswordAdmin.pas' {FpasswordAdmin},
  uLapReturPembelian in 'frm\uLapReturPembelian.pas' {FlapReturPembelian},
  uLaporanHutang in 'frm\uLaporanHutang.pas' {FlapHutang},
  uLapPenjualan in 'frm\uLapPenjualan.pas' {FlapPenjualan},
  uLapReturPenjualan in 'frm\uLapReturPenjualan.pas' {FlapReturPenjualan},
  uFormDashBoard in 'frm\uFormDashBoard.pas' {FFormDashBoard},
  uInputKomputer in 'frm\uInputKomputer.pas' {FinputKomputer},
  uDataSatuan in 'frm\uDataSatuan.pas' {FdataSatuan},
  uInputSatuan in 'frm\uInputSatuan.pas' {FinputSatuan},
  uCopyNota in 'frm\uCopyNota.pas' {FCopyNota},
  upendingsalesorder in 'frm\upendingsalesorder.pas' {FpendingSO},
  uPilihSatuan in 'frm\uPilihSatuan.pas' {FpilihSatuan},
  uDataUser in 'frm\uDataUser.pas' {FDataUser},
  uInputUser in 'frm\uInputUser.pas' {FInputUser},
  uHistoryPenukaranPoin in 'frm\uHistoryPenukaranPoin.pas' {FhistoryPenukaranPoin},
  uInputSupplier in 'frm\uInputSupplier.pas' {Finputsupplier},
  uReturPenjualannew in 'frm\uReturPenjualannew.pas' {FreturJualNew},
  ucariSalesOrder in 'frm\ucariSalesOrder.pas' {FcariSalesOrder},
  uDataStokBarang in 'frm\uDataStokBarang.pas' {FdataStokBarang},
  uPendingTransaksi in 'frm\uPendingTransaksi.pas' {FpendingTransaksi},
  uDataSuratJalan in 'frm\uDataSuratJalan.pas' {FdataSuratJalan},
  uProgress in 'frm\uProgress.pas' {FLoading},
  uCariSupplier in 'frm\uCariSupplier.pas' {FcariSupplier},
  uPoPembelianBarangBaru in 'frm\uPoPembelianBarangBaru.pas' {FpoPembelianBarang},
  uSuratJalan in 'frm\uSuratJalan.pas' {FSuratJalan},
  uPembayaranPiutangNew in 'frm\uPembayaranPiutangNew.pas' {FbayarPiutangNew},
  uPembayaranHutangNew in 'frm\uPembayaranHutangNew.pas' {FpembayaranHutangNew},
  uLph in 'frm\uLph.pas' {FLPH},
  uLapNeraca in 'frm\uLapNeraca.pas' {FlapNeraca},
  uLaporanLabaRugi in 'frm\uLaporanLabaRugi.pas' {FlapLabaRugi},
  uLapJurnalTransaksi in 'frm\uLapJurnalTransaksi.pas' {FlapJurnalTransaksi},
  uLapBukuBesar in 'frm\uLapBukuBesar.pas' {FlapBukuBesar},
  uTutupBuku in 'frm\uTutupBuku.pas' {FtutupBUku},
  uRedemPoin in 'frm\uRedemPoin.pas' {FRedemPoin},
  uDataPemakainBarang in 'frm\uDataPemakainBarang.pas' {FdataPemakainBarang},
  uGantiJenisHarga in 'frm\uGantiJenisHarga.pas' {FGantiJenisHarga},
  uCariPenjualan in 'frm\uCariPenjualan.pas' {FcariPenjualan},
  uDataPelunasanHutang in 'frm\uDataPelunasanHutang.pas' {FdataPelunasanHutang},
  uDataPelunasanPiutang in 'frm\uDataPelunasanPiutang.pas' {FdataPelunasanPiutang},
  uLapPivot in 'frm\uLapPivot.pas' {FlapPivot},
  uBayar in 'frm\uBayar.pas' {Fbayar},
  UcatakLabel in 'frm\UcatakLabel.pas' {FcetakLabel},
  Ubackup in 'frm\Ubackup.pas' {Fbackupdatabase},
  UrestoreDatabase in 'frm\UrestoreDatabase.pas' {FRestoreDatabase},
  usetHarga in 'frm\usetHarga.pas' {FsetHargaDefault},
  uTutupTahun in 'frm\uTutupTahun.pas' {FtutupTahun},
  uCetakStokLimit in 'frm\uCetakStokLimit.pas' {FcetakStokLimit},
  uDataPoPenjualan in 'frm\uDataPoPenjualan.pas' {FDataPoPenjualan},
  uPoPenjualan in 'frm\uPoPenjualan.pas' {FpoPenjualan},
  uInputGiro in 'frm\uInputGiro.pas' {FinputGiro},
  uHistoryHargaBarang in 'frm\uHistoryHargaBarang.pas' {FhistoryHargaBarang},
  uExportExcel in 'frm\uExportExcel.pas' {FexportExcel},
  uInputMasterEDC in 'frm\uInputMasterEDC.pas' {FinputMasterEDC},
  uMasterEDC in 'frm\uMasterEDC.pas' {FmasterEDC},
  uBayarEDC in 'frm\uBayarEDC.pas' {FbayarEDC},
  uRekapitulasiBarangTerjual in 'frm\uRekapitulasiBarangTerjual.pas' {FrekapitulasiBarangTerjual},
  uPenjualan in 'frm\uPenjualan.pas' {FPenjualanBarang},
  uDataPenjualan in 'frm\uDataPenjualan.pas' {FdataPenjualan},
  uKartuStok in 'frm\uKartuStok.pas' {FkartuStok},
  uSupplier in 'frm\uSupplier.pas' {FdataSupplier},
  uPemakainBarang in 'frm\uPemakainBarang.pas' {FpemakainBarang},
  uHistoryPoinPelanggan in 'frm\uHistoryPoinPelanggan.pas' {FHistoryPoin},
  uPembelian in 'frm\uPembelian.pas' {FpembelianBarang},
  uCariPObeli in 'frm\uCariPObeli.pas' {FcariPO},
  uTutupKasir in 'frm\uTutupKasir.pas' {FtutupKasir},
  uImportKategori in 'frm\uImportKategori.pas' {FimportKategori},
  uImportPelanggan in 'frm\uImportPelanggan.pas' {FimportDataPelanggan},
  uImportBarang in 'frm\uImportBarang.pas' {FimportBarang},
  uImportSupplier in 'frm\uImportSupplier.pas' {FimportSupplier},
  uResetData in 'frm\uResetData.pas' {FresetData},
  uGantiBarcode in 'frm\uGantiBarcode.pas' {FBarcodeBarang},
  uSetSaldoAwal in 'frm\uSetSaldoAwal.pas' {FSaldoAwal},
  uSetingHargaPelanggan in 'frm\uSetingHargaPelanggan.pas' {FSetingHargaPelanggan},
  uSettingAkes in 'frm\uSettingAkes.pas' {FsetingAkses},
  uCaripembelian in 'frm\uCaripembelian.pas' {FcariPembelian},
  uCariPembelianCabang in 'frm\uCariPembelianCabang.pas' {FCariPebembelianCabang},
  uAktivasi in 'frm\uAktivasi.pas' {FAktivasi},
  WbemScripting_TLB in 'ctrl\WbemScripting_TLB.pas',
  uLaporanInOutBarang in 'frm\uLaporanInOutBarang.pas' {FlaporanInoutBarang},
  uStokLimitPersupplier in 'frm\uStokLimitPersupplier.pas' {FStokLimtiPerSupplier},
  uLaporanPenjualanPerKategori in 'frm\uLaporanPenjualanPerKategori.pas' {FLapPenjualanKategori},
  uSplash in 'uSplash.pas' {Fsplash},
  uInputQty in 'frm\uInputQty.pas' {FinputQty},
  uGantiKasir in 'frm\uGantiKasir.pas' {FGantiKasir},
  uLapMarginBarang in 'frm\uLapMarginBarang.pas' {FLapMarginBarang},
  uNewLaporanPenjualan in 'frm\uNewLaporanPenjualan.pas' {FNewLaporanPenjualan},
  uLapPenjualanKasir in 'frm\uLapPenjualanKasir.pas' {FLapPenjualanKasir},
  uLapPenjualanBarangPerSupplier in 'frm\uLapPenjualanBarangPerSupplier.pas' {FLapPenjualanBarangPerSupplier},
  uLapLabaPelanggan in 'frm\uLapLabaPelanggan.pas' {FLaporanLabaPelanggan},
  uLapProfitHarian in 'frm\uLapProfitHarian.pas' {FLapProfitHarian},
  uLapFrekuensiBarang in 'frm\uLapFrekuensiBarang.pas' {FLapFrekuensiBarang},
  uLapPenjualanBarangPelanggan in 'frm\uLapPenjualanBarangPelanggan.pas' {FLapPenjualanBarangPelanggan},
  uLapRekapitulasiPenjualanBarangPelanggan in 'frm\uLapRekapitulasiPenjualanBarangPelanggan.pas' {FlapRekapitulasiBarangPelanggan},
  uLaporanCigaretNonCigaret in 'frm\uLaporanCigaretNonCigaret.pas' {FLaporanCigaretNonCigaret},
  uGantiSales in 'frm\uGantiSales.pas' {FGantiSales},
  UlapPelanggan in 'frm\UlapPelanggan.pas' {FlapPelanggan},
  uMigration in 'frm\uMigration.pas' {FMigrationData},
  UBayarPiutang in 'frm\UBayarPiutang.pas' {FbayarPiutang},
  uLapOmsetBulan in 'frm\uLapOmsetBulan.pas' {FLapOmsetBulan},
  uSetoranKasir in 'frm\uSetoranKasir.pas' {FSetoranKasir},
  uPrintSetoranKasir in 'frm\uPrintSetoranKasir.pas' {FPrintSetoranKasir};

{$R *.res}


begin
  Application.Initialize;
  Fsplash  := TFsplash.Create(nil);
  Fsplash.OpenSplash;
  Application.MainFormOnTaskbar := True;
  FormatSettings.ThousandSeparator := '.';
  FormatSettings.DecimalSeparator  := ',';
  Application.CreateForm(Tdm, dm);
  Fsplash.ShowProgress('Sedang Mengoneksikan Database ...',1);
  SetKoneksi(dm.con1);
  dm.con1.Connect;
  if dm.con1.Connected = True then begin
    Fsplash.ShowProgress('Koneksi Database Berhasil ...',1);
    Application.CreateForm(Tdtrx, dtrx);
    Application.CreateForm(TDlaporan, Dlaporan);
  end else begin
    Fsplash.ShowProgress('Koneksi Database Gagal ....',1);
    Fsplash.Hide;
    Fsplash.Free;
  end;
  Fsplash.ShowProgress('Memuat Main Menu ....',2);
  Application.CreateForm(TFmain, Fmain);
  Application.ShowMainForm := False;
  Fsplash.ShowProgress('Memuat Supplier ....',3);
  Application.CreateForm(TFcariSupplier, FcariSupplier);
  Fsplash.ShowProgress('Memuat Barang ....',4);
  Application.CreateForm(TFcariBarang, FcariBarang);
  Fsplash.ShowProgress('Memuat Transaksi ....',5);
  Application.CreateForm(TFPenjualanBarang, FPenjualanBarang);
  Fsplash.ShowProgress('Memuat Pelanggan ....',6);
  Application.CreateForm(TFcariPelanggan, FcariPelanggan);
  Fsplash.ShowProgress('Memuat Transaksi ....',7);
  Application.CreateForm(TFbayar, Fbayar);
  Fsplash.ShowProgress('Memuat File Pendukung ....',8);
  Application.CreateForm(TFubahHargaBeli, FubahHargaBeli);
  Fsplash.ShowProgress('Memuat File Pendukung ....',9);
  Application.CreateForm(TFcariAkun, FcariAkun);
  Fsplash.ShowProgress('Memuat File Pendukung ....',10);
  Application.CreateForm(TFtransaksiPengeluaranBiaya, FtransaksiPengeluaranBiaya);
  Fsplash.ShowProgress('Memuat File Pendukung ....',11);
  Application.CreateForm(TFtransaksiJurnal, FtransaksiJurnal);
  Fsplash.ShowProgress('Memuat File Pendukung ....',12);
  Application.CreateForm(TFcetakBarcode, FcetakBarcode);
  Fsplash.ShowProgress('Memuat File Pendukung ....',13);
  Application.CreateForm(TFsetingLImitasi, FsetingLImitasi);
  Fsplash.ShowProgress('Memuat File Pendukung ....',14);
  Application.CreateForm(TFcariPO, FcariPO);
  Fsplash.ShowProgress('Memuat File Pendukung ....',15);
  Application.CreateForm(TFCariPenjualanCabang, FCariPenjualanCabang);
  Fsplash.ShowProgress('Memuat File Pendukung ....',16);
  Application.CreateForm(TFpasswordAdmin, FpasswordAdmin);
  Fsplash.ShowProgress('Memuat File Pendukung ....',17);
  Application.CreateForm(TFinputSatuan, FinputSatuan);
  Fsplash.ShowProgress('Memuat File Pendukung ....',18);
  Application.CreateForm(TFpendingTransaksi, FpendingTransaksi);
  Fsplash.ShowProgress('Memuat File Pendukung ....',19);
  Application.CreateForm(TFCopyNota, FCopyNota);
  Fsplash.ShowProgress('Memuat File Pendukung ....',20);
  Application.CreateForm(TFpilihSatuan, FpilihSatuan);
  Fsplash.ShowProgress('Memuat File Pendukung ....',21);
  Application.CreateForm(TFinputVoucher, FinputVoucher);
  Fsplash.ShowProgress('Memuat File Pendukung ....',22);
  Application.CreateForm(TFpoPenjualan, FpoPenjualan);
  Fsplash.ShowProgress('Memuat File Pendukung ....',23);
  Application.CreateForm(TFpendingSO, FpendingSO);
  Fsplash.ShowProgress('Memuat File Pendukung ....',24);
  Application.CreateForm(TFcariSalesOrder, FcariSalesOrder);
  Fsplash.ShowProgress('Memuat File Pendukung ....',25);
  Application.CreateForm(TFLoading, FLoading);
  Fsplash.ShowProgress('Memuat File Pendukung ....',26);
  Application.CreateForm(TFcariSales, FcariSales);
  Fsplash.ShowProgress('Memuat File Pendukung ....',27);
  Application.CreateForm(TFreturbelinew, Freturbelinew);
  Fsplash.ShowProgress('Memuat File Pendukung ....',28);
  Application.CreateForm(TFexportExcel, FexportExcel);
  Fsplash.ShowProgress('Memuat File Pendukung ....',29);
  Application.CreateForm(TFtutupBUku, FtutupBUku);
  Fsplash.ShowProgress('Memuat File Pendukung ....',30);
  Application.CreateForm(TFcariPenjualan, FcariPenjualan);
  Fsplash.ShowProgress('Memuat File Pendukung ....',31);
  Application.CreateForm(TFbackupdatabase, Fbackupdatabase);
  Fsplash.ShowProgress('Memuat File Pendukung ....',32);
  Application.CreateForm(TFRestoreDatabase, FRestoreDatabase);
  Fsplash.ShowProgress('Memuat File Pendukung ....',33);
  Application.CreateForm(TFcetakStokLimit, FcetakStokLimit);
  Fsplash.ShowProgress('Memuat File Pendukung ....',34);
  Application.CreateForm(TFpemakainBarang, FpemakainBarang);
  Fsplash.ShowProgress('Memuat File Pendukung ....',35);
  Application.CreateForm(TFinputGiro, FinputGiro);
  Fsplash.ShowProgress('Memuat File Pendukung ....',36);
  Application.CreateForm(TFhistoryHargaBarang, FhistoryHargaBarang);
  Fsplash.ShowProgress('Memuat File Pendukung ....',37);
  Application.CreateForm(TFbayarEDC, FbayarEDC);
  Fsplash.ShowProgress('Memuat File Pendukung ....',38);
  Application.CreateForm(TFCariDataStokOpname, FCariDataStokOpname);
  Fsplash.ShowProgress('Memuat File Pendukung ....',39);
  Application.CreateForm(TFcariPO, FcariPO);
  Fsplash.ShowProgress('Memuat File Pendukung ....',40);
  Application.CreateForm(TFtutupKasir, FtutupKasir);
  Fsplash.ShowProgress('Memuat File Pendukung ....',41);
  Application.CreateForm(TFBarcodeBarang, FBarcodeBarang);
  Fsplash.ShowProgress('Memuat File Pendukung ....',42);
  Application.CreateForm(TFresetData, FresetData);
  Fsplash.ShowProgress('Memuat File Pendukung ....',43);
  Application.CreateForm(TFSaldoAwal, FSaldoAwal);
  Fsplash.ShowProgress('Memuat File Pendukung ....',44);
  Application.CreateForm(TFsetingAkses, FsetingAkses);
  Fsplash.ShowProgress('Memuat File Pendukung ....',45);
  Application.CreateForm(TFcariPembelian, FcariPembelian);
  Fsplash.ShowProgress('Memuat File Pendukung ....',46);
  Application.CreateForm(TFCariPebembelianCabang, FCariPebembelianCabang);
  Fsplash.ShowProgress('Memuat File Pendukung ....',47);
  Application.CreateForm(TFAktivasi, FAktivasi);
  Application.CreateForm(TFinputQty, FinputQty);
  Application.CreateForm(TFGantiKasir, FGantiKasir);
  Application.CreateForm(TFGantiJenisHarga, FGantiJenisHarga);
  Application.CreateForm(TFDesignBrosurBarang, FDesignBrosurBarang);
  Application.CreateForm(TFMigrationData, FMigrationData);
  Application.CreateForm(TFPrintSetoranKasir, FPrintSetoranKasir);
  Fsplash.CloseSplash;
  Flogin.Login;

  Application.Run;

end.
