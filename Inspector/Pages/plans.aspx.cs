using Inspector.Classes;
using Inspector.Persist;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_plans : System.Web.UI.Page
{
    public static DataTable data { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void b_newplano_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "$('#newModal').modal('show')", true);
    }

    protected void cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }

    protected void bOK_Click(object sender, EventArgs e)
    {
        Literal l_msgtype = new Literal(); l_msgtype = (Literal)Master.FindControl("l_msgtype");
        Label l_status = new Label(); l_status = (Label)Master.FindControl("l_status");
        PlanosDB db = new PlanosDB();
        DataSet ds = new DataSet();
        ds = db.Filter(i_op6.Text);
        data = ds.Tables[0];
        if (data.Rows.Count == 0)
        {
            l_msgtype.Text += "<div class='modal-header justify-content-center bg-warning'>";
            l_status.Text = "Aviso: Não há planos a serem criados!";
            l_msgtype.Text += "<h5 class='modal-title'><img src = '../Src/img/error.png' height='32'/></h5>";
            l_msgtype.Text += "</div>";
            ScriptManager.RegisterStartupScript(this, GetType(), "Mensagem", "Mensagem();", true);
            return;
        }
        lvnewplan.DataSource = data;
        lvnewplan.DataBind();
        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "$('#confirmModal').modal('show')", true);
    }

    protected void bConfirm_Click(object sender, EventArgs e)
    {
        Literal l_msgtype = new Literal(); l_msgtype = (Literal)Master.FindControl("l_msgtype");
        Label l_status = new Label(); l_status = (Label)Master.FindControl("l_status");
        string created = "";
        bool fail = false;
        int j = 0;
        try
        {
            foreach (DataRow i in data.Rows)
            {
                PlanoInspecao plano = new PlanoInspecao();
                plano.OP = (string)data.Rows[data.Rows.IndexOf(i)][0];
                plano.Produto = (string)data.Rows[data.Rows.IndexOf(i)][1];

                PlanosDB db = new PlanosDB();
                if (db.Insert(plano))
                {
                    if (db.Integrate(plano.OP, true))
                    {
                        created += " " + plano.OP + ",";
                        j++;
                    }
                    else
                    {
                        fail = true;
                    }
                }
                else
                {
                    fail = true;
                }
            }
            if (fail == false)
            {
                created = created.Remove(created.Length - 1, 1);
                l_msgtype.Text += "<div class='modal-header justify-content-center bg-success'>";
                l_msgtype.Text += "<h5 class='modal-title'><img src = '../Src/img/success.png' height='32'/></h5>";
                l_msgtype.Text += "</div>";
                if (j > 1)
                {
                    l_status.Text = "Planos de inspeção para as ordens" + created + " criados com sucesso.";
                }
                else
                {
                    l_status.Text = "Plano de inspeção para a ordem" + created + " criado com sucesso.";
                }
                ScriptManager.RegisterStartupScript(this, GetType(), "Mensagem", "Mensagem();", true);
            }
            else
            {
                l_msgtype.Text += "<div class='modal-header justify-content-center bg-danger'>";
                l_msgtype.Text += "<h5 class='modal-title'><img src = '../Src/img/error.png' height='32'/></h5>";
                l_msgtype.Text += "</div>";
                l_status.Text = "Não foi possível salvar. Tente novamente mais tarde.";
                ScriptManager.RegisterStartupScript(this, GetType(), "Mensagem", "Mensagem();", true);
            }
        }
        catch (Exception ex)
        {
            l_msgtype.Text += "<div class='modal-header justify-content-center bg-danger'>";
            l_status.Text = "Erro: " + ex.Message;
            l_msgtype.Text += "<h5 class='modal-title'><img src = '../Src/img/error.png' height='32'/></h5>";
            l_msgtype.Text += "</div>";
            ScriptManager.RegisterStartupScript(this, GetType(), "Mensagem", "Mensagem();", true);
        }
    }

    protected void lvplanos_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string op = Convert.ToString(e.CommandArgument);
        PlanosDB db = new PlanosDB();
        Literal l_msgtype = new Literal(); l_msgtype = (Literal)Master.FindControl("l_msgtype");
        Label l_status = new Label(); l_status = (Label)Master.FindControl("l_status");                
        try
        {
            db.Delete(op);
            db.Integrate(op, false);
            l_msgtype.Text += "<div class='modal-header justify-content-center bg-success'>";
            l_msgtype.Text += "<h5 class='modal-title'><img src = '../Src/img/success.png' height='32'/></h5>";
            l_msgtype.Text += "</div>";
            l_status.Text = "Plano para a ordem " + op + " excluído com sucesso.";
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
    }

    protected void lvnewplan_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (data.Rows.Count > 1) {
            data.Rows[e.Item.DataItemIndex].Delete();
            data.AcceptChanges();
            lvnewplan.DataSource = data;
            lvnewplan.DataBind();
        }
    }
}
