trigger ContactTrigger on Contact (after insert,before insert,before update, after update, before delete, after delete) {

    /*if(Trigger.isDelete || Trigger.isBefore) {    
       Account acc = [SELECT Id FROM Account WHERE Id = :Trigger.new[0].AccountId];
       acc.Name = 'TriggerTestScenarioContact';
       update acc;
       System.debug(acc);
       
    }*/
}