using Inspector.Classes;
using Inspector.Persist;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
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
        try
        {
            if (i_pdf.PostedFile.ContentType == "application/pdf" && i_xlt.PostedFile.ContentType == "application/vnd.ms-excel")
            {
                string pdf = Path.GetFileName(i_pdf.FileName);
                i_pdf.SaveAs(Server.MapPath("~/Src/uploaded/") + pdf);
                string xlt = Path.GetFileName(i_xlt.FileName);
                i_xlt.SaveAs(Server.MapPath("~/Src/uploaded/") + xlt);

                Template template = new Template();
                template.Produto = i_produto.Text;
                template.Desenho = i_desenho.Text;
                template.Posicao = i_pos.Text;
                template.Cotas = int.Parse(i_cotas.Text);
                template.PDF = pdf;
                template.XLT = xlt;

                TemplateDB db = new TemplateDB();
                if (db.Insert(template))
                {
                    l_msgtype.Text += "<div class='modal-header justify-content-center bg-success'>";
                    l_msgtype.Text += "<h5 class='modal-title'><img src = '../Src/img/success.png' height='32'/></h5>";
                    l_msgtype.Text += "</div>";
                    l_status.Text = "Template Nº " + template.Produto + " inserido com sucesso.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "Mensagem", "Mensagem();", true);
                }
            }
            else
            {
                l_msgtype.Text += "<div class='modal-header justify-content-center bg-warning'>";
                l_msgtype.Text += "<h5 class='modal-title'><img src = '../Src/img/error.png' height='32'/></h5>";
                l_msgtype.Text += "</div>";
                l_status.Text = "Aviso: Um ou mais anexos não são válidos! Tente novamente.";
                ScriptManager.RegisterStartupScript(this, GetType(), "Mensagem", "Mensagem();", true);
            }
        }
        catch (Exception ex)
        {
            l_msgtype.Text += "<div class='modal-header justify-content-center bg-danger'>";
            l_msgtype.Text += "<h5 class='modal-title'><img src = '../Src/img/error.png' height='32'/></h5>";
            l_msgtype.Text += "</div>";
            if (ex.Message.Contains("Violation of PRIMARY KEY constraint"))
            {
                l_status.Text = "Erro: Um template para esse produto já existe.";
            }
            else
            {
                l_status.Text = "Erro: " + ex.Message;
            }
            ScriptManager.RegisterStartupScript(this, GetType(), "Mensagem", "Mensagem();", true);
        }
    }

    protected void bEdit_Click(object sender, EventArgs e)
    {
        Template template = new Template();
        template.Produto = ei_produto.Text;
        template.Desenho = ei_desenho.Text;
        template.Posicao = ei_pos.Text;
        template.Cotas = int.Parse(ei_cotas.Text);
        try
        {
            Label pdf = new Label();
            int cont = ph_pdf.Controls.Count;
            pdf = (Label)this.Master.FindControl("render").FindControl("ph_pdf").FindControl("ei_pdf");
            template.PDF = pdf.Text;
        }
        catch
        {
            FileUpload pdf = new FileUpload();
            pdf = (FileUpload)ph_pdf.FindControl("ei_pdf");
            template.PDF = Path.GetFileName(pdf.FileName);
        }
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
                Label ei_pdf = new Label();
                ei_pdf.ID = "ei_pdf";
                ei_pdf.Text = template.PDF;
                ph_pdf.Controls.Add(ei_pdf);

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

    protected void b_remove_Click(object sender, EventArgs e)
    {
        ph_pdf.Controls.Clear();
        FileUpload ei_pdf = new FileUpload();
        ei_pdf.Attributes.Add("accept", ".pdf");
        ei_pdf.Attributes.Add("ID", "ei_pdf");
        ph_pdf.Controls.Add(ei_pdf);
        b_remove.Visible = false;
    }

}