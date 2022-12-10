object dtrx: Tdtrx
  OldCreateOrder = False
  Height = 558
  Width = 1150
  object QPembelian: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  p.idpembelian,'
      '  p.nobukti,'
      '  p.tgl,'
      '  p.pembayaran,'
      '  p.idsupplier,'
      '  p.refnota,'
      '  s.kodesupplier,'
      '  s.namasupplier,'
      '  p.nopo,'
      '  p.iduser,'
      '  u.namalengkap,'
      '  p.total,'
      '  p.ppn,'
      '  p.diskon,'
      '  p.grandtotal,'
      '  p.keterangan'
      'FROM'
      '  pembelian p '
      '  LEFT JOIN m_supplier s '
      '    ON s.`idsupplier` = p.`idsupplier` '
      '  LEFT JOIN m_user u '
      '    ON u.`iduser` = p.`iduser`')
    CachedUpdates = True
    Left = 40
    Top = 48
  end
  object Qdetailbeli: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  d.iddetilbeli,'
      '  d.nobukti,'
      '  d.kodebarang,'
      '  b.namabarang,'
      '  d.satuan,'
      '  d.harga,'
      '  d.jumlah,'
      '  d.diskonpersen,'
      '  d.diskon2,'
      '  d.diskon3,'
      '  d.ppn,'
      '  d.subtotal,'
      '  d.isi,'
      '  d.idgudang,'
      '  l.namalokasi '
      'FROM'
      '  detailbeli d '
      '  LEFT JOIN barang b '
      '    ON d.`kodebarang` = b.`kodebarang` '
      '  LEFT JOIN lokasi l '
      '    ON l.`idlokasi` = d.`idgudang`')
    Left = 112
    Top = 48
  end
  object DPembelian: TMyDataSource
    DataSet = QPembelian
    Left = 40
    Top = 112
  end
  object DDetailBeli: TMyDataSource
    DataSet = Qdetailbeli
    Left = 112
    Top = 112
  end
  object QReturBeli: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  rb.nobukti,'
      '  rb.tgl,'
      '  rb.nobuktibeli,'
      '  s.namasupplier,'
      '  rb.total,'
      '  rb.keterangan,'
      '  rb.lunas '
      'FROM'
      '  returpembelian rb '
      '  LEFT JOIN pembelian p '
      '    ON p.`nobukti` = rb.`nobuktibeli` '
      '  LEFT JOIN m_supplier s '
      '    ON s.`idsupplier` = p.`idsupplier`')
    Left = 184
    Top = 48
  end
  object QDetailReturBeli: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  dr.nobukti,'
      '  dr.kodebarang,'
      '  b.kodebarcode,'
      '  b.namabarang,'
      '  dr.satuan,'
      '  dr.harga,'
      '  dr.jumlah,'
      '  dr.diskonpersen,'
      '  dr.diskonrupiah,'
      '  dr.ppn,'
      '  dr.subtotal,'
      '  dr.isi,'
      '  dr.idgudang '
      'FROM'
      '  detailreturbeli dr '
      '  LEFT JOIN barang b '
      '    ON dr.`kodebarang` = b.`kodebarang`')
    MasterFields = 'nobukti'
    Left = 256
    Top = 48
  end
  object DReturBeli: TMyDataSource
    DataSet = QReturBeli
    Left = 184
    Top = 112
  end
  object DDetailReturBeli: TMyDataSource
    DataSet = QDetailReturBeli
    Left = 256
    Top = 112
  end
  object Qpenjualan: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  p.fakturjual,'
      '  p.tgljual,'
      '  p.idpelanggan,'
      '  p.nomerso,'
      '  pl.namapelanggan,'
      
        '  (CASE WHEN p.pembayaran=0 THEN "CASH" ELSE "KREDIT" END) as TR' +
        'X,'
      
        '  (CASE WHEN p.pembayaran=0 and p.nontunai<>0 THEN "NON TUNAI" E' +
        'LSE "TUNAI" end ) as pembayaran,'
      '  p.total,'
      '  p.tglkirim,'
      '  p.diskon,'
      
        '  SUM(d.subtotal - (( d.subtotal / d.jumlah) * d.jumlahretur)) a' +
        's grandtotal,'
      '  pg.namalengkap,'
      '  s.namasales,'
      '  s.kodesales,'
      '  p.kirim,'
      '  p.bayar,'
      '  p.kembali,'
      '  p.keterangan '
      'FROM'
      
        '  penjualan p LEFT JOIN penjualandetil d ON d.fakturjual=p.faktu' +
        'rjual'
      '  LEFT JOIN pelanggan pl '
      '    ON pl.`idpelanggan` = p.`idpelanggan`'
      '  LEFT JOIN m_user pg '
      '   ON pg.iduser=p.`iduser`'
      '  LEFT JOIN sales s '
      '   ON s.idsales=p.idsales'
      '   '
      'group by p.fakturjual')
    Left = 40
    Top = 184
  end
  object QdetailJual: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  d.iddetil,'
      '  d.fakturjual,'
      '  d.kodebarang,'
      '  b.namabarang,'
      '  d.satuan,'
      '  d.harga,'
      '  d.hpp,'
      '  d.jumlah,'
      '  d.jumlahretur,'
      '  d.diskonpersen,'
      '  d.diskon2,'
      '  d.diskon3,'
      '  d.diskonrupiah,'
      
        '  d.subtotal-((d.subtotal / d.jumlah) * d.jumlahretur) as subtot' +
        'al,'
      '  d.isi,'
      '  d.idgudang,'
      '  l.namalokasi '
      'FROM'
      '  penjualandetil d '
      '  LEFT JOIN barang b '
      '    ON d.`kodebarang` = b.`kodebarang` '
      '  LEFT JOIN lokasi l '
      '    ON l.`idlokasi` = d.`idgudang`')
    MasterFields = 'nobukti'
    Left = 112
    Top = 184
  end
  object Dpenjualan: TMyDataSource
    DataSet = Qpenjualan
    Left = 40
    Top = 248
  end
  object DDetailJual: TMyDataSource
    DataSet = QdetailJual
    Left = 112
    Top = 248
  end
  object QreturJual: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  rb.nobukti,'
      '  rb.tgl,'
      '  rb.nobuktijual,'
      '  s.namapelanggan,'
      '  rb.total,'
      '  rb.keterangan '
      'FROM'
      '  returpenjualan rb '
      '  LEFT JOIN penjualan p '
      '    ON p.`fakturjual` = rb.`nobuktijual` '
      '  LEFT JOIN pelanggan s '
      '    ON s.`idpelanggan` = rb.`idpelanggan`')
    Left = 184
    Top = 184
  end
  object QdetailReturjual: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  dr.nobukti,'
      '  dr.kodebarang,'
      '  b.kodebarcode,'
      '  b.namabarang,'
      '  dr.satuan,'
      '  dr.harga,'
      '  dr.jumlah,'
      '  dr.diskonpersen,'
      '  dr.diskonrupiah,'
      '  dr.subtotal,'
      '  dr.isi,'
      '  dr.idgudang '
      'FROM'
      '  detailreturjual dr '
      '  LEFT JOIN barang b '
      '    ON dr.`kodebarang` = b.`kodebarang`')
    MasterFields = 'nobukti'
    Left = 256
    Top = 184
  end
  object DreturJual: TMyDataSource
    DataSet = QreturJual
    Left = 184
    Top = 248
  end
  object DDetailReturJual: TMyDataSource
    DataSet = QdetailReturjual
    Left = 256
    Top = 248
  end
  object Qpiutang: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT   '
      '       h.fakturjual,  '
      '       p.nomerso,                     '
      '       h.tglinput,                            '
      '       h.piutang,                             '
      '       h.tgltempo,                            '
      
        '       CONCAT(TO_DAYS(CURDATE())-TO_DAYS(h.tgltempo)," ","Hari")' +
        ' AS umurhutang,'
      '       h.dibayar,                             '
      '       h.kekurangan,                         '
      '       h.lunas,   '
      '       h.nominalbkp,'
      '       h.nominalnonbkp,                            '
      '       s.namapelanggan                        '
      '     FROM                                     '
      '       piutang h                              '
      '       LEFT JOIN penjualan p                  '
      '       ON p.`fakturjual` = h.`fakturjual`         '
      '       LEFT JOIN pelanggan s                  '
      '       ON s.`idpelanggan` = p.`idpelanggan`')
    Left = 48
    Top = 312
  end
  object Dpiutang: TMyDataSource
    DataSet = Qpiutang
    Left = 48
    Top = 376
  end
  object Qhutang: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT                                    '
      '      h.nobukti,                               '
      '      h.tglinput, '
      '      h.tgltempo,                             '
      '      h.hutang,                                '
      '      h.dibayar,                               '
      '      h.kekurangan,   '
      '      h.nominalbkp,'
      '      h.nominalnonbkp,                         '
      '      h.lunas,                                 '
      '      s.namasupplier                           '
      '    FROM                                       '
      '      hutang h                                 '
      '      LEFT JOIN pembelian p                    '
      '      ON p.`nobukti` = h.`nobukti`           '
      '      LEFT JOIN m_supplier s                   '
      '    ON s.`idsupplier` = p.`idsupplier` ;')
    Left = 104
    Top = 312
  end
  object Dhutang: TMyDataSource
    DataSet = Qhutang
    Left = 112
    Top = 376
  end
  object Qpengeluaran: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      
        'Select pb.nobukti,pb.tanggal,pb.noakun,b.namaakunperkiraan,pb.no' +
        'minal,pb.keterangan'
      
        'from pengeluaranbiaya pb left join  m_akunperkiraan b on pb.noak' +
        'un=b.kodeakunperkiraan')
    MasterFields = 'nobukti'
    Left = 352
    Top = 48
  end
  object DPengeluaran: TMyDataSource
    DataSet = Qpengeluaran
    Left = 352
    Top = 117
  end
  object QDetailPengeluaran: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      
        'Select a.nobukti,a.noakun,b.namaakunperkiraan,a.keterangan,a.nom' +
        'inal'
      'from detailpengeluaranbiaya a left join m_akunperkiraan b on '
      'a.noakun=b.kodeakunperkiraan')
    MasterSource = DPengeluaran
    MasterFields = 'nobukti'
    DetailFields = 'nobukti'
    Left = 456
    Top = 48
    ParamData = <
      item
        DataType = ftString
        Name = 'nobukti'
        ParamType = ptInput
        Value = 'KK180124001'
      end>
  end
  object Ddetailpengeluaran: TMyDataSource
    DataSet = QDetailPengeluaran
    Left = 456
    Top = 117
  end
  object Qpinjaman: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '     b.nobukti,'
      '     b.tanggal, '
      '     b.idkaryawan,'
      '     k.nik,'
      '     k.nama,'
      '     b.ket,'
      '     b.tglpinjam,'
      '     b.pinjam,'
      '     b.tenor,'
      '     b.angsuran,'
      '     b.angsurke,'
      '     b.sudahangsur,'
      '     b.sisaangsur,'
      '     b.status'
      '     FROM '
      '     pinjaman b '
      '     LEFT JOIN m_kary k '
      '     ON b.`idkaryawan` = k.`id`;')
    Left = 360
    Top = 176
  end
  object DPinjaman: TMyDataSource
    DataSet = Qpinjaman
    Left = 360
    Top = 245
  end
  object QdetPinjaman: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'Select * from det_pinjaman')
    MasterSource = DPinjaman
    MasterFields = 'nobukti'
    DetailFields = 'nobukti'
    Left = 440
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'nobukti'
        ParamType = ptInput
        Value = 'PJ.171030001'
      end>
  end
  object DDetPinjaman: TMyDataSource
    DataSet = QdetPinjaman
    Left = 440
    Top = 245
  end
  object QjurnalMeorial: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'select * from jurnalmemorial')
    Left = 360
    Top = 176
  end
  object DJurnalMemorial: TMyDataSource
    DataSet = QjurnalMeorial
    Left = 360
    Top = 245
  end
  object QDetJurnalMemorial: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'Select a.nobukti,a.noakun,b.namaakunperkiraan,a.keterangan,'
      '(Case when a.jenistransaksi="D" then nominal end) as "DEBET",'
      '(Case when a.jenistransaksi="K" then nominal end) as "KREDIT"'
      
        'from detailjurnalmemorial a left join m_akunperkiraan b on a.noa' +
        'kun=b.kodeakunperkiraan')
    MasterSource = DJurnalMemorial
    MasterFields = 'nobukti'
    DetailFields = 'nobukti'
    Left = 440
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'nobukti'
        ParamType = ptInput
        Value = 'JM180124001'
      end>
  end
  object DdetJurnalMemorial: TMyDataSource
    DataSet = QDetJurnalMemorial
    Left = 440
    Top = 245
  end
  object Qpobeli: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  p.idpobeli,'
      '  p.nobukti,'
      '  p.tgl,'
      '  p.idsupplier,'
      '  s.namasupplier,'
      '  s.alamat,'
      '  s.kota,'
      '  s.notelpon,'
      '  u.namalengkap,'
      '  p.total,'
      '  p.diskon,'
      '  p.ppn,'
      '  p.grandtotal,'
      '  p.terima '
      'FROM'
      '  pobeli p '
      '  LEFT JOIN m_supplier s '
      '    ON s.`idsupplier` = p.`idsupplier` '
      '  LEFT JOIN m_user u '
      '    ON u.`iduser` = p.`createby`')
    Left = 600
    Top = 80
  end
  object QdetailPObeli: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  d.nobukti,'
      '  d.kodebarang,'
      '  b.kodebarcode,'
      '  b.namabarang,'
      '  d.satuan,'
      '  d.hargabeli,'
      '  d.ppn,'
      '  d.disk1,'
      '  d.disk2,'
      '  d.disk3,'
      '  d.jumlah,'
      '  d.masuk,'
      '  d.subtotal,'
      '  d.isi'
      'FROM'
      '  pobelidetail d '
      '  LEFT JOIN barang b '
      '    ON d.`kodebarang` = b.`kodebarang`')
    FetchAll = False
    Left = 720
    Top = 80
  end
  object DpoBeli: TMyDataSource
    DataSet = Qpobeli
    Left = 600
    Top = 144
  end
  object DdetailPoBeli: TMyDataSource
    DataSet = QdetailPObeli
    Left = 720
    Top = 144
  end
  object QpenerimaanBarang: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  pb.nobukti,'
      '  pb.tgl,'
      '  pb.nobuktibeli,'
      '  pb.nobuktiorder,'
      '  s.namasupplier '
      'FROM'
      '  penerimaanbarang pb '
      '  LEFT JOIN pembelian p '
      '    ON pb.`nobuktibeli` = p.`nobukti` '
      '  LEFT JOIN m_supplier s '
      '    ON s.`idsupplier` = p.`idsupplier`')
    Left = 600
    Top = 200
  end
  object QPenerimaanBarangdetail: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  pd.nobukti,'
      '  pd.kodebarang,'
      '  pd.satuan,'
      '  pd.jmlorder,'
      '  pd.masuk,'
      '  pd.kekurangan,'
      '  pd.idgudang,'
      '  pd.isi,'
      '  b.namabarang '
      'FROM'
      '  penerimaandetail pd '
      '  LEFT JOIN barang b '
      '    ON b.`kodebarang` = pd.`kodebarang`')
    Filtered = True
    Left = 720
    Top = 200
  end
  object DPenerimaanBarang: TMyDataSource
    DataSet = QpenerimaanBarang
    Left = 600
    Top = 264
  end
  object DPenerimaanBarangDetil: TMyDataSource
    DataSet = QPenerimaanBarangdetail
    Left = 720
    Top = 264
  end
  object Qdatastokopname: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  so.nobukti,'
      '  so.tanggal,'
      '  so.kodebarang,'
      '  b.kodebarcode,'
      '  b.namabarang,'
      '  so.stokkomp,'
      '  so.stoknyata,'
      '  so.selisih,'
      '  so.keterangan,'
      '  k.namalokasi,'
      '  u.namalengkap,'
      '  ab.username '
      'FROM'
      '  stokopname so '
      '  LEFT JOIN barang b '
      '    ON so.`kodebarang` = b.`kodebarang`'
      '  left join lokasi k on k.idlokasi=so.idgudang'
      '  left join m_user u on u.iduser=so.lastuser'
      '  LEFT JOIN m_user ab on ab.iduser=so.petugascheck')
    Left = 224
    Top = 312
  end
  object Ddatastokopname: TMyDataSource
    DataSet = Qdatastokopname
    Left = 224
    Top = 376
  end
  object QdatamutasiBarang: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  mb.nobukti,'
      '  mb.tgl,'
      '  mb.iduser,'
      '  u.namalengkap,'
      '  mb.darigudang,'
      '  mb.kegudang,'
      '  mb.totalbarang,'
      '  mb.keterangan '
      'FROM'
      '  mutasibarang mb '
      '  LEFT JOIN m_user u '
      '    ON u.`iduser` = mb.`iduser`')
    Left = 328
    Top = 312
  end
  object DDataMutasiBarang: TMyDataSource
    DataSet = QdatamutasiBarang
    Left = 328
    Top = 376
  end
  object DdetailmutasiBarang: TMyDataSource
    DataSet = QDetailMutasiBarang
    Left = 432
    Top = 376
  end
  object QDetailMutasiBarang: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  dm.nobukti,'
      '  dm.kodebarang,'
      '  b.namabarang,'
      '  b.kodebarcode,'
      '  dm.satuan,'
      '  dm.jmlmutasi,'
      '  dm.isi '
      'FROM'
      '  detailmutasi dm '
      '  LEFT JOIN barang b '
      '    ON b.`kodebarang` = dm.`kodebarang`')
    Left = 432
    Top = 312
  end
  object Qtempjual: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  p.fakturjual,'
      '  p.tgljual,'
      '  p.idpelanggan,'
      '  pl.namapelanggan,'
      '  pl.kodepelanggan,'
      
        '  (CASE WHEN p.pembayaran=0 THEN "CASH" ELSE "KREDIT" END) as pe' +
        'mbayaran,'
      '  p.total,'
      '  p.diskon,'
      '  p.grandtotal,'
      '  pg.namalengkap,'
      '  p.bayar,'
      '  p.kembali '
      'FROM'
      '  tempjual p '
      '  LEFT JOIN pelanggan pl '
      '    ON pl.`idpelanggan` = p.`idpelanggan`'
      '  LEFT JOIN m_user pg '
      '   ON pg.iduser=p.`iduser`')
    Left = 600
    Top = 328
  end
  object Qtempjualdetail: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  d.iddetil,'
      '  d.fakturjual,'
      '  d.kodebarang,'
      '  b.namabarang,'
      '  d.satuan,'
      '  d.harga,'
      '  d.hpp,'
      '  d.jumlah,'
      '  d.diskonpersen,'
      '  d.diskonrupiah,'
      '  d.subtotal,'
      '  d.isi,'
      '  d.idgudang,'
      '  l.namalokasi '
      'FROM'
      '  tempjualdetail d '
      '  LEFT JOIN barang b '
      '    ON d.`kodebarang` = b.`kodebarang` '
      '  LEFT JOIN lokasi l '
      '    ON l.`idlokasi` = d.`idgudang`')
    Filtered = True
    MasterSource = Dtempjual
    MasterFields = 'fakturjual'
    DetailFields = 'fakturjual'
    Left = 720
    Top = 328
    ParamData = <
      item
        DataType = ftString
        Name = 'fakturjual'
        ParamType = ptInput
        Value = 'PJ44201017001'
      end>
  end
  object Dtempjual: TMyDataSource
    DataSet = Qtempjual
    Left = 600
    Top = 392
  end
  object Dtempjualdetail: TMyDataSource
    DataSet = Qtempjualdetail
    Left = 720
    Top = 392
  end
  object QpendingSO: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  po.idjual,'
      '  po.nosalesorder,'
      '  po.tgljual,'
      '  po.idpelanggan,'
      '  pl.kodepelanggan,'
      '  pl.namapelanggan,'
      '  po.pembayaran,'
      '  po.iduser,'
      '  u.namalengkap,'
      '  po.komputerid,'
      '  po.idsales,'
      '  s.namasales '
      'FROM'
      '  pendingso po '
      '  LEFT JOIN pelanggan pl '
      '    ON pl.`idpelanggan` = po.`idpelanggan` '
      '  LEFT JOIN m_user u '
      '    ON u.`iduser` = po.`iduser` '
      '  LEFT JOIN sales s '
      '    ON s.`idsales` = po.`idsales`')
    Left = 824
    Top = 80
  end
  object QPendingSoDetail: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  sd.iddetil,'
      '  sd.nosalesorder,'
      '  sd.kodebarang,'
      '  b.namabarang,'
      '  sd.satuan,'
      '  sd.jumlah,'
      '  sd.isi,'
      '  sd.idgudang '
      'FROM'
      '  pendingsodetail sd '
      '  LEFT JOIN barang b '
      '    ON b.`kodebarang` = sd.`kodebarang`')
    Filtered = True
    Left = 896
    Top = 80
  end
  object DPendingSo: TMyDataSource
    DataSet = QpendingSO
    Left = 824
    Top = 136
  end
  object DPendingSoDetail: TMyDataSource
    DataSet = QPendingSoDetail
    Left = 896
    Top = 136
  end
  object QsalesOrder: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  so.idsalesorder,'
      '  so.nosalesorder,'
      '  so.tgl,'
      '  s.namasales,'
      '  pl.namapelanggan,'
      '  so.pembayaran '
      'FROM'
      '  salesorder so '
      '  LEFT JOIN sales s '
      '    ON so.`idsales` = s.`idsales` '
      '  LEFT JOIN pelanggan pl '
      '    ON pl.`idpelanggan` = so.`idpelanggan`')
    Left = 824
    Top = 208
  end
  object QSalesOrderDetail: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  ds.iddetailsales,'
      '  ds.nosalesorder,'
      '  ds.kodebarang,'
      '  b.namabarang,'
      '  ds.satuan,'
      '  ds.jumlah,'
      '  ds.isi,'
      '  ds.idgudang '
      'FROM'
      '  detailsalesorder ds '
      '  LEFT JOIN barang b '
      '    ON b.`kodebarang` = ds.`kodebarang`')
    Filtered = True
    Left = 912
    Top = 208
  end
  object DSalesOrder: TMyDataSource
    DataSet = QsalesOrder
    Left = 824
    Top = 264
  end
  object DSalesOrderDetail: TMyDataSource
    DataSet = QSalesOrderDetail
    Left = 912
    Top = 264
  end
  object DSuratJalan: TMyDataSource
    DataSet = Qsuratjalan
    Left = 834
    Top = 401
  end
  object DDetailSuratJalan: TMyDataSource
    DataSet = Qdetailsuratjalan
    Left = 914
    Top = 409
  end
  object Qsuratjalan: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT                                      '
      '     p.nobukti,                             '
      '     p.tgl,                                 '
      '     p.idsales,                             '
      '     s.namasales,'
      '     p.keterangan                            '
      '     FROM                                         '
      '  suratjalan p                                '
      '  LEFT JOIN sales s                         '
      '   ON s.idsales=p.idsales ;')
    Left = 906
    Top = 353
  end
  object Qdetailsuratjalan: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  sj.nobukti,'
      '  sj.kodebarang,'
      '  b.namabarang,'
      'b.hargabeli,'
      '  sj.satuan,'
      '  sj.jumlah,'
      '  sj.idgudang,'
      '  sj.dikembalikan '
      'FROM'
      '  detailsuratjalan sj '
      '  LEFT JOIN barang b '
      '    ON sj.`kodebarang` = b.`kodebarang`')
    Left = 840
    Top = 352
  end
  object Qpelunasanpiutang: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  p.nobukti,'
      '  p.tgl,'
      '  pl.namapelanggan,'
      '  p.keterangan,'
      '  p.nominal,'
      '  p.nopiutang,'
      '  p.nobuktijual,'
      '  p.lastupdate,'
      '  u.namalengkap '
      'FROM'
      '  bayarpiutang p '
      '  LEFT JOIN pelanggan pl '
      '    ON pl.`idpelanggan` = p.`idpelanggan`'
      '  LEFT JOIN m_user u ON u.iduser=p.iduser')
    Left = 1008
    Top = 88
  end
  object Dpelunasanpiutang: TMyDataSource
    DataSet = Qpelunasanpiutang
    Left = 1008
    Top = 144
  end
  object QpelunasanHutang: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  h.nobukti,'
      '  h.tgl,'
      '  s.namasupplier,'
      '  u.namalengkap,'
      '  h.keterangan,'
      '  h.nominal,'
      '  h.nohutang '
      'FROM'
      '  bayarhutang h '
      '  LEFT JOIN m_supplier s '
      '    ON s.`idsupplier` = h.`idsupplier` '
      '  LEFT JOIN m_user u '
      '    ON u.`iduser` = h.iduser')
    Left = 1016
    Top = 216
  end
  object DPelunasanHutang: TMyDataSource
    DataSet = QpelunasanHutang
    Left = 1016
    Top = 272
  end
  object Qpemakainbarang: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  p.nobukti,'
      '  p.tgl,'
      '  p.total,'
      '  u.username,'
      '  p.keterangan '
      'FROM'
      '  pemakainbarang p '
      '  LEFT JOIN m_user u '
      '    ON p.`iduser` = u.`iduser`')
    Left = 64
    Top = 432
  end
  object Dpemakaianbarang: TMyDataSource
    DataSet = Qpemakainbarang
    Left = 64
    Top = 496
  end
  object Ddetailpemakainbarang: TMyDataSource
    DataSet = Qdetailpemakainbarang
    Left = 168
    Top = 496
  end
  object Qdetailpemakainbarang: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  d.nobukti,'
      '  d.kodebarang,'
      '  b.namabarang,'
      '  d.satuan,'
      '  d.harga,'
      '  d.jumlah,'
      '  d.subtotal,'
      '  d.isi '
      'FROM'
      '  detailpemakainbarang d '
      '  LEFT JOIN barang b '
      '    ON d.`kodebarang` = b.`kodebarang`')
    Left = 168
    Top = 432
  end
  object QpoPenjualan: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  p.nomerpo,'
      '  p.tgljual,'
      '  p.idpelanggan,'
      '  pl.namapelanggan,'
      '  p.total,'
      '  p.diskon,'
      '  p.grandtotal,'
      '  pg.namalengkap,'
      '  stts'
      'FROM'
      
        '  popenjualan p LEFT JOIN popenjualandetil d ON d.nomerpo=p.nome' +
        'rpo'
      '  LEFT JOIN pelanggan pl '
      '    ON pl.`idpelanggan` = p.`idpelanggan`'
      '  LEFT JOIN m_user pg '
      '   ON pg.iduser=p.`iduser`'
      'group by p.nomerpo')
    Left = 320
    Top = 448
  end
  object QpoPenjualanDetail: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  d.iddetil,'
      '  d.nomerpo,'
      '  d.kodebarang,'
      '  b.namabarang,'
      '  d.satuan,'
      '  d.harga,'
      '  d.hpp,'
      '  d.jumlah,'
      '  d.diskonpersen,'
      '  d.diskon2,'
      '  d.diskon3,'
      '  d.diskonrupiah,'
      '  d.subtotal,'
      '  d.isi'
      'FROM'
      '  popenjualandetil d '
      '  LEFT JOIN barang b '
      '    ON d.`kodebarang` = b.`kodebarang`')
    Left = 416
    Top = 448
  end
  object DpoPenjualan: TMyDataSource
    DataSet = QpoPenjualan
    Left = 320
    Top = 512
  end
  object DpoPenjualanDetil: TMyDataSource
    DataSet = QpoPenjualanDetail
    Left = 416
    Top = 512
  end
end
