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
        l_clock.Text = DateTime.Now.ToLongTimeString();
        string nv = (string)(Session["Nivel"]);
        if (nv != null && nv != "I")
        {
            manageMenu.Text = "<div class='col-9 col-sm-8 col-lg-5 col-xl-4 ms-lg-5 mt-5 mt-lg-0 menu-border' style='border-color: #4B84D8; background-color: rgba(255,255,255,0.5);'>";
            manageMenu.Text += "<div class='row g-5 row-cols-2 py-5'>";
            manageMenu.Text += "<div class='col d-flex justify-content-end'>";
            manageMenu.Text += "<a title='Templates' href = 'templates.aspx' class='item-gerenciamento pt-3 px-3'><img src = '../Src/img/template.png' style='height: 70px;'></a>";
            manageMenu.Text += "</div>";
            manageMenu.Text += "<div class='col d-flex justify-content-start'>";
            manageMenu.Text += "<a title='Planos de Inspeção' href = 'plans.aspx' class='item-gerenciamento p-2'><img src = '../Src/img/test-passed.png' style='height: 85px;'></a>";
            manageMenu.Text += "</div>";
            manageMenu.Text += "<div class='col d-flex justify-content-end'>";
            manageMenu.Text += "<a title='Relatórios' href = '#' class='item-gerenciamento pt-25'><img src = '../Src/img/doughnut-chart.png' style='height: 80px;'></a>";
            manageMenu.Text += "</div>";
            manageMenu.Text += "<div class='col d-flex justify-content-start'>";
            manageMenu.Text += "<a title='Databooks' href = '#' class='item-gerenciamento pt-3 px-29'><img src = '../Src/img/book-stack.png' style='height: 75px;'></a>";
            manageMenu.Text += "</div></div></div>";
        }
    }

    protected void Clock_Tick(object sender, EventArgs e)
    {
        l_clock.Text = DateTime.Now.ToLongTimeString();
    }
}