using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class ContatoDB
{
    static private Contato[] contatos = new Contato[50];
    static private int contador = 0;

    public static void InsereNovoContato(Contato novoContato)
    {
        contatos[contador] = novoContato;
        contador++;
    }
    public static string SalvaContato()
    {
        string mensagem = "";

        for (int i = 0; i < contador; i++)
        {
            mensagem += "<div class='alert alert-danger' mt-3 mb-5 p-2 role='alert'>";
            mensagem += "<h6>" + contatos[i].Nome + "</h6>";
            mensagem += "<h6>" + contatos[i].Email + "</h6>";
            mensagem += "<p>" + contatos[i].Mensagem + "<p>";
            mensagem += "</div>";
        }

        return mensagem;
    }
}