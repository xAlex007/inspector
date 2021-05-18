using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pg_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void loginButton_Click(object sender, EventArgs e)
    {
        Usuario cliente = new Usuario();
        cliente.Email = txtEmail.Text;
        cliente.Senha = txtSenha.Text;

        bool clienteExiste = UsuarioDB.ChecaCliente(cliente);
        bool loginDoAdmin = txtEmail.Text.Equals("admin@admin.com") && txtSenha.Text.Equals("admin123");

        if (loginDoAdmin)
        {
            UsuarioDB.EstaLogado = true;
            UsuarioDB.IsAdmin = true;
            Response.Redirect("admin.aspx");
        }
        if (clienteExiste)
        {
            UsuarioDB.NomeCliente = UsuarioDB.NomeClienteLogado(cliente);
            UsuarioDB.EstaLogado = true;
            Response.Redirect("../index.aspx");
        }
        else
        {
            mensagem.Text = "<div class='alert alert-danger mt-3' role='alert'>Usuário inválido, você já possui <a href = 'Cadastro.aspx' class='alert-link'>cadastro</a>?</div>";
        }

        txtSenha.Text = "";
    }
}