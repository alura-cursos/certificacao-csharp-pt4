using System;

namespace _03.ByteBank
{
    class ExemplosComIf
    {
        public static void IfSemElse()
        {
            // instrução if sem um else  
            bool condicao = true;
            if (condicao)
            {
                //instrução then;
                FacaAlgo();
            }
            // Próxima instrução do programa. 
        }

        public static void IfElse()
        {
            bool condicao = true;

            if (condicao)
            {
                Console.WriteLine(
                    "A expressão foi avaliada como verdadeiro.");
            }
            else
            {
                Console.WriteLine(
                    "A expressão foi avaliada como falso.");
            }
        }

        public static void IfAninhado()
        {
            int m = 12;
            int n = 18;

            if (m > 10)
                if (n > 20)
                {
                    Console.WriteLine("Resultado 1");
                }
                else
                {
                    Console.WriteLine("Resultado 2");
                }

            if (m > 10)
            {
                if (n > 20)
                    Console.WriteLine("Result1");
            }
            else
            {
                Console.WriteLine("Result2");
            }
        }

        public static void IfTesteCaracteres()
        {
            Console.Write("Digite um caractere: ");
            char c = (char)Console.Read();
            if (Char.IsLetter(c))
            {
                if (Char.IsLower(c))
                {
                    Console.WriteLine("O caractere é minúsculo.");
                }
                else
                {
                    Console.WriteLine("O caractere é maiúsculo.");
                }
            }
            else
            {
                Console.WriteLine("O caractere não é alfabético.");
            }
        }

        public static void IfTesteConsoleRead()
        {
            Console.Write("Digite um caractere: ");
            char ch = (char)Console.Read();

            if (Char.IsUpper(ch))
            {
                Console.WriteLine("O caractere é maiúsculo.");
            }
            else if (Char.IsLower(ch))
            {
                Console.WriteLine("O caractere é minúsculo.");
            }
            else if (Char.IsDigit(ch))
            {
                Console.WriteLine("O caractere é um número.");
            }
            else
            {
                Console.WriteLine("O caractere não é alfanumérico.");
            }
        }

        public static void IfNot()
        {
            bool resultado = true;
            if (!resultado)
            {
                Console.WriteLine(
                    "A condição é verdadeira (resultado é falso).");
            }
            else
            {
                Console.WriteLine(
                    "A condição é falsa (resultado é verdadeiro).");
            }
        }

        public static void IfAndOr()
        {
            int m0 = 9;
            int n0 = 7;
            if (m0 >= n0)
            {
                Console.WriteLine("m0 é maior ou igual a n0.");
            }

            // AND curto-circuito
            int m1 = 9;
            int n1 = 7;
            int p1 = 5;
            if (m1 >= n1 && m1 >= p1)
            {
                Console.WriteLine("Nada é maior que m1.");
            }

            // AND e NOT
            if (m1 >= n1 && !(p1 > m1))
            {
                Console.WriteLine("Nada é maior que m1.");
            }

            // OR curto-circuito
            if (m1 > n1 || m1 > p1)
            {
                Console.WriteLine("m não é o menor.");
            }

            // NOT e OR  
            m1 = 4;
            if (!(m1 >= n1 || m1 >= p1))
            {
                Console.WriteLine("agora me é o menor.");
            }
        }

        public static void OperadoresRelacionais()
        {
            dynamic x = 10;
            dynamic y = 23;

            if (x == y)
                Console.WriteLine("x igual a y");
            if (x != y)
                Console.WriteLine("x diferente de y");
            if (x < y)
                Console.WriteLine("menor que(verdadeiro se x for menor que y)");
            if (x > y)
                Console.WriteLine("maior que(verdadeiro se x for maior que y)");
            if (x <= y)
                Console.WriteLine("menor ou igual a");
            if (x >= y)
                Console.WriteLine("maior que ou igual a");
        }

        public static void OperadoresTesteTipo()
        {
            dynamic x = 10m;

            if (x is int)
                Console.WriteLine("x é int");
            if (x is long)
                Console.WriteLine("x é long");
            if (x is decimal)
                Console.WriteLine("x é decimal");
        }

        public static void FacaAlgo()
        {
            Console.WriteLine("Fazendo algo...");
        }

        public static void IfThenElseIfElse()
        {
            bool valor = true;

            if (valor)
            {
                Console.WriteLine("bloco then");
            }
            else if (valor)
            {
                Console.WriteLine("else if");
            }
            else if (valor)
            {
                Console.WriteLine("else if 2");
            }
            else
            {
                Console.WriteLine("else");
            }
        }
    }
}