using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_templates : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void b_newtemplate_Click(object sender, EventArgs e)
    {
        //Response.Write("<script></script>");
        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "openModal();", true);
    }
}