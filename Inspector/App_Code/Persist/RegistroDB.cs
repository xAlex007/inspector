using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Inspector.Classes;

/// <summary>
/// Descrição resumida de RegistroDB
/// </summary>
/// 

namespace Inspector.Persist
{
    public class RegistroDB
    {
        public bool Insert(Registro registro )
        {
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "INSERT INTO[dbo].[Registro]([cpf],[nome], [data_nascimento],[senha] ) VALUES('" + registro.cpf + "', '" + registro.nome + "', '" + registro.data_nascimento + "', '" + registro.senha +  "')";
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

    }
}