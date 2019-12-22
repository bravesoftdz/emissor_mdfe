unit uVeiculoTracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, RzPanel, RzDlgBtn,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.DBCtrls, JvDBControls, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, RzDBEdit, RzCmboBx, RzDBCmbo, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.ComCtrls, JvExMask, JvToolEdit, JvBaseEdits;

type
  TFrVeiculoTracao = class(TForm)
    pgControl: TPageControl;
    tabVeiculos: TTabSheet;
    tabDetalhes: TTabSheet;
    JvDBGrid1: TJvDBGrid;
    GroupBox4: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    cbUfVeiculo: TRzDBComboBox;
    cbCarroceria: TRzDBComboBox;
    txtPlaca: TRzDBEdit;
    cbTipoRodado: TRzDBComboBox;
    Query: TFDQuery;
    dsQuery: TDataSource;
    QueryID: TIntegerField;
    QueryID_C000700: TIntegerField;
    QueryMD_VEIC_PLACA: TStringField;
    QueryMD_VEIC_RENAVAM: TStringField;
    QueryMD_TARA: TIntegerField;
    QueryMD_CAP_KL: TIntegerField;
    QueryMD_CAP_M3: TIntegerField;
    QueryMD_TIP_ROD: TIntegerField;
    QueryMD_TIPO_CARRO: TIntegerField;
    QueryMD_UF: TStringField;
    txtTara: TJvDBCalcEdit;
    RzPanel1: TRzPanel;
    JvDBNavigator1: TJvDBNavigator;
    btnClose: TButton;
    btnMotoristas: TButton;
    procedure FormShow(Sender: TObject);
    procedure dsQueryStateChange(Sender: TObject);
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure pgControlChanging(Sender: TObject; var AllowChange: Boolean);
    procedure QueryMD_TIPO_CARROGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure QueryMD_TIP_RODGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnCloseClick(Sender: TObject);
    procedure QueryBeforeDelete(DataSet: TDataSet);
    procedure btnMotoristasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrVeiculoTracao: TFrVeiculoTracao;

implementation

{$R *.dfm}

uses uModulo, uMain, uMotorista;

procedure TFrVeiculoTracao.btnCloseClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFrVeiculoTracao.btnMotoristasClick(Sender: TObject);
begin
   FrMotoristas := TFrMotoristas.Create(self);
   try
      FrMotoristas.ShowModal;
   finally
      FreeAndNil(FrMotoristas);
   end;
end;

procedure TFrVeiculoTracao.dsQueryStateChange(Sender: TObject);
begin
   btnMotoristas.Enabled := not (Query.State in [dsInsert,dsEdit]);

   if Query.State in [dsInsert,dsEdit] then
      pgControl.ActivePage := tabDetalhes
   else
      pgControl.ActivePage := tabVeiculos;
end;

procedure TFrVeiculoTracao.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if Query.State in [dsInsert,dsEdit] then
      CanClose := Application.MessageBox('Deseja sair sem salvar os dados informados?','TechCore-RTG',mb_IconQuestion or mb_YesNo) = mrYes
end;

procedure TFrVeiculoTracao.FormShow(Sender: TObject);
begin
   pgControl.ActivePage := tabVeiculos;
   Query.Open();
end;

procedure TFrVeiculoTracao.pgControlChanging(Sender: TObject; var AllowChange: Boolean);
begin
   AllowChange := Query.State in [dsInsert,dsEdit];
end;

procedure TFrVeiculoTracao.QueryBeforeDelete(DataSet: TDataSet);
begin
   if Application.MessageBox('Tem certeza que deseja excluir este registro?','TechCore-RTG',mb_IconQuestion or mb_YesNo) = mrNo then
      Abort;
end;

procedure TFrVeiculoTracao.QueryBeforePost(DataSet: TDataSet);
begin
   if cbUfVeiculo.ItemIndex < 0 then
   begin
      Application.MessageBox('Informe a UF do veículo','TechCore-RTG',mb_IconWarning or mb_ok);
      cbUfVeiculo.SetFocus;
      Abort;
   end;

   if txtPlaca.Text = EmptyStr then
   begin
      Application.MessageBox('Informe a Placa do veículo','TechCore-RTG',mb_IconWarning or mb_ok);
      txtPlaca.SetFocus;
      Abort;
   end;

   if cbCarroceria.ItemIndex < 0 then
   begin
      Application.MessageBox('Informe o Tipo de Carroceria do veículo','TechCore-RTG',mb_IconWarning or mb_ok);
      cbCarroceria.SetFocus;
      Abort;
   end;

   if cbTipoRodado.ItemIndex < 0 then
   begin
      Application.MessageBox('Informe o Tipo de Rodado do veículo','TechCore-RTG',mb_IconWarning or mb_ok);
      cbTipoRodado.SetFocus;
      Abort;
   end;

   if txtTara.AsInteger <= 0.00 then
   begin
      Application.MessageBox('Informe a Tara do veículo','TechCore-RTG',mb_IconWarning or mb_ok);
      txtTara.SetFocus;
      Abort;
   end;

end;

procedure TFrVeiculoTracao.QueryMD_TIPO_CARROGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if not (Query.IsEmpty) then
   begin
      if DisplayText then
      begin
         case Sender.AsInteger of
            0 : Text := 'Não Aplicavel';
            1 : Text := 'Aberta';
            2 : Text := 'Fechada/Baú';
            3 : Text := 'Graneleira';
            4 : Text := 'PortaContêiner';
            5 : Text := 'Sider';
         end;
      end;
   end;
end;

procedure TFrVeiculoTracao.QueryMD_TIP_RODGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if not (Query.IsEmpty) then
   begin
      if DisplayText then
      begin
         case Sender.AsInteger of
            0 : Text := 'Não Aplicavel';
            1 : Text := 'Truck';
            2 : Text := 'Toco';
            3 : Text := 'Cavalo Mecânico';
            4 : Text := 'Van';
            5 : Text := 'Utilitário';
            6 : Text := 'Outros';
         end;
      end;
   end;
end;

end.
