unit uDoctos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, System.JSON, REST.Response.Adapter,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Vcl.StdCtrls,
  Vcl.Mask, RzEdit, RzDBEdit, JvExStdCtrls, JvCombobox, JvDBSearchComboBox,
  RzCmboBx, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  IdTCPConnection, IdTCPClient, IdHTTP, IdBaseComponent, IdComponent,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  Vcl.ExtCtrls, RzPanel, RzDlgBtn, FireDAC.Stan.Async, FireDAC.DApt,
  RzDBCmbo, Vcl.DBCtrls, JvDBControls, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, RzDBBnEd;

type
  TFrDoctos = class(TForm)
    dsQuery: TDataSource;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label10: TLabel;
    txtUf: TRzDBEdit;
    txtMunicipio: TRzDBButtonEdit;
    GridMun: TJvDBGrid;
    Query: TFDQuery;
    QueryID: TIntegerField;
    QueryID_C000700: TIntegerField;
    QueryMD_CMUNDESCARGA: TStringField;
    QueryMD_XMUNDESCARGA: TStringField;
    RzPanel1: TRzPanel;
    JvDBNavigator1: TJvDBNavigator;
    btnClose: TButton;
    btnChave: TButton;
    procedure FormShow(Sender: TObject);
    procedure dsQueryStateChange(Sender: TObject);
    procedure txtMunicipioButtonClick(Sender: TObject);
    procedure QueryBeforeDelete(DataSet: TDataSet);
    procedure QueryAfterInsert(DataSet: TDataSet);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnChaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrDoctos: TFrDoctos;

implementation

{$R *.dfm}

uses uModulo, uMain, uMunicipios, uChavesNFe;

procedure TFrDoctos.btnChaveClick(Sender: TObject);
begin
   if Query.IsEmpty then
   begin
      Application.MessageBox('Não existem municípios informados.','TechCore-RTG',mb_IconWarning or mb_ok);
      exit;
   end;

   FrChavesNFe := TFrChavesNFe.Create(self);
   try
      FrChavesNFe.ShowModal;
   finally
      FreeAndNil(FrChavesNFe);
   end;

end;

procedure TFrDoctos.btnCloseClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFrDoctos.dsQueryStateChange(Sender: TObject);
begin
   txtMunicipio.Enabled := Query.State in [dsInsert,dsEdit];
   GridMun.Enabled      := not (Query.State in [dsInsert,dsEdit]);
   btnChave.Enabled     := not (Query.State in [dsInsert,dsEdit]);
end;

procedure TFrDoctos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if Query.State in [dsInsert,dsEdit] then
      CanClose := not (Application.MessageBox('Deseja sair sem salvar o registro?','TechCore-RTG',mb_IconQuestion or mb_YesNo) = mrNo);
end;

procedure TFrDoctos.FormShow(Sender: TObject);
begin
   Query.Open();
end;

procedure TFrDoctos.QueryAfterInsert(DataSet: TDataSet);
begin
   txtMunicipio.SetFocus;
end;

procedure TFrDoctos.QueryBeforeDelete(DataSet: TDataSet);
begin
   if Application.MessageBox('Tem certeza que deseja excluir este registro','TechCore-RTG',mb_IconQuestion or mb_YesNo) = mrNo then
      Abort;
end;

procedure TFrDoctos.txtMunicipioButtonClick(Sender: TObject);
begin
   FrMunicipios := TFrMunicipios.Create(self);
   try
      // Seta o município escolhido
      FrMunicipios.UfFinal := txtUf.Text;

      if FrMunicipios.ShowModal = mrOk then
      begin
         with dsQuery.DataSet do
         begin
            FieldByName('md_cmundescarga').AsString := FrMunicipios.Query.FieldByName('id').AsString;
            FieldByName('md_xmundescarga').AsString := FrMunicipios.txtMunicipio.Text;
         end;
      end;

   finally
      FreeAndNil(FrMunicipios);
   end;
end;

end.
