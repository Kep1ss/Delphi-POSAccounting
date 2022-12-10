unit udm;

interface

uses
  System.SysUtils, System.Classes, Dialogs,Data.DB, DBAccess, MyAccess, MemDS,
  DADump, MyDump,MemData;

type
  Tdm = class(TDataModule)
    con1: TMyConnection;
    Q1: TMyQuery;
    QUser: TMyQuery;
    DuSer: TMyDataSource;
    Q2: TMyQuery;
    DProfil: TMyDataSource;
    Qprofil: TMyQuery;
    QMasterAkun: TMyQuery;
    DMasterAkun: TMyDataSource;
    QSubMasterAkun: TMyQuery;
    DSubMasterAkun: TMyDataSource;
    QMasterAkunPerkiraan: TMyQuery;
    DMasterAkunPerkiraan: TMyDataSource;
    Q3: TMyQuery;
    D1: TMyDataSource;
    DSupplier: TMyDataSource;
    QSupplier: TMyQuery;
    DKategori: TMyDataSource;
    QKategori: TMyQuery;
    DLokasi: TMyDataSource;
    QLokasi: TMyQuery;
    DSatuan: TMyDataSource;
    QSatuan: TMyQuery;
    DJenisPelanggan: TMyDataSource;
    QJenisPelanggan: TMyQuery;
    DPelanggan: TMyDataSource;
    QPelanggan: TMyQuery;
    DBarang: TMyDataSource;
    QBarang: TMyQuery;
    Q4: TMyQuery;
    Dkomputer: TMyDataSource;
    Qkomputer: TMyQuery;
    DmultiSatuan: TMyDataSource;
    QMultiSatuan: TMyQuery;
    Dvoucher: TMyDataSource;
    Qvoucher: TMyQuery;
    DSales: TMyDataSource;
    QSales: TMyQuery;
    Q5: TMyQuery;
    Dcaribarang: TMyDataSource;
    Qcaribarang: TMyQuery;
    Q6: TMyQuery;
    MyDump1: TMyDump;
    DEDC: TMyDataSource;
    QEdc: TMyQuery;
    DprintBarcode: TMyDataSource;
    QprinteBarcode: TMyQuery;
    QMultiHarga: TMyQuery;
    DMultiHarga: TMyDataSource;
    QFree: TMyQuery;
    Q7: TMyQuery;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  dm: Tdm;

implementation


{$R *.dfm}

end.
