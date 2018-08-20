using System;
using System.Text.RegularExpressions;

namespace _03.ByteBank
{
    class Program
    {
        static void Main(string[] args)
        {
        }

        private static int GetFatorial(int numero)
        {
            //FATORIAL DE 5 = 5 x 4 x 3 x 2 x 1  = 120
            //FATORIAL DE 4 = 4 x 3 x 2 x 1      = 24
            //FATORIAL DE 3 = 3 x 2 x 1          = 6
            //FATORIAL DE 2 = 2 x 1              = 2 
            //FATORIAL DE 1                      = 1
            //FATORIAL DE 0                      = 1 

            int fatorial = 1;

            System.Console.WriteLine($"fatorial de {numero} é {fatorial}");

            return fatorial;
        }
    }
}