using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Master : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        #region Saudação
        int hora = (23 - DateTime.Now.Hour) / 6;
        switch (hora)
        {
            case 0:
                greet.Text = "Boa noite, " + this.Page.User.Identity.Name + "!";
                break;
            case 1:
                greet.Text = "Boa tarde, " + this.Page.User.Identity.Name + "!";
                break;
            case 2:
                greet.Text = "Bom dia, " + this.Page.User.Identity.Name + "!";
                break;
            case 3:
                greet.Text = "Boa madrugada, " + this.Page.User.Identity.Name + "!";
                break;
        }
        #endregion

    }
}
