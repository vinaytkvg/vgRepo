@isTest
public class DeleteTrigger{ 
@isTest 
Static void DeleteTrigger1(){
Account a=new Account(name='vinayadvani',annualrevenue=2000);
insert a;
List<vinay_kumar__c>  lv=new  List<vinay_kumar__c>();
vinay_kumar__c va=new vinay_kumar__c(name=a.name);
lv.add(va);
Account a1=[SELECT name FROM Account WHERE id=:a.id];
delete a1;


}
}