object frmMaquinaDeDinheiro: TfrmMaquinaDeDinheiro
  Left = 0
  Top = 0
  Margins.Left = 0
  Margins.Top = 0
  Margins.Right = 0
  Margins.Bottom = 0
  Caption = 'frmMaquinaDeDinheiro'
  ClientHeight = 448
  ClientWidth = 376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 19
  object mmoResultado: TMemo
    AlignWithMargins = True
    Left = 5
    Top = 41
    Width = 366
    Height = 402
    Margins.Left = 5
    Margins.Top = 0
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object pnlFundo: TPanel
    AlignWithMargins = True
    Left = 5
    Top = 5
    Width = 366
    Height = 36
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object edtValor: TNumberBox
      AlignWithMargins = True
      Left = 1
      Top = 1
      Width = 177
      Height = 31
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 4
      Align = alLeft
      Alignment = taRightJustify
      Mode = nbmCurrency
      TabOrder = 0
      SpinButtonOptions.ButtonWidth = 21
      UseUpDownKeys = False
      OnKeyDown = edtValorKeyDown
      ExplicitHeight = 27
    end
    object btnCalcularTroco: TButton
      AlignWithMargins = True
      Left = 181
      Top = 0
      Width = 185
      Height = 33
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Align = alRight
      Caption = 'Calcular Troco'
      TabOrder = 1
      OnClick = btnCalcularTrocoClick
      ExplicitHeight = 34
    end
  end
end
