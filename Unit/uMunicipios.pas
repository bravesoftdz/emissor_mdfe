unit uMunicipios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzCmboBx, Vcl.ExtCtrls, RzPanel,  System.JSON, REST.Response.Adapter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  JvExStdCtrls, JvCombobox, JvDBCombobox, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, RzDlgBtn, JvDBSearchComboBox,
  Vcl.Grids, Vcl.DBGrids;

type
  TFrMunicipios = class(TForm)
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label10: TLabel;
    RzDialogButtons1: TRzDialogButtons;
    cbUF: TRzComboBox;
    Query: TFDMemTable;
    dsMunicipios: TDataSource;
    IdHTTP1: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    txtMunicipio: TJvDBSearchComboBox;
    procedure cbUFClick(Sender: TObject);
    procedure RzDialogButtons1ClickOk(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
   procedure JsonToDataset(aDataset : TDataSet; aJSON : string);
  public
    { Public declarations }
    StrCodigoo, strNomeo, UfFinal  : String;
  end;

var
  FrMunicipios: TFrMunicipios;

implementation

{$R *.dfm}

uses uMain;

procedure TFrMunicipios.FormShow(Sender: TObject);
begin
   if UfFinal <> EmptyStr then
   begin
      cbUF.FindItem(UfFinal);
      cbUF.Enabled := false;
      cbUF.OnClick(nil);
   end;
end;

procedure TFrMunicipios.JsonToDataset(aDataset : TDataSet; aJSON : string);
var
  JObj : TJSONArray;
  vConv : TCustomJSONDataSetAdapter;
begin
  if (aJSON = EmptyStr) then
  begin
    Exit;
  end;

  JObj := TJSONObject.ParseJSONValue(aJSON) as TJSONArray;
  vConv := TCustomJSONDataSetAdapter.Create(Nil);

  try
    vConv.Dataset := aDataset;
    vConv.UpdateDataSet(JObj);
  finally
    vConv.Free;
    JObj.Free;
  end;
end;

procedure TFrMunicipios.RzDialogButtons1ClickOk(Sender: TObject);
begin
   if txtMunicipio.Text = EmptyStr then
   begin
      Application.MessageBox('Informe o município.','TechCore-ERP',mb_IconWarning or mb_ok);
      txtMunicipio.SetFocus;
      Exit;
   end;

   Self.ModalResult := mrOk;
end;

procedure TFrMunicipios.cbUFClick(Sender: TObject);
var
   Str : String;
begin

   IdHTTP1.Request.Accept              := 'text/javascript';
   IdHTTP1.Request.ContentType         := 'application/json';
   IdHTTP1.Request.ContentEncoding     := 'utf-8';
   IdHTTP1.Request.BasicAuthentication := True;
   Str := IdHTTP1.Get('https://servicodados.ibge.gov.br/api/v1/localidades/estados/' + cbUF.Value + '/municipios');
   JsonToDataset(Query,Str);

   Query.Open;

end;

end.
