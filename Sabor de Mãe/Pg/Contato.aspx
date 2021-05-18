<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contato.aspx.cs" Inherits="pg_Contato" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Sabor de Mãe - Contato</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.5.1.min.js"></script>
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
    <link href="../Content/Main.css" rel="stylesheet" />
    <script type="text/javascript">
        function openModal() {
            $('#modalenviada').modal('show');
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
                <div class="container pt-4 bg-white">
                    <div class="row">
                        <div class="col-12">
                            <div class="card border-danger mb-3">
                                <div class="card-header">
                                    <h5 class="card-title text-danger text-center">Nossos contatos</h5>
                                </div>
                                <div class="card-body text-danger">
                                    <div class="row">
                                        <div class="col-12 col-md-5 pl-5">
                                            <img src="../Imgs/flyer2.jpg" class="card-select ml-5" alt="Logos Sabor de Mãe" />
                                        </div>
                                        <div class="col-12 col-md-7">
                                            <p class="card-text">
                                                <strong>Horário de Funcionamento: </strong>
                                                <br />
                                                Quarta à Sexta das 17:00 às 23:00
                                                <br />
                                                Sábado e Domingo das 15:00 às 23:00
                                            </p>
                                            <p class="card-text"><strong>Telefone:</strong> +55 (12) 99751-0547 / +55 (12) 98145-1818</p>
                                            <p class="card-text"><strong>Endereço:</strong> Rua Piauí, 191, Cidade Industrial, Lorena - SP.</p>
                                            <p class="card-text">
                                                <strong>Redes Sociais :</strong>
                                                <br />
                                                Facebook: <a href="https://www.facebook.com/marilza.nascimento.3304">fb.com/marilza.nascimento.3304</a>
                                                <br />
                                                Instagram: <a href="https://instagram.com/sabordemaeof/">‎‏‏‎@sabordemaeof</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row align-items-center">
                        <div class="col-5 col-md-5 mt-5">
                            <hgroup class="speech-bubble py-5 text-center">
                                <h3 class="text-white">Fale Conosco</h3>
                            </hgroup>
                        </div>
                        <div class="col-7 col-md-7 mt-5">
                            <div class="row">
                                <div class="col-5 col-md-5">
                                    <label>Seu nome:</label>
                                    <asp:TextBox ID="txtNome" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-7 col-md-7">
                                    <label>E-mail:</label>
                                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-12 col-md-12">
                                    <div class="form-group mt-3">
                                        <label for="mensagem">Deixe sua mensagem:</label>
                                        <asp:TextBox ID="txtMensagem" runat="server" required="required" CssClass="form-control" TextMode="MultiLine" Rows="6"></asp:TextBox>
                                    </div>
                                </div>
                                <asp:Button runat="server" ID="buttoncontato" CssClass="btn btn-danger mt-3 offset-5 shadow px-4 py-2 rounded mb-5" Text="Enviar" OnClick="botaoContato_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="modalenviada" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content d-block">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <img src="../Imgs/sent.png" />
                                <div class="modal-body mt-0 pt-0 pl-5">
                                    <h4 class="modal-title text-success text-center"><strong>Mensagem enviada com sucesso!</strong></h4>
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
