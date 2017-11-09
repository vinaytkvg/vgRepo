@isTest
public class UpadteTriggerAccount{
@isTest
static void testUpdate(){
Account a=new Account(name='Ganeshvinay',AnnualRevenue=5000);
insert a;
Account a1=[SELECT Name FROM Account WHERE id=:a.id];
a1.name='GaneshVinayTKVG';
update a1;
List<vinay_kumar__c> lv=new List<vinay_kumar__c>();
vinay_kumar__c v=new vinay_kumar__c(name=a1.name);
lv.add(v);
}
}