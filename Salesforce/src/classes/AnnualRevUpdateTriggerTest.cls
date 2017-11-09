@isTest
public class AnnualRevUpdateTriggerTest{
testMethod 
public static void testMe(){
Account a=new Account(name='doddle',annualRevenue=1000);
insert a;
Account a1=[SELECT name,annualRevenue FROM Account Where annualRevenue<10000];

a1.annualRevenue=a1.annualRevenue+1000;
update a1;
}
}