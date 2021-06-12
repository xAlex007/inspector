using Inspector.Classes;
using Inspector.Persist;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Pages_plans : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) { 
            PlanosDB db = new PlanosDB();
            DataSet ds = new DataSet();
            ds = db.SelectAll();
            ddl_planos.DataSource = ds.Tables[0];
            ddl_planos.DataValueField = "OP";
            ddl_planos.DataTextField = "OP";
            ddl_planos.DataBind();
            ddl_planos.SelectedIndex = 0;
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "$('#newModal').modal('show')", true);
        }
    }

    protected void cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Pages/home.aspx");
    }


    protected void bOK_Click(object sender, EventArgs e)
    {
        PlanosDB db = new PlanosDB();
        DataSet ds = new DataSet();
        ds = db.PlanDetails(ddl_planos.SelectedValue);
        if (Convert.ToInt32(ds.Tables[0].Rows[0][6]) < Convert.ToInt32(ds.Tables[0].Rows[0][5]))
        {
            l_op.Text = ddl_planos.SelectedValue;
            l_prod.Text = ds.Tables[0].Rows[0][1].ToString();
            l_desp.Text = ds.Tables[0].Rows[0][2].ToString() + " Pos. " + ds.Tables[0].Rows[0][3].ToString();
            l_corr.Text = i_newcorr.Text;

            for (int i = 1; i <= Convert.ToInt32(ds.Tables[0].Rows[0][4]); i++)
            {
                Label l_cota = new Label();
                l_cota.ID = "l_cota"+i;
                l_cota.Text = "" + i;
                HtmlGenericControl divcol1 = new HtmlGenericControl();
                divcol1.TagName = "div";
                divcol1.Attributes["class"] = "col border-end border-success p-center";
                divcol1.Controls.Add(l_cota);

                TextBox l_valor = new TextBox();
                l_valor.ID = "l_valor"+i;
                l_valor.CssClass = "form-control form-control-sm text-center m-0";
                l_valor.Attributes["style"] = "font-size: 18px;";
                l_valor.Width = 120;
                HtmlGenericControl divcol2 = new HtmlGenericControl();
                divcol2.TagName = "div";
                divcol2.Attributes["class"] = "col centered py-2";
                divcol2.Controls.Add(l_valor);

                HtmlGenericControl divrow = new HtmlGenericControl();
                divrow.TagName = "div";
                divrow.Attributes["class"] = "row row-cols-2";
                divrow.Controls.Add(divcol1);
                divrow.Controls.Add(divcol2);
                pnl_regs.Controls.Add(divrow);
            }            
        }
        

        //< div class="row row-cols-2">
            //<div class="col border-end border-success p-center">
                //<span id = "l_cota" runat="server">Nº COTA</span>                           
            //</div>
            //<div class="col centered py-2">
                //<input id = "l_valor" type="text" class="form-control form-control-sm text-center m-0" style="font-size: 18px; width:120px;" runat="server" />
            //</div>
        //</div>

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