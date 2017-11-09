public class GetterSetterPage {

public String searchText{get;set;}
public List<List<sObject>> results;
public List<Account> accDeatils;
public List<Contact> conDetails;
public String accId{get;set;}
public PageReference doSearch(){
try{
results=[FIND :searchText RETURNING Account(id,name,AnnualRevenue),contact(id,firstname,lastName,Email)];
accDeatils=(List<Account>)results[0];
conDetails=(List<Contact>)results[1];}catch(Exception e){
ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error,'PLEASE SEARCH WITH A VALUE'));
}
return null;
}

public List<Account> getAccs(){

return accDeatils;
}

public List<Contact> getCons(){

return conDetails;
}
 
 public PageReference accDetailMethod(){
 system.debug(accId);
   Account a=[SELECT id ,name FROM Account WHERE id=:accId];
   PageReference pr=new ApexPages.StandardController(a).view();
   pr.setRedirect(true);
   return pr;
 }


}