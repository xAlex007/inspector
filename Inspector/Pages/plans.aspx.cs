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
        PlanosDB db = new PlanosDB();
        DataSet ds = db.SelectAll();
        DataTable data = ds.Tables[0];
        lvplanos.DataSource = data;
        lvplanos.DataBind();
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
        PlanosDB db = new PlanosDB();
        DataSet ds = new DataSet();
        ds = db.Filter(i_op6.Text);
        data = ds.Tables[0];
        if (data.Rows.Count == 0)
        {
            Mensagem.ShowMessage('A', "Aviso: Não há planos a serem criados!", false);
            return;
        }
        lvnewplan.DataSource = data;
        lvnewplan.DataBind();
        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "$('#confirmModal').modal('show')", true);
    }

    protected void bConfirm_Click(object sender, EventArgs e)
    {
        string created = "";
        bool fail = false;
        int j = 0, k = 0;
        data.Columns.Add("QtPecas", typeof(Int32));
        try
        {
            foreach (ListViewItem row in lvnewplan.Items)
            {
                switch (row.ItemType)
                {
                    case ListViewItemType.DataItem:
                        data.Rows[k][7] = Convert.ToInt32(((TextBox)row.FindControl("txtPeca")).Text);
                        k++;
                        break;
                }
            }

            foreach (DataRow i in data.Rows)
            {
                PlanoInspecao plano = new PlanoInspecao();
                plano.OP = (string)data.Rows[data.Rows.IndexOf(i)][0];
                plano.Produto = (string)data.Rows[data.Rows.IndexOf(i)][1];
                plano.QtPecas = Convert.ToInt32(data.Rows[data.Rows.IndexOf(i)][7]);

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
                if (j > 1)
                {
                    Mensagem.ShowMessage('S', "Planos de inspeção para as ordens" + created + " criados com sucesso.", false);
                }
                else
                {
                    Mensagem.ShowMessage('S', "Plano de inspeção para a ordem" + created + " criado com sucesso.", false);
                }
            }
            else
            {
                Mensagem.ShowMessage('E', "Não foi possível salvar. Tente novamente mais tarde.", false);
            }
        }
        catch (Exception ex)
        {
            Mensagem.ShowMessage('E', "Erro: " + ex.Message, false);
        }
    }

    protected void lvplanos_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string op = Convert.ToString(e.CommandArgument);
        PlanosDB db = new PlanosDB();
        try
        {
            db.Delete(op);
            db.Integrate(op, false);
            Mensagem.ShowMessage('S', "Plano para a ordem " + op + " excluído com sucesso.", false);
        }
        catch (Exception ex)
        {
            Mensagem.ShowMessage('E', "Erro: " + ex.Message, false);
        }
    }

    protected void lvnewplan_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (data.Rows.Count > 1)
        {
            data.Rows[e.Item.DataItemIndex].Delete();
            data.AcceptChanges();
            lvnewplan.DataSource = data;
            lvnewplan.DataBind();
        }
    }

    protected void lvplanos_PagePropertiesChanged(object sender, EventArgs e)
    {
        lvplanos.DataBind();
    }

    protected void Search_TextChanged(object sender, EventArgs e)
    {
        PlanosDB db = new PlanosDB();
        DataSet ds = db.Search(Search.Text);
        DataTable data = ds.Tables[0];
        lvplanos.DataSource = data;
        lvplanos.DataBind();
    }
}
