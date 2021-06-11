using Inspector.Classes;
using Inspector.Persist;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_plans : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PlanosDB db = new PlanosDB();
        DataSet ds = new DataSet();
        ds = db.SelectAll();
        ddl_planos.DataSource = ds.Tables[0];
        ddl_planos.DataValueField = "OP";
        ddl_planos.DataTextField = "OP";
        ddl_planos.DataBind();
        //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "$('#newModal').modal('show')", true);
    }

    protected void cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }


    protected void bOK_Click(object sender, EventArgs e)
    {
        
        //if (data.Rows.Count == 0)
        //{
        //    l_msgtype.Text += "<div class='modal-header justify-content-center bg-warning'>";
        //    l_status.Text = "Aviso: Não há planos a serem criados!";
        //    l_msgtype.Text += "<h5 class='modal-title'><img src = '../Src/img/error.png' height='32'/></h5>";
        //    l_msgtype.Text += "</div>";
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Mensagem", "Mensagem();", true);
        //    return;
        //}
        //lvnewplan.DataSource = data;
        //lvnewplan.DataBind();
        //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "$('#confirmModal').modal('show')", true);
    }
}