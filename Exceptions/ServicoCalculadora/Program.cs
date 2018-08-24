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
    public interface ICalculator
    {
        [OperationContract]
        double Add(double n1, double n2);
        [OperationContract]
        double Subtract(double n1, double n2);
        [OperationContract]
        double Multiply(double n1, double n2);
        [OperationContract]
        double Divide(double n1, double n2);
    }

    // Service class which implements the service contract.
    public class CalculatorService : ICalculator
    {
        public double Add(double n1, double n2)
        {
            return n1 + n2;
        }

        public double Subtract(double n1, double n2)
        {
            return n1 - n2;
        }

        public double Multiply(double n1, double n2)
        {
            return n1 * n2;
        }

        public double Divide(double n1, double n2)
        {
            return n1 / n2;
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Uri baseAddress = new Uri("http://localhost:8080/Calculator");

            // Create the ServiceHost.
            using (ServiceHost host = new ServiceHost(typeof(CalculatorService), baseAddress))
            {
                // Enable metadata publishing.
                ServiceMetadataBehavior smb = new ServiceMetadataBehavior();
                smb.HttpGetEnabled = true;
                smb.MetadataExporter.PolicyVersion = PolicyVersion.Policy15;
                host.Description.Behaviors.Add(smb);

                // Open the ServiceHost to start listening for messages. Since
                // no endpoints are explicitly configured, the runtime will create
                // one endpoint per base address for each service contract implemented
                // by the service.
                host.Open();

                Console.WriteLine("The service is ready at {0}", baseAddress);
                Console.WriteLine("Press <Enter> to stop the service.");
                Console.ReadLine();

                // Close the ServiceHost.
                host.Close();
            }
        }
    }
}