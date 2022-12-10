unit uSkinChanger;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxClasses, dxLayoutLookAndFeels, cxContainer, cxEdit,
  cxListView, Vcl.ImgList,dxSkinInfo, dxSkinsdxBarPainter, dxBar,
  dxRibbonGallery, dxSkinChooserGallery, dxSkinsForm, dxRibbonSkins,
  dxSkinsdxRibbonPainter, dxRibbonCustomizationForm, dxRibbon;

type
  TFPilhSkin = class(TForm)
    dxlytlkndflst1: TdxLayoutLookAndFeelList;
    cxImg1: TcxImageList;
    dxMn1: TdxBarManager;
    dxskncntrlr1: TdxSkinController;
    dxRibbon1: TdxRibbon;
    dxRibbon1Tab1: TdxRibbonTab;
    dxGMn1Bar1: TdxBar;
    dxsknchsrglrytm2: TdxSkinChooserGalleryItem;
    procedure dxsknchsrglrytm2SkinChanged(Sender: TObject;
      const ASkinName: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPilhSkin: TFPilhSkin;

implementation

{$R *.dfm}

uses uMainMenu,dxSkinsLookAndFeelPainter;

procedure TFPilhSkin.dxsknchsrglrytm2SkinChanged(Sender: TObject;
  const ASkinName: string);
begin
  Fmain.dxSkinController1.SkinName := ASkinName;
  Fmain.dxRibbon1.ColorSchemeName  := ASkinName;
  Fmain.SaveSkin(ASkinName);
end;

end.
