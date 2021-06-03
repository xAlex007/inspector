using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Login.Service;

public partial class Pages_Login : System.Web.UI.Page
{

    #region Propriedades

    LoginDB logindb = new LoginDB();

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
        txtSenha.Focus();
    }


}