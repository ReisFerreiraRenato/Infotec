unit frmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  Tfrm_Principal = class(TForm)
    Panel1: TPanel;
    GridItemVenda: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    Label5: TLabel;
    Label3: TLabel;
    DBEdit5: TDBEdit;
    edValorTotal: TDBEdit;
    Label4: TLabel;
    edQtdItens: TDBEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    lbVendaIniciada: TLabel;
    edProduto: TEdit;
    edQuantidade: TEdit;
    edNomeCliente: TEdit;
    Panel7: TPanel;
    imgSair: TImage;
    imgFinalizarVenda: TImage;
    imgConsultarVenda: TImage;
    imgCliente: TImage;
    imgProduto: TImage;
    imgFecharVenda: TImage;
    imgNovaVenda: TImage;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    lbSair: TLabel;
    lbFinalizarVenda: TLabel;
    Panel11: TPanel;
    lbConsultarVenda: TLabel;
    Panel12: TPanel;
    lbCliente: TLabel;
    Panel13: TPanel;
    lbProdutos: TLabel;
    Panel14: TPanel;
    lbCancelarVenda: TLabel;
    Panel15: TPanel;
    lbNovaVenda: TLabel;
    edNumVenda: TDBEdit;
    lbNumeroVenda: TLabel;
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lbSairClick(Sender: TObject);
    procedure edProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbCancelarVendaClick(Sender: TObject);
    procedure lbNovaVendaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbProdutosClick(Sender: TObject);
    procedure lbClienteClick(Sender: TObject);
    procedure edQuantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbFinalizarVendaClick(Sender: TObject);
    procedure imgNovaVendaClick(Sender: TObject);
    procedure imgFecharVendaClick(Sender: TObject);
    procedure imgProdutoClick(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
    procedure imgFinalizarVendaClick(Sender: TObject);
    procedure imgClienteClick(Sender: TObject);
    procedure lbConsultarVendaClick(Sender: TObject);
    procedure imgConsultarVendaClick(Sender: TObject);
  private
    { Private declarations }
    pvtIDNovaVenda, //ID da venda
    pvtIDCliente: Integer; //ID Cliente

  public
    { Public declarations }
  end;

var
  frm_Principal: Tfrm_Principal;

implementation

{$R *.dfm}

uses Funcoes, frmDataModulo, untInterfaces, untClasses;

procedure Tfrm_Principal.edProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  LocAdicionarProduto: IAdicionarProdutoVenda;
  LocIniciarVenda: IIniciarNovaVenda;
begin
  LocAdicionarProduto := TAdicionarProdutoVenda.Create();
  LocIniciarVenda     := TIniciarNovaVenda.Create();
  //Passando para a quantidade com enter
  if (key = 13) and (edProduto.Text = '') then
  begin
    edQuantidade.SetFocus();
    Exit;
  end;

  if edQuantidade.Text = '' then
  begin
    MessageDlg('Favor digitar a quantidade!',mtConfirmation,[mbOK], 0);
    edQuantidade.SetFocus();
    Exit;
  end;

  if not IsDouble(edQuantidade.Text) then
  begin
    MessageDlg('Favor digitar uma quantidade v�lida!',mtConfirmation,[mbOK], 0);
    edQuantidade.SetFocus();
    Exit();
  end;

  if (key = 13) and (edProduto.Text <> '') then
  begin
    if pvtIDNovaVenda = 0 then
    begin
      pvtIDNovaVenda := LocIniciarVenda.Iniciar();
      lbVendaIniciada.Visible := true;
    end;

    if not LocAdicionarProduto.ADD(edProduto.Text, pvtIDNovaVenda, StrToFloat(edQuantidade.Text)) then
      MessageDlg('Erro ao Adicionar produto!',mtConfirmation,[mbOK], 0);

    edProduto.Clear();
    edQuantidade.Text := '1';
    edProduto.SetFocus();
  end;
end;

procedure Tfrm_Principal.edQuantidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //Passando para a quantidade
  if (key = 13) then
  begin
    if (edProduto.Text = '') then
    begin
      edProduto.SetFocus();
    end
    else
    begin
      edProdutoKeyDown(Self, key, Shift);
    end;
  end;
end;

procedure Tfrm_Principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if pvtIDNovaVenda > 0 then
  begin
    MessageDlg('Venda iniciada, favor cancelar antes de sair!',mtConfirmation,[mbOK], 0);
    Action := caNone;
  end;

  if MessageDlg('Deseja Sair?',mtConfirmation,[mbYes,mbNo], 0) = 7 then
  begin
    Action := caNone;
  end;
end;

procedure Tfrm_Principal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    113: lbNovaVendaClick(nil); //F2
    114: lbCancelarVendaClick(nil); //F3
    115: lbProdutosClick(nil); //F4
    116: lbClienteClick(nil); //F5
    121: lbFinalizarVendaClick(nil); //F10
    123: lbSairClick(nil); //F12
  end;
end;

procedure Tfrm_Principal.FormResize(Sender: TObject);
begin
  //DimensionarGrid(GridItemVenda);
end;

procedure Tfrm_Principal.FormShow(Sender: TObject);
var
  LocConfiguracoesShowfrmPrincipal: IConfiguracoesShowfrmPrincipal;
begin
  LocConfiguracoesShowfrmPrincipal := TConfiguracoesShowfrmPrincipal.Create();
  pvtIDNovaVenda := LocConfiguracoesShowfrmPrincipal.Iniciar(pvtIDNovaVenda);
  edQuantidade.Text := '1';
  edProduto.SetFocus();
end;

procedure Tfrm_Principal.imgClienteClick(Sender: TObject);
begin
  lbClienteClick(nil);
end;

procedure Tfrm_Principal.imgConsultarVendaClick(Sender: TObject);
begin
  lbConsultarVendaClick(nil);
end;

procedure Tfrm_Principal.imgFecharVendaClick(Sender: TObject);
begin
  lbCancelarVendaClick(nil);
end;

procedure Tfrm_Principal.imgFinalizarVendaClick(Sender: TObject);
begin
  lbFinalizarVendaClick(nil);
end;

procedure Tfrm_Principal.imgNovaVendaClick(Sender: TObject);
begin
  lbNovaVendaClick(nil);
end;

procedure Tfrm_Principal.imgProdutoClick(Sender: TObject);
begin
  lbProdutosClick(nil);
end;

procedure Tfrm_Principal.imgSairClick(Sender: TObject);
begin
  lbSairClick(nil);
end;

procedure Tfrm_Principal.lbConsultarVendaClick(Sender: TObject);
begin
  if pvtIDNovaVenda <> 0 then
  begin
    MessageDlg('Favor finalizar a venda!',mtConfirmation,[mbOK], 0);
    Exit;
  end;

  GridItemVenda.DataSource := nil;
  IniciarConsultarVendas();
  dmPrincipal.qrItemVenda.close();
  GridItemVenda.DataSource := dmPrincipal.dsItemVenda;
end;

procedure Tfrm_Principal.lbSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Principal.lbProdutosClick(Sender: TObject);
begin
  AbrirBuscarProdutos(pvtIDNovaVenda);
end;

procedure Tfrm_Principal.lbCancelarVendaClick(Sender: TObject);
var
  LocCancelarVenda: ICancelarVenda;
begin
  LocCancelarVenda:= TCancelarVenda.Create();
  if pvtIDNovaVenda = 0 then
  begin
    MessageDlg('Sem venda Iniciada',mtConfirmation,[mbOK], 0);
    Exit;
  end;

  if MessageDlg('Deseja Cancelar a venda?',mtConfirmation,[mbYes, mbNO], 0) = 6 then
  begin
    if LocCancelarVenda.Cancelar(pvtIDNovaVenda) then
    begin
      MessageDlg('Venda Cancelada',mtConfirmation,[mbOK], 0);
      lbVendaIniciada.Visible := false;
    end;
  end;
  edProduto.SetFocus();
end;

procedure Tfrm_Principal.lbClienteClick(Sender: TObject);
var
    LocString: String;
begin
  LocString := '';
  if pvtIDNovaVenda = 0 then
  begin
    MessageDlg('Favor iniciar a venda!',mtConfirmation,[mbOK], 0);
    Exit();
  end;
  pvtIDCliente := AbrirClientes(pvtIDNovaVenda, LocString);
  if pvtIDCliente <> 0 then
  begin
    edNomeCliente.Text := LocString;
  end;
end;

procedure Tfrm_Principal.lbFinalizarVendaClick(Sender: TObject);
var
  LocFinalizarVenda: IFinalizarVenda;
begin
  LocFinalizarVenda:= TFinalizarVenda.Create();
  if pvtIDNovaVenda = 0 then
  begin
    MessageDlg('Venda n�o iniciada',mtConfirmation,[mbOK], 0);
    edProduto.SetFocus();
    Exit;
  end;

  if (edQtdItens.Text = '') or (edQtdItens.Text = '0') then
  begin
    MessageDlg('Favor adicionar itens a venda',mtConfirmation,[mbOK], 0);
    edProduto.SetFocus();
    Exit;
  end;

  edNumVenda.Visible    := true;
  lbNumeroVenda.Visible := true;
  if not LocFinalizarVenda.Finalizar(pvtIDNovaVenda, pvtIDCliente) then
  begin
    MessageDlg('Erro ao Fnalizar Venda',mtConfirmation,[mbOK], 0);
    Exit();
  end;
  edNomeCliente.Clear();
  edNumVenda.Visible      := False;
  lbNumeroVenda.Visible   := False;
  lbVendaIniciada.Visible := False;
  pvtIDNovaVenda := 0;

  edProduto.SetFocus();
end;

procedure Tfrm_Principal.lbNovaVendaClick(Sender: TObject);
var
  LocIniciarNovaVenda: IIniciarNovaVenda;
begin
  LocIniciarNovaVenda := TIniciarNovaVenda.Create();
  if pvtIDNovaVenda = 0 then
  begin
    pvtIDNovaVenda := LocIniciarNovaVenda.Iniciar();
    lbVendaIniciada.Visible := true;
  end
  else
    MessageDlg('Venda j� iniciada',mtConfirmation,[mbOK], 0);
  edProduto.SetFocus();
end;

end.
