using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class UsuarioDB
{
    private static int contador = 0;
    private static bool estaLogado = false;
    private static bool isAdmin = false;
    private static string nomeCliente = "";
    private static Usuario[] clientes = new Usuario[20];

    public static bool EstaLogado
    {
        get
        {
            return estaLogado;
        }

        set
        {
            estaLogado = value;
        }
    }
    public static string NomeCliente
    {
        get
        {
            return nomeCliente;
        }

        set
        {
            nomeCliente = value;
        }
    }
    public static bool IsAdmin
    {
        get
        {
            return isAdmin;
        }

        set
        {
            isAdmin = value;
        }
    }
    public static void InsereNovoCliente(Usuario novoCliente)
    {
        clientes[contador] = novoCliente;
        contador++;
    }
    public static bool ChecaCliente(Usuario cliente)
    {
        bool clienteExiste = false;

        for (int i = 0; i < contador; i++)
        {
            if(clientes[i].Email == cliente.Email && clientes[i].Senha == cliente.Senha)
            {
                return clienteExiste = true;
            }
        }

        return clienteExiste;
    }
    public static string NomeClienteLogado(Usuario cliente)
    {
        string nomeClienteLogado = "";

        for (int i = 0; i < contador; i++)
        {
            if (clientes[i].Email.Equals(cliente.Email))
            {
                nomeClienteLogado = clientes[i].Nome;
                nomeClienteLogado += " " + clientes[i].Sobrenome;
            }
        }

        return nomeClienteLogado;
    }

    public static void Logout()
    {
        UsuarioDB.NomeCliente = "";
        UsuarioDB.EstaLogado = false;
        UsuarioDB.IsAdmin = false;
    }
}