using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de Registro
/// </summary>
/// 

namespace Inspector.Classes
{
    public class Registro
    {
        [Key]
        public int cpf { get; set; }

        [Required]
        public string nome { get; set; }

        [Required]
        public int data_nascimento { get; set; }

        [Required]
        public string senha { get; set; }


    }
}