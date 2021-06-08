using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Inspector.Classes
{
    /// <summary>
    /// Descrição resumida de Template
    /// </summary>
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
