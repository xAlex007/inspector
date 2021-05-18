using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de EncomendaDB
/// </summary>
public class EncomendaDB
{
    private static int contador = 0;
    private static Encomenda[] encomendas = new Encomenda[100];
    public static void InsereNovaEncomenda(Encomenda novaEncomenda)
    {
        encomendas[contador] = novaEncomenda;
        contador++;
    }
    public static string DadosEncomenda()
    {
        string encomenda = "";

        for (int i = 0; i < contador; i++)
        {
            encomenda += "<div class='alert alert-primary mt-3 mb-5' p-2 role='alert'>";
            encomenda += "<p>Doce: " + encomendas[i].Produto + "</p>";
            encomenda += "<p>Quantidade: " + encomendas[i].Quantidade + "</p>";
            encomenda += "<p>Forma de pagamento: " + encomendas[i].FormaPagamento + "</p>";
            encomenda += "<p>Endereço: " + encomendas[i].Endereco + "</p>";
            encomenda += "<p>Número: " + encomendas[i].Numero + "</p>";
            encomenda += "<p>Cidade: " + encomendas[i].Cidade + "</p>";
            encomenda += "<p>CEP: " + encomendas[i].Cep + "</p>";
            encomenda += "<p>Valor total: " + encomendas[i].ValorTotal + "</p>";
            encomenda += "</div>";
        }
        return encomenda;
    }
    public static string ImgSelect(string selected)
    {
        string imagem = "";

        switch (selected)
        {
            case "Doce1":
                imagem += "<img class='card-img' src='../Imgs/Prods/Abacaxi.jpg' alt='Bolo de Abacaxi'/>";
                break;
            case "Doce2":
                imagem += "<img class='card-img' src='../Imgs/Prods/Suiço.jpg' alt='Bolo de Abacaxi suíço'/>";
                break;
            case "Doce3":
                imagem += "<img class='card-img' src='../Imgs/Prods/Ameixa.jpg' alt='Bolo de Ameixa com doce de leite'/>";
                break;
            case "Doce4":
                imagem += "<img class='card-img' src='../Imgs/Prods/Brigadeiro.jpg' alt='Bolo de Brigadeiro'/>";
                break;
            case "Doce5":
                imagem += "<img class='card-img' src='../Imgs/Prods/Maltado.jpg' alt='Bolo de Brigadeiro maltado'/>";
                break;
            case "Doce6":
                imagem += "<img class='card-img' src='../Imgs/Prods/Cereja.jpg' alt='Bolo de Cereja'/>";
                break;
            case "Doce7":
                imagem += "<img class='card-img' src='../Imgs/Prods/Coco.jpg' alt='Bolo de Coco'/>";
                break;
            case "Doce8":
                imagem += "<img class='card-img' src='../Imgs/Prods/Avelã.jpg' alt='Bolo de Creme de avelã com cacau'/>";
                break;
            case "Doce9":
                imagem += "<img class='card-img' src='../Imgs/Prods/Doce de Leite.jpg' alt='Bolo de Doce de leite'/>";
                break;
            case "Doce10":
                imagem += "<img class='card-img' src='../Imgs/Prods/Floresta.jpg' alt='Bolo de Floresta negra'/>";
                break;
            case "Doce11":
                imagem += "<img class='card-img' src='../Imgs/Prods/Calda.jpg' alt='Bolo de Frutas vermelhas em calda'/>";
                break;
            case "Doce12":
                imagem += "<img class='card-img' src='../Imgs/Prods/Geleia.jpg' alt='Bolo de Frutas vermelhas em geleia'/>";
                break;
            case "Doce13":
                imagem += "<img class='card-img' src='../Imgs/Prods/Maracuja.jpg' alt='Bolo de mousse de maracujá' />";
                break;
            case "Doce14":
                imagem += "<img class='card-img' src='../Imgs/Prods/Limão.jpg' alt='Bolo de mousse de limão' />";
                break;
            case "Doce15":
                imagem += "<img class='card-img' src='../Imgs/Prods/Ninho.jpg' alt='Bolo de ninho' />";
                break;
            case "Doce16":
                imagem += "<img class='card-img' src='../Imgs/Prods/Nutella.jpg' alt='Bolo de nutella' />";
                break;
            case "Doce17":
                imagem += "<img class='card-img' src='../Imgs/Prods/Prestigio.jpg' alt='Bolo de prestígio' />";
                break;
            case "Doce18":
                imagem += "<img class='card-img' src='../Imgs/Prods/Ninho - Avela.jpg' alt='Combinação 1' />";
                break;
            case "Doce19":
                imagem += "<img class='card-img' src='../Imgs/Prods/Coco - ameixa.jpg' alt='Combinação 2' />";
                break;
            case "Doce20":
                imagem += "<img class='card-img' src='../Imgs/Prods/Brigadeiro - doce de leite.jpg' alt='Combinação 3' />";
                break;
            case "Doce21":
                imagem += "<img class='card-img' src='../Imgs/Prods/Ninho - ovomaltine.jpg' alt='Combinação 4' />";
                break;
            case "Doce22":
                imagem += "<img class='card-img' src='../Imgs/Prods/Doce de leite - abacaxi.jpg' alt='Combinação 5' />";
                break;
            case "Doce23":
                imagem += "<img class='card-img' src='../Imgs/Prods/Maracuja - ovomaltine.jpg' alt='Combinação 6' />";
                break;
            case "Doce24":
                imagem += "<img class='card-img' src='../Imgs/Prods/Ninho com Negresco App.jpg' alt='Combinação 7' />";
                break;
            case "Doce25":
            case "Doce26":
                imagem += "<img class='card-img' src='../Imgs/Prods/Brigadeiro Pote.jpg' alt='Recheio de brigadeiro' />";
                break;
            case "Doce27":
            case "Doce28":
                imagem += "<img class='card-img' src='../Imgs/Prods/Maltado Pote.jpg' alt='Recheio de brigadeiro maltado' />";
                break;
            case "Doce29":
            case "Doce30":
                imagem += "<img class='card-img' src='../Imgs/Prods/Coco Pote.jpg' alt='Recheio de coco' />";
                break;
            case "Doce31":
            case "Doce32":
                imagem += "<img class='card-img' src='../Imgs/Prods/Ninho Pote.jpg' alt='Recheio de creme branco' />";
                break;
            case "Doce33":
            case "Doce34":
                imagem += "<img class='card-img' src='../Imgs/Prods/Avelã 2.jpg' alt='Recheio de creme de avelã' />";
                break;
            case "Doce35":
            case "Doce36":
                imagem += "<img class='card-img' src='../Imgs/Prods/Doce de Leite Pote.jpg' alt='Recheio de doce de leite' />";
                break;
            case "Doce37":
            case "Doce38":
                imagem += "<img class='card-img' src='../Imgs/Prods/Maracujá Pote.jpg' alt='Recheio de mousse de maracujá' />";
                break;
            case "Doce39":
            case "Doce40":
                imagem += "<img class='card-img' src='../Imgs/Prods/Limão Pote.jpg' alt='Recheio de mousse de limão' />";
                break;
            case "Doce41":
            case "Doce42":
                imagem += "<img class='card-img' src='../Imgs/Prods/Ninho Pote.jpg' alt='Recheio de ninho' />";
                break;
            case "Doce43":
                imagem += "<img class='card-img' src='../Imgs/Prods/Pudim.jpg' alt='Pudim' />";
                break;
            case "Doce44":
                imagem += "<img class='card-img' src='../Imgs/Prods/Manjar.jpg' alt='Manjar' />";
                break;
            case "Doce45":
                imagem += "<img class='card-img' src='../Imgs/Prods/Açai.jpg' alt='Açaí' />";
                break;
            default:
                break;
        }
        return imagem;
    }
    public static double CalcVT(string selected, int quant)
    {
        double vt=0;
        
        switch (selected)
        {
            case "Doce45":
                vt = 3 * quant;
                break;
            case "Doce43":
            case "Doce44":
                vt = 4 * quant;
                break;
            case "Doce1":
            case "Doce4":
            case "Doce6":
            case "Doce7":
            case "Doce10":
            case "Doce11":
            case "Doce12":
            case "Doce13":
            case "Doce14":
            case "Doce15":
            case "Doce17":
            case "Doce31":
            case "Doce37":
            case "Doce39":
                vt = 8 * quant;
                break;
            case "Doce2":
            case "Doce3":
            case "Doce8":
            case "Doce9":
                vt = 8.5 * quant;
                break;
            case "Doce5":
            case "Doce19":
            case "Doce20":
            case "Doce21":
            case "Doce22":
            case "Doce23":
            case "Doce24":
            case "Doce25":
            case "Doce29":
            case "Doce41":
                vt = 9 * quant;
                break;            
            case "Doce18":
                vt = 9.5 * quant;
                break;
            case "Doce27":
            case "Doce35":
                vt = 10 * quant;
                break;
            case "Doce16":
            case "Doce32":
            case "Doce38":
            case "Doce40":
                vt = 12 * quant;
                break;
            case "Doce26":
            case "Doce30":
            case "Doce33":
            case "Doce42":
                vt = 13 * quant;
                break;
            case "Doce28":
                vt = 14 * quant;
                break;
            case "Doce36":
                vt = 15 * quant;
                break;
            case "Doce34":
                vt = 17 * quant;
                break;            
            default:
                break;
        }
        return vt;
    }
}