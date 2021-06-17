using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Inspector.Classes;

namespace Inspector.Persist
{
    public class ValoresDB
    {
        //Métodos
        //Insert
        public bool Insert(ValoresInspecao valor)
        {
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "INSERT INTO[dbo].[ValoresInspecao]([Corrida], [Cota], [ValorMedido]) VALUES('" + valor.Corrida + "', '" + valor.Cota + "', '" + valor.ValorMedido + "')";
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
        public DataSet SelectAll(string corrida)
        {
            DataSet ds = new DataSet();
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "SELECT * FROM [dbo].[ValoresInspecao] WHERE Corrida = '" + corrida + "'";
            SqlDataAdapter cmd = new SqlDataAdapter(sql, _context);
            _context.Open();
            cmd.Fill(ds, "ValoresInspecao");
            _context.Close();

            cmd.Dispose();
            _context.Dispose();
            return ds;
        }

        //Update
        public bool Update(ValoresInspecao valor)
        {
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);            
            string sql = "UPDATE [dbo].[ValoresInspecao] SET ValorMedido = '" + valor.ValorMedido + "' WHERE Corrida = '" + valor.Corrida + "' AND Cota = '" + valor.Cota + "'";
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
        public bool Delete(string corrida)
        {
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "DELETE FROM [dbo].[ValoresInspecao] WHERE Corrida = '" + corrida + "'";
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

        public ValoresDB()
        {
            // TODO: Add constructor logic here
        }
    }
}
