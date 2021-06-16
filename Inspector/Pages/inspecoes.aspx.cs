﻿using Inspector.Classes;
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

    //protected void b_newplano_Click(object sender, EventArgs e)
    //{
    //    ClientScript.RegisterStartupScript(this.GetType(), "Pop", "$('#newModal').modal('show')", true);
    //}

    //protected void cancel_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect(Request.RawUrl);
    //}

    //protected void bOK_Click(object sender, EventArgs e)
    //{
    //    PlanosDB db = new PlanosDB();
    //    DataSet ds = new DataSet();
    //    ds = db.Filter(i_op6.Text);
    //    data = ds.Tables[0];
    //    if (data.Rows.Count == 0)
    //    {
    //        Mensagem.ShowMessage('A', "Aviso: Não há planos a serem criados!");
    //        return;
    //    }
    //    lvnewplan.DataSource = data;
    //    lvnewplan.DataBind();
    //    ClientScript.RegisterStartupScript(this.GetType(), "Pop", "$('#confirmModal').modal('show')", true);
    //}

    //protected void bConfirm_Click(object sender, EventArgs e)
    //{
    //    string created = "";
    //    bool fail = false;
    //    int j = 0, k = 0;
    //    data.Columns.Add("QtPecas", typeof(Int32));
    //    try
    //    {
    //        foreach (ListViewItem row in lvnewplan.Items)
    //        {
    //            switch (row.ItemType)
    //            {
    //                case ListViewItemType.DataItem:
    //                    data.Rows[k][7] = Convert.ToInt32(((TextBox)row.FindControl("txtPeca")).Text);
    //                    k++;
    //                    break;
    //            }
    //        }

    //        foreach (DataRow i in data.Rows)
    //        {
    //            PlanoInspecao plano = new PlanoInspecao();
    //            plano.OP = (string)data.Rows[data.Rows.IndexOf(i)][0];
    //            plano.Produto = (string)data.Rows[data.Rows.IndexOf(i)][1];
    //            plano.QtPecas = Convert.ToInt32(data.Rows[data.Rows.IndexOf(i)][7]);

    //            PlanosDB db = new PlanosDB();
    //            if (db.Insert(plano))
    //            {
    //                if (db.Integrate(plano.OP, true))
    //                {
    //                    created += " " + plano.OP + ",";
    //                    j++;
    //                }
    //                else
    //                {
    //                    fail = true;
    //                }
    //            }
    //            else
    //            {
    //                fail = true;
    //            }
    //        }
    //        if (fail == false)
    //        {
    //            created = created.Remove(created.Length - 1, 1);
    //            if (j > 1)
    //            {
    //                Mensagem.ShowMessage('S', "Planos de inspeção para as ordens" + created + " criados com sucesso.");
    //            }
    //            else
    //            {
    //                Mensagem.ShowMessage('S', "Plano de inspeção para a ordem" + created + " criado com sucesso.");
    //            }
    //        }
    //        else
    //        {
    //            Mensagem.ShowMessage('E', "Não foi possível salvar. Tente novamente mais tarde.");
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        Mensagem.ShowMessage('E', "Erro: " + ex.Message);
    //    }
    //}

    protected void lvinspecoes_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Detalhes":
                Response.Redirect("~/Pages/inspecao.aspx?visualiza=" + e.CommandArgument);
                break;
            case "Editar":
                Response.Redirect("~/Pages/inspecao.aspx?edita=" + e.CommandArgument);
                break;
            case "Deletar":
                //try
                //{
                //    db.Delete(produto);
                //    var delfile = Convert.ToString(Server.MapPath("~/Src/uploaded/") + template.PDF);
                //    System.IO.File.Delete(delfile);
                //    delfile = Convert.ToString(Server.MapPath("~/Src/uploaded/") + template.XLT);
                //    System.IO.File.Delete(delfile);
                //    Mensagem.ShowMessage('S', "Template Nº " + produto + " excluído com sucesso.");
                //}
                //catch (Exception ex)
                //{
                //    Mensagem.ShowMessage('E', "Erro: " + ex.Message);
                //}
                //break;
            default:
                break;
        }
        //string op = Convert.ToString(e.CommandArgument);
        //PlanosDB db = new PlanosDB();
        //Literal l_msgtype = new Literal(); l_msgtype = (Literal)Master.FindControl("l_msgtype");
        //Label l_status = new Label(); l_status = (Label)Master.FindControl("l_status");
        //try
        //{
        //    db.Delete(op);
        //    db.Integrate(op, false);
        //    Mensagem.ShowMessage('S', "Plano para a ordem " + op + " excluído com sucesso.");
        //}
        //catch (Exception ex)
        //{
        //    Mensagem.ShowMessage('E', "Erro: " + ex.Message);
        //}
    }

    //protected void lvnewplan_ItemCommand(object sender, ListViewCommandEventArgs e)
    //{
    //    if (data.Rows.Count > 1)
    //    {
    //        data.Rows[e.Item.DataItemIndex].Delete();
    //        data.AcceptChanges();
    //        lvnewplan.DataSource = data;
    //        lvnewplan.DataBind();
    //    }
    //}

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