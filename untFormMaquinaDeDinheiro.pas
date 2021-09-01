unit untFormMaquinaDeDinheiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics, System.Math, System.StrUtils, TypInfo,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.NumberBox, untMaquinaDeDinheiro, Vcl.ExtCtrls;

type
  TfrmMaquinaDeDinheiro = class(TForm)
    mmoResultado: TMemo;
    pnlFundo: TPanel;
    edtValor: TNumberBox;
    btnCalcularTroco: TButton;
    procedure btnCalcularTrocoClick(Sender: TObject);
    procedure edtValorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure CalcularTroco;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMaquinaDeDinheiro: TfrmMaquinaDeDinheiro;

implementation

uses
  System.SysUtils;

{$R *.dfm}

procedure TfrmMaquinaDeDinheiro.btnCalcularTrocoClick(Sender: TObject);
begin
  CalcularTroco;
end;

procedure TfrmMaquinaDeDinheiro.CalcularTroco;
var
  ValorTroco: Double;
  ListraTroco: TList;
  Troco: TTroco;
  Maquina: TMaquinaDinheiro;
  Saida: TStrings;
  Tipo: TCedula;
  Quantidade: Integer;
  Linha, StrTipo, StrEnum, StrValor: String;
  IsMoeda, IsPlural: Boolean;
begin
  ValorTroco := edtValor.ValueFloat;
  Maquina := TMaquinaDinheiro.Create;
  ListraTroco := TList.Create;
  Saida := TStringList.Create;
  try
    ListraTroco := Maquina.MontarTroco(ValorTroco);
    Saida.BeginUpdate;
    for Troco in ListraTroco do
    begin
      Tipo := Troco.GetTipo;
      Quantidade := Troco.GetQuantidade;
      IsMoeda := Tipo in [ceMoeda100, ceMoeda50, ceMoeda25, ceMoeda10, ceMoeda5, ceMoeda1];
      IsPlural := Quantidade > 1;
      StrTipo := IfThen(IsMoeda, 'moeda', 'nota');
      StrEnum := GetEnumName(TypeInfo(TCedula), Ord(Tipo));
      if (IsMoeda) then
        StrValor := (StrToInt(StrEnum.Substring(7))/100).ToString(ffNumber, 8, 2).Replace(',', '.')
      else
        StrValor := StrEnum.Substring(6);
      Linha := Format('%d %s%s de %s - TTroco(%s, %0:d)'
                     ,[Quantidade
                      ,StrTipo
                      ,IfThen(IsPlural, 's')
                      ,StrValor
                      ,StrEnum]);
      Saida.Add(Linha);
    end;
    Saida.EndUpdate;
    mmoResultado.Lines.Clear;
    mmoResultado.Lines.AddStrings(Saida);
  finally
    Maquina.Free;
    ListraTroco.Free;
    Saida.Free;
  end;
end;

procedure TfrmMaquinaDeDinheiro.edtValorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    CalcularTroco;
  end;
end;

end.
