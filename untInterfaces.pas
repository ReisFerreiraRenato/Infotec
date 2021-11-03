unit untInterfaces;

interface
  //Interfaces baseadas em micro serviços
  type
    IAdicionarCliente = Interface
   ['{17F2FC17-275B-41CE-825B-5FD515B1CF0C}']
      function ADD(prmNomeCliente, prmEndereco, prmDataNascimento, prmDataCadastro: String; prmCriarDM: Boolean = False): Boolean;
    End;
  type
    IAdicionarProdutoVenda = Interface
    ['{15160C1C-A9A9-4526-810B-30F130024613}']
      function ADD(prmProduto: String; prmIDVenda: Integer; prmQuantidade: Double; prmCriarDM: Boolean = False):Boolean;
    End;
  type
    IAdicionarProdutoVendaPorCodBarras = Interface
    ['{DD0BA3DA-1AB8-418D-B4B0-4539D9DADD0C}']
      function ADD(prmCodBarras: String; prmIDVenda: Integer; prmQuantidade: Double; prmCriarDM: Boolean = False): Boolean;
    End;
  type
    IAdicionarProdutoVendaPorID = Interface
    ['{DF5CC313-30A3-4903-BDE8-0506E347F65C}']
      function ADD(prmIDProduto, prmIDVenda: Integer; prmQuantidade, prmValorUnitario: Double; prmCriarDM: Boolean = False): Boolean;
    End;

  type
    IAtualizarTotaisVenda = Interface
    ['{D6547DEC-600B-4F60-B616-CA4A66AC5DEB}']
      function Atualizar(prmIdVenda: Integer; prmCriarDM: Boolean = False ): Boolean;
    End;

  type
    IBuscarClienteNome = Interface
    ['{E97FBD70-DA01-4BD0-BA5E-1CE658B32BC5}']
      function Buscar(prmNome: String; prmCriarDM: Boolean = false): Boolean;
    End;

  type
    ICancelarVenda = Interface
    ['{EB58AB1D-0926-46EF-A315-E9998E6EC669}']
      function Cancelar(prmIDVenda: Integer; prmCriarDM: Boolean = False): Boolean;
    End;
  type
    ICodigoBarraExistente = Interface
    ['{2864EF84-BFC9-4EE0-8A90-3B9AAC4B0AC3}']
      function Existe(prmCodigo: String; prmCriarDM: Boolean = False): Boolean;
    End;
  type
    IConfiguracoesShowfrmPrincipal = interface
    ['{FDCA0DCC-FC24-4343-84E4-293C90C6BAAD}']
      function Iniciar(prmIDNovaVenda: Integer; prmCriarDM: Boolean = False): Integer;
    end;
  type
    IConsultarItensFrmShow = interface
    ['{CE247987-1984-486C-8F79-AC090796CE9D}']
      function Iniciar(prmIDVendaIniciada: String; prmCriarDM: Boolean = False): Boolean;
    end;
  type
    //Consultar vendas por data e/ou numeroVenda
    IConsultarVendas = interface
    ['{96DE5C6F-9B0A-41FD-98DF-480E4DD0378F}']
      function Consultar(prmData, prmNumeroVenda: String; prmCriarDM: Boolean = False): Boolean;
    end;
  type
    IFinalizarVenda = interface
    ['{6C078B66-3B55-437A-9632-6BF2130D297A}']
      function Finalizar(prmIDVenda, prmIDCliente: Integer; prmCriarDM: Boolean = False): Boolean;
    end;
  type
    IIniciarNovaVenda = interface
    ['{093B9518-A32C-44D1-8532-9722AB1CF5AF}']
      function Iniciar(prmCriarDM: Boolean = False): Integer;
    end;
  type
    ISalvarNovoProduto = interface
    ['{74244CCD-34AF-4C7E-BF0E-1CE2A09AF89B}']
      function Salvar(prmNomeProduto, prmDataCadastro, prmDataAtualizacao,
          prmPrecoUnitario, prmValCompra, prmCodBarras: String; prmCriarDM: Boolean = False): Boolean;
    end;
  type
    //Interface de microserviço para verificar se tem venda iniciada
    IVendaIniciada = interface
    ['{50369D10-6092-4CFF-B1DB-07E353A89104}']
      function Iniciada(prmIDVendaIniciada: integer; prmCriarDM: Boolean = False): Boolean;
    end;

implementation

uses frmDataModulo;

end.
