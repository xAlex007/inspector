using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Inspector.Classes;

public partial class Pages_Registrar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lbRegistro_Click1(object sender, EventArgs e)
    {
        Registro Funcionario = new Registro();
        Funcionario.cpf = txtcpf.Text;
        Funcionario.data_nascimento = txtdatanascimento;
        Funcionario.nome = txtnome.Text;
        Funcionario.senha = txtsenha.Text;
    }
}