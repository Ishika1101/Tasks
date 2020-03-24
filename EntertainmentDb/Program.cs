using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntertainmentDb
{
    class Program
    {
        static void Main(string[] args)
        {
            Movies movie = new Movies();
            Actors actor = new Actors();
            Associative relation= new Associative();
            Console.WriteLine("Enter Choice:");
            int choice = Convert.ToInt32(Console.ReadLine());
            switch (choice)
            {
                case 1:
                    movie.AddMovies();
                    break;
                case 2:
                    movie.DeleteMovie();
                    break;
                case 3:
                    actor.AddActors();
                    break;
                case 4:

                   actor.DeleteActors();
                    break;
                case 5:

                    relation.CastActors();
                    break;
                case 6:

                    relation.ViewCastActors();
                   
                    break;
                default:
                    Console.WriteLine("Exit");
                    break;
            }

        }
    }
}
