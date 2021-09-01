program ProjetoMaquinaDeDinheiro;

uses
  Vcl.Forms,
  untFormMaquinaDeDinheiro in 'untFormMaquinaDeDinheiro.pas' {frmMaquinaDeDinheiro},
  untMaquinaDeDinheiro in 'untMaquinaDeDinheiro.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMaquinaDeDinheiro, frmMaquinaDeDinheiro);
  Application.Run;
end.
