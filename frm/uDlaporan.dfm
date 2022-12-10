object Dlaporan: TDlaporan
  OldCreateOrder = False
  Height = 745
  Width = 1763
  object QLapBarang: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'Call sp_stokbarang(CURDATE(), CURDATE(),'#39#39','#39#39');')
    Left = 40
    Top = 40
  end
  object Fr1: TfrxReport
    Version = '6.6.7'
    DotMatrixReport = False
    EngineOptions.UseFileCache = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42223.031294363400000000
    ReportOptions.LastChange = 44877.794980381940000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    ShowProgress = False
    Left = 720
    Top = 8
    Datasets = <
      item
        DataSet = FrBarang
        DataSetName = 'FrBarang'
      end
      item
        DataSet = frdPprofil
        DataSetName = 'frdPprofil'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 3
      ColumnWidth = 63.333333333333300000
      ColumnPositions.Strings = (
        '0'
        '63,3333333333333'
        '126,666666666667')
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 192.755956770000000000
        Top = 18.897650000000000000
        Width = 239.370233333333200000
        AllowSplit = True
        Columns = 1
        DataSet = FrBarang
        DataSetName = 'FrBarang'
        KeepTogether = True
        RowCount = 0
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 8.559060000000000000
          Width = 230.551330000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial Black'
          Font.Style = []
          Frame.Typ = []
          ParentFont = False
        end
        object LapBarangnamabarang: TfrxMemoView
          AllowVectorExport = True
          Left = 6.118120000000000000
          Top = 8.338590000000000000
          Width = 226.771800000000000000
          Height = 30.236240000000000000
          DataField = 'namabarang'
          DataSet = FrBarang
          DataSetName = 'FrBarang'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[FrBarang."namabarang"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object LapBaranghargajual: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 45.236240000000000000
          Width = 226.771800000000000000
          Height = 41.574830000000000000
          DataSetName = 'LapBarang'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          ParentFont = False
          VAlign = vaCenter
        end
        object LapBaranghargajual1: TfrxMemoView
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 60.692950000000000000
          Width = 188.976500000000000000
          Height = 37.795300000000000000
          DataField = 'hargaecer'
          DataSet = FrBarang
          DataSetName = 'FrBarang'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HideZeros = True
          Memo.UTF8W = (
            '[FrBarang."hargaecer"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object BarCode1: TfrxBarCodeView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 141.842610000000000000
          Width = 90.000000000000000000
          Height = 45.354360000000000000
          BarType = bcCodeEAN128
          DataField = 'kodebarcode'
          DataSetName = 'frCetakLabel'
          Expression = '<FrBarang."kodebarcode">'
          Frame.Typ = []
          Rotation = 0
          TestLine = False
          Text = '12345678'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ColorBar = clBlack
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 124.724490000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 45.354360000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Rp')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frdLapBarang: TfrxDBDataset
    UserName = 'frdLapBarang'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Kode Barang=Kode Barang'
      'Kode Barcode=Kode Barcode'
      'Nama Barang=Nama Barang'
      'Kategori=Kategori'
      'Harga Beli=Harga Beli'
      'Harga Jual=Harga Jual'
      'DISPLAY=DISPLAY'
      'GUDANG=GUDANG'
      'TOTAL STOK =TOTAL STOK '
      'TOTAL HARGA=TOTAL HARGA')
    DataSet = QLapBarang
    BCDToCurrency = False
    Left = 40
    Top = 104
  end
  object frxcrsbjct1: TfrxCrossObject
    Left = 776
    Top = 8
  end
  object QProfil: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT * FROM profile WHERE idprofil=1')
    Left = 120
    Top = 40
  end
  object frdPprofil: TfrxDBDataset
    UserName = 'frdPprofil'
    CloseDataSource = False
    FieldAliases.Strings = (
      'idprofil=idprofil'
      'nama=nama'
      'alamat=alamat'
      'kota=kota'
      'notelepon=notelepon'
      'fax=fax'
      'npwp=npwp'
      'dirbackup=dirbackup'
      'gudangbeli=gudangbeli'
      'gudangterima=gudangterima'
      'gudangjual=gudangjual'
      'footernota=footernota'
      'Footernota2=Footernota2'
      'footernota3=footernota3'
      'printerstruk=printerstruk'
      'printerinvoice=printerinvoice'
      'minpoin=minpoin'
      'minpoinrokok=minpoinrokok'
      'default_kas_penjualan=default_kas_penjualan'
      'default_kas_pembelian=default_kas_pembelian'
      'stokmin=stokmin')
    DataSet = dm.Qprofil
    BCDToCurrency = False
    Left = 120
    Top = 104
  end
  object QLapHistoryHarga: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      
        'select b.kodebarang,b.kodebarcode,b.namabarang,h.tgl,h.hargabeli' +
        ',h.hargaecer,h.hargagrosir,h.hargapartai from'
      
        'barang b left join historyhargabarang h on h.kodebarang=b.kodeba' +
        'rang')
    Left = 200
    Top = 40
  end
  object frdReturbeli: TfrxDBDataset
    UserName = 'frdReturbeli'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nobukti=nobukti'
      'tgl=tgl'
      'nobuktibeli=nobuktibeli'
      'namasupplier=namasupplier'
      'total=total'
      'keterangan=keterangan')
    DataSet = QReturBeli
    BCDToCurrency = False
    Left = 952
    Top = 216
  end
  object QFastMoving: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  b.kodebarcode,'
      '  b.namabarang,'
      '  k.namakategori,'
      '  (SUM(dj.isi)) AS terjual '
      'FROM'
      '  barang b '
      '  LEFT JOIN penjualandetil dj '
      '    ON b.`kodebarang` = dj.`kodebarang` '
      '  LEFT JOIN penjualan p '
      '    ON dj.`fakturjual` = p.`fakturjual` '
      '  LEFT JOIN kategori k '
      '    ON k.`idkategori` = b.`idkategori`')
    Left = 288
    Top = 40
  end
  object frdreturbelidetail: TfrxDBDataset
    UserName = 'frdreturbelidetail'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nobukti=nobukti'
      'kodebarang=kodebarang'
      'kodebarcode=kodebarcode'
      'namabarang=namabarang'
      'satuan=satuan'
      'harga=harga'
      'jumlah=jumlah'
      'diskonpersen=diskonpersen'
      'diskonrupiah=diskonrupiah'
      'ppn=ppn'
      'subtotal=subtotal'
      'isi=isi'
      'idgudang=idgudang')
    DataSet = QDetailReturBeli
    BCDToCurrency = False
    Left = 952
    Top = 280
  end
  object QKartuStok: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT                                         '
      '       k.tgl AS TANGGAL,                              '
      '       b.kodebarang AS "KODE BARANG",                     '
      '       b.namabarang AS "NAMA BARANG",                      '
      '       k.saldoawal AS "SALDO AWAL",                 '
      '       k.masuk AS "MASUK",                           '
      '       k.keluar AS "KELUAR",                        '
      
        '       k.saldoakhir AS "SALDO AKHIR",                           ' +
        '  '
      '       lk.namalokasi AS "GUDANG ",                        '
      '       k.keterangan AS "KETERANGAN"                        '
      '       FROM                                           '
      '       kartustok k                                        '
      '       LEFT JOIN barang b                           '
      '       ON b.`kodebarang` = k.`kodebarang`               '
      '       LEFT JOIN lokasi lk ON                          '
      '       k.`idgudang`=lk.`idlokasi` ;')
    Left = 368
    Top = 40
  end
  object frdKartuStok: TfrxDBDataset
    UserName = 'frdKartuStok'
    CloseDataSource = False
    FieldAliases.Strings = (
      'TANGGAL=TANGGAL'
      'KODE BARANG=KODE BARANG'
      'NAMA BARANG=NAMA BARANG'
      'SALDO AWAL=SALDO AWAL'
      'MASUK=MASUK'
      'KELUAR=KELUAR'
      'SALDO AKHIR=SALDO AKHIR'
      'GUDANG =GUDANG '
      'KETERANGAN=KETERANGAN')
    DataSet = QKartuStok
    BCDToCurrency = False
    Left = 368
    Top = 101
  end
  object QLaporanPelanggan: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  p.idpelanggan,'
      '  p.kodepelanggan,'
      '  p.namapelanggan,'
      '  p.alamat,'
      '  p.kota,'
      '  p.notelpon,'
      '  jp.jenis,'
      '  p.maxpiutang,'
      '  p.top ,'
      '  p.poin'
      'FROM'
      '  pelanggan p '
      '  LEFT JOIN jenispelanggan jp '
      '    ON p.`idjenispelanggan` = jp.`idjenispelanggan`')
    Left = 464
    Top = 40
  end
  object FlaporanPelanggan: TfrxDBDataset
    UserName = 'FlaporanPelanggan'
    CloseDataSource = False
    FieldAliases.Strings = (
      'idpelanggan=idpelanggan'
      'kodepelanggan=kodepelanggan'
      'namapelanggan=namapelanggan'
      'alamat=alamat'
      'kota=kota'
      'notelpon=notelpon'
      'jenis=jenis'
      'maxpiutang=maxpiutang'
      'top=top'
      'poin=poin')
    DataSet = QLaporanPelanggan
    BCDToCurrency = False
    Left = 464
    Top = 96
  end
  object frPengeluaran: TfrxDBDataset
    UserName = 'frPengeluaran'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nobukti=nobukti'
      'tanggal=tanggal'
      'noakun=noakun'
      'namaakunperkiraan=namaakunperkiraan'
      'nominal=nominal'
      'keterangan=keterangan')
    DataSet = dtrx.Qpengeluaran
    BCDToCurrency = False
    Left = 576
    Top = 40
  end
  object frDetailPengeluaran: TfrxDBDataset
    UserName = 'frDetailPengeluaran'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nobukti=nobukti'
      'noakun=noakun'
      'namaakunperkiraan=namaakunperkiraan'
      'keterangan=keterangan'
      'nominal=nominal')
    DataSet = dtrx.QDetailPengeluaran
    BCDToCurrency = False
    Left = 576
    Top = 96
  end
  object frdetJurnalMemorial: TfrxDBDataset
    UserName = 'frdetJurnalMemorial'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nobukti=nobukti'
      'noakun=noakun'
      'namaakunperkiraan=namaakunperkiraan'
      'keterangan=keterangan'
      'DEBET=DEBET'
      'KREDIT=KREDIT')
    DataSet = dtrx.QDetJurnalMemorial
    BCDToCurrency = False
    Left = 688
    Top = 96
  end
  object frJurnalMemorial: TfrxDBDataset
    UserName = 'frJurnalMemorial'
    CloseDataSource = False
    FieldAliases.Strings = (
      'idjurnalmemorial=idjurnalmemorial'
      'nobukti=nobukti'
      'tanggal=tanggal'
      'nominal=nominal'
      'keterangan=keterangan'
      'iduser=iduser')
    DataSet = dtrx.QjurnalMeorial
    BCDToCurrency = False
    Left = 688
    Top = 40
  end
  object QLapBukuBesar: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'CALL sp_bukubesar('#39'2019-09-01'#39','#39'2019-09-30'#39','#39' '#39');')
    Left = 40
    Top = 176
  end
  object FrLapbukuBesar: TfrxDBDataset
    UserName = 'FrLapbukuBesar'
    CloseDataSource = False
    FieldAliases.Strings = (
      'jenisakun=jenisakun'
      'tgl=tgl'
      'noakun=noakun'
      'nobukti=nobukti'
      'namaakunperkiraan=namaakunperkiraan'
      'keterangan=keterangan'
      's_awal=s_awal'
      'debet=DEBET'
      'kredit=KREDIT'
      's_akhir=s_akhir')
    DataSet = QLapBukuBesar
    BCDToCurrency = False
    Left = 40
    Top = 248
  end
  object QlapPenjualan: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  p.fakturjual AS fakturjual,'
      '  p.tgljual AS tgljual,'
      '  pl.namapelanggan AS namapelanggan,'
      
        '  (CASE WHEN p.pembayaran=0 THEN "CASH" ELSE "KREDIT" END) AS pe' +
        'mbayaran,'
      '  p.diskon AS diskon,'
      '  p.ppn as ppn,'
      '  p.total AS total,'
      '  u.namalengkap AS namapegawai,'
      
        '  (CASE WHEN p.bayar>=p.grandtotal THEN 0 ELSE p.bayar END)  AS ' +
        'bayar,'
      
        '  (CASE WHEN p.pembayaran=1 THEN p.grandtotal-p.bayar ELSE 0 END' +
        ') as piutang,'
      '  p.kembali AS kembali,'
      '  p.grandtotal AS grantotal,'
      '  s.namasales as namasales'
      'FROM'
      '  penjualan p '
      '  LEFT JOIN pelanggan pl '
      '    ON pl.`idpelanggan` = p.`idpelanggan` '
      '  LEFT JOIN m_user u '
      '    ON u.`iduser` = p.`lastuser`'
      '  LEFT JOIN sales s ON s.idsales=p.idsales')
    FetchAll = False
    IndexFieldNames = 'fakturjual'
    Left = 120
    Top = 176
  end
  object LapPenjualan: TfrxDBDataset
    UserName = 'lapPenjualan'
    CloseDataSource = False
    FieldAliases.Strings = (
      'fakturjual=fakturjual'
      'tgljual=tgljual'
      'namapelanggan=namapelanggan'
      'pembayaran=pembayaran'
      'diskon=diskon'
      'ppn=ppn'
      'total=total'
      'namapegawai=namapegawai'
      'bayar=bayar'
      'piutang=piutang'
      'kembali=kembali'
      'grantotal=grantotal'
      'namasales=namasales')
    DataSet = QlapPenjualan
    BCDToCurrency = False
    Left = 120
    Top = 248
  end
  object FlapPenjualanDetil: TfrxDBDataset
    UserName = 'FlapPenjualanDetil'
    CloseDataSource = False
    FieldAliases.Strings = (
      'fakturjual=fakturjual'
      'kodebarang=kodebarang'
      'namabarang=namabarang'
      'satuan=satuan'
      'harga=harga'
      'jumlah=jumlah'
      'diskon=diskon'
      'subtotal=subtotal'
      'isi=isi')
    DataSet = Qlapdetiljual
    BCDToCurrency = False
    Left = 208
    Top = 248
  end
  object Qlapdetiljual: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  pj.fakturjual,'
      '  pj.kodebarang,'
      '  b.`namabarang`,'
      '  pj.satuan,'
      '  pj.harga,'
      '  pj.jumlah,'
      '  pj.diskonpersen AS diskon,'
      '  pj.subtotal,'
      '  pj.isi '
      'FROM'
      '  penjualandetil pj '
      '  LEFT JOIN barang b '
      '    ON b.`kodebarang` = pj.`kodebarang`')
    MasterSource = DlapJual
    MasterFields = 'fakturjual'
    DetailFields = 'fakturjual'
    FetchAll = False
    IndexFieldNames = 'fakturjual'
    Left = 432
    Top = 432
    ParamData = <
      item
        DataType = ftString
        Name = 'fakturjual'
        ParamType = ptInput
        Value = 'PJ44190118005'
      end>
  end
  object DlapJual: TMyDataSource
    DataSet = QlapPenjualan
    Left = 168
    Top = 224
  end
  object QLapPembelian: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  p.nobukti,'
      '  p.tgl AS tglbeli,'
      '  p.pembayaran,'
      '  s.namasupplier AS namasupplier,'
      '  p.refnota AS refnota,'
      '  p.total AS total,'
      '  p.diskon as diskon,'
      '  p.ppn as ppn,'
      '  p.grandtotal as grandtotal,'
      '  u.namalengkap AS namapegawai,'
      '  p.keterangan '
      'FROM'
      '  pembelian p '
      '  LEFT JOIN m_supplier s '
      '    ON s.`idsupplier` = p.`idsupplier` '
      '  LEFT JOIN m_user u '
      '    ON u.`iduser` = p.`iduser`')
    Left = 296
    Top = 176
  end
  object LapPembelian: TfrxDBDataset
    UserName = 'LapPembelian'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nobukti=nobukti'
      'tglbeli=tglbeli'
      'pembayaran=pembayaran'
      'namasupplier=namasupplier'
      'refnota=refnota'
      'total=total'
      'diskon=diskon'
      'ppn=ppn'
      'grandtotal=grandtotal'
      'namapegawai=namapegawai'
      'keterangan=keterangan')
    DataSet = QLapPembelian
    BCDToCurrency = False
    Left = 296
    Top = 248
  end
  object QlapBeliDetil: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  dj.nobukti,'
      '  dj.kodebarang AS kodebarang,'
      '  b.kodebarcode AS kodebarcode,'
      '  b.namabarang AS namabarang,'
      '  dj.satuan AS satuan,'
      '  dj.harga AS harga,'
      '  dj.diskonpersen AS diskonpersen,'
      '  dj.diskon2,'
      '  dj.diskon3,'
      '  dj.jumlah AS jumlah,'
      '  dj.subtotal AS subtotal '
      'FROM'
      '  detailbeli dj '
      '  LEFT JOIN barang b '
      '    ON b.`kodebarang` = dj.`kodebarang`')
    MasterSource = DlapBeli
    MasterFields = 'nobukti'
    DetailFields = 'nobukti'
    Left = 384
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'nobukti'
        ParamType = ptInput
        Value = 'PB44190117009'
      end>
  end
  object Fdetilbeli: TfrxDBDataset
    UserName = 'FdetilBeli'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nobukti=nobukti'
      'kodebarang=kodebarang'
      'kodebarcode=kodebarcode'
      'namabarang=namabarang'
      'satuan=satuan'
      'harga=harga'
      'diskonpersen=diskonpersen'
      'diskon2=diskon2'
      'diskon3=diskon3'
      'jumlah=jumlah'
      'subtotal=subtotal')
    DataSet = QlapBeliDetil
    BCDToCurrency = False
    Left = 384
    Top = 248
  end
  object DlapBeli: TMyDataSource
    DataSet = QLapPembelian
    Left = 336
    Top = 224
  end
  object frdDatabarang: TfrxDBDataset
    UserName = 'frdDatabarang'
    CloseDataSource = False
    FieldAliases.Strings = (
      'idbarang=idbarang'
      'kodebarang=kodebarang'
      'kodebarcode=kodebarcode'
      'namabarang=namabarang'
      'namabarcode=namabarcode'
      'namakategori=namakategori'
      'satuanbeli=satuanbeli'
      'satuanjual=satuanjual'
      'isi=isi'
      'stokmin=stokmin'
      'stokmax=stokmax'
      'hargasebelum=hargasebelum'
      'hargabeli=hargabeli'
      'HargaPPN=HargaPPN'
      'margin=margin'
      'hargaecer=hargaecer'
      'margingrosir=margingrosir'
      'hargagrosir=hargagrosir'
      'marginpartai=marginpartai'
      'hargapartai=hargapartai'
      'hargapartai4=hargapartai4'
      'hargapartai5=hargapartai5'
      'diskonpersen=diskonpersen'
      'diskonrupiah=diskonrupiah'
      'hargabeliratarata=hargabeliratarata'
      'minimalorder=minimalorder'
      'stok=stok'
      'hargapromo=hargapromo'
      'tglawal=tglawal'
      'tglakhir=tglakhir'
      'hargapromo2=hargapromo2'
      'tglawal2=tglawal2'
      'tglakhir2=tglakhir2'
      'hargapromo3=hargapromo3'
      'tglawal3=tglawal3'
      'tglakhir3=tglakhir3'
      'ppn=ppn')
    DataSet = dm.QBarang
    BCDToCurrency = False
    Left = 464
    Top = 176
  end
  object frxbrcdbjct1: TfrxBarCodeObject
    Left = 856
    Top = 8
  end
  object frdPObeli: TfrxDBDataset
    UserName = 'frdPObeli'
    CloseDataSource = False
    FieldAliases.Strings = (
      'idpobeli=idpobeli'
      'nobukti=nobukti'
      'tgl=tgl'
      'idsupplier=idsupplier'
      'namasupplier=namasupplier'
      'alamat=alamat'
      'kota=kota'
      'notelpon=notelpon'
      'namalengkap=namalengkap'
      'total=total')
    DataSet = Qpobeli
    BCDToCurrency = False
    Left = 728
    Top = 176
  end
  object frdPoBeliDetil: TfrxDBDataset
    UserName = 'frdPoBeliDetil'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nobukti=nobukti'
      'kodebarang=kodebarang'
      'kodebarcode=kodebarcode'
      'namabarang=namabarang'
      'satuan=satuan'
      'hargabeli=hargabeli'
      'jumlah=jumlah'
      'subtotal=subtotal'
      'isi=isi')
    DataSet = QdetailPObeli
    BCDToCurrency = False
    Left = 728
    Top = 240
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
      '  p.total '
      'FROM'
      '  pobeli p '
      '  LEFT JOIN m_supplier s '
      '    ON s.`idsupplier` = p.`idsupplier` '
      '  LEFT JOIN m_user u '
      '    ON u.`iduser` = p.`createby`')
    Left = 576
    Top = 176
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
      '  d.jumlah,'
      '  d.subtotal,'
      '  d.isi'
      'FROM'
      '  pobelidetail d '
      '  LEFT JOIN barang b '
      '    ON d.`kodebarang` = b.`kodebarang`')
    Filtered = True
    MasterSource = DpoBeli
    MasterFields = 'nobukti'
    DetailFields = 'nobukti'
    Left = 648
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'nobukti'
        ParamType = ptInput
        Value = 'POB180124001'
      end>
  end
  object DpoBeli: TMyDataSource
    DataSet = Qpobeli
    Left = 576
    Top = 240
  end
  object DdetailPoBeli: TMyDataSource
    DataSet = QdetailPObeli
    Left = 648
    Top = 240
  end
  object frdSupplier: TfrxDBDataset
    UserName = 'frdSupplier'
    CloseDataSource = False
    FieldAliases.Strings = (
      'idsupplier=idsupplier'
      'kodesupplier=kodesupplier'
      'namasupplier=namasupplier'
      'namapemilik=namapemilik'
      'alamat=alamat'
      'kota=kota'
      'notelpon=notelpon'
      'norek=norek'
      'namabank=namabank')
    DataSet = dm.QSupplier
    BCDToCurrency = False
    Left = 216
    Top = 544
  end
  object frdPelanggan: TfrxDBDataset
    UserName = 'frdPelanggan'
    CloseDataSource = False
    FieldAliases.Strings = (
      'idpelanggan=idpelanggan'
      'kodepelanggan=kodepelanggan'
      'namapelanggan=namapelanggan'
      'alamat=alamat'
      'kota=kota'
      'notelpon=notelpon'
      'jenis=jenis'
      'maxpiutang=maxpiutang'
      'top=top'
      'poin=poin')
    DataSet = dm.QPelanggan
    BCDToCurrency = False
    Left = 40
    Top = 320
  end
  object frdBuktiMutasi: TfrxDBDataset
    UserName = 'frdBuktiMutasi'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nobukti=nobukti'
      'tgl=tgl'
      'iduser=iduser'
      'namalengkap=namalengkap'
      'darigudang=darigudang'
      'kegudang=kegudang'
      'totalbarang=totalbarang'
      'keterangan=keterangan')
    DataSet = QdatamutasiBarang
    BCDToCurrency = False
    Left = 504
    Top = 304
  end
  object frdBuktiMutasiDetail: TfrxDBDataset
    UserName = 'frdBuktiMutasiDetail'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nobukti=nobukti'
      'kodebarang=kodebarang'
      'namabarang=namabarang'
      'kodebarcode=kodebarcode'
      'satuan=satuan'
      'jmlmutasi=jmlmutasi'
      'isi=isi')
    DataSet = QDetailMutasiBarang
    BCDToCurrency = False
    Left = 504
    Top = 368
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
    Left = 296
    Top = 304
  end
  object DDataMutasiBarang: TMyDataSource
    DataSet = QdatamutasiBarang
    Left = 296
    Top = 368
  end
  object DdetailmutasiBarang: TMyDataSource
    DataSet = QDetailMutasiBarang
    Left = 400
    Top = 368
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
    MasterSource = DDataMutasiBarang
    MasterFields = 'nobukti'
    DetailFields = 'nobukti'
    Left = 400
    Top = 304
    ParamData = <
      item
        DataType = ftString
        Name = 'nobukti'
        ParamType = ptInput
        Value = 'MB4190203001'
      end>
  end
  object Qpenjualan: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  p.fakturjual,'
      '  p.tgljual,'
      '  p.idpelanggan,'
      '  pl.idjenispelanggan,'
      '  pl.namapelanggan,'
      '  pl.poin,'
      '  pl.alamat,'
      '  pl.kota,'
      '  pl.notelpon,'
      
        '  (CASE WHEN p.pembayaran=0 THEN "CASH" ELSE "KREDIT" END) as pe' +
        'mbayaran,'
      '  p.total,'
      '  p.tglkirim,'
      '  p.diskon,'
      '  p.grandtotal,'
      '  pg.namalengkap,'
      '  p.nontunai,'
      '  p.bayar,'
      '  p.kembali,'
      '  p.komputerid,'
      '  k.namakomputer,'
      '  p.ppn,'
      '  p.edc,'
      '  p.kartu,'
      '  p.sucharge,'
      '  p.totalnontunai,'
      '  s.namasales,'
      '  p.tgltempo,'
      '  p.nokartu,'
      '  p.keterangan,'
      '  p.totalnonrokok,'
      '  p.totalrokok,'
      '  p.biayalain,'
      '  p.bayar_poin'
      'FROM'
      '  penjualan p '
      '  LEFT JOIN pelanggan pl '
      '    ON pl.`idpelanggan` = p.`idpelanggan`'
      '  LEFT JOIN m_user pg '
      '   ON pg.iduser=p.`iduser` left join komputer k on'
      
        '   k.komputerid=p.komputerid LEFT JOIN sales s on s.idsales=p.id' +
        'sales')
    FetchAll = False
    IndexFieldNames = 'fakturjual'
    Left = 816
    Top = 80
  end
  object QdetailJual: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  d.iddetil,'
      '  d.fakturjual,'
      '  d.kodebarang,'
      '  b.namabarang,'
      '  b.hargaecer,'
      '  d.satuan,'
      '  d.harga,'
      '  d.hpp,'
      '  d.jumlah,'
      '  d.diskonpersen,'
      '  d.diskon2,'
      '  d.diskon3,'
      '  d.diskonrupiah,'
      '  d.subtotal,'
      '  d.isi,'
      '  d.idgudang,'
      '  l.namalokasi '
      'FROM'
      '  penjualandetil d '
      '  LEFT JOIN barang b '
      '    ON d.`kodebarang` = b.`kodebarang` '
      '  LEFT JOIN lokasi l '
      '    ON l.`idlokasi` = d.`idgudang`')
    MasterSource = Dpenjualan
    MasterFields = 'fakturjual'
    DetailFields = 'fakturjual'
    FetchAll = False
    IndexFieldNames = 'iddetil'
    Left = 888
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'fakturjual'
        ParamType = ptInput
        Value = 'PJ11210305001'
      end>
  end
  object Dpenjualan: TMyDataSource
    DataSet = Qpenjualan
    Left = 816
    Top = 144
  end
  object DDetailJual: TMyDataSource
    DataSet = QdetailJual
    Left = 888
    Top = 144
  end
  object frdNotajual: TfrxDBDataset
    UserName = 'frdNotajual'
    CloseDataSource = False
    FieldAliases.Strings = (
      'fakturjual=fakturjual'
      'tgljual=tgljual'
      'idpelanggan=idpelanggan'
      'idjenispelanggan=idjenispelanggan'
      'namapelanggan=namapelanggan'
      'poin=poin'
      'alamat=alamat'
      'kota=kota'
      'notelpon=notelpon'
      'pembayaran=pembayaran'
      'total=total'
      'tglkirim=tglkirim'
      'diskon=diskon'
      'grandtotal=grandtotal'
      'namalengkap=namalengkap'
      'nontunai=nontunai'
      'bayar=bayar'
      'kembali=kembali'
      'komputerid=komputerid'
      'namakomputer=namakomputer'
      'ppn=ppn'
      'edc=edc'
      'kartu=kartu'
      'sucharge=sucharge'
      'totalnontunai=totalnontunai'
      'namasales=namasales'
      'tgltempo=tgltempo'
      'nokartu=nokartu'
      'keterangan=keterangan'
      'totalnonrokok=totalnonrokok'
      'totalrokok=totalrokok'
      'biayalain=biayalain'
      'bayar_poin=bayar_poin')
    DataSet = Qpenjualan
    BCDToCurrency = False
    Left = 952
    Top = 80
  end
  object frdDetailnotajual: TfrxDBDataset
    UserName = 'frdDetailnotajual'
    CloseDataSource = False
    FieldAliases.Strings = (
      'iddetil=iddetil'
      'fakturjual=fakturjual'
      'kodebarang=kodebarang'
      'namabarang=namabarang'
      'hargaecer=hargaecer'
      'satuan=satuan'
      'harga=harga'
      'hpp=hpp'
      'jumlah=jumlah'
      'diskonpersen=diskonpersen'
      'diskon2=diskon2'
      'diskon3=diskon3'
      'diskonrupiah=diskonrupiah'
      'subtotal=subtotal'
      'isi=isi'
      'idgudang=idgudang'
      'namalokasi=namalokasi')
    DataSet = QdetailJual
    BCDToCurrency = False
    Left = 952
    Top = 144
  end
  object frdLapHUtang: TfrxDBDataset
    UserName = 'frdLapHUtang'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nobukti=nobukti'
      'tglinput=tglinput'
      'tgltempo=tgltempo'
      'hutang=hutang'
      'dibayar=dibayar'
      'kekurangan=kekurangan'
      'lunas=lunas'
      'namasupplier=namasupplier')
    DataSet = dtrx.Qhutang
    BCDToCurrency = False
    Left = 120
    Top = 320
  end
  object frdPiutang: TfrxDBDataset
    UserName = 'frdPiutang'
    CloseDataSource = False
    FieldAliases.Strings = (
      'fakturjual=fakturjual'
      'tglinput=tglinput'
      'piutang=piutang'
      'tgltempo=tgltempo'
      'umurhutang=umurhutang'
      'dibayar=dibayar'
      'kekurangan=kekurangan'
      'lunas=lunas'
      'namapelanggan=namapelanggan')
    DataSet = dtrx.Qpiutang
    BCDToCurrency = False
    Left = 208
    Top = 320
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
    Left = 40
    Top = 400
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
    MasterSource = DreturJual
    MasterFields = 'nobukti'
    DetailFields = 'nobukti'
    FetchAll = False
    IndexFieldNames = 'nobukti'
    Left = 112
    Top = 400
    ParamData = <
      item
        DataType = ftString
        Name = 'nobukti'
        ParamType = ptInput
        Value = 'RJ.0517000001'
      end>
  end
  object DreturJual: TMyDataSource
    DataSet = QreturJual
    Left = 40
    Top = 464
  end
  object DDetailReturJual: TMyDataSource
    DataSet = QdetailReturjual
    Left = 112
    Top = 464
  end
  object frdreturPenjualan: TfrxDBDataset
    UserName = 'frdreturPenjualan'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nobukti=nobukti'
      'tgl=tgl'
      'nobuktijual=nobuktijual'
      'namapelanggan=namapelanggan'
      'total=total'
      'keterangan=keterangan')
    DataSet = QreturJual
    BCDToCurrency = False
    Left = 216
    Top = 400
  end
  object frdDetailReturPenjualan: TfrxDBDataset
    UserName = 'frdDetailReturPenjualan'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nobukti=nobukti'
      'kodebarang=kodebarang'
      'kodebarcode=kodebarcode'
      'namabarang=namabarang'
      'satuan=satuan'
      'harga=harga'
      'jumlah=jumlah'
      'diskonpersen=diskonpersen'
      'diskonrupiah=diskonrupiah'
      'subtotal=subtotal'
      'isi=isi'
      'idgudang=idgudang')
    DataSet = QdetailReturjual
    BCDToCurrency = False
    Left = 216
    Top = 464
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
      '  rb.keterangan '
      'FROM'
      '  returpembelian rb '
      '  LEFT JOIN pembelian p '
      '    ON p.`nobukti` = rb.`nobuktibeli` '
      '  LEFT JOIN m_supplier s '
      '    ON s.`idsupplier` = p.`idsupplier`')
    FetchAll = False
    Left = 816
    Top = 216
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
    FetchAll = False
    IndexFieldNames = 'nobukti'
    Left = 888
    Top = 216
  end
  object DReturBeli: TMyDataSource
    DataSet = QReturBeli
    Left = 816
    Top = 280
  end
  object DDetailReturBeli: TMyDataSource
    DataSet = QDetailReturBeli
    Left = 888
    Top = 280
  end
  object frxDesigner1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    GradientEnd = 11982554
    GradientStart = clWindow
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    MemoParentFont = False
    Left = 496
    Top = 256
  end
  object frdRekapKasir: TfrxDBDataset
    UserName = 'frdRekapKasir'
    CloseDataSource = False
    FieldAliases.Strings = (
      'tgljual=tgljual'
      'grandtotal=grandtotal'
      'nontunai=nontunai'
      'namalengkap=namalengkap'
      'namakomputer=namakomputer')
    DataSet = QrekapKasir
    BCDToCurrency = False
    Left = 1096
    Top = 16
  end
  object QrekapKasir: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT p.tgljual,p.grandtotal,p.nontunai,pg.namalengkap,'
      'k.namakomputer from penjualan p left join m_user pg '
      
        'on pg.iduser=p.iduser left join komputer k on k.komputerid=p.kom' +
        'puterid')
    Left = 1024
    Top = 16
  end
  object Qstoklimit: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  b.kodebarang,b.namabarang,k.namakategori,'
      '  b.stokmin,b.warningiflimit as "PERINGATAN",'
      '  SUM('
      '    ks.saldoawal + ks.masuk - ks.keluar'
      '  ) AS stok '
      'FROM'
      '  barang b left join kategori k on k.idkategori=b.idkategori'
      '  LEFT JOIN kartustok ks '
      '    ON ks.`kodebarang` = b.`kodebarang`'
      'GROUP BY  b.`kodebarang`  HAVING stok<=stokmin')
    Left = 1144
    Top = 72
  end
  object DstokLimit: TMyDataSource
    DataSet = Qstoklimit
    Left = 1144
    Top = 136
  end
  object frdLaporanStokOpname: TfrxDBDataset
    UserName = 'frdLaporanStokOpname'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nobukti=nobukti'
      'tanggal=tanggal'
      'kodebarang=kodebarang'
      'kodebarcode=kodebarcode'
      'namabarang=namabarang'
      'stokkomp=stokkomp'
      'stoknyata=stoknyata'
      'selisih=selisih'
      'keterangan=keterangan')
    DataSet = dtrx.Qdatastokopname
    BCDToCurrency = False
    Left = 337
    Top = 432
  end
  object QtotalNilaiBarang: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      
        'SELECT b.kodebarang,b.namabarang,b.hargabeli,(SUM(ks.saldoawal +' +
        ' ks.masuk) - ks.keluar) AS stok,'
      
        '(SUM(ks.saldoawal + ks.masuk) -ks.keluar) * b.hargabeli AS total' +
        'nilai FROM barang b LEFT JOIN kartustok ks'
      'ON ks.kodebarang=b.kodebarang  GROUP BY b.kodebarang')
    Left = 680
    Top = 376
  end
  object frdTotalNilaiBarang: TfrxDBDataset
    UserName = 'frdTotalNilaiBarang'
    CloseDataSource = False
    FieldAliases.Strings = (
      'kodebarang=kodebarang'
      'namabarang=namabarang'
      'hargabeli=hargabeli'
      'stok=stok'
      'totalnilai=totalnilai')
    DataSet = QtotalNilaiBarang
    BCDToCurrency = False
    Left = 792
    Top = 400
  end
  object Qrekapitulasibarang: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  p.tgljual,'
      '  pd.kodebarang,'
      '  b.kodebarcode,'
      '  b.namabarang,'
      '  b.satuanjual AS satuan,'
      '  SUM(pd.isi) AS jumlah,'
      '  SUM(b.hargaecer * pd.isi) AS subtotal '
      'FROM'
      '  penjualan p '
      '  LEFT JOIN penjualandetil pd '
      '    ON p.`fakturjual` = pd.`fakturjual` '
      '  LEFT JOIN barang b '
      '    ON b.`kodebarang` = pd.`kodebarang` '
      'GROUP BY b.`kodebarang`')
    Left = 968
    Top = 334
  end
  object Drekapitulasibarang: TMyDataSource
    DataSet = Qrekapitulasibarang
    Left = 952
    Top = 416
  end
  object frdrekapitulasibarang: TfrxDBDataset
    UserName = 'frdRekapKasir'
    CloseDataSource = False
    FieldAliases.Strings = (
      'tgljual=tgljual'
      'kodebarang=kodebarang'
      'kodebarcode=kodebarcode'
      'namabarang=namabarang'
      'satuan=satuan'
      'jumlah=jumlah'
      'subtotal=subtotal')
    DataSet = Qrekapitulasibarang
    BCDToCurrency = False
    Left = 1080
    Top = 352
  end
  object Lpacking: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  p.fakturjual,'
      '  p.tgljual,'
      '  p.idpelanggan,'
      '  pl.idjenispelanggan,'
      '  pl.namapelanggan,'
      '  pl.poin,'
      '  pl.alamat,'
      '  pl.kota,'
      '  pl.notelpon,'
      '  p.pembayaran,'
      '  p.total,'
      '  p.diskon,'
      '  p.grandtotal,'
      '  pg.namalengkap,'
      '  p.nontunai,'
      '  p.bayar,'
      '  p.kembali,'
      '  p.komputerid,'
      '  k.namakomputer,'
      '  p.ppn,'
      '  s.namasales'
      'FROM'
      '  penjualan p '
      '  LEFT JOIN pelanggan pl '
      '    ON pl.`idpelanggan` = p.`idpelanggan`'
      '  LEFT JOIN m_user pg '
      '   ON pg.iduser=p.`iduser` left join komputer k on'
      
        '   k.komputerid=p.komputerid LEFT JOIN sales s on s.idsales=p.id' +
        'sales')
    AutoCalcFields = False
    Left = 576
    Top = 452
  end
  object FLpacking: TfrxDBDataset
    UserName = 'FLpacking'
    CloseDataSource = False
    FieldAliases.Strings = (
      'fakturjual=fakturjual'
      'tgljual=tgljual'
      'idpelanggan=idpelanggan'
      'idjenispelanggan=idjenispelanggan'
      'namapelanggan=namapelanggan'
      'poin=poin'
      'alamat=alamat'
      'kota=kota'
      'notelpon=notelpon'
      'pembayaran=pembayaran'
      'total=total'
      'diskon=diskon'
      'grandtotal=grandtotal'
      'namalengkap=namalengkap'
      'nontunai=nontunai'
      'bayar=bayar'
      'kembali=kembali'
      'komputerid=komputerid'
      'namakomputer=namakomputer'
      'ppn=ppn'
      'namasales=namasales')
    DataSet = Lpacking
    BCDToCurrency = False
    Left = 656
    Top = 444
  end
  object Ldetpacking: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  dj.fakturjual,'
      '  dj.kodebarang,'
      '  b.kodebarcode,'
      '  b.namabarang,'
      '  dj.satuan,'
      '  SUM(jumlah) AS jumlah,'
      '  dj.subtotal '
      'FROM'
      '  penjualandetil dj '
      '  LEFT JOIN barang b '
      '    ON b.kodebarang = dj.kodebarang '
      'GROUP BY dj.kodebarang')
    Filtered = True
    Left = 520
    Top = 452
  end
  object FLpackingLIst: TfrxDBDataset
    UserName = 'FLpackingLIst'
    CloseDataSource = False
    FieldAliases.Strings = (
      'fakturjual=fakturjual'
      'kodebarang=kodebarang'
      'kodebarcode=kodebarcode'
      'namabarang=namabarang'
      'satuan=satuan'
      'jumlah=jumlah'
      'subtotal=subtotal')
    DataSet = Ldetpacking
    BCDToCurrency = False
    Left = 696
    Top = 444
  end
  object Dpacking: TMyDataSource
    DataSet = Lpacking
    Left = 616
    Top = 444
  end
  object frdHistoryHarga: TfrxDBDataset
    UserName = 'frdHistoryHarga'
    CloseDataSource = False
    FieldAliases.Strings = (
      'kodebarang=kodebarang'
      'kodebarcode=kodebarcode'
      'namabarang=namabarang'
      'tgl=tgl'
      'hargabeli=hargabeli'
      'hargaecer=hargaecer'
      'hargagrosir=hargagrosir'
      'hargapartai=hargapartai')
    DataSet = QLapHistoryHarga
    BCDToCurrency = False
    Left = 200
    Top = 104
  end
  object frdFastMoving: TfrxDBDataset
    UserName = 'frdFastMoving'
    CloseDataSource = False
    FieldAliases.Strings = (
      'kodebarcode=kodebarcode'
      'namabarang=namabarang'
      'namakategori=namakategori'
      'terjual=terjual')
    DataSet = QFastMoving
    BCDToCurrency = False
    Left = 288
    Top = 104
  end
  object QactivaSub: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT a.akunsubmaster,a.namasubmaster FROM m_subbukubesar a '
      'LEFT JOIN m_bukubesar ak ON ak.nomasterakun=a.nomasterakun'
      'WHERE ak.nomasterakun in (1,5);')
    Left = 1128
    Top = 280
  end
  object QPasiva: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT a.akunsubmaster,a.namasubmaster FROM m_subbukubesar a '
      'LEFT JOIN m_bukubesar ak ON ak.nomasterakun=a.nomasterakun'
      'WHERE ak.nomasterakun in (2,3,4);')
    Left = 1056
    Top = 216
  end
  object QAkunPasiva: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  ak.kodeakunperkiraan,'
      '  ak.namaakunperkiraan,'
      '  ak.akunsubmaster,mb.namasubmaster, '
      '  SUM(s.s_awal) + SUM(s.kredit) - SUM(s.debet) AS saldoakhir'
      'FROM'
      '  m_akunperkiraan ak '
      '  LEFT JOIN m_subbukubesar mb'
      '  ON mb.akunsubmaster=ak.akunsubmaster'
      '  LEFT JOIN saldoakun s '
      '    ON s.`noakun` = ak.`kodeakunperkiraan` '
      'GROUP BY ak.`kodeakunperkiraan`')
    Left = 1136
    Top = 216
  end
  object DSubActiva: TMyDataSource
    DataSet = QactivaSub
    Left = 1272
    Top = 344
  end
  object DPasiva: TMyDataSource
    DataSet = QPasiva
    Left = 1056
    Top = 280
  end
  object FrPasiva: TfrxDBDataset
    UserName = 'FrPasiva'
    CloseDataSource = False
    FieldAliases.Strings = (
      'akunsubmaster=akunsubmaster'
      'namasubmaster=namasubmaster')
    DataSet = QPasiva
    BCDToCurrency = False
    Left = 1224
    Top = 216
  end
  object FrAkunPasiva: TfrxDBDataset
    UserName = 'FrAkunPasiva'
    CloseDataSource = False
    FieldAliases.Strings = (
      'kodeakunperkiraan=kodeakunperkiraan'
      'namaakunperkiraan=namaakunperkiraan'
      'akunsubmaster=akunsubmaster'
      'namasubmaster=namasubmaster'
      'saldoakhir=saldoakhir')
    DataSet = QAkunPasiva
    BCDToCurrency = False
    Left = 1288
    Top = 216
  end
  object FrSubActiva: TfrxDBDataset
    UserName = 'FrSubActiva'
    CloseDataSource = False
    FieldAliases.Strings = (
      'akunsubmaster=akunsubmaster'
      'namasubmaster=namasubmaster')
    DataSet = QactivaSub
    BCDToCurrency = False
    Left = 1296
    Top = 280
  end
  object FrAkunActiva: TfrxDBDataset
    UserName = 'FrAkunActiva'
    CloseDataSource = False
    FieldAliases.Strings = (
      'kodeakunperkiraan=kodeakunperkiraan'
      'namaakunperkiraan=namaakunperkiraan'
      'akunsubmaster=akunsubmaster'
      'namasubmaster=namasubmaster'
      'saldoakhir=saldoakhir')
    DataSet = QactivaAkun
    BCDToCurrency = False
    Left = 1352
    Top = 264
  end
  object QactivaAkun: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  ak.kodeakunperkiraan,'
      '  ak.namaakunperkiraan,'
      '  ak.akunsubmaster,mb.namasubmaster, '
      '  SUM(s.s_awal) + SUM(s.debet) - SUM(s.kredit) AS saldoakhir'
      'FROM'
      '  m_akunperkiraan ak '
      
        '  LEFT JOIN m_subbukubesar mb ON ak.akunsubmaster=mb.akunsubmast' +
        'er'
      '  LEFT JOIN saldoakun s '
      '    ON s.`noakun` = ak.`kodeakunperkiraan` '
      'GROUP BY ak.`kodeakunperkiraan`')
    Filtered = True
    Left = 1224
    Top = 288
  end
  object QAkunPerkiraan: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  ak.kodeakunperkiraan,'
      '  ak.namaakunperkiraan,'
      '  ms.akunsubmaster,'
      '  ms.namasubmaster,'
      '  bb.nomasterakun,'
      '  bb.namamasterakun,'
      '  ('
      '    CASE'
      '      WHEN bb.jenisakun = '#39'A'#39' '
      '      THEN SUM(s.s_awal) + SUM(s.debet) - SUM(s.kredit) '
      '      ELSE SUM(s.s_awal) + SUM(s.kredit) - SUM(s.debet) '
      '    END'
      '  ) AS saldoakhir ,'
      
        '  (CASE WHEN bb.jenisakun = '#39'A'#39' THEN SUM(s.s_awal) + SUM(s.debet' +
        ') - SUM(s.kredit) END) AS "Biaya",'
      
        '  (CASE WHEN bb.jenisakun = '#39'P'#39' THEN SUM(s.s_awal) + SUM(s.kredi' +
        't) - SUM(s.debet) END) AS "Pendapatan"'
      'FROM'
      '  m_akunperkiraan ak '
      '  LEFT JOIN saldoakun s '
      '    ON s.`noakun` = ak.`kodeakunperkiraan` '
      
        '    LEFT JOIN m_subbukubesar ms ON ms.akunsubmaster=ak.`akunsubm' +
        'aster`'
      
        '    LEFT JOIN m_bukubesar bb ON bb.`nomasterakun`=ms.`nomasterak' +
        'un`'
      'GROUP BY ak.`kodeakunperkiraan`')
    Left = 1224
    Top = 54
  end
  object frProfil: TfrxDBDataset
    UserName = 'frProfil'
    CloseDataSource = False
    FieldAliases.Strings = (
      'idprofil=idprofil'
      'nama=nama'
      'alamat=alamat'
      'kota=kota'
      'notelepon=notelepon'
      'fax=fax'
      'npwp=npwp'
      'dirbackup=dirbackup'
      'gudangbeli=gudangbeli'
      'gudangterima=gudangterima'
      'gudangjual=gudangjual'
      'footernota=footernota'
      'Footernota2=Footernota2'
      'footernota3=footernota3'
      'printerstruk=printerstruk'
      'printerinvoice=printerinvoice'
      'minpoin=minpoin'
      'minpoinrokok=minpoinrokok'
      'default_kas_penjualan=default_kas_penjualan'
      'default_kas_pembelian=default_kas_pembelian'
      'stokmin=stokmin')
    DataSet = dm.Qprofil
    BCDToCurrency = False
    Left = 160
    Top = 152
  end
  object frAkunPerkiraan: TfrxDBDataset
    UserName = 'frAkunPerkiraan'
    CloseDataSource = False
    FieldAliases.Strings = (
      'kodeakunperkiraan=kodeakunperkiraan'
      'namaakunperkiraan=namaakunperkiraan'
      'akunsubmaster=akunsubmaster'
      'namasubmaster=namasubmaster'
      'nomasterakun=nomasterakun'
      'namamasterakun=namamasterakun'
      'saldoakhir=saldoakhir'
      'Biaya=Biaya'
      'Pendapatan=Pendapatan')
    DataSet = QAkunPerkiraan
    BCDToCurrency = False
    Left = 1296
    Top = 54
  end
  object frJurnalTransaksi: TfrxDBDataset
    UserName = 'frJurnalTransaksi'
    CloseDataSource = False
    FieldAliases.Strings = (
      'noakun=noakun'
      'namaakunperkiraan=namaakunperkiraan'
      'keterangan=keterangan'
      'nobukti=nobukti'
      'tgl=tgl'
      's_awal=s_awal'
      'debet=debet'
      'kredit=kredit'
      's_akhir=s_akhir')
    DataSet = QjurnalTransaksi
    BCDToCurrency = False
    Left = 1352
    Top = 96
  end
  object QjurnalTransaksi: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  jr.noakun,'
      '  ma.namaakunperkiraan,'
      '  jr.keterangan,'
      '  jr.nobukti,'
      '  jr.tgl,'
      '  jr.s_awal,'
      '  jr.debet,'
      '  jr.kredit,'
      '  jr.s_akhir '
      'FROM'
      '  saldoakun jr '
      '  LEFT JOIN m_akunperkiraan ma '
      '    ON ma.`kodeakunperkiraan` = jr.`noakun`')
    Left = 1344
    Top = 168
  end
  object frLapBarangPelanggan: TfrxDBDataset
    UserName = 'frLapBarangPelanggan'
    CloseDataSource = False
    FieldAliases.Strings = (
      'fakturjual=fakturjual'
      'tgljual=tgljual'
      'idpelanggan=idpelanggan'
      'namapelanggan=namapelanggan'
      'kodebarang=kodebarang'
      'namabarang=namabarang'
      'satuan=satuan'
      'jumlah=jumlah'
      'harga=harga'
      'subtotal=subtotal')
    DataSet = Qlapbarangpelanggan
    BCDToCurrency = False
    Left = 1440
    Top = 296
  end
  object Qlapbarangpelanggan: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  p.fakturjual,'
      '  p.tgljual,'
      '  p.idpelanggan,'
      '  pl.namapelanggan,'
      '  dj.kodebarang,'
      '  b.namabarang,'
      '  dj.satuan,'
      '  SUM(dj.jumlah) AS jumlah,'
      '  dj.harga,'
      '  SUM(dj.subtotal) AS subtotal '
      'FROM'
      '  penjualan p '
      '  LEFT JOIN penjualandetil dj '
      '    ON dj.`fakturjual` = p.`fakturjual` '
      '  LEFT JOIN pelanggan pl '
      '    ON p.`idpelanggan` = pl.`idpelanggan` '
      '  LEFT JOIN barang b '
      '    ON b.`kodebarang` = dj.`kodebarang` '
      'GROUP BY b.`kodebarang`')
    Left = 1440
    Top = 344
  end
  object frSalesTarget: TfrxDBDataset
    UserName = 'frSalesTarget'
    CloseDataSource = False
    FieldAliases.Strings = (
      'kodesales=kodesales'
      'namasales=namasales'
      'alamat=alamat'
      'kota=kota'
      'notelpon=notelpon'
      'target=target'
      'totalpenjualan=totalpenjualan')
    DataSet = Qsalestarget
    BCDToCurrency = False
    Left = 616
    Top = 312
  end
  object Qsalestarget: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  s.kodesales,'
      '  s.namasales,'
      '  s.alamat,'
      '  S.kota,'
      '  s.notelpon,'
      '  s.target,'
      '  SUM(pj.grandtotal) AS totalpenjualan '
      'FROM'
      '  sales s '
      '  LEFT JOIN penjualan pj '
      '    ON pj.`idsales` = s.`idsales`'
      'GROUP BY s.`idsales`')
    Left = 688
    Top = 312
  end
  object Qomsetbersih: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  p.tgljual,'
      '  SUM(p.grandtotal) AS grandtotal,'
      '  SUM(IFNULL(rt.total, 0)) totalretur,'
      '  ('
      '    SUM(p.grandtotal) - SUM(IFNULL(rt.total, 0))'
      '  ) AS totalomset '
      'FROM'
      '  penjualan p '
      '  LEFT JOIN returpenjualan rt '
      '    ON rt.`tgl` = p.`tgljual` '
      'GROUP BY p.`tgljual`')
    Left = 1520
    Top = 224
  end
  object frOmsetBersih: TfrxDBDataset
    UserName = 'frOmsetBersih'
    CloseDataSource = False
    FieldAliases.Strings = (
      'tgljual=tgljual'
      'grandtotal=grandtotal'
      'totalretur=totalretur'
      'totalomset=totalomset')
    DataSet = Qomsetbersih
    BCDToCurrency = False
    Left = 1520
    Top = 280
  end
  object Qlappenjualanbysales: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  s.namasales,'
      '  pl.namapelanggan,'
      '  pl.kota,'
      '  pl.notelpon,'
      '  SUM(p.grandtotal) AS grandtotal '
      'FROM'
      '  pelanggan pl '
      '  LEFT JOIN penjualan p '
      '    ON pl.`idpelanggan` = p.`idpelanggan` '
      '  LEFT JOIN sales s '
      '    ON s.idsales = pl.`idsales`'
      'GROUP BY pl.`idpelanggan` ORDER BY pl.idsales asc')
    Left = 1464
    Top = 136
  end
  object frLapPenjualanBysales: TfrxDBDataset
    UserName = 'frLapPenjualanBysales'
    CloseDataSource = False
    FieldAliases.Strings = (
      'namasales=namasales'
      'namapelanggan=namapelanggan'
      'kota=kota'
      'notelpon=notelpon'
      'grandtotal=grandtotal')
    DataSet = Qlappenjualanbysales
    BCDToCurrency = False
    Left = 1464
    Top = 72
  end
  object Qgrafikbarang: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  dj.lastupdate,'
      '  dj.kodebarang,'
      '  b.namabarang,'
      '  SUM(dj.jumlah) AS jml '
      'FROM'
      '  penjualandetil dj '
      '  LEFT JOIN barang b '
      '    ON b.kodebarang = dj.kodebarang '
      'WHERE iddetil > 1 '
      'GROUP BY dj.kodebarang')
    Left = 1080
    Top = 424
  end
  object Qgrafikpenjualan: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  pl.namapelanggan,'
      '  pl.kota,'
      '  pl.notelpon,'
      '  SUM(p.grandtotal) AS grandtotal '
      'FROM'
      '  pelanggan pl '
      '  LEFT JOIN penjualan p '
      '    ON pl.`idpelanggan` = p.`idpelanggan` '
      'GROUP BY pl.`idpelanggan` ORDER BY SUM(p.grandtotal) DESC')
    Left = 1200
    Top = 440
  end
  object frGrafikpenjualan: TfrxDBDataset
    UserName = 'frGrafikpenjualan'
    CloseDataSource = False
    FieldAliases.Strings = (
      'namasales=namasales'
      'namapelanggan=namapelanggan'
      'kota=kota'
      'notelpon=notelpon'
      'grandtotal=grandtotal')
    DataSet = Qgrafikpenjualan
    BCDToCurrency = False
    Left = 1200
    Top = 376
  end
  object DSuratJalan: TMyDataSource
    DataSet = Qsuratjalan
    Left = 1344
    Top = 480
  end
  object DDetailSuratJalan: TMyDataSource
    DataSet = Qdetailsuratjalan
    Left = 1432
    Top = 480
  end
  object frSuratJalan: TfrxDBDataset
    UserName = 'frSuratJalan'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nobukti=nobukti'
      'tgl=tgl'
      'idsales=idsales'
      'namasales=namasales'
      'keterangan=keterangan')
    DataSet = Qsuratjalan
    BCDToCurrency = False
    Left = 1520
    Top = 416
  end
  object frDetailSuratJalan: TfrxDBDataset
    UserName = 'frDetailSuratJalan'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nobukti=nobukti'
      'kodebarang=kodebarang'
      'namabarang=namabarang'
      'satuan=satuan'
      'jumlah=jumlah'
      'idgudang=idgudang')
    DataSet = Qdetailsuratjalan
    BCDToCurrency = False
    Left = 1520
    Top = 480
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
    Left = 1344
    Top = 424
  end
  object Qdetailsuratjalan: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  sj.nobukti,'
      '  sj.kodebarang,'
      '  b.namabarang,'
      '  sj.satuan,'
      '  sj.jumlah,'
      '  sj.idgudang '
      'FROM'
      '  detailsuratjalan sj '
      '  LEFT JOIN barang b '
      '    ON sj.`kodebarang` = b.`kodebarang`')
    MasterSource = DSuratJalan
    MasterFields = 'nobukti'
    DetailFields = 'nobukti'
    Left = 1432
    Top = 424
    ParamData = <
      item
        DataType = ftString
        Name = 'nobukti'
        ParamType = ptInput
      end>
  end
  object Qlappenjualansales: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  p.tgljual,'
      '  p.fakturjual,'
      '  s.namasales,'
      '  SUM('
      '    pd.harga * (pd.jumlah - pd.jumlahretur)'
      '  ) AS totalomset,'
      '  SUM('
      '    pd.hpp * (pd.jumlah - pd.jumlahretur)'
      '  ) AS totalhpp,'
      '  SUM('
      '    (pd.harga - pd.hpp) * (pd.jumlah - pd.jumlahretur)'
      '  ) AS totalprofit '
      'FROM'
      '  penjualandetil pd '
      '  LEFT JOIN penjualan p '
      '    ON p.`fakturjual` = pd.`fakturjual` '
      '  LEFT JOIN sales s '
      '    ON s.`idsales` = p.`idsales` '
      'GROUP BY p.`fakturjual`')
    Left = 808
    Top = 344
  end
  object frPenjualanSales: TfrxDBDataset
    UserName = 'frPenjualanSales'
    CloseDataSource = False
    FieldAliases.Strings = (
      'tgljual=tgljual'
      'fakturjual=fakturjual'
      'namasales=namasales'
      'totalomset=totalomset'
      'totalhpp=totalhpp'
      'totalprofit=totalprofit')
    DataSet = Qlappenjualansales
    BCDToCurrency = False
    Left = 880
    Top = 344
  end
  object QpivotHari: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  s.namasales,'
      '  p.tgljual,'
      '  SUM(p.grandtotal) AS total '
      'FROM'
      '  penjualan p '
      '  LEFT JOIN sales s '
      
        '    ON p.`idsales` = s.`idsales` WHERE MONTH(p.tgljual)="8" and ' +
        'YEAR(p.tgljual)="2018" '
      'GROUP BY p.`tgljual`,'
      '  s.`idsales`')
    Left = 1040
    Top = 152
  end
  object frPivotHari: TfrxDBDataset
    UserName = 'frPivotHari'
    CloseDataSource = False
    FieldAliases.Strings = (
      'bulan=bulan'
      'namapelanggan=namapelanggan'
      'namasales=namasales'
      '2018-08-02=2018-08-02'
      '2018-08-03=2018-08-03'
      '2018-08-06=2018-08-06'
      '2018-08-07=2018-08-07'
      '2018-08-08=2018-08-08'
      '2018-08-09=2018-08-09'
      '2018-08-10=2018-08-10'
      '2018-08-11=2018-08-11'
      '2018-08-13=2018-08-13'
      '2018-08-14=2018-08-14'
      '2018-08-15=2018-08-15'
      '2018-08-16=2018-08-16'
      '2018-08-18=2018-08-18'
      '2018-08-20=2018-08-20'
      '2018-08-21=2018-08-21'
      '2018-08-23=2018-08-23'
      '2018-08-24=2018-08-24'
      '2018-08-25=2018-08-25'
      '2018-08-27=2018-08-27'
      '2018-08-28=2018-08-28'
      '2018-08-29=2018-08-29'
      '2018-08-30=2018-08-30'
      '2018-08-31=2018-08-31'
      'total=total')
    DataSet = QpivotHari
    BCDToCurrency = False
    Left = 1040
    Top = 88
  end
  object DpivotHari: TMyDataSource
    DataSet = QpivotHari
    Left = 1096
    Top = 88
  end
  object QgrafikGlobal: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  DATE_FORMAT(tgljual,"%b") AS tgljual,'
      '  SUM(grandtotal) AS total '
      'FROM'
      '  penjualan '
      'GROUP BY MONTH(tgljual)')
    Left = 912
    Top = 528
  end
  object QPivotPenjualanHari: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  DATE_FORMAT(tgljual,"%b") AS tgljual,'
      '  SUM(grandtotal) AS total '
      'FROM'
      '  penjualan '
      'GROUP BY MONTH(tgljual)')
    Left = 1032
    Top = 512
  end
  object DPivotPenjualanHari: TMyDataSource
    DataSet = QactivaSub
    Left = 1144
    Top = 512
  end
  object FrBarang: TfrxDBDataset
    UserName = 'FrBarang'
    CloseDataSource = False
    FieldAliases.Strings = (
      'idbarang=idbarang'
      'kodebarang=kodebarang'
      'kodebarcode=kodebarcode'
      'namabarang=namabarang'
      'namabarcode=namabarcode'
      'namakategori=namakategori'
      'satuanbeli=satuanbeli'
      'satuanjual=satuanjual'
      'isi=isi'
      'stokmin=stokmin'
      'stokmax=stokmax'
      'hargabeli=hargabeli'
      'margin=margin'
      'hargaecer=hargaecer'
      'hargagrosir=hargagrosir'
      'hargapartai=hargapartai'
      'hargapartai4=hargapartai4'
      'hargapartai5=hargapartai5'
      'diskonpersen=diskonpersen'
      'diskonrupiah=diskonrupiah'
      'ppn=ppn')
    DataSet = dm.QBarang
    BCDToCurrency = False
    Left = 224
    Top = 168
  end
  object Qrekapkasi2: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'CALL sp_rekapitulasikasir('#39'2019-8-2'#39','#39'2019-8-2'#39')')
    Left = 40
    Top = 536
  end
  object frrekapKasir2: TfrxDBDataset
    UserName = 'FrrekapKasir2'
    CloseDataSource = False
    FieldAliases.Strings = (
      'namalengkap=namalengkap'
      'total=total'
      'diskon=diskon'
      'pembulatan=pembulatan'
      'grandtotal=grandtotal'
      'bayarpoin=bayarpoin'
      'penjualan_cash=penjualan_cash'
      'penjualan_kredit=penjualan_kredit'
      'nontunai=nontunai'
      'tunai=tunai'
      'biayalain=biayalain'
      'penerimaan_tunai=penerimaan_tunai'
      'penerimaan_transfer=penerimaan_transfer')
    DataSet = Qrekapkasi2
    BCDToCurrency = False
    Left = 112
    Top = 536
  end
  object QPendapatan: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'call sp_pendapatan('#39'2019-09-01'#39','#39'2019-09-06'#39')')
    Left = 336
    Top = 528
  end
  object frPendapatan: TfrxDBDataset
    UserName = 'frPendapatan'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'kodeakunperkiraan=kodeakunperkiraan'
      'namaakunperkiraan=namaakunperkiraan'
      'saldo=saldo')
    DataSet = QPendapatan
    BCDToCurrency = False
    Left = 400
    Top = 536
  end
  object Qhpp: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'call sp_hpp('#39'2019-09-01'#39','#39'2019-09-06'#39')')
    Left = 520
    Top = 544
  end
  object frHpp: TfrxDBDataset
    UserName = 'frHpp'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'kodeakunperkiraan=kodeakunperkiraan'
      'namaakunperkiraan=namaakunperkiraan'
      'saldo=saldo')
    DataSet = Qhpp
    BCDToCurrency = False
    Left = 600
    Top = 544
  end
  object Qbiaya: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'call sp_biaya('#39'2019-09-01'#39','#39'2019-09-06'#39')')
    Left = 672
    Top = 544
  end
  object frBiaya: TfrxDBDataset
    UserName = 'frBiaya'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'kodeakunperkiraan=kodeakunperkiraan'
      'namaakunperkiraan=namaakunperkiraan'
      'saldo=saldo')
    DataSet = Qbiaya
    BCDToCurrency = False
    Left = 752
    Top = 544
  end
  object frPemakaianBarang: TfrxDBDataset
    UserName = 'frPemakaianBarang'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nobukti=nobukti'
      'tgl=tgl'
      'total=total'
      'username=username'
      'keterangan=keterangan')
    DataSet = dtrx.Qpemakainbarang
    BCDToCurrency = False
    Left = 40
    Top = 604
  end
  object frDpemakainBarang: TfrxDBDataset
    UserName = 'frDpemakaianBarang'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nobukti=nobukti'
      'kodebarang=kodebarang'
      'namabarang=namabarang'
      'satuan=satuan'
      'harga=harga'
      'jumlah=jumlah'
      'subtotal=subtotal'
      'isi=isi')
    DataSet = dtrx.Qdetailpemakainbarang
    BCDToCurrency = False
    Left = 112
    Top = 604
  end
  object frxls1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 1264
    Top = 120
  end
  object QSP_returJual: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'call sp_returjual('#39'2020-06-21'#39','#39'2020-06-21'#39')')
    Left = 520
    Top = 600
  end
  object frSpReturjual: TfrxDBDataset
    UserName = 'frSpReturjual'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'kodeakunperkiraan=kodeakunperkiraan'
      'namaakunperkiraan=namaakunperkiraan'
      'saldo=saldo')
    DataSet = QSP_returJual
    BCDToCurrency = False
    Left = 600
    Top = 600
  end
  object QPenukaranPoin: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  r.nobukti,'
      '  r.tgl,'
      '  pl.namapelanggan,'
      '  r.jmlpoin,'
      '  r.jmltukar,'
      '  r.jmlpoin - r.jmltukar AS sisapoin,'
      '  r.keterangan,'
      '  u.namalengkap '
      'FROM'
      '  redempoin r '
      '  LEFT JOIN pelanggan pl '
      '    ON r.id_pelanggan = pl.idpelanggan '
      '  LEFT JOIN m_user u '
      '    ON u.iduser = r.iduser')
    Left = 672
    Top = 608
  end
  object frPenukaranPoin: TfrxDBDataset
    UserName = 'frPenukaranPoin'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nobukti=nobukti'
      'tgl=tgl'
      'namapelanggan=namapelanggan'
      'jmlpoin=jmlpoin'
      'jmltukar=jmltukar'
      'sisapoin=sisapoin'
      'keterangan=keterangan'
      'namalengkap=namalengkap')
    DataSet = QPenukaranPoin
    BCDToCurrency = False
    Left = 752
    Top = 608
  end
  object QDetailPenukaranPoin: TMyQuery
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
      '  detailredempoin d '
      '  LEFT JOIN barang b '
      '    ON b.`kodebarang` = d.`kodebarang`')
    MasterSource = Dpenukaranpoin
    MasterFields = 'nobukti'
    DetailFields = 'nobukti'
    Left = 672
    Top = 664
    ParamData = <
      item
        DataType = ftString
        Name = 'nobukti'
        ParamType = ptInput
        Value = 'R44200622001'
      end>
  end
  object frDetailPenukaranPoin: TfrxDBDataset
    UserName = 'frDetailPenukaranPoin'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nobukti=nobukti'
      'kodebarang=kodebarang'
      'namabarang=namabarang'
      'satuan=satuan'
      'harga=harga'
      'jumlah=jumlah'
      'subtotal=subtotal'
      'isi=isi')
    DataSet = QDetailPenukaranPoin
    BCDToCurrency = False
    Left = 752
    Top = 664
  end
  object Dpenukaranpoin: TMyDataSource
    DataSet = QPenukaranPoin
    Left = 592
    Top = 664
  end
  object frTempStokOpname: TfrxDBDataset
    UserName = 'frTempStokOpname'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nobukti=nobukti'
      'tanggal=tanggal'
      'kodebarang=kodebarang'
      'kodebarcode=kodebarcode'
      'namabarang=namabarang'
      'stokkomp=stokkomp'
      'stoknyata=stoknyata'
      'selisih=selisih'
      'keterangan=keterangan'
      'namalokasi=namalokasi'
      'namalengkap=namalengkap'
      'username=username')
    DataSet = QTempStokOpanme
    BCDToCurrency = False
    Left = 121
    Top = 680
  end
  object QTempStokOpanme: TMyQuery
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
      '  temp_stokopname so '
      '  LEFT JOIN barang b '
      '    ON so.`kodebarang` = b.`kodebarang`'
      '  left join lokasi k on k.idlokasi=so.idgudang'
      '  left join m_user u on u.iduser=so.lastuser'
      '  LEFT JOIN m_user ab on ab.iduser=so.petugascheck')
    Filtered = True
    Left = 32
    Top = 684
  end
  object QLabPelanggan: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      'SELECT '
      '  pl.kodepelanggan,'
      '  pl.namapelanggan,'
      '  SUM('
      '    (d.harga - d.diskonrupiah) * (d.jumlah - d.jumlahretur)'
      '  ) AS totalomset,'
      '  SUM(d.hpp * (d.jumlah - d.jumlahretur)) AS totalhpp,'
      '  SUM('
      
        '    ((d.harga - d.diskonrupiah) - d.hpp) * (d.jumlah - d.jumlahr' +
        'etur)'
      '  ) AS totalprofit '
      'FROM'
      '  penjualan p '
      '  LEFT JOIN penjualandetil d '
      '    ON p.`fakturjual` = d.`fakturjual` '
      '  LEFT JOIN pelanggan pl '
      
        '    ON pl.`idpelanggan` = p.`idpelanggan` GROUP BY p.`idpelangga' +
        'n`')
    Left = 1440
    Top = 560
  end
  object frLabaPelanggan: TfrxDBDataset
    UserName = 'frLabaPelanggan'
    CloseDataSource = False
    FieldAliases.Strings = (
      'kodepelanggan=kodepelanggan'
      'namapelanggan=namapelanggan'
      'totalomset=totalomset'
      'totalhpp=totalhpp'
      'totalprofit=totalprofit')
    DataSet = QLabPelanggan
    BCDToCurrency = False
    Left = 1344
    Top = 560
  end
  object frPrintOrder: TfrxDBDataset
    UserName = 'frPrintOrder'
    CloseDataSource = False
    FieldAliases.Strings = (
      'fakturjual=fakturjual'
      'tgljual=tgljual'
      'idpelanggan=idpelanggan'
      'namapelanggan=namapelanggan'
      'kodepelanggan=kodepelanggan'
      'pembayaran=pembayaran'
      'total=total'
      'diskon=diskon'
      'grandtotal=grandtotal'
      'namalengkap=namalengkap'
      'bayar=bayar'
      'kembali=kembali')
    DataSet = dtrx.Qtempjual
    BCDToCurrency = False
    Left = 1072
    Top = 600
  end
  object frPrintOrderDetail: TfrxDBDataset
    UserName = 'frPrintOrderDetail'
    CloseDataSource = False
    FieldAliases.Strings = (
      'iddetil=iddetil'
      'fakturjual=fakturjual'
      'kodebarang=kodebarang'
      'namabarang=namabarang'
      'satuan=satuan'
      'harga=harga'
      'hpp=hpp'
      'jumlah=jumlah'
      'diskonpersen=diskonpersen'
      'diskonrupiah=diskonrupiah'
      'subtotal=subtotal'
      'isi=isi'
      'idgudang=idgudang'
      'namalokasi=namalokasi')
    DataSet = dtrx.Qtempjualdetail
    BCDToCurrency = False
    Left = 1072
    Top = 664
  end
  object FrPrintBarcode: TfrxDBDataset
    UserName = 'FrPrintBarcode'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'kodebarcode=kodebarcode'
      'namabarcode=namabarcode'
      'harga=harga')
    DataSet = dm.QprinteBarcode
    BCDToCurrency = False
    Left = 936
    Top = 656
  end
  object QAkunBiaya: TMyQuery
    Connection = dm.con1
    SQL.Strings = (
      
        'SELECT a.kodeakunperkiraan,a.namaakunperkiraan,SUM(s.s_awal+s.de' +
        'bet-s.kredit) as saldo FROM'
      
        'saldoakun s LEFT JOIN m_akunperkiraan a on a.kodeakunperkiraan=s' +
        '.noakun where a.akunsubmaster="502"')
    Left = 928
    Top = 600
  end
  object frAKunBiaya: TfrxDBDataset
    UserName = 'frAKunBiaya'
    CloseDataSource = False
    FieldAliases.Strings = (
      'kodeakunperkiraan=kodeakunperkiraan'
      'namaakunperkiraan=namaakunperkiraan'
      'saldo=saldo')
    DataSet = QAkunBiaya
    BCDToCurrency = False
    Left = 928
    Top = 656
  end
end
