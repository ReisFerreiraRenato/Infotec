object frmCadastrarProdutos: TfrmCadastrarProdutos
  Left = 0
  Top = 0
  Caption = 'Cadastrar Produto'
  ClientHeight = 287
  ClientWidth = 465
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial]'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label2: TLabel
    Left = 24
    Top = 16
    Width = 79
    Height = 16
    Caption = 'NomeProduto'
  end
  object Label3: TLabel
    Left = 24
    Top = 66
    Width = 79
    Height = 16
    Caption = 'DataCadastro'
  end
  object Label4: TLabel
    Left = 337
    Top = 66
    Width = 78
    Height = 16
    Caption = 'PrecoUnitario'
  end
  object Label5: TLabel
    Left = 184
    Top = 66
    Width = 95
    Height = 16
    Caption = 'DataAtualizacao'
  end
  object Label6: TLabel
    Left = 24
    Top = 118
    Width = 63
    Height = 16
    Caption = 'ValCompra'
  end
  object Label7: TLabel
    Left = 184
    Top = 118
    Width = 61
    Height = 16
    Caption = 'CodBarras'
  end
  object edNomeProduto: TEdit
    Left = 24
    Top = 38
    Width = 418
    Height = 24
    TabOrder = 0
  end
  object edValCompra: TEdit
    Left = 24
    Top = 140
    Width = 121
    Height = 24
    TabOrder = 2
    OnExit = edValCompraExit
  end
  object edCodBarras: TEdit
    Left = 183
    Top = 140
    Width = 259
    Height = 24
    TabOrder = 3
    OnExit = edCodBarrasExit
  end
  object btnNovo: TBitBtn
    Left = 24
    Top = 228
    Width = 100
    Height = 35
    Caption = '&Novo'
    TabOrder = 4
    OnClick = btnNovoClick
  end
  object btnCancelar: TBitBtn
    Left = 236
    Top = 228
    Width = 100
    Height = 35
    Caption = '&Cancelar'
    Enabled = False
    TabOrder = 6
    OnClick = btnCancelarClick
  end
  object btnSalvar: TBitBtn
    Left = 130
    Top = 228
    Width = 100
    Height = 35
    Caption = '&Salvar'
    Enabled = False
    TabOrder = 5
    OnClick = btnSalvarClick
  end
  object btnSair: TBitBtn
    Left = 342
    Top = 228
    Width = 100
    Height = 35
    Caption = 'Sai&r'
    TabOrder = 7
    OnClick = btnSairClick
  end
  object edDataCadastro: TMaskEdit
    Left = 24
    Top = 88
    Width = 120
    Height = 24
    Enabled = False
    EditMask = '!99/99/00;1;_'
    MaxLength = 8
    TabOrder = 8
    Text = '  /  /  '
  end
  object edDataAtualizacao: TMaskEdit
    Left = 184
    Top = 88
    Width = 120
    Height = 24
    Enabled = False
    EditMask = '!99/99/00;1;_'
    MaxLength = 8
    TabOrder = 9
    Text = '  /  /  '
  end
  object edPrecoUnitario: TMaskEdit
    Left = 337
    Top = 88
    Width = 105
    Height = 24
    TabOrder = 1
    Text = ''
    OnExit = edPrecoUnitarioExit
  end
end
