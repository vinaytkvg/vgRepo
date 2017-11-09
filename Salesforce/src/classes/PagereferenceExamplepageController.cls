public class PagereferenceExamplepageController {
Public Account account;
    public Account getAccount() {
       if(account==null)
        account=new Account();
       
       return account ;
    }
 public PageReference save(){
    insert account;
    CANDIDATE_INFO__c ca = [SELECT id FROM CANDIDATE_INFO__c LIMIT 1];
    PageReference accPref= new ApexPages.StandardController(ca).view();
    //accPref.setRedirect(true);
    return accPref;
    
   
}

}