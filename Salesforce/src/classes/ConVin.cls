@isTest
public class ConVin{
@isTest
static void testMe(){
Contact c=new Contact();
c.lastName='vinay';
insert c;
Contact c1=[SELECT lastName From Contact];
vinay_kumar__c v=new vinay_kumar__c(name=c1.lastName);
insert v;
system.assertEquals('vinay',v.name);
}
}