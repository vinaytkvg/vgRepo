//Generated by wsdl2apex

public class soapClassAddcls {
    public class LogInfo {
        public String category;
        public String level;
        private String[] category_type_info = new String[]{'category','http://soap.sforce.com/schemas/class/addcls',null,'1','1','false'};
        private String[] level_type_info = new String[]{'level','http://soap.sforce.com/schemas/class/addcls',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/addcls','true','false'};
        private String[] field_order_type_info = new String[]{'category','level'};
    }
    public class AllowFieldTruncationHeader_element {
        public Boolean allowFieldTruncation;
        private String[] allowFieldTruncation_type_info = new String[]{'allowFieldTruncation','http://soap.sforce.com/schemas/class/addcls',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/addcls','true','false'};
        private String[] field_order_type_info = new String[]{'allowFieldTruncation'};
    }
    public class DebuggingHeader_element {
        public soapClassAddcls.LogInfo[] categories;
        public String debugLevel;
        private String[] categories_type_info = new String[]{'categories','http://soap.sforce.com/schemas/class/addcls',null,'0','-1','false'};
        private String[] debugLevel_type_info = new String[]{'debugLevel','http://soap.sforce.com/schemas/class/addcls',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/addcls','true','false'};
        private String[] field_order_type_info = new String[]{'categories','debugLevel'};
    }
    public class CallOptions_element {
        public String client;
        private String[] client_type_info = new String[]{'client','http://soap.sforce.com/schemas/class/addcls',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/addcls','true','false'};
        private String[] field_order_type_info = new String[]{'client'};
    }
    public class location {
        public Double latitude;
        public Double longitude;
        private String[] latitude_type_info = new String[]{'latitude','http://soap.sforce.com/schemas/class/addcls',null,'1','1','false'};
        private String[] longitude_type_info = new String[]{'longitude','http://soap.sforce.com/schemas/class/addcls',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/addcls','true','false'};
        private String[] field_order_type_info = new String[]{'latitude','longitude'};
    }
    public class address {
        public String city;
        public String country;
        public String countryCode;
        public String postalCode;
        public String state;
        public String stateCode;
        public String street;
        private String[] city_type_info = new String[]{'city','http://soap.sforce.com/schemas/class/addcls',null,'1','1','false'};
        private String[] country_type_info = new String[]{'country','http://soap.sforce.com/schemas/class/addcls',null,'1','1','false'};
        private String[] countryCode_type_info = new String[]{'countryCode','http://soap.sforce.com/schemas/class/addcls',null,'1','1','false'};
        private String[] postalCode_type_info = new String[]{'postalCode','http://soap.sforce.com/schemas/class/addcls',null,'1','1','false'};
        private String[] state_type_info = new String[]{'state','http://soap.sforce.com/schemas/class/addcls',null,'1','1','false'};
        private String[] stateCode_type_info = new String[]{'stateCode','http://soap.sforce.com/schemas/class/addcls',null,'1','1','false'};
        private String[] street_type_info = new String[]{'street','http://soap.sforce.com/schemas/class/addcls',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/addcls','true','false'};
        private String[] field_order_type_info = new String[]{'city','country','countryCode','postalCode','state','stateCode','street'};
    }
    public class show_element {
        public Integer a;
        public Integer b;
        private String[] a_type_info = new String[]{'a','http://soap.sforce.com/schemas/class/addcls',null,'1','1','true'};
        private String[] b_type_info = new String[]{'b','http://soap.sforce.com/schemas/class/addcls',null,'1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/addcls','true','false'};
        private String[] field_order_type_info = new String[]{'a','b'};
    }
    public class SessionHeader_element {
        public String sessionId;
        private String[] sessionId_type_info = new String[]{'sessionId','http://soap.sforce.com/schemas/class/addcls',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/addcls','true','false'};
        private String[] field_order_type_info = new String[]{'sessionId'};
    }
    public class DebuggingInfo_element {
        public String debugLog;
        private String[] debugLog_type_info = new String[]{'debugLog','http://soap.sforce.com/schemas/class/addcls',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/addcls','true','false'};
        private String[] field_order_type_info = new String[]{'debugLog'};
    }
    public class showResponse_element {
        public Integer result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/schemas/class/addcls',null,'1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/addcls','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class addcls {
        public String endpoint_x = 'https://ap1.salesforce.com/services/Soap/class/addcls';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        public soapClassAddcls.AllowFieldTruncationHeader_element AllowFieldTruncationHeader;
        public soapClassAddcls.DebuggingInfo_element DebuggingInfo;
        public soapClassAddcls.CallOptions_element CallOptions;
        public soapClassAddcls.SessionHeader_element SessionHeader;
        public soapClassAddcls.DebuggingHeader_element DebuggingHeader;
        private String AllowFieldTruncationHeader_hns = 'AllowFieldTruncationHeader=http://soap.sforce.com/schemas/class/addcls';
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/schemas/class/addcls';
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/schemas/class/addcls';
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/schemas/class/addcls';
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/schemas/class/addcls';
        private String[] ns_map_type_info = new String[]{'http://soap.sforce.com/schemas/class/addcls', 'soapClassAddcls'};
        public Integer show(Integer a,Integer b) {
            soapClassAddcls.show_element request_x = new soapClassAddcls.show_element();
            request_x.a = a;
            request_x.b = b;
            soapClassAddcls.showResponse_element response_x;
            Map<String, soapClassAddcls.showResponse_element> response_map_x = new Map<String, soapClassAddcls.showResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/schemas/class/addcls',
              'show',
              'http://soap.sforce.com/schemas/class/addcls',
              'showResponse',
              'soapClassAddcls.showResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
    }
}