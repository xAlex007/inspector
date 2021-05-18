<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pedidos.aspx.cs" Inherits="pg_Pedidos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Sabor de Mãe - Pedidos</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.5.1.min.js"></script>
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
    <link href="../Content/Main.css" rel="stylesheet" />
    <script type="text/javascript">
        function openModal() {
            $('#modalpedido').modal('show');
        }
        function openModalFail() {
            $('#modalfalha').modal('show');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <!--Navbar-->
            <nav class="navbar navbar-expand-md navbar-light fixed-top" style="background-image: url('../Imgs/FundoCadastro1.png')">
                <a class="navbar-brand" href="../index.aspx">
                    <img src="../Imgs/ilogo.png" class="mr-4" alt="Logo" width="60" height="60" />
                </a>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-item nav-link btn-outline-danger  mr-2" href="Sobre.aspx">
                            <h4>Sobre</h4>
                        </a>
                        <a class="nav-item nav-link  btn-outline-danger mr-2" href="Produtos.aspx">
                            <h4>Produtos</h4>
                        </a>
                        <a class="nav-item nav-link  btn-outline-danger mr-2" href="Contato.aspx">
                            <h4>Contatos</h4>
                        </a>
                        <a class="nav-item nav-link  btn-outline-danger mr-2" href="Pedidos.aspx">
                            <h4>Faça seu pedido</h4>
                        </a>
                    </div>
                </div>
                <asp:PlaceHolder ID="UserOptions" runat="server"></asp:PlaceHolder>
                <div class="navbar-nav">
                    <button class="navbar-toggler ml-auto" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </div>
            </nav>
        </header>
        <!--Conteúdo-->
        <main>
            <div class="bg-light">
                <div class="container bg-white pb-4">
                    <div class="row pt-5 mb-4">
                        <div class="col-12 col-md-5 align-self-center" style="display: flex; justify-content: center">
                            <div class="card card-select">
                                <asp:Literal ID="imagem" runat="server"></asp:Literal>
                            </div>
                        </div>
                        <div class="col-12 col-md-7">
                            <div class="row justify-content-center">
                                <h2>Pedido</h2>
                                <div class="col-12 col-md-12 mt-3">
                                    <label><strong>Escolha o doce desejado:</strong></label>
                                    <asp:DropDownList ID="dlDoce" CssClass="form-control" runat="server" OnSelectedIndexChanged="dlDoce_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Selected="True" Value="1">Selecione uma opção</asp:ListItem>
                                        <asp:ListItem Value="Doce1"> Abacaxi (Bolo de pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce2"> Abacaxi Suiço (Bolo de pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce3"> Ameixa com Doce de Leite (Bolo de pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce4"> Brigadeiro (Bolo de pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce5"> Brigadeiro Maltado (Bolo de pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce6"> Cereja (Bolo de pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce7"> Coco (Bolo de pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce8"> Creme de Avelã com Cacau (Bolo de pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce9"> Doce de Leite (Bolo de pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce10"> Floresta Negra (Bolo de pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce11"> Frutas Vermelhas em Calda (Bolo de pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce12"> Frutas Vermelhas em Geleia (Bolo de pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce13"> Mousse de Maracujá (Bolo de pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce14"> Mousse de Limão (Bolo de pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce15"> Ninho (Bolo de pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce16"> Nutella Original (Bolo de pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce17"> Prestigio (Bolo de pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce18"> Combinação 1 (Recheio de Ninho com creme de avelã com cacau) </asp:ListItem>
                                        <asp:ListItem Value="Doce19"> Combinação 2 (Recheio de leite condensado cozido com coco em flocos e geleia de ameixa) </asp:ListItem>
                                        <asp:ListItem Value="Doce20"> Combinação 3 (Recheio de doce de leite caseiro com brigadeiro) </asp:ListItem>
                                        <asp:ListItem Value="Doce21"> Combinação 4 (Recheio de creme de Ninho com o tradicional Ovomaltine) </asp:ListItem>
                                        <asp:ListItem Value="Doce22"> Combinação 5 (Recheio de doce de leite caseiro com Abacaxi)</asp:ListItem>
                                        <asp:ListItem Value="Doce23"> Combinação 6 (Recheio de mousse de maracujá com Ovomaltine) </asp:ListItem>
                                        <asp:ListItem Value="Doce24"> Combinação 7 (Recheio de Ninho com Negreso) </asp:ListItem>
                                        <asp:ListItem Value="Doce25"> Brigadeiro (Recheio no Pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce26"> Brigadeiro (Recheio no Pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce27"> Brigadeiro Maltado (Recheio no Pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce28"> Brigadeiro Maltado (Recheio no Pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce29"> Coco - 180ml (Recheio no Pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce30"> Coco - 250ml(Recheio no Pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce31"> Creme Branco - 180ml (Recheio no Pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce32"> Creme Branco - 250ml(Recheio no Pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce33"> Creme de Avelã - 180ml(Recheio no Pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce34"> Creme de Avelã - 250ml(Recheio no Pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce35"> Doce de Leite Caseiro - 180ml(Recheio no Pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce36"> Doce de Leite Caseiro - 250ml(Recheio no Pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce37"> Mousse de Maracujá - 180ml(Recheio no Pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce38"> Mousse de Maracujá - 180ml(Recheio no Pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce39"> Mousse de Limão - 180ml(Recheio no Pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce40"> Mousse de Limão - 250ml(Recheio no Pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce41"> Ninho - 180ml(Recheio no Pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce42"> Ninho - 250ml(Recheio no Pote) </asp:ListItem>
                                        <asp:ListItem Value="Doce43"> Pudim Tradicional (Pudim) </asp:ListItem>
                                        <asp:ListItem Value="Doce44"> Manjar de Coco (Pudim) </asp:ListItem>
                                        <asp:ListItem Value="Doce45"> Sache (Açai) </asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-12 col-md-4 mt-3">
                                    <label><strong>Quantidade:</strong></label>
                                    <asp:TextBox ID="txtQuantidade" CssClass="form-control" runat="server" required="required" TextMode="Number"></asp:TextBox>
                                </div>
                                <div class="col-12 col-md-8 mt-3">
                                    <label><strong>Método de pagamento:</strong></label>
                                    <asp:DropDownList ID="dlPagamento" CssClass="form-control" runat="server">
                                        <asp:ListItem Selected="True" Value="1">Selecione uma opção</asp:ListItem>
                                        <asp:ListItem Value="db"> Débito </asp:ListItem>
                                        <asp:ListItem Value="cc"> Crédito </asp:ListItem>
                                        <asp:ListItem Value="vc"> Voucher (Alelo refeição, Sodexo Refeição e VR Refeição) </asp:ListItem>
                                        <asp:ListItem Value="po"> Pagamento Online </asp:ListItem>
                                        <asp:ListItem Value="bo"> Boleto </asp:ListItem>
                                        <asp:ListItem Value="pp"> PicPay </asp:ListItem>
                                        <asp:ListItem Value="ps"> Venda direta PagSeguro </asp:ListItem>
                                        <asp:ListItem Value="tb"> Transferência Bancaria </asp:ListItem>
                                        <asp:ListItem Value="px"> PIX </asp:ListItem>
                                        <asp:ListItem Value="ct"> Caixa Tem </asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-12 col-md-8 mt-3">
                                    <label><strong>Endereço de entrega:</strong></label>
                                    <asp:TextBox ID="txtEndereco" CssClass="form-control" runat="server" required="required"></asp:TextBox>
                                </div>
                                <div class="col-12 col-md-4 mt-3">
                                    <label><strong>Número:</strong></label>
                                    <asp:TextBox ID="txtNumero" CssClass="form-control" runat="server" required="required"></asp:TextBox>
                                </div>
                                <div class="col-12 col-md-6 mt-3">
                                    <label><strong>Cidade:</strong></label>
                                    <asp:TextBox ID="txtCidade" CssClass="form-control" runat="server" required="required"></asp:TextBox>
                                </div>
                                <div class="col-12 col-md-6 mt-3">
                                    <label><strong>CEP:</strong></label>
                                    <asp:TextBox ID="txtCep" CssClass="form-control" runat="server" required="required"></asp:TextBox>
                                </div>
                                <asp:Button ID="buttonpedido" runat="server" Text="Concluir" class="btn btn-danger mt-5 shadow p-3 rounded" OnClick="buttonpedido_Click" />
                            </div>
                            <!-- Modal Pedido-->
                            <div class="modal fade" id="modalpedido" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="staticBackdropLabel"><strong>Seu Pedido foi:</strong></h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <asp:Literal ID="ltlPedido" runat="server"></asp:Literal>
                                        </div>
                                        <div class="container mt-2 mb-2">
                                            <p class="text-primary"><b>Caso todos os campos estiverem preenchidos corretamente finalize seu pedido!</b></p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Cancelar</button>
                                            <button type="button" class="btn btn-outline-success" data-dismiss="modal" data-toggle="modal" data-target="#modalpedidofinalizado">Finalizar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Modal Confirmação-->
                        <div class="modal fade" id="modalpedidofinalizado" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content d-block">
                                    <asp:Button class="close c-close p-1" runat="server" OnClick="Dismiss_Click" Text="r" />
                                    <img src="../Imgs/order.png" />
                                    <div class="modal-body mt-0 pt-0 pl-5">
                                        <h4 class="modal-title text-success text-center"><strong>Pedido Finalizado com sucesso!</strong></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Modal Falha-->
                        <div class="modal fade" id="modalfalha" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content d-block">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                    <img src="../Imgs/error.png" />
                                    <div class="modal-body mt-0 pt-0 pl-5">
                                        <h4 class="modal-title text-danger text-center">Não foi possível completar a compra.</h4>
                                        <h6 class="modal-title text-danger text-center"><a href= 'Login.aspx' class='alert-link'>Faça login primeiro.</a></h6>                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!--Rodapé-->
        <footer>
            <div class="bg-danger py-3">
                <div class="text-center">
                    <!-- Redes sociais -->
                    <a href="https://www.facebook.com/marilza.nascimento.3304" target="_blank" class="btn btn-primary btn-circle mx-2 px-0" role="button"><i class="fa fa-facebook fa-2x"></i></a>
                    <a href="https://instagram.com/sabordemaeof/?igshid=hkf2ztec8vcd" target="_blank" class="btn btn-dark btn-circle mx-2 px-2 py-2" role="button"><i class="fa fa-instagram fa-2x"></i></a>
                    <a href="https://api.whatsapp.com/send?phone=5512997510547" target="_blank" class="btn btn-info btn-circle mx-2 px-2 py-2" role="button"><i class="fa fa-whatsapp fa-2x"></i></a>
                    <!-- Copyrights -->
                    <h6 class="text-white-50 mt-4"><strong>Sabor de Mãe © 2018 - 2020. Todos os direitos reservados.</strong></h6>
                    <p class="text-muted mb-0 text-white-50">Desenvolvido por WAT Web Services.</p>
                </div>
            </div>
        </footer>
    </form>
</body>
</html>
