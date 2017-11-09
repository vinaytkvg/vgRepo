public class NewOppControllerOf3Pages {
   Account account;
   Contact contact;
   Opportunity opportunity;
   public Account getAccount(){
   if(account==null)account=new Account();
   return account;
   } 
   public Contact getContact(){
   if(contact==null)Contact=new Contact();
   return contact;
   } 
   public Opportunity getOpportunity() {
    if(opportunity==null) opportunity=new Opportunity();
            return opportunity;
    }
  
   public PageReference cancel(){
   //Pagereference pr=new ApexPages.StandardController(opportunity).view();
   //pr.setRedirect(true);
   return null;
   }
   
   public PageReference step1(){
    return page.OpptyStep1;
   }
   public PageReference step2(){
    return Page.OpptyStep2;
   }
   public PageReference step3(){
    return page.OpptyStep3;
   }
   
    public PageReference save() {
        account.Phone=contact.phone;
        insert account;
        contact.accountId=account.Id;
        insert contact;
        opportunity.accountId=account.Id;
        insert opportunity;
        PageReference oppd=new ApexPages.StandardController(opportunity).view();
        oppd.setRedirect(true);
        return oppd;
    }


}