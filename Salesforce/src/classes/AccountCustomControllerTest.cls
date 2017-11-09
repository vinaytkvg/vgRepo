@isTest
public class AccountCustomControllerTest
{
 public testmethod static void testMethod1()
 {
 Account acc =[SELECT id,name FROM Account LIMIT 1];

 AccountCustomController controller = new AccountCustomController();
 controller.acc.name = 'vinayganesh';
 controller.save();
 System.assertEquals(controller.acc.name,'vinayganesh');
 }
 
 public testmethod static void testMethod2()
 {
 Account acc =[SELECT id,name FROM Account LIMIT 1];
 PageReference p =Page.PRACTICE; //new PageReference('/apex/PRACTICE');
 ApexPages.currentPage().getParameters().put('Id',acc.Id);
 AccountCustomController controller = new AccountCustomController();
 controller.acc.name ='AmmaNaanna';
 controller.save();
 System.assertNotEquals(controller.acc.name,'vinayganesh');
 }
 
 @testSetup
 static void setup()
 {
  Account a= new Account(name='vinay');
  insert a;
 }
}