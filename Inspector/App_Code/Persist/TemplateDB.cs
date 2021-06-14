using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Inspector.Classes;

namespace Inspector.Persist
{
    public class TemplateDB
    {
        //Métodos
        //Insert
        public bool Insert(Template template)
        {
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "INSERT INTO[dbo].[Template]([Produto], [Desenho], [Posicao], [Cotas], [PDF], [XLT]) VALUES('" + template.Produto + "', '" + template.Desenho + "', '" + template.Posicao + "', '" + template.Cotas + "', '" + template.PDF + "', '" + template.XLT + "')";
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
            string sql = "SELECT * FROM [dbo].[Template]";
            SqlDataAdapter cmd = new SqlDataAdapter(sql, _context);
            _context.Open();
            cmd.Fill(ds, "Template");
            _context.Close();

            cmd.Dispose();
            _context.Dispose();
            return ds;
        }

        //Search
        public DataSet Search(string produto)
        {
            DataSet ds = new DataSet();
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "SELECT * FROM [dbo].[Template] WHERE Produto Like '%" + produto + "%'";
            SqlDataAdapter cmd = new SqlDataAdapter(sql, _context);
            _context.Open();
            cmd.Fill(ds, "Template");
            _context.Close();

            cmd.Dispose();
            _context.Dispose();
            return ds;
        }

        //Select
        public Template Select(string produto)
        {
            Template obj = null;
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "SELECT * FROM [dbo].[Template] WHERE Produto = '" + produto + "'";
            SqlCommand cmd = new SqlCommand(sql, _context);
            _context.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                obj = new Template();
                obj.Produto = Convert.ToString(reader["Produto"]);
                obj.Desenho = Convert.ToString(reader["Desenho"]);
                obj.Posicao = Convert.ToString(reader["Posicao"]);
                obj.Cotas = Convert.ToInt32(reader["Cotas"]);
                obj.PDF = Convert.ToString(reader["PDF"]);
                obj.XLT = Convert.ToString(reader["XLT"]);
            }
            _context.Close();

            cmd.Dispose();
            _context.Dispose();
            return obj;
        }

        //Update
        public bool Update(Template template)
        {
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);            
            string sql = "UPDATE [dbo].[Template] SET Desenho = '" + template.Desenho + "', Posicao = '" + template.Posicao + "', Cotas = '" + template.Cotas + "', PDF = '" + template.PDF + "', XLT = '" + template.XLT + "' WHERE Produto = '" + template.Produto + "'";
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
        public bool Delete(string produto)
        {
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "DELETE FROM [dbo].[Template] WHERE Produto = '" + produto + "'";
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
        public TemplateDB()
        {
            // TODO: Add constructor logic here
        }
    }
}
