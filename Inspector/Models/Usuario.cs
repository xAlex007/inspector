﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Inspector.Models
{
    public class Usuario
    {
        public int Id { get; set; }
        public string User { get; set; }
        public string Nome { get; set; }
        public string Email { get; set; }
        public bool Block { get; set; }
    }
}

