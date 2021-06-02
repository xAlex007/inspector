using Inspector.Classes;
using Inspector.Persist;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_usuarios : System.Web.UI.Page
{
    private void Reload()
    {
        Response.Redirect(Request.RawUrl);
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void cancel_Click(object sender, EventArgs e)
    {
        Reload();
    }

    protected void b_newuser_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "$('#newModal').modal('show')", true);
    }

    protected void bSave_Click(object sender, EventArgs e)
    {
        Usuario user = new Usuario();
        UsuarioDB db = new UsuarioDB();
        user.Username = i_usuario.Text;
        user.Senha = db.PswHash(i_senha.Text);
        user.Nome = i_nome.Text;
        user.Email = i_email.Text;
        user.Nivel = Convert.ToChar(i_nivel.Text);
        user.IsBlock = i_isblock.Checked;


        if (db.Insert(user))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('Salvo com sucesso');", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('Erro ao salvar.');", true);
        }
        Reload();
    }

   
}