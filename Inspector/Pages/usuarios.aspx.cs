using Inspector.Classes;
using Inspector.Persist;
using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class Pages_usuarios : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        UsuarioDB db = new UsuarioDB();
        DataSet ds = new DataSet();
        ds = db.SelectAll();
        DataTable data = ds.Tables[0];        
        lvusers.DataSource = data;
        lvusers.DataBind();
    }

    protected void cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
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

        try
        {
            if (db.Insert(user))
            {
                Mensagem.ShowMessage('S', "Usuário <b>" + i_usuario.Text + "</b> cadastrado com sucesso.", false);
            }
            else
            {
                Mensagem.ShowMessage('E', "Erro ao cadastrar. Tente novamente mais tarde.", false);
            }
        }
        catch (Exception ex)
        {
            if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
            {
                Mensagem.ShowMessage('A', "Aviso: Um usuário com esse nome já existe!", false);
            }
            else
            {
                Mensagem.ShowMessage('E', "Erro: " + ex.Message, false);
            }
        }
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

        try
        {
            if (db.Update(user))
            {
                Mensagem.ShowMessage('S', "Usuário <b>" + i_usuario.Text + "</b> alterado com sucesso.", false);
            }
            else
            {
                Mensagem.ShowMessage('E', "Erro ao alterar. Tente novamente mais tarde.", false);
            }
        }
        catch (Exception ex)
        {
            Mensagem.ShowMessage('E', "Erro: " + ex.Message, false);
        }
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
                try
                {
                    db.Delete(id);
                    Mensagem.ShowMessage('S', "Usuário excluído com sucesso.", false);
                }
                catch (Exception ex)
                {
                    Mensagem.ShowMessage('E', "Erro: " + ex.Message, false);
                }
                break;
            default:
                break;
        }
    }

    protected void lvusers_PagePropertiesChanged(object sender, EventArgs e)
    {
        lvusers.DataBind();
    }

    protected void Search_TextChanged(object sender, EventArgs e)
    {
        UsuarioDB db = new UsuarioDB();
        DataSet ds = new DataSet();
        ds = db.Search(Search.Text);
        DataTable data = ds.Tables[0];
        lvusers.DataSource = data;
        lvusers.DataBind();
    }
}
