object dm: Tdm
  OldCreateOrder = False
  Height = 416
  Width = 878
  object con1: TMyConnection
    Port = 3308
    LoginPrompt = False
    Left = 72
    Top = 8
  end
  object Q1: TMyQuery
    Connection = con1
    Left = 24
    Top = 64
  end
  object QUser: TMyQuery
    Connection = con1
    SQL.Strings = (
      'select * from m_user;')
    Left = 24
    Top = 136
  end
  object DuSer: TMyDataSource
    DataSet = QUser
    Left = 24
    Top = 192
  end
  object Q2: TMyQuery
    Connection = con1
    Left = 72
    Top = 64
  end
  object DProfil: TMyDataSource
    DataSet = Qprofil
    Left = 98
    Top = 192
  end
  object Qprofil: TMyQuery
    Connection = con1
    SQL.Strings = (
      'select * from profile')
    Left = 98
    Top = 136
  end
  object QMasterAkun: TMyQuery
    Connection = con1
    SQL.Strings = (
      'select * from m_bukubesar')
    Left = 24
    Top = 272
  end
  object DMasterAkun: TMyDataSource
    DataSet = QMasterAkun
    Left = 24
    Top = 328
  end
  object QSubMasterAkun: TMyQuery
    Connection = con1
    SQL.Strings = (
      'select * from m_subbukubesar')
    Left = 112
    Top = 272
  end
  object DSubMasterAkun: TMyDataSource
    DataSet = QSubMasterAkun
    Left = 112
    Top = 328
  end
  object QMasterAkunPerkiraan: TMyQuery
    Connection = con1
    SQL.Strings = (
      'select * from m_akunperkiraan')
    Left = 216
    Top = 272
  end
  object DMasterAkunPerkiraan: TMyDataSource
    DataSet = QMasterAkunPerkiraan
    Left = 216
    Top = 328
  end
  object Q3: TMyQuery
    Connection = con1
    Left = 120
    Top = 64
  end
  object D1: TMyDataSource
    DataSet = Q1
    Left = 256
    Top = 16
  end
  object DSupplier: TMyDataSource
    DataSet = QSupplier
    Left = 162
    Top = 192
  end
  object QSupplier: TMyQuery
    Connection = con1
    SQL.Strings = (
      'select * from m_supplier')
    Left = 162
    Top = 136
  end
  object DKategori: TMyDataSource
    DataSet = QKategori
    Left = 218
    Top = 192
  end
  object QKategori: TMyQuery
    Connection = con1
    SQL.Strings = (
      'select * from kategori')
    Left = 218
    Top = 136
  end
  object DLokasi: TMyDataSource
    DataSet = QLokasi
    Left = 274
    Top = 192
  end
  object QLokasi: TMyQuery
    Connection = con1
    SQL.Strings = (
      'select * from lokasi')
    Left = 274
    Top = 136
  end
  object DSatuan: TMyDataSource
    DataSet = QSatuan
    Left = 338
    Top = 192
  end
  object QSatuan: TMyQuery
    Connection = con1
    SQL.Strings = (
      'select * from Satuan')
    Left = 338
    Top = 136
  end
  object DJenisPelanggan: TMyDataSource
    DataSet = QJenisPelanggan
    Left = 410
    Top = 192
  end
  object QJenisPelanggan: TMyQuery
    Connection = con1
    SQL.Strings = (
      'select * from jenispelanggan')
    Left = 410
    Top = 136
  end
  object DPelanggan: TMyDataSource
    DataSet = QPelanggan
    Left = 482
    Top = 192
  end
  object QPelanggan: TMyQuery
    Connection = con1
    SQL.Strings = (
      'SELECT '
      '  p.idpelanggan,'
      '  p.kodepelanggan,'
      '  p.namapelanggan,'
      '  p.alamat,'
      '  p.kota,'
      '  p.notelpon,'
      '  P.idjenispelanggan,'
      '  jp.jenis,'
      '  p.maxpiutang,'
      '  p.top ,'
      '  p.poin,'
      '  p.maxjmlinvoice,'
      '  s.kodesales,'
      '  s.namasales,'
      '  p.idsales'
      'FROM'
      '  pelanggan p '
      '  LEFT JOIN jenispelanggan jp '
      '    ON p.`idjenispelanggan` = jp.`idjenispelanggan`'
      '  LEFT JOIN sales s '
      '    ON s.idsales=p.idsales')
    Left = 482
    Top = 136
  end
  object DBarang: TMyDataSource
    DataSet = QBarang
    Left = 546
    Top = 192
  end
  object QBarang: TMyQuery
    Connection = con1
    SQL.Strings = (
      'SELECT '
      '  b.idbarang,'
      '  b.kodebarang,'
      '  b.kodebarcode,'
      '  b.namabarang,'
      '  b.namabarcode,'
      '  k.namakategori,'
      '  b.satuanbeli,'
      '  b.satuanjual,'
      '  b.isi,'
      '  b.stokmin,'
      '  b.stokmax,'
      '  b.hargasebelum,'
      '  b.hargabeli,'
      '  (b.hargabeli + (b.hargabeli * b.ppn / 100)) as HargaPPN,'
      '  b.margin,'
      '  b.hargaecer,'
      '  b.margingrosir,'
      '  b.hargagrosir,'
      '  b.marginpartai,'
      '  b.hargapartai,'
      '  b.hargapartai4,'
      '  b.hargapartai5,'
      '  b.diskonpersen,'
      '  b.diskonrupiah,'
      '  h.hargabeli as hargabeliratarata,'
      '  b.minimalorder,'
      '  b.stok,'
      '  b.hargapromo,'
      '  b.tglawal,'
      '  b.tglakhir,'
      '  b.hargapromo2,'
      '  b.tglawal2,'
      '  b.tglakhir2,'
      '  b.hargapromo3,'
      '  b.tglawal3,'
      '  b.tglakhir3,'
      '  b.ppn,'
      '  b.bkp'
      'FROM'
      '  barang b '
      '  LEFT JOIN kategori k '
      '    ON b.`idkategori` = k.idkategori'
      '  LEFT JOIN hargabelirata h ON h.kodebarang=b.kodebarang')
    Left = 546
    Top = 136
  end
  object Q4: TMyQuery
    Connection = con1
    Left = 168
    Top = 64
  end
  object Dkomputer: TMyDataSource
    DataSet = Qkomputer
    Left = 634
    Top = 192
  end
  object Qkomputer: TMyQuery
    Connection = con1
    SQL.Strings = (
      'SELECT * FROM komputer')
    Left = 626
    Top = 136
  end
  object DmultiSatuan: TMyDataSource
    DataSet = QMultiSatuan
    Left = 338
    Top = 328
  end
  object QMultiSatuan: TMyQuery
    Connection = con1
    SQL.Strings = (
      
        'select s.*,(b.hargabeli * s.isi) as hargabeli  from multisatuan ' +
        's'
      'left join barang b on s.kodebarang=b.kodebarang')
    Left = 338
    Top = 272
  end
  object Dvoucher: TMyDataSource
    DataSet = Qvoucher
    Left = 522
    Top = 328
  end
  object Qvoucher: TMyQuery
    Connection = con1
    SQL.Strings = (
      'SELECT * FROM voucher')
    Left = 522
    Top = 272
  end
  object DSales: TMyDataSource
    DataSet = QSales
    Left = 634
    Top = 328
  end
  object QSales: TMyQuery
    Connection = con1
    SQL.Strings = (
      'select * from sales')
    Left = 634
    Top = 272
  end
  object Q5: TMyQuery
    Connection = con1
    Left = 216
    Top = 64
  end
  object Dcaribarang: TMyDataSource
    DataSet = Qcaribarang
    Left = 434
    Top = 16
  end
  object Qcaribarang: TMyQuery
    Connection = con1
    SQL.Strings = (
      'SELECT '
      '  b.kodebarang,'
      '  b.kodebarcode,'
      '  b.namabarang,'
      '  k.namakategori,'
      '  b.bkp,'
      'b.hargabeli,'
      '  b.hargaecer,'
      '  SUM(ks.saldoawal + ks.masuk - keluar) AS STOK '
      'FROM'
      '  barang b '
      '  LEFT JOIN kategori k '
      '    ON k.`idkategori` = b.`idkategori` '
      '  LEFT JOIN kartustok ks '
      '    ON ks.`kodebarang` = b.`kodebarang`')
    Left = 370
    Top = 16
  end
  object Q6: TMyQuery
    Connection = con1
    Left = 272
    Top = 64
  end
  object MyDump1: TMyDump
    Connection = con1
    Objects = [doDatabase, doStoredProcs, doTables, doData, doViews, doTriggers]
    Left = 584
    Top = 56
  end
  object DEDC: TMyDataSource
    DataSet = QEdc
    Left = 402
    Top = 336
  end
  object QEdc: TMyQuery
    Connection = con1
    SQL.Strings = (
      'select * from masteredc')
    Left = 402
    Top = 280
  end
  object DprintBarcode: TMyDataSource
    DataSet = QprinteBarcode
    Left = 722
    Top = 192
  end
  object QprinteBarcode: TMyQuery
    Connection = con1
    SQL.Strings = (
      'SELECT * FROM print_barcode')
    Left = 714
    Top = 136
  end
  object QMultiHarga: TMyQuery
    Connection = con1
    SQL.Strings = (
      'SELECT * FROM multisatuan')
    Left = 722
    Top = 280
  end
  object DMultiHarga: TMyDataSource
    DataSet = QMultiHarga
    Left = 722
    Top = 336
  end
  object QFree: TMyQuery
    Connection = con1
    Left = 344
    Top = 72
  end
  object Q7: TMyQuery
    Connection = con1
    Left = 304
    Top = 64
  end
end
