unit uDlaporan;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, MyAccess, frxCross,
  frxClass, frxDBSet, frxExportXLSX, frxBarcode, frxDesgn, frxChart,
  frxExportXLS, frxExportBaseDialog;

type
  TDlaporan = class(TDataModule)
    QLapBarang: TMyQuery;
    Fr1: TfrxReport;
    frdLapBarang: TfrxDBDataset;
    frxcrsbjct1: TfrxCrossObject;
    QProfil: TMyQuery;
    frdPprofil: TfrxDBDataset;
    QLapHistoryHarga: TMyQuery;
    frdReturbeli: TfrxDBDataset;
    QFastMoving: TMyQuery;
    frdreturbelidetail: TfrxDBDataset;
    QKartuStok: TMyQuery;
    frdKartuStok: TfrxDBDataset;
    QLaporanPelanggan: TMyQuery;
    FlaporanPelanggan: TfrxDBDataset;
    frPengeluaran: TfrxDBDataset;
    frDetailPengeluaran: TfrxDBDataset;
    frdetJurnalMemorial: TfrxDBDataset;
    frJurnalMemorial: TfrxDBDataset;
    QLapBukuBesar: TMyQuery;
    FrLapbukuBesar: TfrxDBDataset;
    QlapPenjualan: TMyQuery;
    LapPenjualan: TfrxDBDataset;
    FlapPenjualanDetil: TfrxDBDataset;
    Qlapdetiljual: TMyQuery;
    DlapJual: TMyDataSource;
    QLapPembelian: TMyQuery;
    LapPembelian: TfrxDBDataset;
    QlapBeliDetil: TMyQuery;
    Fdetilbeli: TfrxDBDataset;
    DlapBeli: TMyDataSource;
    frdDatabarang: TfrxDBDataset;
    frxbrcdbjct1: TfrxBarCodeObject;
    frdPObeli: TfrxDBDataset;
    frdPoBeliDetil: TfrxDBDataset;
    Qpobeli: TMyQuery;
    QdetailPObeli: TMyQuery;
    DpoBeli: TMyDataSource;
    DdetailPoBeli: TMyDataSource;
    frdSupplier: TfrxDBDataset;
    frdPelanggan: TfrxDBDataset;
    frdBuktiMutasi: TfrxDBDataset;
    frdBuktiMutasiDetail: TfrxDBDataset;
    QdatamutasiBarang: TMyQuery;
    DDataMutasiBarang: TMyDataSource;
    DdetailmutasiBarang: TMyDataSource;
    QDetailMutasiBarang: TMyQuery;
    Qpenjualan: TMyQuery;
    QdetailJual: TMyQuery;
    Dpenjualan: TMyDataSource;
    DDetailJual: TMyDataSource;
    frdNotajual: TfrxDBDataset;
    frdDetailnotajual: TfrxDBDataset;
    frdLapHUtang: TfrxDBDataset;
    frdPiutang: TfrxDBDataset;
    QreturJual: TMyQuery;
    QdetailReturjual: TMyQuery;
    DreturJual: TMyDataSource;
    DDetailReturJual: TMyDataSource;
    frdreturPenjualan: TfrxDBDataset;
    frdDetailReturPenjualan: TfrxDBDataset;
    QReturBeli: TMyQuery;
    QDetailReturBeli: TMyQuery;
    DReturBeli: TMyDataSource;
    DDetailReturBeli: TMyDataSource;
    frxDesigner1: TfrxDesigner;
    frdRekapKasir: TfrxDBDataset;
    QrekapKasir: TMyQuery;
    Qstoklimit: TMyQuery;
    DstokLimit: TMyDataSource;
    frdLaporanStokOpname: TfrxDBDataset;
    QtotalNilaiBarang: TMyQuery;
    frdTotalNilaiBarang: TfrxDBDataset;
    Qrekapitulasibarang: TMyQuery;
    Drekapitulasibarang: TMyDataSource;
    frdrekapitulasibarang: TfrxDBDataset;
    Lpacking: TMyQuery;
    FLpacking: TfrxDBDataset;
    Ldetpacking: TMyQuery;
    FLpackingLIst: TfrxDBDataset;
    Dpacking: TMyDataSource;
    frdHistoryHarga: TfrxDBDataset;
    frdFastMoving: TfrxDBDataset;
    QactivaSub: TMyQuery;
    QPasiva: TMyQuery;
    QAkunPasiva: TMyQuery;
    DSubActiva: TMyDataSource;
    DPasiva: TMyDataSource;
    FrPasiva: TfrxDBDataset;
    FrAkunPasiva: TfrxDBDataset;
    FrSubActiva: TfrxDBDataset;
    FrAkunActiva: TfrxDBDataset;
    QactivaAkun: TMyQuery;
    QAkunPerkiraan: TMyQuery;
    frProfil: TfrxDBDataset;
    frAkunPerkiraan: TfrxDBDataset;
    frJurnalTransaksi: TfrxDBDataset;
    QjurnalTransaksi: TMyQuery;
    frLapBarangPelanggan: TfrxDBDataset;
    Qlapbarangpelanggan: TMyQuery;
    frSalesTarget: TfrxDBDataset;
    Qsalestarget: TMyQuery;
    Qomsetbersih: TMyQuery;
    frOmsetBersih: TfrxDBDataset;
    Qlappenjualanbysales: TMyQuery;
    frLapPenjualanBysales: TfrxDBDataset;
    Qgrafikbarang: TMyQuery;
    Qgrafikpenjualan: TMyQuery;
    frGrafikpenjualan: TfrxDBDataset;
    DSuratJalan: TMyDataSource;
    DDetailSuratJalan: TMyDataSource;
    frSuratJalan: TfrxDBDataset;
    frDetailSuratJalan: TfrxDBDataset;
    Qsuratjalan: TMyQuery;
    Qdetailsuratjalan: TMyQuery;
    Qlappenjualansales: TMyQuery;
    frPenjualanSales: TfrxDBDataset;
    QpivotHari: TMyQuery;
    frPivotHari: TfrxDBDataset;
    DpivotHari: TMyDataSource;
    QgrafikGlobal: TMyQuery;
    QPivotPenjualanHari: TMyQuery;
    DPivotPenjualanHari: TMyDataSource;
    FrBarang: TfrxDBDataset;
    Qrekapkasi2: TMyQuery;
    frrekapKasir2: TfrxDBDataset;
    QPendapatan: TMyQuery;
    frPendapatan: TfrxDBDataset;
    Qhpp: TMyQuery;
    frHpp: TfrxDBDataset;
    Qbiaya: TMyQuery;
    frBiaya: TfrxDBDataset;
    frPemakaianBarang: TfrxDBDataset;
    frDpemakainBarang: TfrxDBDataset;
    frxls1: TfrxXLSExport;
    QSP_returJual: TMyQuery;
    frSpReturjual: TfrxDBDataset;
    QPenukaranPoin: TMyQuery;
    frPenukaranPoin: TfrxDBDataset;
    QDetailPenukaranPoin: TMyQuery;
    frDetailPenukaranPoin: TfrxDBDataset;
    Dpenukaranpoin: TMyDataSource;
    frTempStokOpname: TfrxDBDataset;
    QTempStokOpanme: TMyQuery;
    QLabPelanggan: TMyQuery;
    frLabaPelanggan: TfrxDBDataset;
    frPrintOrder: TfrxDBDataset;
    frPrintOrderDetail: TfrxDBDataset;
    FrPrintBarcode: TfrxDBDataset;
    QAkunBiaya: TMyQuery;
    frAKunBiaya: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dlaporan: TDlaporan;

implementation


uses udm, uDtrx;

{$R *.dfm}

end.
