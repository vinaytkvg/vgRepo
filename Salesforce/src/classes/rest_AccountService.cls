@RestResource(urlMapping='/accountservice/*/account/*')
global class rest_AccountService 
{
    @HttpGet
    global static void get()
    {
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        System.debug(request.requestUri);
        System.debug(request.resourcePath);
        String accId = request.requestUri.substringafter('/account/');
        if(accId instanceof Id && Id.valueOf(accId).getSObjectType() == Account.sObjectType)
        {
            Account acc = [SELECT Id,name,annualrevenue FROM Account WHERE Id = :accId];
            response.responseBody = Blob.valueOf(System.Json.serialize(new base_Account(acc),true));
        }
        else
        {   response.statusCode = 400;
            response.responseBody = Blob.valueOf('Invalid Account Id is Provided.Please Provide valid account Id');
        }
    }
    
    public class base_Account
    {
        public String name;
        public Decimal annualRevenue;
        public base_Account(Account acc)
        {
            this.name = acc.name;
            this.annualRevenue = acc.AnnualRevenue;
        }
    }
}