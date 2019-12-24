unit uPercurso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, RzPanel, RzDlgBtn,
  Vcl.StdCtrls, RzCmboBx, RzDBCmbo;

type
  TFrPercurso = class(TForm)
    GroupBox1: TGroupBox;
    cbUfFinal: TRzDBComboBox;
    RzDialogButtons1: TRzDialogButtons;
    procedure RzDialogButtons1ClickOk(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrPercurso: TFrPercurso;

implementation

{$R *.dfm}

uses uCabecalho;

procedure TFrPercurso.RzDialogButtons1ClickOk(Sender: TObject);
begin
   if cbUfFinal.ItemIndex < 0 then
   begin
      Application.MessageBox('Informe a UF de percurso.','TechCore-RTG',mb_IconWarning or mb_ok);
      cbUfFinal.SetFocus;
      Exit;
   end;

   Self.ModalResult := mrOk;
end;

end.
