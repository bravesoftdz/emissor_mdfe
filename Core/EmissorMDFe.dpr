program EmissorMDFe;

uses
  Vcl.Forms,
  uListaDoctos in '..\Unit\uListaDoctos.pas' {FrListaDoctos},
  uDoctos in '..\Unit\uDoctos.pas' {FrDoctos},
  uMain in '..\Unit\uMain.pas' {FrPrincipal},
  uModulo in '..\Unit\uModulo.pas' {Modulo: TDataModule},
  uCabecalho in '..\Unit\uCabecalho.pas' {FrCabecalho},
  uMunicipios in '..\Unit\uMunicipios.pas' {FrMunicipios},
  uChavesNFe in '..\Unit\uChavesNFe.pas' {FrChavesNFe},
  uVeiculoTracao in '..\Unit\uVeiculoTracao.pas' {FrVeiculoTracao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TModulo, Modulo);
  Application.CreateForm(TFrPrincipal, FrPrincipal);
  Application.CreateForm(TFrVeiculoTracao, FrVeiculoTracao);
  Application.Run;
end.
