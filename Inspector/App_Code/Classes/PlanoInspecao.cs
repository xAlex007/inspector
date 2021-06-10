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
    public class PlanoInspecao
    {
        [Key]
        public string OP { get; set; }
        [Required]
        public string Produto { get; set; }
        [Required]
        public int QtPecas { get; set; }
        public PlanoInspecao()
        {
            // TODO: Adicionar lógica do construtor aqui
        }
    }
}
