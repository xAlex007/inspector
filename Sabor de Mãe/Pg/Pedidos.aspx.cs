using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pg_Pedidos : System.Web.UI.Page
{
    bool l = true;
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
                LinkButton logout = new LinkButton();
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
            buttons.Text = "<a class='btn ml-auto btn-outline-light mr-2' href='Login.aspx'><h5 class='pt-1'>Login</h5></a>";
            buttons.Text += "<div class='navbar-nav'><a class='btn ml-auto btn-outline-light mr-2' href='Cadastro.aspx'><h5 class='pt-1'>Cadastro</h5></a></div>";
            UserOptions.Controls.Add(buttons);
        }
        /*Parâmetros das DropDownLists*/
        while (l)
        {
            ListItem i = dlDoce.Items.FindByValue("1");
            i.Attributes.Add("style", "color:gray;");
            i.Attributes.Add("disabled", "true");
            i = dlPagamento.Items.FindByValue("1");
            i.Attributes.Add("style", "color:gray;");
            i.Attributes.Add("disabled", "true");
            l = false;
        }
    }
    protected void Logout_Click(object sender, EventArgs e)
    {
        UsuarioDB.Logout();
        Server.TransferRequest(Request.Url.AbsolutePath, false);
    }
    protected void buttonpedido_Click(object sender, EventArgs e)
    {
        if (UsuarioDB.EstaLogado)
        {
            Encomenda encomenda = new Encomenda();

            encomenda.Cliente = UsuarioDB.NomeCliente;
            encomenda.Produto = Convert.ToString(dlDoce.SelectedItem);
            encomenda.Quantidade = Convert.ToInt32(txtQuantidade.Text);
            encomenda.FormaPagamento = Convert.ToString(dlPagamento.SelectedItem);
            encomenda.Endereco = txtEndereco.Text;
            encomenda.Numero = txtNumero.Text;
            encomenda.Cidade = txtCidade.Text;
            encomenda.Cep = txtCep.Text;
            encomenda.ValorTotal = EncomendaDB.CalcVT(dlDoce.SelectedValue, encomenda.Quantidade);
            EncomendaDB.InsereNovaEncomenda(encomenda);

            ltlPedido.Text = "";

            ltlPedido.Text += "<p><b>Doce: </b>" + encomenda.Produto + "</p>";
            ltlPedido.Text += "<p><b>Quantidade: </b>" + encomenda.Quantidade + "</p>";
            ltlPedido.Text += "<p><b>Forma de pagamento: </b>" + encomenda.FormaPagamento + "</p>";
            ltlPedido.Text += "<p><b>Endereço: </b>" + encomenda.Endereco + "</p>";
            ltlPedido.Text += "<p><b>Número: </b>" + encomenda.Numero + "</p>";
            ltlPedido.Text += "<p><b>Cidade: </b>" + encomenda.Cidade + "</p>";
            ltlPedido.Text += "<p><b>CEP: </b>" + encomenda.Cep + "</p>";
            ltlPedido.Text += "<p><b>Valor total: </b> R$" + encomenda.ValorTotal + "</p>";

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalFail();", true);
        }
    }
    protected void dlDoce_SelectedIndexChanged(object sender, EventArgs e)
    {
        string docesel = dlDoce.SelectedValue;
        imagem.Text = EncomendaDB.ImgSelect(docesel);
    }
    protected void Dismiss_Click(object sender, EventArgs e)
    {
        Server.TransferRequest(Request.Url.AbsolutePath, false);
    }
}