using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de Usuario
/// </summary>
public class Usuario    
{
    [Key]
    public int Id { get; set; }
    [Key]
    public string Username { get; set; }
    [Required]
    public string Senha { get; set; }
    [Required]
    public string Nome { get; set; }
    public string Email { get; set; }
    [Required]
    public char Nivel { get; set; }
    [Required]
    public bool IsBlock { get; set; }
    public Usuario()
    {
        //
        // TODO: Adicionar lógica do construtor aqui
        //
    }
}