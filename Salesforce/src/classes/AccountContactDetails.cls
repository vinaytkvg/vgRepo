public class AccountContactDetails {
public ApexPages.StandardController controller{get;set;}
public List<Contact> conts{get;set;}
public String chosen{get;set;}
public AccountContactDetails (ApexPages.StandardController std){

controller=std;

myMethod();
}
public void myMethod(){
conts=[SELECT Name,Email FROM Contact WHERE AccountId=:controller.getId()];
}
public PageReference delContact(){
Contact c=new Contact(id=chosen);
delete c;
myMethod();
return null;

}

}