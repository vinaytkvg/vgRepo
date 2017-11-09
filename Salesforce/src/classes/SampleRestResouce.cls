@RestResource(urlMapping='/account/*')
global class SampleRestResouce {

    @HttpGet
    global static void get() {
        AccountObject aO = new AccountObject();
        ContactObject co = new ContactObject();
            aO.con = co;
            cO.accObj = aO;
     System.RestRequest req = System.RestContext.request;
     System.RestResponse res = System.RestContext.response;
     /*String accId = req.requestUri.subStringAfter('account/');
     System.debug(accId);
     Account a = [SELECT Id ,name FROM Account WHERE Id = :accId];
     res.responseBody = Blob.valueOf(System.Json.serialize(a));*/
     res.responseBody = Blob.valueOf(System.Json.serialize(aO));
    }
    
    @HttpPut
    global static void put() {
        System.RestRequest req = System.RestContext.request;
        System.RestResponse res = System.RestContext.response;
        Object accObj = Json.deSerializeStrict(req.requestBody.toString(),AccountObject.class);
        AccountObject aO = (AccountObject)accObj;
        Account acc = new Account(Name = aO.name,annualRevenue = aO.annualRevenue);
        insert acc;
        res.responseBody = Blob.valueOf(System.Json.serialize(acc));
    }
    
    private class AccountObject{
        private ContactObject con;
        private String name;
        private  decimal annualRevenue;
    }
    
    private class ContactObject{
        AccountObject accObj;
    }
}