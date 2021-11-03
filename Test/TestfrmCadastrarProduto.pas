unit TestfrmCadastrarProduto;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, Vcl.Mask, Vcl.Dialogs, frmCadastrarProduto, Vcl.DBCtrls, Vcl.Buttons,
  System.SysUtils, Vcl.Graphics, System.Variants, Winapi.Messages, Vcl.StdCtrls,
  Winapi.Windows, Vcl.Controls, Vcl.Forms, System.Classes;

type
  // Test methods for class TfrmCadastrarProdutos

  TestTfrmCadastrarProdutos = class(TTestCase)
  strict private
    FfrmCadastrarProdutos: TfrmCadastrarProdutos;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestFormShow;
    procedure TestStatusEdits;
    procedure TestbtnSairClick;
    procedure TestbtnNovoClick;
    procedure TestbtnSalvarClick;
    procedure TestedPrecoUnitarioExit;
    procedure TestedValCompraExit;
    procedure TestedCodBarrasExit;
    procedure TestbtnCancelarClick;
    procedure TestLimparEdits;
    procedure TestEnableBotoes;
  end;

implementation

procedure TestTfrmCadastrarProdutos.SetUp;
begin
  FfrmCadastrarProdutos := TfrmCadastrarProdutos.Create;
end;

procedure TestTfrmCadastrarProdutos.TearDown;
begin
  FfrmCadastrarProdutos.Free;
  FfrmCadastrarProdutos := nil;
end;

procedure TestTfrmCadastrarProdutos.TestFormShow;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FfrmCadastrarProdutos.FormShow(Sender);
  // TODO: Validate method results
end;

procedure TestTfrmCadastrarProdutos.TestStatusEdits;
var
  prmStatus: Boolean;
begin
  // TODO: Setup method call parameters
  FfrmCadastrarProdutos.StatusEdits(prmStatus);
  // TODO: Validate method results
end;

procedure TestTfrmCadastrarProdutos.TestbtnSairClick;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FfrmCadastrarProdutos.btnSairClick(Sender);
  // TODO: Validate method results
end;

procedure TestTfrmCadastrarProdutos.TestbtnNovoClick;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FfrmCadastrarProdutos.btnNovoClick(Sender);
  // TODO: Validate method results
end;

procedure TestTfrmCadastrarProdutos.TestbtnSalvarClick;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FfrmCadastrarProdutos.btnSalvarClick(Sender);
  // TODO: Validate method results
end;

procedure TestTfrmCadastrarProdutos.TestedPrecoUnitarioExit;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FfrmCadastrarProdutos.edPrecoUnitarioExit(Sender);
  // TODO: Validate method results
end;

procedure TestTfrmCadastrarProdutos.TestedValCompraExit;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FfrmCadastrarProdutos.edValCompraExit(Sender);
  // TODO: Validate method results
end;

procedure TestTfrmCadastrarProdutos.TestedCodBarrasExit;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FfrmCadastrarProdutos.edCodBarrasExit(Sender);
  // TODO: Validate method results
end;

procedure TestTfrmCadastrarProdutos.TestbtnCancelarClick;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FfrmCadastrarProdutos.btnCancelarClick(Sender);
  // TODO: Validate method results
end;

procedure TestTfrmCadastrarProdutos.TestLimparEdits;
begin
  FfrmCadastrarProdutos.LimparEdits;
  // TODO: Validate method results
end;

procedure TestTfrmCadastrarProdutos.TestEnableBotoes;
var
  prmEnable: Boolean;
begin
  // TODO: Setup method call parameters
  FfrmCadastrarProdutos.EnableBotoes(prmEnable);
  // TODO: Validate method results
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTfrmCadastrarProdutos.Suite);
end.

