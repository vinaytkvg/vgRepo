@isTest
public class OpportunityAccTriggerTest {
    
    @isTest
    private  static  void testInsertMtehod(){
        
         List<Opportunity> opp=[SELECT name,AccountId,Amount FROM Opportunity];
         OpportunityAccTriggerHandler oath=new OpportunityAccTriggerHandler();
         oath.oppInsert(opp);
         Opportunity opp2=[SELECT id,Amount FROM Opportunity WHERE name='vinayopportunity'];
         system.assert(opp2.Amount!=30000);
        
    }
    @isTest
    private  static  void testUpdateMtehod(){
         Account a1=[SELECT id,name FROM Account WHERE name='vinaytest'];
         Account a2=[SELECT id,name FROM Account WHERE name='vinaytest1'];
         Opportunity opp=[SELECT name,AccountId FROM Opportunity WHERE name='vinayopportunity'];
         opp.AccountId=a2.id;
        
            update opp;
       
         Opportunity opp2=[SELECT id,name,Amount,AccountId FROM Opportunity WHERE name='vinayopportunity'];
         
         System.assert(opp2.AccountId==a2.id);
         system.assert(opp2.Amount==1000000);
        
    }
    
   
    @testSetUp static void myAccRecords(){
        
        Account aa1=new Account(name='vinaytest',AccountNumber='30583058612',AnnualRevenue=123456789);
        insert aa1;
        Account aa2=new Account(name='vinaytest1',AccountNumber='30583058613',AnnualRevenue=123456789);
        insert aa2;
       
    }
    @testSetup static void myOppRecords(){
        Account a1=[SELECT id,name FROM Account WHERE name='vinaytest'];
        
        Opportunity  opp=new Opportunity(name='vinayopportunity',AccountId=a1.id,Type='New Customer',Amount=10000,CloseDate=System.today(),StageName='Qualification',Probability=10);
    
        insert opp;
    }
}