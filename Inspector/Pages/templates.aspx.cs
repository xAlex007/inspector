using Inspector.Classes;
using Inspector.Persist;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_templates : System.Web.UI.Page
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

    protected void b_newtemplate_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "$('#newModal').modal('show')", true);
    }

    protected void bSave_Click(object sender, EventArgs e)
    {
        Template template = new Template();
        template.Produto = i_produto.Text;
        template.Desenho = i_desenho.Text;
        template.Posicao = i_pos.Text;
        template.Cotas = int.Parse(i_cotas.Text);
        template.PDF = i_pdf.Text;
        template.XLT = i_xlt.Text;

        TemplateDB db = new TemplateDB();
        if (db.Insert(template))
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
        Template template = new Template();
        template.Produto = ei_produto.Text;
        template.Desenho = ei_desenho.Text;
        template.Posicao = ei_pos.Text;
        template.Cotas = int.Parse(ei_cotas.Text);
        template.PDF = ei_pdf.Text;
        template.XLT = ei_xlt.Text;

        TemplateDB db = new TemplateDB();
        if (db.Update(template))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('Alterado com sucesso');", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('Erro ao alterar.');", true);
        }
        Reload();
    }

    protected void lvtemplates_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string produto = Convert.ToString(e.CommandArgument);
        TemplateDB db = new TemplateDB();

        switch (e.CommandName)
        {
            case "Alterar":
                Template template = db.Select(produto);
                ei_produto.Text = template.Produto;
                ei_desenho.Text = template.Desenho;
                ei_pos.Text = template.Posicao;
                ei_cotas.Text = Convert.ToString(template.Cotas);
                ei_pdf.Text = template.PDF;
                ei_xlt.Text = template.XLT;
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "$('#editModal').modal('show')", true);
                break;
            case "Deletar":
                db.Delete(produto);
                Reload();
                break;
            default:
                break;
        }
    }


}