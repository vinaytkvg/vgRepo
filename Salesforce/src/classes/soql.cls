public class soql {

    public String find { get; set; }

    public String Search { get; set; }
    public List<Account> acc=new List<Account>();
    public List<Account> getAccountDetails() {
       
      acc=[SELECT Name,Phone,BillingLatitude,billinglongitude,billingcity,distance__c,STANDARDLOCATION__c FROM Account WHERE name LIKE:'%'+search+'%'];
      return acc;
     
        
    }

}