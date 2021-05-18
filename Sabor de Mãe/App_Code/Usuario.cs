using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Usuario
{

    private string nome, sobrenome, email, senha;

    public string Nome
    {
        get
        {
            return nome;
        }

        set
        {
            nome = value;
        }
    }
    public string Sobrenome
    {
        get
        {
            return sobrenome;
        }

        set
        {
            sobrenome = value;
        }
    }
    public string Email
    {
        get
        {
            return email;
        }

        set
        {
            email = value;
        }
    }
    public string Senha
    {
        get
        {
            return senha;
        }

        set
        {
            senha = value;
        }

    }
}