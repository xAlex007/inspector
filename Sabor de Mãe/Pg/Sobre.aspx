<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sobre.aspx.cs" Inherits="pg_Sobre" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Sabor de Mãe - Sobre</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.5.1.min.js"></script>
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
    <link href="../Content/Main.css" rel="stylesheet" />
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
        <div class="bg-light">
            <div class="container bg-white">
                <div class="row">
                    <div class="col-12 col-md-12 text-center pt-5 pb-4">
                        <h2>Quem Somos?</h2>
                        <hr />
                    </div>
                    <div class="col-12 col-md-5 pl-5">
                        <img src="../Imgs/imgsobre1.jpeg" class="pl-5" height="250" alt="Imagem Sobre" />
                    </div>
                    <div class="col-12 col-md-7 pt-5">
                        <p>A Sabor de Mãe é uma empresa localizada na cidade de Lorena -SP, com o CNPJ/ CNAE principal no fornecimento de alimentos preparados preponderantemente para consumo domiciliar, com o objetivo de levar até você todo o sabor dos deliciosos doces preparados com amor de mãe. Todos nossos produtos são montados e selecionados no momento dos pedidos e também por encomendas para festas e eventos.</p>
                    </div>
                    <div class="col-12 col-md-12 text-center pt-5 pb-4">
                        <h2>Nossa História</h2>
                        <hr />
                    </div>
                    <div class="col-12 col-md-7 pt-5">
                        <p>Em meados de junho de 2018 nasce a ideia de criar um negócio para entrar no mercado de doces alimentícios, partindo do fundador Renan Nascimento junto a sua mãe Marilza Ferreira, que já vendia doces e bolos eventualmente, mas enfrentava dificuldades em vender pois não tinha recursos como: plataforma, marketing e execução de entregas. Em uma conversa os dois resolveram fechar parceria e dar início aos trabalhos, criando a Delícias de Mãe, atendendo via WhatsApp, Facebook e Instagram.</p>
                    </div>
                    <div class="col-12 col-md-5 pt-2 pl-5">
                        <img src="../Imgs/logo_ant.jpg" class="pl-5" height="250" alt="Logotipo Delícias de Mãe" />                        
                    </div>
                    <div class="col-12 col-md-5 pt-4 pl-5">
                        <img src="../Imgs/imgsobre3.jpg" class="pl-5" height="250" alt="Delivery" />
                    </div>
                    <div class="col-12 col-md-7 mt-3 pt-5">
                        <p>Logo percebeu-se o sucesso das vendas e visando a evolução do negócio, na data de 20/01/2020 foi aberto o CNPJ da empresa, possibilitando o início da integração em plataformas de delivery. A primeira plataforma integrada foi o aplicativo AiqFome, onde se obteve um excelente desempenho, gerando um aumento grande no volume das vendas. Depois de 7 meses trabalhando com foco neste App resolveu-se expandir a outras plataformas e trabalhar com Ifood.</p>
                    </div>                    
                    <div class="col-12 col-md-7 mt-3 pt-5">
                        <p>Dois anos após a criação ainda com mesmo nome e logo, notou-se uma necessidade de buscar trabalhos de profissionais capacitados para realizar mudanças no marketing da empresa, visando maior alcance público e uma identidade própria. Como resultado, surgiu a Sabor de Mãe: o mesmo amor e profissionalismo com uma carinha nova.</p>
                    </div>
                    <div class="col-12 col-md-5 pb-4">
                        <img src="../Imgs/logo_full.jpg"class="pl-5" height="250" alt="Logotipo atual" />
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
