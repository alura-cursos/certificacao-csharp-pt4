using System;
using System.Linq;

namespace _01.ByteBank
{
    class CaixaEletronico
    {
        private Conta conta;
        public CaixaEletronico()
        {
            ExibirLogo();
            conta = new Conta(100);
        }

        private static void ExibirLogo()
        {
            Console.ForegroundColor = ConsoleColor.Yellow;
            Console.WriteLine(
@"
█▀▀▄ █░░█ ▀▀█▀▀ █▀▀ █▀▀▄ █▀▀█ █▀▀▄ █░█
█▀▀▄ █▄▄█ ░░█░░ █▀▀ █▀▀▄ █▄▄█ █░░█ █▀▄
▀▀▀░ ▄▄▄█ ░░▀░░ ▀▀▀ ▀▀▀░ ▀░░▀ ▀░░▀ ▀░▀");

            Console.WriteLine("****************************");
            Console.WriteLine("*** CAIXA ELETRÔNICO 2.0 ***");
            Console.WriteLine("****************************");
            Console.WriteLine("*      SEJA BEM-VINDO      *");
            Console.WriteLine("****************************");

            Console.ForegroundColor = ConsoleColor.White;
        }

        public void Sacar(decimal quantia)
        {
            var resultado = conta.SacarDinheiro(quantia);

            //if (resultado == ResultadoOperacao.OperacaoIniciada)
            //{
            //    Console.WriteLine("Resultado: Operacão iniciada");
            //}
            //else if (resultado == ResultadoOperacao.SaldoInsuficiente)
            //{
            //    Console.WriteLine("Resultado: Saldo insuficiente");
            //}
            //else if (resultado == ResultadoOperacao.Sucesso)
            //{
            //    Console.WriteLine("Resultado: Sucesso");
            //}
            //else if (resultado == ResultadoOperacao.ErroNaoTemDinheiro)
            //{
            //    Console.WriteLine("Resultado: Erro não tem dinheiro");
            //}
            //else if (resultado == ResultadoOperacao.ErroComunicacaoComServidor)
            //{
            //    Console.WriteLine("Resultado: Erro de comunicação com Servidor");
            //}
            //else 
            //{
            //    Console.WriteLine("Resultado: Erro desconhecido");
            //}

            //TAREFA:
            //IMPLEMENTAR AS INSTRUÇÕES ACIMA COMO UM
            //BLOCO DE INSTRUÇÕES SWITCH-CASE

            switch (resultado)
            {
                case ResultadoOperacao.OperacaoIniciada:
                    Console.WriteLine("Resultado: Operacão iniciada");
                    break;
                case ResultadoOperacao.SaldoInsuficiente:
                    Console.WriteLine("Resultado: Saldo insuficiente");
                    break;
                case ResultadoOperacao.Sucesso:
                    Console.WriteLine("Resultado: Sucesso");
                    break;
                case ResultadoOperacao.ErroNaoTemDinheiro:
                    Console.WriteLine("Resultado: Erro não tem dinheiro");
                    break;
                case ResultadoOperacao.ErroComunicacaoComServidor:
                    Console.WriteLine("Resultado: Erro de comunicação com Servidor");
                    break;
                default:
                    Console.WriteLine("Resultado: Erro desconhecido");
                    break;
            }
        }
    }

    class Conta
    {
        private decimal saldo = 0m;

        public Conta(decimal saldo)
        {
            this.saldo = saldo;
            Console.WriteLine(this);
        }

        public ResultadoOperacao SacarDinheiro(decimal quantia)
        {
            ResultadoOperacao resultado =
                ResultadoOperacao.OperacaoIniciada;
            if (saldo < quantia)
            {
                Console.WriteLine("Saldo insuficiente.");
                return ResultadoOperacao.SaldoInsuficiente;
            }
            resultado = Sacar(quantia);
            ImprimirComprovante();
            return resultado;

            ///<image url="$(ProjectDir)\img3.png"/>
        }

        private bool TemSaldoSuficiente(decimal quantia)
        {
            return quantia <= saldo;
        }

        private void ImprimirComprovante()
        {
            Console.WriteLine("Comprovante impresso.");
        }

        private ResultadoOperacao Sacar(decimal quantia)
        {
            ResultadoOperacao resultado;
            resultado = GetResultadoEquipamento();

            if (resultado != ResultadoOperacao.Sucesso)
            {
                return resultado;
            }
            Console.WriteLine($"Sacando {quantia:C}");
            saldo = saldo - quantia;
            Console.WriteLine(this);
            return resultado;
        }

        private static ResultadoOperacao GetResultadoEquipamento()
        {
            ResultadoOperacao resultado;
            int[] resultados = new[] { 2, 3, 4 };
            var aleatorio = resultados.OrderBy(n => Guid.NewGuid()).First();
            resultado = (ResultadoOperacao)aleatorio;
            return resultado;
        }

        public override string ToString()
        {
            return $"Saldo: {saldo:C}";
        }
    }

    public enum ResultadoOperacao
    {
        OperacaoIniciada = 0,
        SaldoInsuficiente = 1,
        Sucesso = 2,
        ErroNaoTemDinheiro = 3,
        ErroComunicacaoComServidor = 4
    }
}
