using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inspector.Classes
{
    public class Mensagem
    {
        public static void ShowMessage(char type, string prompt)
        {
            Literal msgtype = new Literal();
            Label msg = new Label();
            Page page = HttpContext.Current.Handler as Page;
            var pagehandler = HttpContext.Current.CurrentHandler;
            if (pagehandler is Page)
            {
                msgtype = (Literal)((Page)pagehandler).Master.FindControl("l_msgtype");
                msg = (Label)((Page)pagehandler).Master.FindControl("l_status");
            }
            msg.Text = prompt;
            switch (type)
            {
                case 'S':
                    msgtype.Text += "<div class='modal-header justify-content-center bg-success'>";
                    msgtype.Text += "<h5 class='modal-title'><img src = '../Src/img/success.png' height='32'/></h5>";
                    msgtype.Text += "</div>";
                    break;
                case 'A':
                    msgtype.Text += "<div class='modal-header justify-content-center bg-warning'>";
                    msgtype.Text += "<h5 class='modal-title'><img src = '../Src/img/warning.png' height='32'/></h5>";
                    msgtype.Text += "</div>";
                    break;
                case 'E':
                    msgtype.Text += "<div class='modal-header justify-content-center bg-danger'>";
                    msgtype.Text += "<h5 class='modal-title'><img src = '../Src/img/error.png' height='32'/></h5>";
                    msgtype.Text += "</div>";
                    break;
            }
            ScriptManager.RegisterStartupScript(page, page.GetType(), "Mensagem", "Mensagem();", true);
        }

        public Mensagem()
        {
            // TODO: Adicionar lógica do construtor aqui
        }
    }
}