using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de Login
/// </summary>
public class Usuario    
{
    public int Id { get; set; }
    public string Username { get; set; }
    public string Senha { get; set; }
    public string Nome { get; set; }
    public string Email { get; set; }
    public char Nivel { get; set; }
    public bool IsBlock { get; set; }

}