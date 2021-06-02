using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Inspector.Classes;
using System.Security.Cryptography;
/// <summary>
/// Descrição resumida de UsuarioDB
/// </summary>
/// 
namespace Inspector.Persist
{
    public class UsuarioDB
    {
        public string PswHash(string senha)
        {
            byte[] salt;
            new RNGCryptoServiceProvider().GetBytes(salt = new byte[16]);
            var pbkdf2 = new Rfc2898DeriveBytes(senha, salt, 100000);
            byte[] hash = pbkdf2.GetBytes(20);
            byte[] hashBytes = new byte[36];
            Array.Copy(salt, 0, hashBytes, 0, 16);
            Array.Copy(hash, 0, hashBytes, 16, 20);
            string senhaHash = Convert.ToBase64String(hashBytes);
            return senhaHash;
        }

        //Métodos
        //Insert
        public bool Insert(Usuario user)
        {
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "INSERT INTO[dbo].[Usuario]([Username], [Senha], [Nome], [Email], [Nivel], [IsBlock]) VALUES('" + user.Username + "', '" + user.Senha + "', '" + user.Nome + "', '" + user.Email + "', '" + user.Nivel + "', '" + user.IsBlock + "')";
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