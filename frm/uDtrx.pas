unit uDtrx;

interface

uses
  System.SysUtils, System.Classes, udm, Data.DB, DBAccess, MyAccess, MemDS;

type
  Tdtrx = class(TDataModule)
    QPembelian: TMyQuery;
    Qdetailbeli: TMyQuery;
    DPembelian: TMyDataSource;
    DDetailBeli: TMyDataSource;
    QReturBeli: TMyQuery;
    QDetailReturBeli: TMyQuery;
    DReturBeli: TMyDataSource;
    DDetailReturBeli: TMyDataSource;
    Qpenjualan: TMyQuery;
    QdetailJual: TMyQuery;
    Dpenjualan: TMyDataSource;
    DDetailJual: TMyDataSource;
    QreturJual: TMyQuery;
    QdetailReturjual: TMyQuery;
    DreturJual: TMyDataSource;
    DDetailReturJual: TMyDataSource;
    Qpiutang: TMyQuery;
    Dpiutang: TMyDataSource;
    Qhutang: TMyQuery;
    Dhutang: TMyDataSource;
    Qpengeluaran: TMyQuery;
    DPengeluaran: TMyDataSource;
    QDetailPengeluaran: TMyQuery;
    Ddetailpengeluaran: TMyDataSource;
    Qpinjaman: TMyQuery;
    DPinjaman: TMyDataSource;
    QdetPinjaman: TMyQuery;
    DDetPinjaman: TMyDataSource;
    QjurnalMeorial: TMyQuery;
    DJurnalMemorial: TMyDataSource;
    QDetJurnalMemorial: TMyQuery;
    DdetJurnalMemorial: TMyDataSource;
    Qpobeli: TMyQuery;
    QdetailPObeli: TMyQuery;
    DpoBeli: TMyDataSource;
    DdetailPoBeli: TMyDataSource;
    QpenerimaanBarang: TMyQuery;
    QPenerimaanBarangdetail: TMyQuery;
    DPenerimaanBarang: TMyDataSource;
    DPenerimaanBarangDetil: TMyDataSource;
    Qdatastokopname: TMyQuery;
    Ddatastokopname: TMyDataSource;
    QdatamutasiBarang: TMyQuery;
    DDataMutasiBarang: TMyDataSource;
    DdetailmutasiBarang: TMyDataSource;
    QDetailMutasiBarang: TMyQuery;
    Qtempjual: TMyQuery;
    Qtempjualdetail: TMyQuery;
    Dtempjual: TMyDataSource;
    Dtempjualdetail: TMyDataSource;
    QpendingSO: TMyQuery;
    QPendingSoDetail: TMyQuery;
    DPendingSo: TMyDataSource;
    DPendingSoDetail: TMyDataSource;
    QsalesOrder: TMyQuery;
    QSalesOrderDetail: TMyQuery;
    DSalesOrder: TMyDataSource;
    DSalesOrderDetail: TMyDataSource;
    DSuratJalan: TMyDataSource;
    DDetailSuratJalan: TMyDataSource;
    Qsuratjalan: TMyQuery;
    Qdetailsuratjalan: TMyQuery;
    Qpelunasanpiutang: TMyQuery;
    Dpelunasanpiutang: TMyDataSource;
    QpelunasanHutang: TMyQuery;
    DPelunasanHutang: TMyDataSource;
    Qpemakainbarang: TMyQuery;
    Dpemakaianbarang: TMyDataSource;
    Ddetailpemakainbarang: TMyDataSource;
    Qdetailpemakainbarang: TMyQuery;
    QpoPenjualan: TMyQuery;
    QpoPenjualanDetail: TMyQuery;
    DpoPenjualan: TMyDataSource;
    DpoPenjualanDetil: TMyDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtrx: Tdtrx;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
