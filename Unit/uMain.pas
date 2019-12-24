unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.ExtCtrls, RzPanel, RzDlgBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Vcl.Mask, RzEdit,
  RzDBEdit, JvExStdCtrls, JvCombobox, JvDBSearchComboBox,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvExMask, JvToolEdit,
  Vcl.Menus, System.Actions, Vcl.ActnList;

type
  TFrPrincipal = class(TForm)
    JvDBGrid1: TJvDBGrid;
    Query: TFDQuery;
    dsQuery: TDataSource;
    GroupBox1: TGroupBox;
    cbEmitente: TJvDBSearchComboBox;
    RzDBEdit13: TRzDBEdit;
    RzDBEdit14: TRzDBEdit;
    DataIni: TJvDateEdit;
    Datafim: TJvDateEdit;
    Button1: TButton;
    QueryEmitente: TFDQuery;
    QueryEmitenteID: TFDAutoIncField;
    QueryEmitenteEMP_RAZAO: TStringField;
    QueryEmitenteEMP_CNPJ: TStringField;
    QueryEmitenteEMP_UF: TStringField;
    dsEmitente: TDataSource;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Novo1: TMenuItem;
    Alterar1: TMenuItem;
    AlterarCabealho1: TMenuItem;
    AlterarDocumentos1: TMenuItem;
    Excluir1: TMenuItem;
    Excluir2: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    QueryID: TIntegerField;
    QueryID_EMP: TIntegerField;
    QueryMD_TIP_AMBIENTE: TIntegerField;
    QueryMD_TIP_TRANSPORTADOR: TIntegerField;
    QueryMD_MODELO: TIntegerField;
    QueryMD_SERIE: TIntegerField;
    QueryMD_NUMERO: TIntegerField;
    QueryMD_COD_SEGURANCA: TStringField;
    QueryMD_COD_DIVISOR: TIntegerField;
    QueryMD_TIP_MODAL: TIntegerField;
    QueryMD_DH_EMISSAO: TSQLTimeStampField;
    QueryMD_DH_INICIO_VIAGEM: TSQLTimeStampField;
    QueryMD_TIP_EMISSAO: TIntegerField;
    QueryMD_TIP_APLICATIVO: TIntegerField;
    QueryMD_VER_APLICATIVO: TStringField;
    QueryMD_UF_INICIAL: TStringField;
    QueryMD_UF_FINAL: TStringField;
    QueryMD_STATUS: TIntegerField;
    QueryMD_VLR_CARGA: TFMTBCDField;
    QueryMD_COD_UNIDADE: TIntegerField;
    QueryMD_QTD_CARGA: TBCDField;
    QueryMD_INF_COMPLEMENTARES: TStringField;
    QueryMD_SEF_CSTAT: TIntegerField;
    QueryMD_INF_FISCO: TStringField;
    QueryMD_SEF_RECIBO: TStringField;
    QueryMD_SEF_PROTOCOLO: TStringField;
    QueryMD_SEF_CHAVE: TStringField;
    QueryMD_SEF_XML: TMemoField;
    QueryMD_SEF_CAN_CHAVE: TStringField;
    QueryMD_SEF_CAN_XML: TMemoField;
    QueryMD_SEF_CAN_RECIBO: TStringField;
    QueryMD_SEF_CAN_PROTOCOLO: TStringField;
    QueryMD_TIP_EMITENTE: TIntegerField;
    QueryMD_COD_MUNICIPIO: TStringField;
    QueryMD_NOM_MUNICIPIO: TStringField;
    DadosdoVeculo1: TMenuItem;
    RzPanel1: TRzPanel;
    Button2: TButton;
    Button3: TButton;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Button4: TButton;
    Action5: TAction;
    Button5: TButton;
    Action4: TAction;
    Button6: TButton;
    procedure FormShow(Sender: TObject);
    procedure QueryNewRecord(DataSet: TDataSet);
    procedure QueryMD_STATUSGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure AlterarDocumentos1Click(Sender: TObject);
    procedure Novo1Click(Sender: TObject);
    procedure AlterarCabealho1Click(Sender: TObject);
    procedure DadosdoVeculo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrPrincipal: TFrPrincipal;

