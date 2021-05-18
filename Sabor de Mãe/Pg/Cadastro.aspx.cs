using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pg_Cadastro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void botaoCadastro_Click(object sender, EventArgs e)
    {
        bool senhaValida = txtSenha.Text.Equals(txtConfirmaSenha.Text);
        if (senhaValida)
        {
            Usuario cliente = new Usuario();
            cliente.Nome = txtNome.Text;
            cliente.Sobrenome = txtSobrenome.Text;
            cliente.Email = txtEmail.Text;
            cliente.Senha = txtSenha.Text;

            bool naoExisteCadastro = !UsuarioDB.ChecaCliente(cliente);

            if (naoExisteCadastro)
            {
                UsuarioDB.InsereNovoCliente(cliente);
                mensagem.Text = "<div class='alert alert-primary mt-3' role='alert'>Cadastro realizado com sucesso, <a href= 'Login.aspx' class='alert-link'>faça login.</a></div>";
            }
            else
            {
                mensagem.Text = "<div class='alert alert-danger mt-3' role='alert'>Essa conta já existe, vá para a <a href = 'Login.aspx' class='alert-link'>página de login.</a></div>";
            }
        }
        else
        {
            mensagem.Text = "<div class='alert alert-danger mt-3' role='alert'>As senhas digitadas não correspondem.</div>";
        }

        txtNome.Text = "";
        txtSobrenome.Text = "";
        txtEmail.Text = "";
        txtSenha.Text = "";
        txtConfirmaSenha.Text = "";
        receberemail.Checked = false;
    }
}