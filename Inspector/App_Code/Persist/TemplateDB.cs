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
public class TemplateDB
{
        //Métodos
        //Insert
        public bool Insert(Template template)
        {
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            _context.Open();
            string sql = "INSERT INTO[dbo].[Template]([Produto], [Desenho], [Posicao], [Cotas], [PDF], [XLT]) VALUES(N'01261', N'CEC-100000', N'03', N'10', N'03.pdf', N'03.xlt')";
            SqlCommand cmd = new SqlCommand(sql, _context);
            int m = cmd.ExecuteNonQuery();
            _context.Close();
            if (m != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        //selectall
        //select
        //update
        //delete
        //construtor

        public TemplateDB()
        {
            //
            // TODO: Add constructor logic here
            //
        }

    }
}