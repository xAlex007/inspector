<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Sabor de Mãe - Página Inicial</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <link href="Content/Main.css" rel="stylesheet" />
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
                        <a class="nav-item nav-link btn-outline-danger  mr-2" href="Pg/Sobre.aspx">
                            <h4>Sobre</h4>
                        </a>
                        <a class="nav-item nav-link  btn-outline-danger mr-2" href="Pg/Produtos.aspx">
                            <h4>Produtos</h4>
                        </a>
                        <a class="nav-item nav-link  btn-outline-danger mr-2" href="Pg/Contato.aspx">
                            <h4>Contatos</h4>
                        </a>
                        <a class="nav-item nav-link  btn-outline-danger mr-2" href="Pg/Pedidos.aspx">
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
        <div class="bg-light">            
            <div class="container bg-white pb-3">
                <div class="row pt-4">
                    <div class="col-12 col-md-12">
                        <!--Carrosel -->
                        <div id="Indicators" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#Indicators" data-slide-to="0" class="active"></li>
                                <li data-target="#Indicators" data-slide-to="1"></li>
                                <li data-target="#Indicators" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="d-block w-100" src="Imgs/banner1.jpg" alt="First slide" />
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100" src="Imgs/banner2.jpg" alt="Second slide" />
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100" src="Imgs/banner3.jpg" alt="Third slide" />
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#Indicators" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#Indicators" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-12 col-md-12">
                        <div class="card border-danger mb-3">
                            <div class="card-header">
                                <h5 class="card-title text-danger text-center">📢 Cuidados em relação à pandemia de Covid-19 📢</h5>
                            </div>
                            <div class="card-body text-danger">
                                <h6 class="card-text">Pensando no momento que estamos vivendo e na saúde de nossos colaboradores e clientes, o Sabor de Mãe adotou uma série de medidas para evitar o contágio do Coronavírus:</h6>
                                <br />
                                <p class="card-text">•	Pagamento online, Boleto, Picpay e transferência</p>
                                <p class="card-text">•	Higienização constante de todos que tem contato com o produto</p>
                                <p class="card-text">•	Higienização da maquininha pós uso</p>
                                <p class="card-text">•	Troco embalado para evitar contato direto com o dinheiro</p>
                                <p class="card-text">•	Uso de luvas, máscaras e toucas</p>
                                <p class="card-text">•	Disponibilização de Álcool em gel para clientes e funcionários</p>
                                <p class="card-text">•	Retirada Agendada</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt-4 align-items-center">
                    <div class="col-4 col-md-4">
                        <hgroup class="speech-bubble pt-2 pb-4 text-center">
                            <h3 class="text-white">Como chegar?</h3>
                            <hr />
                            <h6 class="p-3 text-white">Apesar de não termos loja física, nossas sobremesas são preparadas com muito carinho aqui.</h6>
                        </hgroup>
                    </div>
                    <div class="col-8 col-md-8">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d650.423920479237!2d-45.12233310358066!3d-22.75226561904895!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ccc96ccd0121e5%3A0x5f9b8b0ed81c83cc!2sSabor%20de%20M%C3%A3e!5e0!3m2!1spt-BR!2sbr!4v1606599039380!5m2!1spt-BR!2sbr" width="100%" height="450" frameborder="0" style="border: 0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                    </div>
                </div>
            </div>
        </div>
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
