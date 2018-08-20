using System;

namespace _01.ByteBank
{
    class ContaBancaria
    {
        private decimal saldo = 0m;

        public ContaBancaria(decimal saldo)
        {
            this.saldo = saldo;
            Console.WriteLine(this);
        }

        public void SacarDinheiro(decimal quantia)
        {
            Sacar(quantia);
            ImprimirComprovante();
            ///< image url="$(ProjectDir)\img1.png"/>
        }

        private bool TemSaldoSuficiente(decimal quantia)
        {
            return quantia <= saldo;
        }

        private void ImprimirComprovante()
        {
            Console.WriteLine("Comprovante impresso.");
        }

        private void Sacar(decimal quantia)
        {
            Console.WriteLine($"Sacando {quantia:C}");
            saldo = saldo - quantia;
            Console.WriteLine(this);
        }

        public override string ToString()
        {
            return $"Saldo: {saldo:C}";
        }
    }
}