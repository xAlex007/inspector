using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Inspector.Classes
{
    public class PlanoInspecao
    {
        [Key]
        public string OP { get; set; }
        [Required]
        public string Produto { get; set; }
        [Required]
        public int QtPecas { get; set; }
        public int QtTotalizada { get; set; }
        public ICollection<Inspecao> Inspecoes { get; set; }
        public PlanoInspecao()
        {
            // TODO: Adicionar lógica do construtor aqui
        }
    }
}
