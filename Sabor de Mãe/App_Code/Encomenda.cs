using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Encomenda
{
    private string cliente, produto, formaPagamento, endereco, numero, cidade, cep;
    private int quantidade;
    private double valorTotal;

    public string Cliente
    {
        get
        {
            return cliente;
        }

        set
        {
            cliente = value;
        }
    }
    public string Produto
    {
        get
        {
            return produto;
        }

        set
        {
            produto = value;
        }
    }
    public string FormaPagamento
    {
        get
        {
            return formaPagamento;
        }

        set
        {
            formaPagamento = value;
        }
    }
    public string Endereco
    {
        get
        {
            return endereco;
        }

        set
        {
            endereco = value;
        }
    }
    public string Numero
    {
        get
        {
            return numero;
        }

        set
        {
            numero = value;
        }
    }
    public string Cidade
    {
        get
        {
            return cidade;
        }

        set
        {
            cidade = value;
        }
    }
    public string Cep
    {
        get
        {
            return cep;
        }

        set
        {
            cep = value;
        }
    }
    public int Quantidade
    {
        get
        {
            return quantidade;
        }

        set
        {
            quantidade = value;
        }
    }
    public double ValorTotal
    {
        get
        {
            return valorTotal;
        }

        set
        {
            valorTotal = value;
        }
    }
}