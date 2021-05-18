using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Contato
{
    private string nome, email, mensagem;

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

    public string Mensagem
    {
        get
        {
            return mensagem;
        }

        set
        {
            mensagem = value;
        }
    }
}