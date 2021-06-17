using Inspector.Classes;
using Inspector.Persist;
using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class Pages_plans : System.Web.UI.Page
{
    public static DataTable data { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        InspecaoDB db = new InspecaoDB();
        DataTable data = new DataTable();
        DataSet ds = new DataSet();
        if (Request.QueryString.Count == 0)
        {
            ds = db.SelectAll();
        }
        else
        {
            ds = db.SearchByPlan(Request.QueryString["plano"]);
        }
        data = ds.Tables[0];
        lvinspecoes.DataSource = data;
        lvinspecoes.DataBind();
    }

    protected void lvinspecoes_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Detalhes":
                Response.Redirect("~/pages/inspecao.aspx?visualiza=" + e.CommandArgument);
                break;
            case "Editar":
                Response.Redirect("~/pages/inspecao.aspx?edita=" + e.CommandArgument);
                break;
            case "Deletar":
                string corrida = Convert.ToString(e.CommandArgument);
                string plano = ((Label)e.Item.FindControl("PlanoLabel")).Text;
                ValoresDB vdb = new ValoresDB();
                InspecaoDB idb = new InspecaoDB();
                PlanosDB pdb = new PlanosDB();
                try
                {
                    vdb.Delete(corrida);
                    idb.Delete(corrida);
                    pdb.Update(plano, false);
                    Mensagem.ShowMessage('S', "Inspeção para a corrida " + corrida + " excluída com sucesso.", false);
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

    protected void lvinspecoes_PagePropertiesChanged(object sender, EventArgs e)
    {
        lvinspecoes.DataBind();
    }

    protected void Search_TextChanged(object sender, EventArgs e)
    {
        InspecaoDB db = new InspecaoDB();
        DataSet ds = new DataSet();
        if (Request.QueryString.Count == 0)
        {
            ds = db.Search(Search.Text);
        }
        else
        {
            ds = db.SearchHtByPlan(Request.QueryString["plano"], Search.Text);
        }
        DataTable data = ds.Tables[0];
        lvinspecoes.DataSource = data;
        lvinspecoes.DataBind();
    }
}
