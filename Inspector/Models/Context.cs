using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Inspector.Models
{
    public class Context:DbContext
    {
        public Context(DbContextOptions<Context> options) : base(options)
        {
            InicializacaoDB.Initialize(this);
        }

        public DbSet<Usuario> Usuarios { get; set; }

    }
}
