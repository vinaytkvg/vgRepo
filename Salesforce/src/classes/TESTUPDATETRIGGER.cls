@isTest
public class TESTUPDATETRIGGER {
@isTest
static void testme(){
    Account a=new Account(name='Vajpayee',AnnualRevenue=20000);
    insert a;
    Account a1=[SELECT name,AnnualRevenue FROM Account WHERE id=:a.id];
    System.assertEquals(a1.AnnualRevenue,21000);
}
}