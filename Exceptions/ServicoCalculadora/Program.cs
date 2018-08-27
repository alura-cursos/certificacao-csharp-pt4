using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ServiceModel;
using System.ServiceModel.Description;

namespace ConsoleApp1
{
    //IMPORTANTE: siga os passos abaixo para testar tanto o cliente quando a serviço:
    //
    //1) rodar o cmd como ADMINISTRADOR
    //
    //2) rodar o comando abaixo antes de executar o servico
    //netsh http add urlacl url=http://+:8080/ user=%USERDOMAIN%\%USERNAME%
    //
    //3) compilar o projeto ServicoCalculadora.
    //
    //4) abrir a pasta bin\debug do serviço, rodar o executável ServicoCalculadora.exe
    //
    //5) rodar o projeto ClienteCalculadora.

    [ServiceContract(Namespace = "http://Microsoft.Samples.ExpectedExceptions")]
    public interface ICalculadora
    {
        [OperationContract]
        double Somar(double n1, double n2);
        [OperationContract]
        double Subtrair(double n1, double n2);
        [OperationContract]
        double Multiplicar(double n1, double n2);
        [OperationContract]
        double Dividir(double n1, double n2);
    }

    public class CalculadoraService : ICalculadora
    {
        public double Somar(double n1, double n2)
        {
            return n1 + n2;
        }

        public double Subtrair(double n1, double n2)
        {
            return n1 - n2;
        }

        public double Multiplicar(double n1, double n2)
        {
            return n1 * n2;
        }

        public double Dividir(double n1, double n2)
        {
            return n1 / n2;
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Uri baseAddress = new Uri("http://localhost:8080/Calculadora");

            // Cria o ServiceHost.
            using (ServiceHost host = new ServiceHost(typeof(CalculadoraService), baseAddress))
            {
                // Habilita a publicação de metadata.
                ServiceMetadataBehavior smb = new ServiceMetadataBehavior();
                smb.HttpGetEnabled = true;
                smb.MetadataExporter.PolicyVersion = PolicyVersion.Policy15;
                host.Description.Behaviors.Add(smb);

                // Abre o ServiceHost para começar a ouvir as mensages. Como
                // nenhum endpoint é explicitamente configurado, o runtime irá criar
                // um endpoint por endereço base para cada contrato de serviço implementado implemented
                // pelo serviço.
                host.Open();

                Console.WriteLine("O serviço está pronto no serviço {0}\r\n", baseAddress);
                Console.WriteLine("Tecle <Enter> para parar o serviço.\r\n");
                Console.ReadLine();

                // Fecha o ServiceHost.
                host.Close();
            }
        }
    }
}