unit uModulo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, Vcl.Controls, Vcl.Forms,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, WinApi.Windows,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Stan.StorageBin,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB;

type
  TModulo = class(TDataModule)
    DBConexao: TFDConnection;
    QueryParams: TFDMemTable;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Modulo: TModulo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TModulo.DataModuleCreate(Sender: TObject);
begin
   // Conecta a base de dados do sistema
   if not FileExists('ConfigServidores.dat') then
   begin
      Application.MessageBox('Se este for seu primeiro acesso, é necessário configurar o acesso ao servidor do sistema.','TechCore-RTG',mb_IconWarning or mb_OK);
      Application.Terminate;
      Abort;
   end;

   // Se o arquivo existe, verifica se existem servidores cadastrados
   QueryParams := TFDMemTable.Create(Application);
   QueryParams.LoadFromFile('ConfigServidores.dat');
   QueryParams.Open;

   // Checa se a tabela esta vazia
   if QueryParams.IsEmpty then
   begin
      Application.MessageBox('Não foram encontrados servidores configurados no arquivo de parâmetros.','TechCore-RTG',mb_IconWarning or mb_OK);
      Application.Terminate;
      Abort;
   end;

   // Conecta no banco de dados
   try
      With DBConexao do
      begin
         Params.Clear;
         Params.Values['DriverID']  := 'FB';
         Params.Values['Server']    := QueryParams.FieldByName('con_endereco').AsString;
         Params.Values['Port']      := QueryParams.FieldByName('con_porta').AsString;
         Params.Values['Protocol']  := QueryParams.FieldByName('con_protocolo').AsString;
         Params.Values['Database']  := QueryParams.FieldByName('con_database').AsString;
         Params.Values['User_name'] := QueryParams.FieldByName('con_usuario').AsString;;
         Params.Values['Password']  := QueryParams.FieldByName('con_senha').AsString;;
         Connected := True;
      end;

   Except
      on e:exception do
      begin
         Application.MessageBox(pChar('Erro ao conectar no banco de dados do sistema!'#13#10 + E.Message),'Techcore-RTG', mb_IconStop or mb_OK);
         Application.Terminate;
      end;
   end;

   // Desconecta os parametros
   QueryParams.Close;
end;

end.
