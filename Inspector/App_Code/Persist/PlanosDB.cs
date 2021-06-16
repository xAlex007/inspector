using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Inspector.Classes;

namespace Inspector.Persist
{
    public class PlanosDB
    {
        //Métodos
        //Insert
        public bool Insert(PlanoInspecao plano)
        {
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "INSERT INTO[dbo].[PlanoInspecao]([OP], [Produto], [QtPecas]) VALUES('" + plano.OP + "', '" + plano.Produto + "', '" + plano.QtPecas + "')";
            SqlCommand cmd = new SqlCommand(sql, _context);
            _context.Open();
            int m = cmd.ExecuteNonQuery();
            _context.Close();

            cmd.Dispose();
            _context.Dispose();
            if (m != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //SelectAll
        public  DataSet SelectAll()
        {
            DataSet ds = new DataSet();
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "SELECT P.OP, P.Produto, P.QtPecas, P.QtTotalizada, T.Desenho, T.Posicao FROM [dbo].PlanoInspecao AS P INNER JOIN [dbo].Template AS T ON P.Produto = T.Produto";
            SqlDataAdapter cmd = new SqlDataAdapter(sql, _context);
            _context.Open();
            cmd.Fill(ds, "PlanoInspecao");
            _context.Close();

            cmd.Dispose();
            _context.Dispose();
            return ds;
        }

        //Search
        public DataSet Search(string op)
        {
            DataSet ds = new DataSet();
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "SELECT P.OP, P.Produto, P.QtPecas, P.QtTotalizada, T.Desenho, T.Posicao FROM [dbo].PlanoInspecao AS P INNER JOIN [dbo].Template AS T ON P.Produto = T.Produto WHERE OP Like '%" + op + "%'";
            SqlDataAdapter cmd = new SqlDataAdapter(sql, _context);
            _context.Open();
            cmd.Fill(ds, "PlanoInspecao");
            _context.Close();

            cmd.Dispose();
            _context.Dispose();
            return ds;
        }

        //Select
        public PlanoInspecao Select(string op)
        {
            PlanoInspecao obj = null;
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "SELECT * FROM [dbo].[PlanoInspecao] WHERE OP = '" + op + "'";
            SqlCommand cmd = new SqlCommand(sql, _context);
            _context.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                obj = new PlanoInspecao();
                obj.OP = Convert.ToString(reader["OP"]);
                obj.Produto = Convert.ToString(reader["Produto"]);
            }
            _context.Close();

            cmd.Dispose();
            _context.Dispose();
            return obj;
        }

        //Filter
        public DataSet Filter(string op6)
        {
            DataSet ds = new DataSet();
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "SELECT VI.OP, VI.PRODUTO, T.Desenho, T.Posicao, T.Cotas, T.PDF, T.XLT FROM [dbo].[VIEW_INSPECOES] VI INNER JOIN [dbo].[Template] T ON VI.PRODUTO = T.Produto WHERE OP Like '" + op6 + "%' AND STATUS != 'true' ORDER BY OP";
            SqlDataAdapter cmd = new SqlDataAdapter(sql, _context);
            _context.Open();
            cmd.Fill(ds, "VIEW_INSPECOES");
            _context.Close();

            cmd.Dispose();
            _context.Dispose();
            return ds;
        }

        //Status de integração na tabela de integração
        public bool Integrate(string plano, bool integrationStatus)
        {
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "";
            if (integrationStatus == true)
            {
                sql = "UPDATE [dbo].[VIEW_INSPECOES] SET STATUS = 'true' WHERE OP = '" + plano + "'";
            }
            else
            {
                sql = "UPDATE [dbo].[VIEW_INSPECOES] SET STATUS = 'false' WHERE OP = '" + plano + "'";
            }
            SqlCommand cmd = new SqlCommand(sql, _context);
            _context.Open();
            int m = cmd.ExecuteNonQuery();
            _context.Close();

            cmd.Dispose();
            _context.Dispose();
            if (m != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //Detalhes do plano para inspeção
        public DataSet PlanDetails(string op)
        {
            DataSet ds = new DataSet();
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "SELECT P.OP, P.Produto, T.Desenho, T.Posicao, T.Cotas, P.QtPecas, P.QtTotalizada FROM [dbo].[PlanoInspecao] P INNER JOIN [dbo].[Template] T ON P.PRODUTO = T.Produto WHERE OP='" + op + "'";
            SqlDataAdapter cmd = new SqlDataAdapter(sql, _context);
            _context.Open();
            cmd.Fill(ds, "PlanoInspecao");
            _context.Close();

            cmd.Dispose();
            _context.Dispose();
            return ds;
        }

        //Update
        public bool Update(string op)
        {
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);            
            string sql = "UPDATE [dbo].[PlanoInspecao] SET QtTotalizada = QtTotalizada + 1 WHERE OP = '" + op + "'";
            SqlCommand cmd = new SqlCommand(sql, _context);
            _context.Open();
            int m = cmd.ExecuteNonQuery();
            _context.Close();

            cmd.Dispose();
            _context.Dispose();
            if (m != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //Delete
        public bool Delete(string op)
        {
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "DELETE FROM [dbo].[PlanoInspecao] WHERE OP = '" + op + "'";
            SqlCommand cmd = new SqlCommand(sql, _context);
            _context.Open();
            int m = cmd.ExecuteNonQuery();
            _context.Close();

            cmd.Dispose();
            _context.Dispose();
            if (m != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //Construtor
        public PlanosDB()
        {
            // TODO: Add constructor logic here
        }
    }
}
