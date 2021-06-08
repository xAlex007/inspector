using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
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
        usrini.Text = (string)(Session["Ini"]);
        string nv = (string)(Session["Nivel"]);
        if (nv != null && nv != "I")
        {
            HyperLink link = new HyperLink(); link.CssClass = "dropdown-item"; link.NavigateUrl = "~/Pages/usuarios.aspx"; link.Attributes.Add("runat", "server");
            Label txt = new Label(); txt.Text = " Gestão de Usuários";
            Image icon = new Image(); icon.ImageUrl = "~/Src/img/users.png"; icon.CssClass = "pb-1"; icon.Height = 32;
            link.Controls.Add(icon);
            link.Controls.Add(txt);
            ph_usr.Controls.Add(link);
        } 
        if (this.Page.User.Identity.IsAuthenticated)
        {
            userbtn.Visible = true;
        }
    }

    protected void b_logout_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Session.Abandon();
        HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, "");
        cookie.Expires = DateTime.Now.AddYears(-1);
        Response.Cookies.Add(cookie);
        SessionStateSection sessionStateSection = (SessionStateSection)WebConfigurationManager.GetSection("system.web/sessionState");
        HttpCookie cookie2 = new HttpCookie(sessionStateSection.CookieName, "");
        cookie2.Expires = DateTime.Now.AddYears(-1);
        Response.Cookies.Add(cookie2);
        FormsAuthentication.RedirectToLoginPage();
    }
}
