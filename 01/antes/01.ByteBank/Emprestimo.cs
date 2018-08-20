using System;

namespace _01.ByteBank
{
    public class Emprestimo
    {
        private int prazo;
        private const int PRAZO_MAXIMO_PAGAMENTO_ANOS = 5;
        private const decimal JUROS = 0.034m;

        private string codigoContrato;

        private bool ValidarCodigo(string codigoContrato)
        {
            bool codigoContratoValido = true;
            foreach (var caractere in codigoContrato)
            {
                //só é válido se for numérico ou maiúscula
                bool valido = false;
                if (!(valido))
                {
                    codigoContratoValido = false;
                    break;
                }
            }

            return codigoContratoValido;
        }

        public Emprestimo(string codigoContrato)
        {
            this.codigoContrato = codigoContrato;
            Console.WriteLine($"Novo empréstimo com código: {codigoContrato}");
        }

        public event PrazoMaximoEstouradoHandler OnPrazoMaximoEstourado;

        public int Prazo
        {
            get
            {
                return prazo;
            }
            set
            {
                //se o novo prazo for maior que o prazo máximo,
                //lançar um evento de "prazo estourado"
                //senão, definir o novo prazo.

                prazo = value;
                Console.WriteLine($"novo prazo: {prazo}");
            }
        }

        public decimal CalcularJuros(decimal valor, int prazo)
        {
            decimal valorJuros;
            decimal taxaJuros = 0;

            //1) se o prazo é maior que zero E menor que 5 E
            //o valor é menor que 7 mil, a taxa de juros é 3,5%
            //   1.1) senão, se o prazo for maior que 5 
            //        E o valor for maior que 7 mil, a taxa é 7,5%
            //   1.2) senão, a taxa de juros é 8,75%

            valorJuros = valor * taxaJuros * prazo;
            Console.WriteLine($"valorJuros: {valorJuros}");
            return valorJuros;
        }
    }

    public delegate void PrazoMaximoEstouradoHandler(object source, EventArgs e);
}