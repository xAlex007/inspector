using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI.WebControls;
using Inspector.Persist;

public partial class Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void bLogin_Click(object sender, EventArgs e)
    {

    }

    protected void btnLogar_Click(object sender, EventArgs e)
    {
        logar();
    }

    public void logar()
    {
        /*if (UsuarioDB.ValidarUsuario(UserName.Text, txtSenha.Text))
        {
            Response.Redirect("~/Default.aspx");
        }
        else
        {
            this.ExibirAlerta(Mensagem.TipoMensagem.Alerta, "Usuario não existe");
            return;
        } */
        
    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        string auth = this.ValidarUsuario(Login1.UserName, Login1.Password);

        if (auth == "OK")
        {
            FormsAuthentication.RedirectFromLoginPage(Login1.UserName, Login1.RememberMeSet);
        }
        else
        {
            Label lbl = (Label)Login1.FindControl("msg");
            lbl.Text = auth;
        }

    }

    public string ValidarUsuario(string usuario, string senha)
    {
        string retorno = null;
        UsuarioDB db = new UsuarioDB();

        if (db.IsAlphaNumeric(usuario))
        {
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            Usuario obj = null;
            string sql = "SELECT * FROM [dbo].[Usuario] WHERE Username = @usuario";
            SqlCommand cmd = new SqlCommand(sql, _context);
            SqlParameter user = new SqlParameter();
            user.ParameterName = "@usuario"; user.Value = usuario.Trim(); cmd.Parameters.Add(user);

            try
            {
                _context.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    obj = new Usuario();
                    obj.Senha = Convert.ToString(reader["Senha"]);
                    obj.Nivel = Convert.ToChar(reader["Nivel"]);
                    obj.IsBlock = Convert.ToBoolean(reader["IsBlock"]);

                    if (db.HashCompare(obj.Senha, senha))
                    {
                        if (!obj.IsBlock)
                        {
                            Session["Nivel"] = reader["Nivel"];
                            retorno = "OK";
                        }
                        else
                        {
                            retorno = "Usuário bloqueado.";
                        }
                    }
                    else
                    {
                        retorno = "Senha incorreta.";
                    }
                }
                else{
                    retorno = "Este usuário não existe.";
                }
                reader.Close();
            }
            catch
            {
                retorno = "Erro de conexão com o banco de dados. Tente novamente mais tarde.";
            }
            finally
            {
                _context.Close();
            }
        }
        else
        {
            retorno = "Formato de entrada inválido.";
        }
        return retorno;
    }
}