implementation

{$R *.dfm}

uses uModulo, uCabecalho, uListaDoctos, uDoctos, uChavesNFe,
  uVeiculoTracao;

procedure TFrPrincipal.AlterarCabealho1Click(Sender: TObject);
begin
   Query.Edit;

   FrCabecalho := TFrCabecalho.Create(self);
   try
      if FrCabecalho.ShowModal = mrOk then
         Query.Post
      else
         Query.Cancel
   finally
      FreeAndNil(FrCabecalho);
   end;
end;

procedure TFrPrincipal.AlterarDocumentos1Click(Sender: TObject);
begin
   FrDoctos := TFrDoctos.Create(self);
   try
      FrDoctos.ShowModal;
   finally
      FreeAndNil(FrDoctos);
   end;
end;

procedure TFrPrincipal.DadosdoVeculo1Click(Sender: TObject);
begin
   FrVeiculoTracao := TFrVeiculoTracao.Create(self);
   try
      FrVeiculoTracao.ShowModal;
   finally
      FreeAndNil(FrVeiculoTracao);
   end;
end;

procedure TFrPrincipal.FormShow(Sender: TObject);
begin
   // Carrega os emitentes
   with QueryEmitente do
   begin
      Close;
      SQL.Clear;
      SQL.Add('select * from c000501 where emp_status = 1');
      Open();
   end;

   // Ajusta so campos de datas
   DataIni.Date := Date;
   DataFim.Date := Date;

   // Carrega os mdfes emitidos para a empresa
   with Query do
   begin
      Close;
      SQL.Clear;
      SQL.Add('select * from c000700 where id_emp = :id_emp and cast(md_dh_emissao as date) between :a_data and :b_data order by id');
      ParamByName('id_emp').AsInteger := QueryEmitente.FieldByName('id').AsInteger;
      ParamByName('a_data').AsDate    := DataIni.Date;
      ParamByName('b_data').AsDate    := DataFim.Date;
      Open();
   end;

end;

procedure TFrPrincipal.Novo1Click(Sender: TObject);
begin
   Query.Insert;

   FrCabecalho := TFrCabecalho.Create(self);
   try
      if FrCabecalho.ShowModal = mrOk then
         Query.Post
      else
         Query.Cancel;
   finally
      FreeAndNil(FrCabecalho);
   end;
end;

procedure TFrPrincipal.QueryMD_STATUSGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if (DisplayText) and not(Query.IsEmpty) then
   begin
      case Sender.AsInteger of
         0 : Text := 'Em Digitação';
         1 : Text := 'Enviada';
         2 : Text := 'Autorizada';
         3 : Text := 'Cancelada';
         4 : Text := 'Finalizada';
      end;
   end;
end;

procedure TFrPrincipal.QueryNewRecord(DataSet: TDataSet);
begin
   DataSet.FieldByName('id_emp').AsInteger               := QueryEmitente.FieldByName('id').AsInteger;
   DataSet.FieldByName('md_dh_emissao').AsDateTime       := Now;
   DataSet.FieldByName('md_dh_inicio_viagem').AsDateTime := Now;
   DataSet.FieldByName('md_modelo').AsInteger            := 58;
   DataSet.FieldByName('md_serie').AsInteger             := 1;
   DataSet.FieldByName('md_tip_ambiente').AsInteger      := 0;
   DataSet.FieldByName('md_tip_emissao').AsInteger       := 0;
   DataSet.FieldByName('md_tip_emitente').AsInteger      := 1;
   DataSet.FieldByName('md_tip_modal').AsInteger         := 0;
   DataSet.FieldByName('md_tip_transportador').AsInteger := 0;
   DataSet.FieldByName('md_cod_unidade').AsInteger       := 0;
   DataSet.FieldByName('md_tip_aplicativo').AsInteger    := 1;
   DataSet.FieldByName('md_ver_aplicativo').AsString     := '1.0';
end;

end.
