
// Copyright (c) Microsoft Corporation.  All Rights Reserved.

namespace Microsoft.Samples.ExpectedExceptions
{
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(Namespace="http://Microsoft.Samples.ExpectedExceptions", ConfigurationName="Microsoft.Samples.ExpectedExceptions.ICalculadora")]
    public interface ICalculadora
    {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://Microsoft.Samples.ExpectedExceptions/ICalculadora/Somar", ReplyAction="http://Microsoft.Samples.ExpectedExceptions/ICalculadora/SomarResponse")]
        double Somar(double n1, double n2);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://Microsoft.Samples.ExpectedExceptions/ICalculadora/Subtrair", ReplyAction="http://Microsoft.Samples.ExpectedExceptions/ICalculadora/SubtrairResponse")]
        double Subtrair(double n1, double n2);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://Microsoft.Samples.ExpectedExceptions/ICalculadora/Multiplicar", ReplyAction="http://Microsoft.Samples.ExpectedExceptions/ICalculadora/MultiplicarResponse")]
        double Multiplicar(double n1, double n2);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://Microsoft.Samples.ExpectedExceptions/ICalculadora/Dividir", ReplyAction="http://Microsoft.Samples.ExpectedExceptions/ICalculadora/DividirResponse")]
        double Dividir(double n1, double n2);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface ICalculadoraChannel : Microsoft.Samples.ExpectedExceptions.ICalculadora, System.ServiceModel.IClientChannel
    {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class ClienteCalculadora : System.ServiceModel.ClientBase<Microsoft.Samples.ExpectedExceptions.ICalculadora>, Microsoft.Samples.ExpectedExceptions.ICalculadora
    {
        
        public ClienteCalculadora()
        {
        }
        
        public ClienteCalculadora(string endpointConfigurationName) : 
                base(endpointConfigurationName)
        {
        }
        
        public ClienteCalculadora(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress)
        {
        }
        
        public ClienteCalculadora(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress)
        {
        }
        
        public ClienteCalculadora(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress)
        {
        }
        
        public double Somar(double n1, double n2)
        {
            return base.Channel.Somar(n1, n2);
        }
        
        public double Subtrair(double n1, double n2)
        {
            return base.Channel.Subtrair(n1, n2);
        }
        
        public double Multiplicar(double n1, double n2)
        {
            return base.Channel.Multiplicar(n1, n2);
        }
        
        public double Dividir(double n1, double n2)
        {
            return base.Channel.Dividir(n1, n2);
        }
    }
}
