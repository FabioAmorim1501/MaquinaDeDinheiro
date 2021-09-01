unit untMaquinaDeDinheiro;

interface

uses Classes;

type
  IMaquina = interface
    ['{214BF960-EAF5-41C2-91D5-0E8F401D65A3}']
    function MontarTroco(Troco: Double): TList;
  end;

  TCedula = (ceNota100, ceNota50, ceNota20, ceNota10, ceNota5, ceNota2, ceMoeda100, ceMoeda50, ceMoeda25, ceMoeda10,
    ceMoeda5, ceMoeda1);

  TTroco = class
  private
    FTipo: TCedula;
    FQuantidade: Integer;
  public
    constructor Create(Tipo: TCedula; Quantidade: Integer);
    function GetTipo: TCedula;
    function GetQuantidade: Integer;
    procedure SetQuantidade(Quantidade: Integer);
  end;

  TMaquinaDinheiro = class(TInterfacedObject, IMaquina)
    function MontarTroco(Troco: Double): TList;
  end;

implementation

uses
  SysUtils;

{ TTroco }

constructor TTroco.Create(Tipo: TCedula; Quantidade: Integer);
begin
  inherited Create();
  FTipo := Tipo;
  FQuantidade := Quantidade;
end;

function TTroco.GetQuantidade: Integer;
begin
  Result := FQuantidade;
end;

function TTroco.GetTipo: TCedula;
begin
  Result := FTipo;
end;

procedure TTroco.SetQuantidade(Quantidade: Integer);
begin
  FQuantidade := Quantidade;
end;

{ TMaquinaDinheiro }

function TMaquinaDinheiro.MontarTroco(Troco: Double): TList;
var
  ListaTroco: TList;
  ValorTrocoRestante: Double;
begin
  if Troco < 0 then
  begin
    raise Exception.Create('O troco não deve ser negativo, verificar chamada do método MontarTroco!');
  end;
  ValorTrocoRestante := Troco;
  ListaTroco := TList.Create;

  if ValorTrocoRestante >= 100 then
  begin
    ListaTroco.Add(TTroco.Create(ceNota100, Round(ValorTrocoRestante) div 100));
    ValorTrocoRestante := (Round(ValorTrocoRestante * 100) mod 10000) / 100;
  end;
  if ValorTrocoRestante >= 50 then
  begin
    ListaTroco.Add(TTroco.Create(ceNota50, Round(ValorTrocoRestante) div 50));
    ValorTrocoRestante := (Round(ValorTrocoRestante * 100) mod 5000) / 100;
  end;
  if ValorTrocoRestante >= 20 then
  begin
    ListaTroco.Add(TTroco.Create(ceNota20, Round(ValorTrocoRestante) div 20));
    ValorTrocoRestante := (Round(ValorTrocoRestante * 100) mod 2000) / 100;
  end;
  if ValorTrocoRestante >= 10 then
  begin
    ListaTroco.Add(TTroco.Create(ceNota10, Round(ValorTrocoRestante) div 10));
    ValorTrocoRestante := (Round(ValorTrocoRestante * 100) mod 1000) / 100;
  end;
  if ValorTrocoRestante >= 5 then
  begin
    ListaTroco.Add(TTroco.Create(ceNota5, Round(ValorTrocoRestante) div 5));
    ValorTrocoRestante := (Round(ValorTrocoRestante * 100) mod 500) / 100;
  end;
  if ValorTrocoRestante >= 2 then
  begin
    ListaTroco.Add(TTroco.Create(ceNota2, Round(ValorTrocoRestante) div 2));
    ValorTrocoRestante := (Round(ValorTrocoRestante * 100) mod 200) / 100;
  end;

  ValorTrocoRestante := ValorTrocoRestante * 100; { Converte o valor restante em centavos }
  if ValorTrocoRestante >= 100 then
  begin
    ListaTroco.Add(TTroco.Create(ceMoeda100, Round(ValorTrocoRestante) div 100));
    ValorTrocoRestante := (Round(ValorTrocoRestante * 100) mod 10000) / 100;
  end;
  if ValorTrocoRestante >= 50 then
  begin
    ListaTroco.Add(TTroco.Create(ceMoeda50, Round(ValorTrocoRestante) div 50));
    ValorTrocoRestante := (Round(ValorTrocoRestante * 100) mod 5000) / 100;
  end;
  if ValorTrocoRestante >= 25 then
  begin
    ListaTroco.Add(TTroco.Create(ceMoeda25, Round(ValorTrocoRestante) div 25));
    ValorTrocoRestante := (Round(ValorTrocoRestante * 100) mod 2500) / 100;
  end;
  if ValorTrocoRestante >= 10 then
  begin
    ListaTroco.Add(TTroco.Create(ceMoeda10, Round(ValorTrocoRestante) div 10));
    ValorTrocoRestante := (Round(ValorTrocoRestante * 100) mod 1000) / 100;
  end;
  if ValorTrocoRestante >= 5 then
  begin
    ListaTroco.Add(TTroco.Create(ceMoeda5, Round(ValorTrocoRestante) div 5));
    ValorTrocoRestante := (Round(ValorTrocoRestante * 100) mod 500) / 100;
  end;
  if ValorTrocoRestante >= 1 then
  begin
    ListaTroco.Add(TTroco.Create(ceMoeda1, Round(ValorTrocoRestante) div 1));
  end;
  Result := ListaTroco;
end;

end.
