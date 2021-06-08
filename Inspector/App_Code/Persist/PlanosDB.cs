using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
            string sql = "INSERT INTO[dbo].[PlanoInspecao]([OP], [Produto]) VALUES('" + plano.OP + "', '" + plano.Produto + "')";
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
            string sql = "SELECT * FROM [dbo].[PlanoInspecao]";
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
            string connection = ConfigurationManager.ConnectionStrings["DADOSADV"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "SELECT * FROM [dbo].[VIEW_INSPECOES] WHERE OP Like '" + op6 + "%' AND STATUS != 'true' ORDER BY OP";
            SqlDataAdapter cmd = new SqlDataAdapter(sql, _context);
            _context.Open();
            cmd.Fill(ds, "VIEW_INSPECOES");
            _context.Close();

            cmd.Dispose();
            _context.Dispose();
            return ds;
        }

        //Update
        public bool Update(PlanoInspecao plano)
        {
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);            
            string sql = "UPDATE [dbo].[PlanoInspecao] SET Produto = '" + plano.Produto + "' WHERE OP = '" + plano.OP + "'";
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

        public PlanosDB()
        {
            // TODO: Add constructor logic here
        }

    }
}