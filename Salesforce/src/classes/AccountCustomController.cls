public class AccountCustomController
{
    public transient Account acc
    {
     get;
     set;
    }
    
    public AccountCustomController()
    {
     ID id = ApexPages.currentPage().getParameters().get('Id'); 
     acc = (id==null) ? new Account() : [SELECT id,name,annualRevenue FROM Account WHERE id=:id];
    }
    
    public PageReference save()
    {
      upsert acc;
      PageReference successRecord = new ApexPages.StandardController(acc).view();
      return successRecord;
    } 
}