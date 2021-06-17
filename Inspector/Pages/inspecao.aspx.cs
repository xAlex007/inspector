using Inspector.Classes;
using Inspector.Persist;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Threading;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Pages_plans : System.Web.UI.Page
{
    protected int Controles
    {
        get { return (int)ViewState["NumControls"]; }
        set { ViewState["NumControls"] = value; }
    }

    public static bool edit;

    public static List<string> oldval = new List<string>();

    protected void Page_Load(object sender, EventArgs e)
    {
        ins_head.Attributes["style"] = "display: none;";
        ins_data.Attributes["style"] = "display: none;";
        if (!Page.IsPostBack)
        {
            if (Request.QueryString.Count == 0)
            {
                this.Controles = 0;
                PlanosDB db = new PlanosDB();
                DataSet ds = new DataSet();
                ds = db.SelectAll();
                ddl_planos.DataSource = ds.Tables[0];
                ddl_planos.DataValueField = "OP";
                ddl_planos.DataTextField = "OP";
                ddl_planos.DataBind();
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "$('#newModal').modal('show')", true);
            }
            else
            {
                this.Controles = 0;
                oldval.Clear();
                string corrida;
                if (Request.QueryString["visualiza"] != null)
                {
                    corrida = Request.QueryString["visualiza"];
                    bSave.Attributes["style"] = "display: none;";
                }
                else
                {
                    corrida = Request.QueryString["edita"];
                    edit = true;
                }
                ValoresDB vdb = new ValoresDB();
                DataSet vds = vdb.SelectAll(corrida);
                InspecaoDB idb = new InspecaoDB();
                Inspecao inspecao = idb.Select(corrida);
                PlanosDB pdb = new PlanosDB();
                DataSet pds = pdb.PlanDetails(inspecao.Plano);
                GenHead(inspecao.Plano, corrida, pds);
                GenForm(Convert.ToInt32(pds.Tables[0].Rows[0][4]), vds, edit);
                ins_head.Attributes["style"] = "display: normal;";
                ins_data.Attributes["style"] = "display: normal;";
            }
        }
        else
        {
            this.GetForm();
        }
    }

    protected void GenHead(string plano, string corrida, DataSet ds)
    {
        l_op.Text = plano;
        l_prod.Text = ds.Tables[0].Rows[0][1].ToString();
        l_desp.Text = ds.Tables[0].Rows[0][2].ToString() + " Pos. " + ds.Tables[0].Rows[0][3].ToString();
        l_desp.NavigateUrl = "~/Src/uploaded/" + ds.Tables[0].Rows[0][7].ToString();
        l_corr.Text = corrida;
    }

    protected void GenForm(int nc, DataSet vds, bool edita)
    {
        for (int i = 0; i < nc; i++)
        {
            #region Número da cota
            Label l_cota = new Label();
            l_cota.ID = "l_cota" + i;
            l_cota.Text = "" + (i + 1);
            HtmlGenericControl divcol1 = new HtmlGenericControl();
            divcol1.TagName = "div";
            divcol1.Attributes["class"] = "col border-end border-success p-center";
            divcol1.Controls.Add(l_cota);
            #endregion            
            #region Entrada + Validador
            TextBox l_valor = new TextBox();
            l_valor.ID = "l_valor" + Controles;
            if (Request.QueryString.Count != 0)
            {
                l_valor.Text = vds.Tables[0].Rows[i][3].ToString();
                if (edita == true)
                {
                    oldval.Add(vds.Tables[0].Rows[i][3].ToString());
                }
                else
                {
                    l_valor.Enabled = false;
                }
            }
            l_valor.CssClass = "form-control form-control-sm text-center m-0";
            l_valor.Attributes["style"] = "font-size: 18px;";
            l_valor.Width = 120;
            RequiredFieldValidator required = new RequiredFieldValidator();
            required.ErrorMessage = "*";
            required.ControlToValidate = "l_valor" + i;
            required.SetFocusOnError = true;
            required.ValidationGroup = "Save";
            required.CssClass = "fst-italic fw-bold text-danger text-small";
            HtmlGenericControl divcol2 = new HtmlGenericControl();
            divcol2.TagName = "div";
            divcol2.Attributes["class"] = "col centered py-2";
            divcol2.Controls.Add(l_valor);
            divcol2.Controls.Add(required);
            this.Controles++;
            #endregion
            #region Estrutura HTML
            HtmlGenericControl divrow = new HtmlGenericControl();
            divrow.TagName = "div";
            divrow.Attributes["class"] = "row row-cols-2";
            divrow.Controls.Add(divcol1);
            divrow.Controls.Add(divcol2);
            pnl_regs.Controls.Add(divrow);
            #endregion
        }
    }

    protected void GetForm()
    {
        int c = this.Controles;
        for (int i = 0; i < c; i++)
        {
            TextBox l_valor = new TextBox();
            l_valor.ID = "l_valor" + i;
            l_valor.CssClass = "form-control form-control-sm text-center m-0";
            l_valor.Attributes["style"] = "font-size: 18px;";
            l_valor.Width = 120;
            pnl_regs.Controls.Add(l_valor);
        }
    }

    protected void cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/pages/home.aspx");
    }

    protected void bOK_Click(object sender, EventArgs e)
    {
        InspecaoDB idb = new InspecaoDB();
        Inspecao teste = idb.Select(i_newcorr.Text);
        if (teste == null)
        {
            PlanosDB db = new PlanosDB();
            DataSet ds = db.PlanDetails(ddl_planos.SelectedValue);
            if (Convert.ToInt32(ds.Tables[0].Rows[0][6]) < Convert.ToInt32(ds.Tables[0].Rows[0][5]))
            {
                //Cabeçalho
                GenHead(ddl_planos.SelectedValue, i_newcorr.Text, ds);
                //Formulário
                GenForm(Convert.ToInt32(ds.Tables[0].Rows[0][4]), null, false);
                ins_head.Attributes["style"] = "display: normal;";
                ins_data.Attributes["style"] = "display: normal;";
            }
            else
            {
                Mensagem.ShowMessage('A', "Alerta: Todas as peças previstas para esse plano já foram inspecionadas.", false);
            }
        }
        else
        {
            Mensagem.ShowMessage('A', "Alerta: A corrida <b>" + i_newcorr.Text + "</b> já foi inspecionada.", false);
        }
    }

    protected void bSave_Click(object sender, EventArgs e)
    {
        Inspecao inspecao = new Inspecao();
        inspecao.Corrida = l_corr.Text;
        inspecao.Plano = l_op.Text;
        inspecao.Inspetor = this.Page.User.Identity.Name;
        inspecao.Horario = DateTime.Now;
        bool fail = false;
        Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US");
        try
        {
            PlanosDB pdb = new PlanosDB();
            InspecaoDB idb = new InspecaoDB();
            ValoresDB vdb = new ValoresDB();
            ValoresInspecao valor = new ValoresInspecao();
            //Salvar
            if (edit == false)
            {
                if (pdb.Update(inspecao.Plano, true))
                {
                    if (idb.Insert(inspecao))
                    {
                        int i = 1;
                        foreach (Control c in pnl_regs.Controls)
                        {
                            valor.Corrida = inspecao.Corrida;
                            valor.Cota = i;
                            valor.ValorMedido = float.Parse((c as TextBox).Text.Replace(',', '.'));
                            if (vdb.Insert(valor) == false)
                            {
                                vdb.Delete(valor.Corrida);
                                fail = true;
                            }
                            i++;
                        }
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
                if (fail == false)
                {
                    Mensagem.ShowMessage('S', "Inspeção para a corrida <b>" + l_corr.Text + "</b> registrada com sucesso.", false);
                }
                else
                {
                    Mensagem.ShowMessage('E', "Não foi possível salvar.Tente novamente mais tarde.", false);
                }
            }
            //Editar
            else
            {
                inspecao.Modificado = DateTime.Now;
                if (idb.Update(inspecao))
                {
                    int i = 1, j = 0;
                    foreach (Control c in pnl_regs.Controls)
                    {
                        if ((c as TextBox).Text != oldval[j])
                        {
                            valor.Corrida = inspecao.Corrida;
                            valor.Cota = i;
                            valor.ValorMedido = float.Parse((c as TextBox).Text.Replace(',', '.'));
                            if (vdb.Update(valor) == false)
                            {
                                fail = true;
                            }
                        }
                        i++;
                        j++;
                    }
                }
                else
                {
                    fail = true;
                }
                if (fail == false)
                {
                    Mensagem.ShowMessage('S', "Inspeção para a corrida <b>" + l_corr.Text + "</b> editada com sucesso.", true, "inspecoes");
                }
                else
                {
                    Mensagem.ShowMessage('E', "Não foi possível salvar.Tente novamente mais tarde.", false);
                }
            }
        }
        catch (Exception ex)
        {
            Mensagem.ShowMessage('E', "Erro: " + ex.Message, false);
        }
        Thread.CurrentThread.CurrentCulture = new CultureInfo("pt-BR");
    }
}
