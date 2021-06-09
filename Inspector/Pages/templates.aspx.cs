using Inspector.Classes;
using Inspector.Persist;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_templates : System.Web.UI.Page
{
    public static string oldpdf { get; set; }
    public static string oldxlt { get; set; }

    protected List<Control> ControlCache
    {
        get { return (List<Control>)(Session["cachedControlsForPageX"] = (Session["cachedControlsForPageX"] as List<Control>) ?? new List<Control>()); }
        set { Session["cachedControlsForPageX"] = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            foreach (var control in ControlCache)
            {
                if (control.ID == "ei_pdf") {
                    ph_pdf.Controls.Add(control);
                }
                else
                {
                    ph_xlt.Controls.Add(control);
                }
            }
        }
        else
        {
            ControlCache = null;
        }
    }

    protected void cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }

    protected void b_newtemplate_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "$('#newModal').modal('show')", true);
    }

    protected void bSave_Click(object sender, EventArgs e)
    {
        Literal l_msgtype = new Literal(); l_msgtype = (Literal)Master.FindControl("l_msgtype");
        Label l_status = new Label(); l_status = (Label)Master.FindControl("l_status");
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
        Literal l_msgtype = new Literal(); l_msgtype = (Literal)Master.FindControl("l_msgtype");
        Label l_status = new Label(); l_status = (Label)Master.FindControl("l_status");
        try
        {
            bool invalidfile = false;
            Template template = new Template();
            template.Produto = ei_produto.Text;
            template.Desenho = ei_desenho.Text;
            template.Posicao = ei_pos.Text;
            template.Cotas = int.Parse(ei_cotas.Text);
            try
            {
                Label pdf = new Label();
                pdf = (Label)ph_pdf.FindControl("ei_pdf");
                template.PDF = pdf.Text;
            }
            catch
            {
                FileUpload pdf = new FileUpload();
                pdf = (FileUpload)ph_pdf.FindControl("ei_pdf");
                if (pdf.PostedFile.ContentType == "application/pdf")
                {
                    template.PDF = Path.GetFileName(pdf.FileName);
                    pdf.SaveAs(Server.MapPath("~/Src/uploaded/") + template.PDF);
                    var oldfile = Convert.ToString(Server.MapPath("~/Src/uploaded/") + oldpdf);
                    System.IO.File.Delete(oldfile);
                }
                else
                {
                    invalidfile = true;
                }
            }
            try
            {
                Label xlt = new Label();
                xlt = (Label)ph_xlt.FindControl("ei_xlt");
                template.XLT = xlt.Text;
            }
            catch
            {
                FileUpload xlt = new FileUpload();
                xlt = (FileUpload)ph_xlt.FindControl("ei_xlt");
                if (xlt.PostedFile.ContentType == "application/vnd.ms-excel")
                {
                    template.XLT = Path.GetFileName(xlt.FileName);
                    xlt.SaveAs(Server.MapPath("~/Src/uploaded/") + template.XLT);
                    var oldfile = Convert.ToString(Server.MapPath("~/Src/uploaded/") + oldxlt);
                    System.IO.File.Delete(oldfile);
                }
                else
                {
                    invalidfile = true;
                }
            }
            if (invalidfile == false)
            {
                TemplateDB db = new TemplateDB();
                if (db.Update(template))
                {
                    l_msgtype.Text += "<div class='modal-header justify-content-center bg-success'>";
                    l_msgtype.Text += "<h5 class='modal-title'><img src = '../Src/img/success.png' height='32'/></h5>";
                    l_msgtype.Text += "</div>";
                    l_status.Text = "Template Nº " + template.Produto + " alterado com sucesso.";
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
            l_status.Text = "Erro: " + ex.Message;
            ScriptManager.RegisterStartupScript(this, GetType(), "Mensagem", "Mensagem();", true);
        }
    }

    protected void b_rmvpdf_Click(object sender, EventArgs e)
    {
        //Salvar nome antigo e remover controle Label
        Label pdfo = new Label();
        pdfo = (Label)ph_pdf.FindControl("ei_pdf");
        oldpdf = pdfo.Text;
        ph_pdf.Controls.Remove(pdfo);
        ControlCache.Remove(pdfo);
        //Criar controle FileUpload
        FileUpload ei_pdf = new FileUpload();
        ei_pdf.ID = "ei_pdf";
        ei_pdf.Attributes.Add("accept", ".pdf");
        ph_pdf.Controls.Add(ei_pdf);
        ControlCache.Add(ei_pdf);
        b_rmvpdf.Visible = false;
    }

    protected void b_rmvxlt_Click(object sender, EventArgs e)
    {
        //Salvar nome antigo e remover controle Label
        Label xlto = new Label();
        xlto = (Label)ph_xlt.FindControl("ei_xlt");
        oldxlt = xlto.Text;
        ph_xlt.Controls.Remove(xlto);
        ControlCache.Remove(xlto);
        //Criar controle FileUpload
        FileUpload ei_xlt = new FileUpload();
        ei_xlt.ID = "ei_xlt";
        ei_xlt.Attributes.Add("accept", ".xlt");
        ph_xlt.Controls.Add(ei_xlt);
        ControlCache.Add(ei_xlt);
        b_rmvxlt.Visible = false;
    }

    protected void lvtemplates_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string produto = Convert.ToString(e.CommandArgument);
        TemplateDB db = new TemplateDB();
        Template template = db.Select(produto);
        switch (e.CommandName)
        {
            case "Deletar":
                Literal l_msgtype = new Literal(); l_msgtype = (Literal)Master.FindControl("l_msgtype");
                Label l_status = new Label(); l_status = (Label)Master.FindControl("l_status");
                try
                {
                    db.Delete(produto);
                    var delfile = Convert.ToString(Server.MapPath("~/Src/uploaded/") + template.PDF);
                    System.IO.File.Delete(delfile);
                    delfile = Convert.ToString(Server.MapPath("~/Src/uploaded/") + template.XLT);
                    System.IO.File.Delete(delfile);
                    l_msgtype.Text += "<div class='modal-header justify-content-center bg-success'>";
                    l_msgtype.Text += "<h5 class='modal-title'><img src = '../Src/img/success.png' height='32'/></h5>";
                    l_msgtype.Text += "</div>";
                    l_status.Text = "Template Nº " + produto + " excluído com sucesso.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "Mensagem", "Mensagem();", true);
                }
                catch (Exception ex)
                {
                    l_msgtype.Text += "<div class='modal-header justify-content-center bg-danger'>";
                    l_msgtype.Text += "<h5 class='modal-title'><img src = '../Src/img/error.png' height='32'/></h5>";
                    l_msgtype.Text += "</div>";
                    l_status.Text = "Erro: " + ex.Message;
                    ScriptManager.RegisterStartupScript(this, GetType(), "Mensagem", "Mensagem();", true);
                }
                break;
            default:
                break;
        }
    }
}
