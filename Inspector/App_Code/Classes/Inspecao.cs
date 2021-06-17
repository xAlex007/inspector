using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Inspector.Classes
{
    public class Inspecao
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public string Corrida { get; set; }
        [Required]
        public string Plano { get; set; }
        [Required]
        public string Inspetor { get; set; }
        [Required]
        public DateTime Horario { get; set; }
        public DateTime Modificado { get; set; }
        public ICollection<ValoresInspecao> ValoresInspecoes { get; set; }
        public Inspecao()
        {
            // TODO: Adicionar lógica do construtor aqui
        }
    }
}
