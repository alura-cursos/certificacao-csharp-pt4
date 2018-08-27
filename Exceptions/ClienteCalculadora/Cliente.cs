
//  Copyright (c) Microsoft Corporation.  All Rights Reserved.

using System;
using System.ServiceModel;

namespace Microsoft.Samples.ExpectedExceptions
{
    // O contrato do serviço é definido no generatedClient.cs, gerado pela ferramenta svcutil.

    class Cliente
    {
        static void Main()
        {
            DemonstraCaminhoFeliz();
            DemonstraCommunicationException();
            DemonstraTimeoutException();

            Console.WriteLine();
            Console.WriteLine("Tecle <ENTER> para fechar o cliente.\r\n");
            Console.ReadLine();
        }

        static void DemonstraCaminhoFeliz()
        {
            // Cria o cliente
            ClienteCalculadora cliente = new ClienteCalculadora();

            // Chama a operação Somar do serviço.
            double valor1 = 100.00D;
            double valor2 = 15.99D;
            double resultado = cliente.Somar(valor1, valor2);
            Console.WriteLine("Somar({0},{1}) = {2}\r\n", valor1, valor2, resultado);

            // Chama a operação Dividir do serviço.
            valor1 = 22.00D;
            valor2 = 7.00D;
            resultado = cliente.Dividir(valor1, valor2);
            Console.WriteLine("Dividir({0},{1}) = {2}\r\n", valor1, valor2, resultado);

            // Fechamos o cliente "graciosamente", 
            // para que o canal feche sem problemas e limpe/finalize os recursos.
            cliente.Close();

            Console.WriteLine("O serviço retornou todos os resultados com sucesso.\r\n");
        }

        static void DemonstraCommunicationException()
        {
            // Cria o cliente
            ClienteCalculadora cliente = new ClienteCalculadora();

            try
            {
                // Chama a operação Somar do serviço.
                double valor1 = 100.00D;
                double valor2 = 15.99D;
                double resultado = cliente.Somar(valor1, valor2);
                Console.WriteLine("Somar({0},{1}) = {2}\r\n", valor1, valor2, resultado);

                // Simula um problema de rede ao abortar a conexão.
                Console.WriteLine("Ocorreu um problema de conexão de rede simulado...\r\n");
                cliente.Abort();

                // Chama a operação Dividir. Agora que o canal foi encerrado abruptamente,
                // a próxima chamada irá falhar.
                valor1 = 22.00D;
                valor2 = 7.00D;
                resultado = cliente.Dividir(valor1, valor2);
                Console.WriteLine("Dividir({0},{1}) = {2}\r\n", valor1, valor2, resultado);

                // NÃO DEVE CHEGAR NESTA LINHA, pois o método Dividir irá lançar uma exceção

                // Se chegar aqui, devemos fechar o cliente "graciosamente", 
                // para que o canal feche sem problemas e limpe/finalize os recursos.
                cliente.Close();

                Console.WriteLine("O serviço retornou todos os resultados com sucesso.\r\n");
            }
            catch (TimeoutException exception)
            {
                Console.WriteLine("Exceção capturada: {0}\r\n", exception.GetType());
                cliente.Abort();
            }
            catch (CommunicationException exception)
            {
                // O controle da execução é direcionado para cá quando o método cliente.Dividir lança
                // uma exceção. A exceção real é CommunicationObjectAbortedException, que é uma subclasse
                // de CommunicationException.
                Console.WriteLine("Exceção capturada: {0}\r\n", exception.GetType());
                cliente.Abort();
            }
        }

        static void DemonstraTimeoutException()
        {
            // Cria um cliente
            ClienteCalculadora cliente = new ClienteCalculadora();

            try
            {
                // Chama a operação Somar do serviço.
                double valor1 = 100.00D;
                double valor2 = 15.99D;
                double resultado = cliente.Somar(valor1, valor2);
                Console.WriteLine("Somar({0},{1}) = {2}\r\n", valor1, valor2, resultado);

                // Define um timeout muito pequeno. Isso irá fazer com que a próxima chamada
                // falhe com uma TimeoutException, porque ela não pode processar dentro do tempo devido.
                Console.WriteLine("Define o timeout muito curto, e assim o método não pode ser completado...\r\n");
                cliente.InnerChannel.OperationTimeout = TimeSpan.FromMilliseconds(0.001);

                // Chama a operação Dividir do serviço.
                valor1 = 22.00D;
                valor2 = 7.00D;
                resultado = cliente.Dividir(valor1, valor2);
                Console.WriteLine("Dividir({0},{1}) = {2}\r\n", valor1, valor2, resultado);

                // NÃO DEVE CHEGAR NESTA LINHA, pois o método Dividir irá lançar uma exceção

                // Se chegar aqui, devemos fechar o cliente "graciosamente", 
                // para que o canal feche sem problemas e limpe/finalize os recursos.
                cliente.Close();

                Console.WriteLine("O serviço retornou todos os resultados com sucesso.\r\n");
            }
            catch (TimeoutException exception)
            {
                // O controle da execução é direcionado para cá quando o método cliente.Dividir lança
                // uma exceção TimeoutException.
                Console.WriteLine("Exceção capturada: {0}\r\n", exception.GetType());
                cliente.Abort();
            }
            catch (CommunicationException exception)
            {
                Console.WriteLine("Exceção capturada: {0}\r\n", exception.GetType());
                cliente.Abort();
            }
        }
    }
}
