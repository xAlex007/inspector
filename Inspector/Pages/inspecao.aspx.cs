using Inspector.Classes;
using Inspector.Persist;
using System;
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
    protected bool edit { get; set; }
    protected string[] oldval { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {        
        if (!Page.IsPostBack)
        {
            this.Controles = 0;
            edit = false;
            ins_head.Attributes["style"] = "display: none;";
            ins_data.Attributes["style"] = "display: none;";
            if (Request.QueryString.Count == 0)
            {
                PlanosDB db = new PlanosDB();
                DataSet ds = db.SelectAll();
                ddl_planos.DataSource = ds.Tables[0];
                ddl_planos.DataValueField = "OP";
                ddl_planos.DataTextField = "OP";
                ddl_planos.DataBind();
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "$('#newModal').modal('show')", true);
            }
            else
            {
                string corrida = Request.QueryString["corrida"];
                InspecaoDB idb = new InspecaoDB();
                Inspecao inspecao = idb.Select(corrida);

                //Cabeçalho
                PlanosDB db = new PlanosDB();
                DataSet ds = db.PlanDetails(inspecao.Plano);
                l_op.Text = inspecao.Plano;
                l_prod.Text = ds.Tables[0].Rows[0][1].ToString();
                l_desp.Text = ds.Tables[0].Rows[0][2].ToString() + " Pos. " + ds.Tables[0].Rows[0][3].ToString();
                l_corr.Text = corrida;

                //Formulário
                ValoresDB vdb = new ValoresDB();
                DataSet vds = vdb.SelectAll(corrida);
                for (int i = 0; i < Convert.ToInt32(ds.Tables[0].Rows[0][4]); i++)
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
                    //oldval[i] = vds.Tables[0].Rows[i][3].ToString();
                    TextBox l_valor = new TextBox();
                    l_valor.ID = "l_valor" + Controles;
                    l_valor.Text = vds.Tables[0].Rows[i][3].ToString();
                    l_valor.Enabled = false;
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
                ins_head.Attributes["style"] = "display: normal;";
                ins_data.Attributes["style"] = "display: normal;";
                bSave.Attributes["style"] = "display: none;";
                bEdit.Attributes["style"] = "display: normal;";
            }
        }
        else
        {
            this.GetForm();
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
        Response.Redirect("~/Pages/home.aspx");
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
                l_op.Text = ddl_planos.SelectedValue;
                l_prod.Text = ds.Tables[0].Rows[0][1].ToString();
                l_desp.Text = ds.Tables[0].Rows[0][2].ToString() + " Pos. " + ds.Tables[0].Rows[0][3].ToString();
                l_corr.Text = i_newcorr.Text;
                //Formulário
                for (int i = 0; i < Convert.ToInt32(ds.Tables[0].Rows[0][4]); i++)
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
                ins_head.Attributes["style"] = "display: normal;";
                ins_data.Attributes["style"] = "display: normal;";
            }
        }
        else
        {
            Mensagem.ShowMessage('A', "Alerta: A corrida <b>" + i_newcorr.Text + "</b> já foi inspecionada.");
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
            InspecaoDB db = new InspecaoDB();
            ValoresDB vdb = new ValoresDB();
            ValoresInspecao valor = new ValoresInspecao();
            //Salvar
            if (edit == false)
            {
                if (db.Insert(inspecao))
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
                if (fail == false)
                {
                    Mensagem.ShowMessage('S', "Inspeção para a corrida <b>" + l_corr.Text + "</b> registrada com sucesso.");
                }
                else
                {
                    Mensagem.ShowMessage('E', "Não foi possível salvar.Tente novamente mais tarde.");
                }
            }
            //Editar
            else
            {
                inspecao.Modificado = DateTime.Now;
                if (db.Update(inspecao))
                {
                    int i = 1;
                    foreach (Control c in pnl_regs.Controls)
                    {
                        if ((c as TextBox).Text != oldval[i])
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
                    }
                }
                else
                {
                    fail = true;
                }
                if (fail == false)
                {
                    Mensagem.ShowMessage('S', "Inspeção para a corrida <b>" + l_corr.Text + "</b> editada com sucesso.");
                }
                else
                {
                    Mensagem.ShowMessage('E', "Não foi possível salvar.Tente novamente mais tarde.");
                }
            }
        }
        catch (Exception ex)
        {
            Mensagem.ShowMessage('E', "Erro: " + ex.Message);
        }
        Thread.CurrentThread.CurrentCulture = new CultureInfo("pt-BR");
    }

    protected void bEdit_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < Controles; i++)
        {
            TextBox l_valor = (TextBox)pnl_regs.FindControl("l_valor" + i);
            l_valor.Enabled = true;
        }
        edit = true;
        bSave.Attributes["style"] = "display: normal;";
        bEdit.Attributes["style"] = "display: none;";
    }
}
