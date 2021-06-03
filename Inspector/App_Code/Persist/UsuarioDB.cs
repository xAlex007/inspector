using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Inspector.Classes;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
/// <summary>
/// Descrição resumida de UsuarioDB
/// </summary>
/// 
namespace Inspector.Persist
{
    public class UsuarioDB
    {
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
        //Select
        public Usuario Select(int id)
        {
            Usuario obj = null;
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "SELECT * FROM [dbo].[Usuario] WHERE Id = '" + id + "'";
            SqlCommand cmd = new SqlCommand(sql, _context);
            _context.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                obj = new Usuario();
                obj.Id = Convert.ToInt32(reader["Id"]);
                obj.Username = Convert.ToString(reader["Username"]);
                obj.Nome = Convert.ToString(reader["Nome"]);
                obj.Email = Convert.ToString(reader["Email"]);
                obj.Nivel = Convert.ToChar(reader["Nivel"]);
                obj.IsBlock = Convert.ToBoolean(reader["IsBlock"]);
            }
            _context.Close();

            cmd.Dispose();
            _context.Dispose();
            return obj;
        }
        //Update
        public bool Update(Usuario user)
        {
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "UPDATE [dbo].[Usuario] SET Senha = '" + user.Senha + "', Nome = '" + user.Nome + "', Email = '" + user.Email + "', Nivel = '" + user.Nivel + "', IsBlock = '" + user.IsBlock + "' WHERE Id = '" + user.Id + "'";
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
        public bool Delete(int id)
        {
            string connection = ConfigurationManager.ConnectionStrings["InspectorDB"].ConnectionString;
            SqlConnection _context = new SqlConnection(connection);
            string sql = "DELETE FROM [dbo].[Usuario] WHERE Id = '" + id + "'";
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

        //Proteção contra SQL Injection
        public bool IsAlphaNumeric(string text)
        {
            return Regex.IsMatch(text, "^[a-zA-Z0-9]+$");
        }
        //Hashing de Senha
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
        //Validação Hash de Senha
        public bool HashCompare(string senhabd, string senha)
        {
            byte[] hashBytes = Convert.FromBase64String(senhabd);
            byte[] salt = new byte[16];
            Array.Copy(hashBytes, 0, salt, 0, 16);
            var pbkdf2 = new Rfc2898DeriveBytes(senha, salt, 100000);
            byte[] hash = pbkdf2.GetBytes(20);
            for (int i = 0; i < 20; i++)
            {
                if (hashBytes[i + 16] != hash[i])
                {
                    return false;
                }
            }
            return true;
        }
    }
}