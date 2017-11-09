trigger AccountTrigger on Account (before insert ,before update,after update,after insert) 
{ 
   public static Integer integ;
   public List<Account> accList = new List<Account>();
   if(utl_User.isTriggerActiveForMe('AccountTrigger'))
   {
        ProcessDispatcher dispatcher = new ProcessDispatcher();
        if(Trigger.isBefore)
        {
            Account acc = TRigger.new[0];
            System.debug(acc);
            //acc.Name = 'TestSampleTrigger';
            //dispatcher.addProcesses(new ProcessBase[]{new AccountAnnualRevenueIncrement()});
        }
        else 
        {
            Account acc = Trigger.new[0];
            if(acc.SLA__c == null) {
                Account account = [SELECT id FROM Account WHERE Id = :acc.Id];
                
                account.SLA__c = 'Gold';
                accList.add(account);
                System.debug(acc);
               
                update accList;
            }
        }
        dispatcher.dispatch();
        
   }
   
   
   public class MyinnerClass
   {
       public Integer i;
   }
}