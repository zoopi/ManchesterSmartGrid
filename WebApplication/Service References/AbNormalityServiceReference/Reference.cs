﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18449
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApplication.AbNormalityServiceReference {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="OverThresholdObj", Namespace="http://tempuri.org/")]
    [System.SerializableAttribute()]
    public partial class OverThresholdObj : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        private System.DateTime TimeStampField;
        
        private double PreDefinedThresholdField;
        
        private double ActualDataValueField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public System.DateTime TimeStamp {
            get {
                return this.TimeStampField;
            }
            set {
                if ((this.TimeStampField.Equals(value) != true)) {
                    this.TimeStampField = value;
                    this.RaisePropertyChanged("TimeStamp");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true, Order=1)]
        public double PreDefinedThreshold {
            get {
                return this.PreDefinedThresholdField;
            }
            set {
                if ((this.PreDefinedThresholdField.Equals(value) != true)) {
                    this.PreDefinedThresholdField = value;
                    this.RaisePropertyChanged("PreDefinedThreshold");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true, Order=2)]
        public double ActualDataValue {
            get {
                return this.ActualDataValueField;
            }
            set {
                if ((this.ActualDataValueField.Equals(value) != true)) {
                    this.ActualDataValueField = value;
                    this.RaisePropertyChanged("ActualDataValue");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="AbNormalityServiceReference.AbnormalityServiceSoap")]
    public interface AbnormalityServiceSoap {
        
        // CODEGEN: Generating message contract since element name OverThresholdWebMethodResult from namespace http://tempuri.org/ is not marked nillable
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/OverThresholdWebMethod", ReplyAction="*")]
        WebApplication.AbNormalityServiceReference.OverThresholdWebMethodResponse OverThresholdWebMethod(WebApplication.AbNormalityServiceReference.OverThresholdWebMethodRequest request);
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class OverThresholdWebMethodRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="OverThresholdWebMethod", Namespace="http://tempuri.org/", Order=0)]
        public WebApplication.AbNormalityServiceReference.OverThresholdWebMethodRequestBody Body;
        
        public OverThresholdWebMethodRequest() {
        }
        
        public OverThresholdWebMethodRequest(WebApplication.AbNormalityServiceReference.OverThresholdWebMethodRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute()]
    public partial class OverThresholdWebMethodRequestBody {
        
        public OverThresholdWebMethodRequestBody() {
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class OverThresholdWebMethodResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="OverThresholdWebMethodResponse", Namespace="http://tempuri.org/", Order=0)]
        public WebApplication.AbNormalityServiceReference.OverThresholdWebMethodResponseBody Body;
        
        public OverThresholdWebMethodResponse() {
        }
        
        public OverThresholdWebMethodResponse(WebApplication.AbNormalityServiceReference.OverThresholdWebMethodResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class OverThresholdWebMethodResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public WebApplication.AbNormalityServiceReference.OverThresholdObj[] OverThresholdWebMethodResult;
        
        public OverThresholdWebMethodResponseBody() {
        }
        
        public OverThresholdWebMethodResponseBody(WebApplication.AbNormalityServiceReference.OverThresholdObj[] OverThresholdWebMethodResult) {
            this.OverThresholdWebMethodResult = OverThresholdWebMethodResult;
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface AbnormalityServiceSoapChannel : WebApplication.AbNormalityServiceReference.AbnormalityServiceSoap, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class AbnormalityServiceSoapClient : System.ServiceModel.ClientBase<WebApplication.AbNormalityServiceReference.AbnormalityServiceSoap>, WebApplication.AbNormalityServiceReference.AbnormalityServiceSoap {
        
        public AbnormalityServiceSoapClient() {
        }
        
        public AbnormalityServiceSoapClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public AbnormalityServiceSoapClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public AbnormalityServiceSoapClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public AbnormalityServiceSoapClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        WebApplication.AbNormalityServiceReference.OverThresholdWebMethodResponse WebApplication.AbNormalityServiceReference.AbnormalityServiceSoap.OverThresholdWebMethod(WebApplication.AbNormalityServiceReference.OverThresholdWebMethodRequest request) {
            return base.Channel.OverThresholdWebMethod(request);
        }
        
        public WebApplication.AbNormalityServiceReference.OverThresholdObj[] OverThresholdWebMethod() {
            WebApplication.AbNormalityServiceReference.OverThresholdWebMethodRequest inValue = new WebApplication.AbNormalityServiceReference.OverThresholdWebMethodRequest();
            inValue.Body = new WebApplication.AbNormalityServiceReference.OverThresholdWebMethodRequestBody();
            WebApplication.AbNormalityServiceReference.OverThresholdWebMethodResponse retVal = ((WebApplication.AbNormalityServiceReference.AbnormalityServiceSoap)(this)).OverThresholdWebMethod(inValue);
            return retVal.Body.OverThresholdWebMethodResult;
        }
    }
}