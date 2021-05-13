using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Inspector.Models
{
    public class InicializacaoDB
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
                new Usuario{User="Alex", Nome="Alex Afonso M. P. de Oliveira", Email="suporteti@cecal.com.br", Block=false},
                new Usuario{User="Diogo", Nome="Diogo W. Rangel", Email="rangel.diogo@cecal.com.br", Block=false},
                new Usuario{User="Alexandre", Nome="Alexandre Reis Marques", Email="marques.alexandre@cecal.com.br", Block=false},
                new Usuario{User="Angelo", Nome="Angelo Espindola", Email="espindola.angelo@cecal.com.br", Block=true},
                new Usuario{User="Fabio", Nome="Fabio Henrique dos Santos", Email="santos.fabio@cecal.com.br", Block=false},
            };

            foreach (var item in usuarios)
            {
                context.Usuarios.Add(item);
            }

            context.SaveChanges();
        }
    }
}
