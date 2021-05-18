<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cadastro.aspx.cs" Inherits="pg_Cadastro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Sabor de Mãe - Cadastro</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.5.1.min.js"></script>
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
    <link href="../Content/Main.css" rel="stylesheet" />
</head>
<body id="cadastro">
    <form runat="server">
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
                <a class="btn ml-auto btn-outline-light mr-2" href="Login.aspx">
                    <h5 class="pt-1">Login</h5>
                </a>
                <div class="navbar-nav">
                    <a class="btn ml-auto btn-outline-light mr-2" href="Cadastro.aspx">
                        <h5 class="pt-1">Cadastro</h5>
                    </a>
                </div>
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
                <div class="container bg-white pt-1 pb-5">
                    <div class="row justify-content-center  pr-0 pl-4">
                        <div class="col-md-8">
                            <h1 class="text-center"><strong>Cadastro</strong></h1>
                            <div class="row col-md-12">
                                <div class="col-md-12 text-center">
                                    <label><strong>Escolha um idioma (Choose a language):</strong></label>
                                    <asp:DropDownList CssClass="form-control" ID="ddllingua" runat="server">
                                        <asp:ListItem Value="PT-BR">Português(BR)</asp:ListItem>
                                        <asp:ListItem Value="EN">English</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-6 col-md-6 mt-2">
                                    <label><strong>Primeiro nome:</strong></label>
                                    <asp:TextBox ID="txtNome" CssClass="form-control" runat="server" required="required"></asp:TextBox>
                                </div>
                                <div class="col-6 col-md-6 mt-2">
                                    <label><strong>Sobrenome:</strong></label>
                                    <asp:TextBox ID="txtSobrenome" CssClass="form-control" runat="server" required="required"></asp:TextBox>
                                </div>
                                <div class="col-12 col-md-12 mt-2">
                                    <label><strong>E-mail:</strong></label>
                                    <asp:TextBox type="email" ID="txtEmail" CssClass="form-control" runat="server" required="required"></asp:TextBox>
                                </div>
                                <div class="col-6 col-md-6 mt-2">
                                    <label><strong>Senha:</strong></label>
                                    <asp:TextBox type="password" ID="txtSenha" CssClass="form-control" runat="server" required="required"></asp:TextBox>
                                </div>
                                <div class="col-6 col-md-6 mt-2">
                                    <label><strong>Confirme a senha:</strong></label>
                                    <asp:TextBox type="password" ID="txtConfirmaSenha" CssClass="form-control" runat="server" required="required"></asp:TextBox>
                                </div>
                                <div class="col-12 col-md-6 mt-2">
                                    <asp:CheckBox ID="receberemail" runat="server" />
                                    <span>Gostaria de receber e-mails com promoções e notícias sobre o estabelecimento.</span>
                                </div>
                                <div class="col-md-4 mt-1 pt-2">
                                    <asp:Button ID="botaoCadastro" CssClass="form-control alert-danger" runat="server" Text="Confirmar" OnClick="botaoCadastro_Click" />
                                </div>
                                <div class="col-12 mt-2 text-light">
                                    <asp:Literal ID="mensagem" runat="server"></asp:Literal>
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
