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
        user.IsBlock = false;


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

    protected void bEdit_Click(object sender, EventArgs e)
    {
        Usuario user = new Usuario();
        UsuarioDB db = new UsuarioDB();
        
        user.Id = Convert.ToInt32(ei_id.Text);
        user.Senha = db.PswHash(ei_senha.Text);
        user.Nome = ei_nome.Text;
        user.Email = ei_email.Text;
        user.Nivel = Convert.ToChar(ei_nivel.Text);
        user.IsBlock = ei_isblock.Checked;

        if (db.Update(user))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('Alterado com sucesso');", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('Erro ao alterar.');", true);
        }
        Reload();
    }

    protected void lvusers_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        UsuarioDB db = new UsuarioDB();

        switch (e.CommandName)
        {
            case "Alterar":
                Usuario user = db.Select(id);
                ei_id.Text = Convert.ToString(id);
                ei_usuario.Text = user.Username;
                ei_nome.Text = user.Nome;
                ei_email.Text = user.Email;
                ei_nivel.SelectedValue = Convert.ToString(user.Nivel);
                ei_isblock.Checked = user.IsBlock;
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "$('#editModal').modal('show')", true);
                break;
            case "Deletar":
                db.Delete(id);
                Reload();
                break;
            default:
                break;
        }
    }
}