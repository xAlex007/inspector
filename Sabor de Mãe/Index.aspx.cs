using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*Carregar opções da navbar*/
        if (UsuarioDB.EstaLogado)
        {
            if (UsuarioDB.IsAdmin)
            {
                Label hello = new Label();
                LinkButton cpl = new LinkButton();
                LinkButton logout = new LinkButton();
                hello.Text = "Olá, Administrador!";
                hello.Attributes["class"] = "mr-md-4 bold";
                cpl.ID = "controlpanel";
                cpl.Text = "Painel de Controle";
                cpl.Attributes["href"] = "../Pg/Admin.aspx";
                cpl.Attributes["class"] = "btn ml-auto btn-outline-light mr-2 navbutton";
                cpl.Attributes["runat"] = "server";
                logout.ID = "logout";
                logout.Text = "Logout";
                logout.Click += Logout_Click;
                logout.Attributes["class"] = "btn ml-auto btn-outline-light mr-2 navbutton";
                logout.Attributes["runat"] = "server";
                UserOptions.Controls.Add(hello);
                UserOptions.Controls.Add(cpl);
                UserOptions.Controls.Add(logout);
            }
            else
            {
                Label hello = new Label();
                Button logout = new Button();
                hello.Text = "Olá, " + UsuarioDB.NomeCliente + "!";
                hello.Attributes["class"] = "mr-md-5 bold";
                logout.ID = "logout";
                logout.Text = "Logout";
                logout.Click += Logout_Click;
                logout.Attributes["class"] = "btn ml-auto btn-outline-light mr-2 navbutton";
                logout.Attributes["runat"] = "server";
                UserOptions.Controls.Add(hello);
                UserOptions.Controls.Add(logout);
            }
        }
        else
        {
            Literal buttons = new Literal();
            buttons.Text = "<a class='btn ml-auto btn-outline-light mr-2' href='Pg/Login.aspx'><h5 class='pt-1'>Login</h5></a>";
            buttons.Text += "<div class='navbar-nav'><a class='btn ml-auto btn-outline-light mr-2' href='Pg/Cadastro.aspx'><h5 class='pt-1'>Cadastro</h5></a></div>";
            UserOptions.Controls.Add(buttons);
        }
    }
    protected void Logout_Click(object sender, EventArgs e)
    {
        UsuarioDB.Logout();
        Server.TransferRequest(Request.Url.AbsolutePath, false);
    }
}