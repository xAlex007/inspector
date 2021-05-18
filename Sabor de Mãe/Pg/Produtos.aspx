<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Produtos.aspx.cs" Inherits="Pg_Produtos" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Sabor de Mãe - Produtos</title>
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
            <div class="container bg-white pb-3">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1>Menu</h1>
                        <img src="../Imgs/Sabores de mãe cardapio.jpeg" class="wadjust mt-1" alt="Cardápio - Sabor de Mãe" />
                    </div>
                </div>
                <div class="text-center mt-5">
                    <h2>Por categoria</h2>
                </div>
                <ul class="nav nav-tabs justify-content-center">
                    <li class="nav-item">
                        <a class="nav-link text-danger" data-toggle="tab" href="#bolosdepote">Bolos de pote</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-danger" data-toggle="tab" href="#combinacoes">Combinações</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-danger" data-toggle="tab" href="#comrecheio">Recheios no pote</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-danger" data-toggle="tab" href="#sobremesas">Outras sobremesas</a>
                    </li>
                </ul>
                <div class="tab-content mt-5 mb-5 overflow-auto" style="max-height: 23.25rem">
                    <div class="tab-pane container active" id="bolosdepote">
                        <div class="row px-2">
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Abacaxi ➜ R$8,00</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Bolo branco molhado com uma calda especial, recheado com um incrível creme branco com pedaços de abacaxi em calda.</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Abacaxi.jpg" alt="Bolo de Abacaxi" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Abacaxi Suíço ➜ R$8,50</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Bolo branco molhado com uma calda especial, recheado com um incrível creme branco com pedaços de abacaxi em calda com coco fresco.</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Suiço.jpg" alt="Bolo de Abacaxi Suíço" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Ameixa c/ doce de leite R$8,50</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Bolo branco molhado com calda especial recheada com um saboroso doce de leite caseiro e pedaços de ameixa.</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Ameixa.jpg" alt="Bolo de Ameixa com doce de leite" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Brigadeiro ➜ R$8,00</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Bolo de chocolate molhado com uma calda especial, recheado com um delicioso brigadeiro de chocolate ao leite, levemente adoçado.</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Brigadeiro.jpg" alt="Bolo de Brigadeiro" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Brig. Maltado ➜ R$9,00</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Bolo de chocolate molhado com uma calda especial, recheado com um delicioso brigadeiro de chocolate ao leite com Ovomaltine original.</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Maltado.jpg" alt="Bolo de Brigadeiro Maltado" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Cereja ➜ R$8,00</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Bolo branco molhado com uma calda especial, recheada com um saboroso creme branco com cereja azedinha.</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Cereja.jpg" alt="Bolo de Cereja" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Coco ➜ R$8,00</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Bolo branco molhado com uma calda especial, recheada com um delicioso creme branco cozido com flocos de coco.</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Coco.jpg" alt="Bolo de Coco" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Creme de avelã c/ cacau R$8,50</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Bolo branco molhado com uma calda especial, recheada com um delicioso creme de avelã com cacau.</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Avelã.jpg" alt="Bolo de Creme de avelã com cacau" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Doce de leite ➜ R$8,50</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Bolo branco molhado com uma calda especial, recheada com um saboroso doce de leite caseiro.</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Doce de Leite.jpg" alt="Bolo de doce de leite" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Floresta negra → R$8,00</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Bolo de chocolate molhado com uma calda especial de cereja, recheada com um saboroso creme branco com cereja azedinha.</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Floresta.jpg" alt="Bolo de floresta negra" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Frutas vermelhas em calda ➜ R$8,00</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Bolo branco molhado com calda recheada com um saboroso creme branco com pedaços de frutas vermelhas.</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Calda.jpg" alt="Bolo de frutas vermelhas em calda" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Frutas vermelhas em geleia ➜ R$8,00</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Bolo branco molhado com uma calda recheada com um saboroso creme branco e geleia de frutas vermelhas.</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Geleia.jpg" alt="Bolo de frutas vermelhas em geleia" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Mousse de maracujá R$8,00</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Bolo branco molhado com calda recheada com um saboroso mousse de maracujá e pedaços de sementes.</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Maracuja.jpg" alt="Bolo de mousse de maracujá" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Mousse de limão R$8,00</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Bolo branco molhado com uma calda especial, recheada com um saboroso mouse de limão.</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Limão.jpg" alt="Bolo de mousse de limão" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Ninho ➜ R$8,00</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Bolo branco molhado com uma calda especial, recheada com um delicioso creme de leite em pó da marca Ninho.</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Ninho.jpg" alt="Bolo de ninho" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Nutella Original ‏‏‎ ‎R$12,00</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Bolo branco molhado com uma calda especial, recheada com o verdadeiro creme de avelã da marca Nutella.</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Nutella.jpg" alt="Bolo de nutella" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Prestígio ➜‏‏‎ ‎R$8,00</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Bolo de chocolate molhado com uma calda especial, recheada com um delicioso creme branco cozido com flocos de coco.</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Prestigio.jpg" alt="Bolo de prestígio" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane container fade" id="combinacoes">
                        <div class="row px-2">
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Combinação 1 ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎   ‎‏‏‎ R$9,50</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Saboroso recheio de Ninho com creme de avelã com cacau. 🤤</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Ninho - Avela.jpg" alt="Combinação 1" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Combinação 2‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎   ‎‏‏‎ ‎‏‏‎R$9,00</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Incrível recheio de leite condensado cozido com coco em flocos e geleia de ameixa. 🤤</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Coco - ameixa.jpg" alt="Combinação 2" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Combinação 3‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎   ‎‏‏‎ ‎‏‏‎R$9,00</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Delicioso recheio de doce de leite caseiro com brigadeiro. 🤤</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Brigadeiro - doce de leite.jpg" alt="Combinação 3" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Combinação 4 ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎   ‎‏‏‎ ‎‏‏‎R$9,00</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Incrível recheio de creme de Ninho com o tradicional Ovomaltine. 🤤</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Ninho - ovomaltine.jpg" alt="Combinação 4" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Combinação 5 ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎   ‎‏‏‎ ‎‏‏‎R$9,00</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Delicioso recheio de doce de leite caseiro com abacaxi. 🤤</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Doce de leite - abacaxi.jpg" alt="Combinação 5" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Combinação 6 ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎   ‎‏‏‎ ‎‏‏‎R$9,00</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Saboroso recheio de mousse de maracujá com Ovomaltine. 🤤</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Maracuja - ovomaltine.jpg" alt="Combinação 6" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Combinação 7 ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎   ‎‏‏‎ ‎‏‏‎R$9,00</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Incrível recheio de creme de Ninho com Negresco. 🤤</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Ninho com Negresco App.jpg" alt="Combinação 7" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane container fade" id="comrecheio">
                        <div class="row px-2">
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Brigadeiro </h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Saboroso recheio de brigadeiro na consistência de danete. 🤤 ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎180ml - R$9,00 ‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎250ml - R$13,00‎</p>
                                        <p class="card-text text-justify">‎ ‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Brigadeiro Pote.jpg" alt="Recheio de brigadeiro" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Brigadeiro Maltado</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Delicioso brigadeiro de chocolate ao leite com Ovomaltine original. 🤤‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‎ ‎‏‏‎ ‎‏‏‎  180ml - R$10,00 ‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‎‏‏‎250ml - R$14,00 ‎</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Maltado Pote.jpg" alt="Recheio de brigadeiro maltado" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Coco</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Incrível creme de leite condensado cozido com flocos de coco. 🤤‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‎  ‎‏‏‎ ‎‏‏‎ ‎‎  ‎‏‏‎ ‎‏‏‎ ‎‎  ‎‏‏‎ ‎‏‏‎ ‎‎  ‎‏‏‎ ‎‏‏‎ ‎‎  ‎‏‏‎ ‎‏‏‎ ‎‎ ‎‏‏‎ ‎‏‏‎  180ml - R$9,00 ‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‎‏‏‎250ml - R$13,00 ‎</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Coco Pote.jpg" alt="Recheio de coco" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Creme branco</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Delicioso creme de leite condensado cozido. 🤤‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‎  ‎‏‏‎ ‎‏‏‎ ‎‎ ‎‏‏‎180ml - R$8,00 ‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‎‏‏‎250ml - R$11,00 ‎</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Ninho Pote.jpg" alt="Recheio de creme branco" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Creme de avelã</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Incrível recheio de creme de avelã com cacau com semelhança à Nutella. 🤤‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‏‏‎ ‎‏‏‎ ‎‎ ‎‏‏‎180ml - R$13,00 ‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‎‏‏‎250ml - R$16,00 ‎</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Avelã 2.jpg" alt="Recheio de creme de avelã" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Doce de leite</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Incrível recheio de doce de leite caseiro. 🤤‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‏‏‎ ‎‏‏‎ ‎‎ ‎‏‏‎180ml - R$10,00 ‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‎‏‏‎250ml - R$14,00 ‎</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Doce de Leite Pote.jpg" alt="Recheio de doce de leite" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Mousse de maracujá</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Incrível recheio de mousse de maracujá com sementes da própria fruta. 🤤‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‏‏‎ ‎‏‏‎ ‎‎ ‎‏‏‎180ml - R$8,00 ‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‎‏‏‎250ml - R$11,00 ‎</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Maracujá Pote.jpg" alt="Recheio de mousse de maracujá" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Mousse de limão</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Saboroso mousse de limão feito com a própria fruta e azedinho. 🤤‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‏‏‎ ‎‏‏‎ ‎‏‏‎‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‏‏‎ ‎‏‏‎ ‎‎ ‎‏‏‎180ml - R$8,00 ‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‎‏‏‎250ml - R$11,00 ‎</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Limão Pote.jpg" alt="Recheio de mousse de limão" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Ninho</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Saboroso creme de ninho com chantili. 🤤‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‏‏‎ ‎‏‏‎ ‎‏‏‎‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‏‏‎ ‎‏‏‎ ‎‎ ‎‏‏‎180ml - R$9,00 ‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎  ‎‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‎‏‏‎250ml - R$13,00 ‎</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Ninho Pote.jpg" alt="Recheio de ninho" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane container fade" id="sobremesas">
                        <div class="row px-2">
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Pudim ➜ R$4,00</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Saboroso pudim tradicional de leite condensado.</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Pudim.jpg" alt="Pudim" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Manjar ➜ R$4,00</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Saboroso manjar de coco com pedaços de ameixa e uma incrível calda de caramelo.</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Manjar.jpg" alt="Manjar" />
                                </div>
                            </div>
                            <div class="col-6 col-md-3 mb-2">
                                <div class="card container-overlay">
                                    <div class="card-img-overlay detalhes">
                                        <h5 class="card-title text-center">Açaí ➜ R$3,00</h5>
                                        <hr class="m-0 p-0" />
                                        <p class="card-text text-justify">Sache de 100g de açaí pronto com guaraná em formato de geladinho.</p>
                                    </div>
                                    <img class="card-img" src="../Imgs/Prods/Açai.jpg" alt="Açaí" />
                                </div>
                            </div>
                        </div>
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
