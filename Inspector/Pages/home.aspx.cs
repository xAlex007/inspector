using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string nv = (string)(Session["Nivel"]);
        if (nv != null && nv != "I")
        {
            manageMenu.Text = "<div class='col-10 col-sm-8 col-lg-5 col-xl-4 ms-lg-5 mt-5 mt-lg-0 menu-border' style='border-color: #4B84D8; background-color: rgba(0,0,0,0.05);'>";
            manageMenu.Text += "<div class='row g-5 row-cols-2 py-5'>";
            manageMenu.Text += "<div class='col d-flex justify-content-end'>";
            manageMenu.Text += "<asp:HyperLink class='item-inspecao p-2' NavigateUrl='#' ToolTip='Registrar Inspeções51" runat='server'><asp:Image ImageUrl="~/Src/img/caliper.png" AlternateText="Registrar Inspeções" ToolTip="Registrar Inspeções" style="height: 90px;" runat="server" /></asp:HyperLink>" +
                "<a href = 'templates.aspx' class='item-gerenciamento p-2'><img src = '../Src/img/template.png' style='height: 90px;'></a>";
            manageMenu.Text += "</div>";
            manageMenu.Text += "<div class='col d-flex justify-content-start'>";
            manageMenu.Text += "<a href = 'plans.aspx' class='item-gerenciamento p-2'><img src = '../Src/img/test-passed.png' style='height: 90px;'></a>";
            manageMenu.Text += "</div>";
            manageMenu.Text += "<div class='col d-flex justify-content-end'>";
            manageMenu.Text += "<a href = '#' class='item-gerenciamento p-2'><img src = '../Src/img/doughnut-chart.png' style='height: 90px'></a>";
            manageMenu.Text += "</div>";
            manageMenu.Text += "<div class='col d-flex justify-content-start'>";
            manageMenu.Text += "<a href = '#' class='item-gerenciamento p-2'><img src = '../Src/img/book-stack.png' style='height: 84px; margin-left: 3px;' class='mt-1'></a>";
            manageMenu.Text += "</div></div></div>";
        }
    }
}