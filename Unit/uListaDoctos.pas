unit uListaDoctos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, JvDBControls,
  Vcl.ExtCtrls, RzPanel, RzDlgBtn, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrListaDoctos = class(TForm)
    JvDBGrid1: TJvDBGrid;
    RzDialogButtons1: TRzDialogButtons;
    JvDBNavigator1: TJvDBNavigator;
    QueryDoctos: TFDQuery;
    IntegerField1: TIntegerField;
    QueryID_C000800: TIntegerField;
    QueryUF: TIntegerField;
    QueryMD_COD_MUNICIPIO: TStringField;
    QueryMD_DESC_MUNICIPIO: TStringField;
    QueryMD_CHAVE_DOC: TStringField;
    dsDoctos: TDataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrListaDoctos: TFrListaDoctos;

implementation

{$R *.dfm}

uses uMain;

procedure TFrListaDoctos.FormShow(Sender: TObject);
begin
   // Carrega os documentos vinculados
   QueryDoctos.Open();
end;

end.
