using System.ComponentModel.DataAnnotations;

namespace Inspector.Classes
{
    public class ValoresInspecao
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public string Corrida { get; set; }
        [Required]
        public int Cota { get; set; }
        [Required]
        public float ValorMedido { get; set; }
        public ValoresInspecao()
        {
            // TODO: Adicionar lógica do construtor aqui
        }
    }
}
