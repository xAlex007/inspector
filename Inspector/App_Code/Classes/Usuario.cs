using System.ComponentModel.DataAnnotations;

namespace Inspector.Classes
{
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
            // TODO: Adicionar lógica do construtor aqui
        }
    }
}
