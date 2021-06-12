using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Inspector.Classes
{
    public class Template
    {
        [Key]
        public string Produto { get; set; }
        [Required]
        public string Desenho { get; set; }
        [Required]
        public string Posicao { get; set; }
        [Required]
        public int Cotas { get; set; }
        [Required]
        public string PDF { get; set; }
        [Required]
        public string XLT { get; set; }
        public ICollection<PlanoInspecao> Planos { get; set; }
        public Template()
        {
            // TODO: Adicionar lógica do construtor aqui
        }
    }
}
