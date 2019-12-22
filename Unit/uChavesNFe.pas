unit uChavesNFe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Vcl.ExtCtrls, RzPanel, RzDlgBtn, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  Vcl.DBCtrls, JvDBControls;

type
  TFrChavesNFe = class(TForm)
    GridChave: TJvDBGrid;
    Query: TFDQuery;
    dsQuery: TDataSource;
    RzDialogButtons1: TRzDialogButtons;
    QueryID: TIntegerField;
    QueryID_C000705: TIntegerField;
    QueryMD_CHAVE_NFE: TStringField;
    JvDBNavigator1: TJvDBNavigator;
    procedure QueryAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrChavesNFe: TFrChavesNFe;

implementation

{$R *.dfm}

uses uModulo, uDoctos;

procedure TFrChavesNFe.QueryAfterInsert(DataSet: TDataSet);
begin
   GridChave.SetFocus;
end;

procedure TFrChavesNFe.FormShow(Sender: TObject);
begin
   Query.Open();
end;

end.
