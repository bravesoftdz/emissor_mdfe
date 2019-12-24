unit uCabecalho;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls,
  RzDBEdit, JvExMask, JvToolEdit, JvBaseEdits, JvDBControls, RzCmboBx,
  RzDBCmbo, Vcl.Mask, RzEdit, Vcl.ExtCtrls, RzPanel, RzDlgBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, RzDBBnEd, Vcl.ComCtrls, JvExComCtrls,
  JvDateTimePicker, JvDBDateTimePicker, RzDTP, RzDBDTP, Vcl.AppEvnts,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid;

type
  TFrCabecalho = class(TForm)
    txtModelo: TRzDBEdit;
    txtSerie: TRzDBEdit;
    txtNumero: TRzDBEdit;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    cbTipoAmbiente: TRzDBComboBox;
    Label5: TLabel;
    Label6: TLabel;
    RzDBComboBox2: TRzDBComboBox;
    cbTipoModal: TRzDBComboBox;
    Label10: TLabel;
    Label9: TLabel;
    cbUfFinal: TRzDBComboBox;
    Label11: TLabel;
    txtValor: TJvDBCalcEdit;
    Label13: TLabel;
    cbUnidade: TRzDBComboBox;
    Label14: TLabel;
    RzDBMemo1: TRzDBMemo;
    RzDBMemo2: TRzDBMemo;
    RzDialogButtons1: TRzDialogButtons;
    Label12: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    dsQuery: TDataSource;
    txtUfCarregamento: TRzDBButtonEdit;
    Label8: TLabel;
    Label17: TLabel;
    cbTipoTransportadorar: TRzDBComboBox;
    txtMunicipio: TRzDBEdit;
    txtDhEmissao: TRzDBEdit;
    txtDhSaida: TRzDBEdit;
    ApplicationEvents1: TApplicationEvents;
    cbPeso: TJvDBCalcEdit;
    JvDBGrid1: TJvDBGrid;
    JvDBNavigator1: TJvDBNavigator;
    Label7: TLabel;
    QueryPerc: TFDQuery;
    dsQueryPerc: TDataSource;
    QueryPercID: TIntegerField;
    QueryPercID_C000700: TIntegerField;
    QueryPercMD_PERCURSO: TStringField;
    procedure RzDialogButtons1ClickOk(Sender: TObject);
    procedure txtUfCarregamentoButtonClick(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure FormShow(Sender: TObject);
    procedure QueryPercAfterInsert(DataSet: TDataSet);
    procedure QueryPercBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrCabecalho: TFrCabecalho;

implementation

{$R *.dfm}

uses uModulo, uMain, uMunicipios, uPercurso;

procedure TFrCabecalho.ApplicationEvents1Exception(Sender: TObject; E: Exception);
begin
   if Pos('Invalid input value.', e.Message) > 0 then
   begin
      if (txtDhEmissao.Focused) or (txtDhSaida.Focused) then
         Application.MessageBox('Informe a data e hora corretamente ou pressione a tecla ESC para cancelar','TechCore-RTG', mb_IconWarning or mb_ok);
   end;
end;

procedure TFrCabecalho.FormShow(Sender: TObject);
var
   xQuery : TFDQuery;
begin
   xQuery            := TFDQuery.Create(self);
   xQuery.Connection := Modulo.DBConexao;
   try
      xQuery.Close;
      xQuery.SQL.Clear;
      xQuery.SQL.Add('select 1 from c000705 where id_c000700 = :id');
      xQuery.ParamByName('id').AsInteger := dsQuery.DataSet.FieldByName('id').AsInteger;
      xQuery.Open();

      cbUfFinal.Enabled := xQuery.IsEmpty;

   finally
      FreeAndNil(xQuery);
   end;

   // Carrega os percusrsos
   QueryPerc.Open();
end;

procedure TFrCabecalho.QueryPercAfterInsert(DataSet: TDataSet);
begin
   FrPercurso := TFrPercurso.Create(self);
   try
      if FrPercurso.ShowModal = mrOk then
         QueryPerc.Post
      else
         QueryPerc.Cancel;
   finally
      FreeAndNil(FrPercurso);
   end;
end;

procedure TFrCabecalho.QueryPercBeforeDelete(DataSet: TDataSet);
begin
   if Application.MessageBox('Tem certeza que deseja excluir esta UF?','TechCore-RTG',mb_IconQuestion or mb_YesNo) = mrNo then
      Abort;
end;

procedure TFrCabecalho.RzDialogButtons1ClickOk(Sender: TObject);
begin
   if txtUfCarregamento.Text = EmptyStr then
   begin
      Application.MessageBox('Informe o local de Carregamento.','TechCore-RTG',mb_IconWarning or mb_ok);
      txtUfCarregamento.SetFocus;
      Exit;
   end;

   if cbUfFinal.ItemIndex < 0 then
   begin
      Application.MessageBox('Informe a UF de Descarregamento.','TechCore-RTG',mb_IconWarning or mb_ok);
      cbUfFinal.SetFocus;
      Exit;
   end;

   if txtValor.AsInteger <= 0.00 then
   begin
      Application.MessageBox('Informe o Valor da Carga.','TechCore-RTG',mb_IconWarning or mb_ok);
      txtValor.SetFocus;
      Exit;
   end;

   if cbPeso.AsInteger <= 0.00 then
   begin
      Application.MessageBox('Informe o pesoa da Carga.','TechCore-RTG',mb_IconWarning or mb_ok);
      cbPeso.SetFocus;
      Exit;
   end;

   Self.ModalResult := mrOk;

end;

procedure TFrCabecalho.txtUfCarregamentoButtonClick(Sender: TObject);
begin
   FrMunicipios := TFrMunicipios.Create(self);
   try
      if FrMunicipios.ShowModal = mrOk then
      begin
         with dsQuery.DataSet do
         begin
            FieldByName('md_uf_inicial').AsString    := FrMunicipios.cbUF.Text;
            FieldByName('md_nom_municipio').AsString := FrMunicipios.txtMunicipio.Text;
            FieldByName('md_cod_municipio').AsString := FrMunicipios.Query.FieldByName('id').AsString;
         end;
      end;

   finally
      FreeAndNil(FrMunicipios);
   end;
end;

end.
