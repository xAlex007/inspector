using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Inspector.Models
{
    public class DBInit
    {
        public static void Initialize(Context context)
        {
            context.Database.EnsureCreated();

            if (context.Usuarios.Any())
            {
                return;
            }

            var usuarios = new Usuario[]
            {
                new Usuario{Username="Alex", Nome="Alex Afonso M. P. de Oliveira", Email="suporteti@cecal.com.br", Block=false},
                new Usuario{Username="Diogo", Nome="Diogo W. Rangel", Email="rangel.diogo@cecal.com.br", Block=false},
                new Usuario{Username="Alexandre", Nome="Alexandre Reis Marques", Email="marques.alexandre@cecal.com.br", Block=false},
                new Usuario{Username="Angelo", Nome="Angelo Espindola", Email="espindola.angelo@cecal.com.br", Block=true},
                new Usuario{Username="Fabio", Nome="Fabio Henrique dos Santos", Email="santos.fabio@cecal.com.br", Block=false}
            };

            foreach(var item in usuarios)
            {
                context.Usuarios.Add(item);
            }

            context.SaveChanges();
        }
    }
}
