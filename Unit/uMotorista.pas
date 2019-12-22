unit uMotorista;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  Vcl.Mask, RzEdit, RzDBEdit, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, Vcl.ComCtrls, Vcl.ExtCtrls, RzPanel, RzDlgBtn, ACBrBase, ACBRutil,
  ACBrValidador, Vcl.DBCtrls, JvDBControls;

type
  TFrMotoristas = class(TForm)
    RzDialogButtons1: TRzDialogButtons;
    pgControl: TPageControl;
    tabVeiculos: TTabSheet;
    JvDBGrid1: TJvDBGrid;
    tabDetalhes: TTabSheet;
    GroupBox4: TGroupBox;
    Label16: TLabel;
    txtCpf: TRzDBEdit;
    txtNome: TRzDBEdit;
    Label1: TLabel;
    Query: TFDQuery;
    dsQuery: TDataSource;
    QueryID: TIntegerField;
    QueryID_C000703: TIntegerField;
    QueryMD_CONDUTOR_CPF: TStringField;
    QueryMD_CONDUTOR_NOME: TStringField;
    ChecDoc: TACBrValidador;
    JvDBNavigator1: TJvDBNavigator;
    procedure txtCpfExit(Sender: TObject);
    procedure QueryBeforeDelete(DataSet: TDataSet);
    procedure pgControlChanging(Sender: TObject; var AllowChange: Boolean);
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure dsQueryStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrMotoristas: TFrMotoristas;

implementation

{$R *.dfm}

uses uModulo;

procedure TFrMotoristas.dsQueryStateChange(Sender: TObject);
begin
   if Query.State in [dsInsert,dsEdit] then
      pgControl.ActivePage := tabDetalhes
   else
      pgControl.ActivePage := tabVeiculos;
end;

procedure TFrMotoristas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if Query.State in [dsInsert,dsEdit] then
      CanClose := Application.MessageBox('Deseja sair sem salvar os dados informados?','TechCore-RTG',mb_IconQuestion or mb_YesNo) = mrYes
end;

procedure TFrMotoristas.FormShow(Sender: TObject);
begin
   Query.Open();
end;

procedure TFrMotoristas.pgControlChanging(Sender: TObject; var AllowChange: Boolean);
begin
   AllowChange := Query.State in [dsInsert,dsEdit];
end;

procedure TFrMotoristas.QueryBeforeDelete(DataSet: TDataSet);
begin
   if Application.MessageBox('Tem certeza que deseja excluir este registro?','TechCore-RTG',mb_IconWarning or mb_YesNo) = mrNo then
      Abort;
end;

procedure TFrMotoristas.QueryBeforePost(DataSet: TDataSet);
begin
   if OnlyNumber(txtCpf.Text) = EmptyStr then
   begin
      Application.MessageBox('Informe o número do CPF do motorista.','TechCore-RTG',mb_IconWarning or mb_ok);
      txtCpf.SetFocus;
      Abort;
   end;

   if OnlyNumber(txtCpf.Text) = EmptyStr then
   begin
      Application.MessageBox('Informe o Nome do motorista.','TechCore-RTG',mb_IconWarning or mb_ok);
      txtNome.SetFocus;
      Abort;
   end;
end;

procedure TFrMotoristas.txtCpfExit(Sender: TObject);
begin
   ChecDoc.Documento := txtCpf.Text;
   if not ChecDoc.Validar then
   begin
      Application.MessageBox('O CPF informado não é válido.','TechCore-RTG',mb_IconWarning or mb_ok);
      txtCpf.Text := EmptyStr;
      txtCpf.SetFocus;
   end;
end;

end.
