using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Login.Service;

public partial class Pages_Login : System.Web.UI.Page
{

    #region Propriedades

    LoginDB logindb = new LoginDB();

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
        txtSenha.Focus();
    }

    protected void btnLogar_Click(object sender, EventArgs e)
    {
        logar();
    }

    public void logar ()
    {
        if(string.IsNullOrEmpty(txtLogin.Text)|| string.IsNullOrEmpty(txtSenha.Text))
            {
            this.ExibirAlerta(Mensagem.TipoMensagem.Alerta, "Uusuario ou Senha não informados.");
            txtLogin.Text = string.Empty;
            txtSenha.Text = string.Empty;
            txtLogin.Focus();
            return;
        }
        else
        {
            if (LoginDB.ValidarUsuario(txtLogin.Text, txtSenha.Text))
            {
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                this.ExibirAlerta(Mensagem.TipoMensagem.Alerta, "Usuario não existe");
                return;
            }
        }
    }
}