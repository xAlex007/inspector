using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Inspector.Classes;

namespace Inspector.Persist
{
    public class InspecaoDB
    {
        //Métodos
        //Insert
        public bool Insert(Inspecao inspecao)
        {
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "INSERT INTO[dbo].[Inspecao]([Corrida], [Plano], [Inspetor], [Horario]) VALUES('" + inspecao.Corrida + "', '" + inspecao.Plano + "', '" + inspecao.Inspetor + "', '" + inspecao.Horario + "')";
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
            string sql = "SELECT Corrida, Plano, Inspetor, Horario, Modificado FROM [dbo].[Inspecao]";
            SqlDataAdapter cmd = new SqlDataAdapter(sql, _context);
            _context.Open();
            cmd.Fill(ds, "Inspecao");
            _context.Close();

            cmd.Dispose();
            _context.Dispose();
            return ds;
        }

        //Search
        public DataSet Search(string corrida)
        {
            DataSet ds = new DataSet();
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "SELECT Corrida, Plano, Inspetor, Horario, Modificado FROM [dbo].[Inspecao] WHERE Corrida Like '%" + corrida + "%'";
            SqlDataAdapter cmd = new SqlDataAdapter(sql, _context);
            _context.Open();
            cmd.Fill(ds, "Inspecao");
            _context.Close();

            cmd.Dispose();
            _context.Dispose();
            return ds;
        }

        //Search by Plan
        public DataSet SearchByPlan(string op)
        {
            DataSet ds = new DataSet();
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "SELECT Corrida, Plano, Inspetor, Horario, Modificado FROM [dbo].[Inspecao] WHERE Plano Like '%" + op + "%'";
            SqlDataAdapter cmd = new SqlDataAdapter(sql, _context);
            _context.Open();
            cmd.Fill(ds, "Inspecao");
            _context.Close();

            cmd.Dispose();
            _context.Dispose();
            return ds;
        }

        //Search by Plan
        public DataSet SearchHtByPlan(string op, string corrida)
        {
            DataSet ds = new DataSet();
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "SELECT Corrida, Plano, Inspetor, Horario, Modificado FROM [dbo].[Inspecao] WHERE Plano = '" + op + "' AND Corrida Like '%" + corrida + "%'";
            SqlDataAdapter cmd = new SqlDataAdapter(sql, _context);
            _context.Open();
            cmd.Fill(ds, "Inspecao");
            _context.Close();

            cmd.Dispose();
            _context.Dispose();
            return ds;
        }

        //Select
        public Inspecao Select(string corrida)
        {
            Inspecao obj = null;
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "SELECT * FROM [dbo].[Inspecao] WHERE Corrida = '" + corrida + "'";
            SqlCommand cmd = new SqlCommand(sql, _context);
            _context.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                obj = new Inspecao();
                obj.Id = Convert.ToInt32(reader["Id"]);
                obj.Corrida = Convert.ToString(reader["Corrida"]);
                obj.Plano = Convert.ToString(reader["Plano"]);
                obj.Inspetor = Convert.ToString(reader["Inspetor"]);
                obj.Horario = Convert.ToDateTime(reader["Horario"]);
            }
            _context.Close();

            cmd.Dispose();
            _context.Dispose();
            return obj;
        }        

        //Update
        public bool Update(Inspecao inspecao)
        {
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);            
            string sql = "UPDATE [dbo].[Inspecao] SET Modificado = '" + inspecao.Modificado + "' WHERE Corrida = '" + inspecao.Corrida + "'";
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
            string sql = "DELETE FROM [dbo].[Inspecao] WHERE Corrida = '" + corrida + "'";
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

        public InspecaoDB()
        {
            // TODO: Add constructor logic here
        }

    }
}
