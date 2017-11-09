global class UpdateAccFieldBatchApex implements Database.Batchable<sObject>,Database.Stateful{
public  string value;
 
    global decimal tA=0.0;
public UpdateAccFieldBatchApex(string value){
this.value=value;
    }
global Database.QueryLocator start(Database.BatchableContext vid){
return Database.getQueryLocator('SELECT id,name,description,annualRevenue FROM Account');
}
global void execute(Database.BatchableContext vid,List<sObject> ob){
List<Account> a=new List<Account>();
    for(sObject s:ob){
       Account acc=(Account) s;
       acc.description=value;
        tA=tA+acc.annualRevenue;
        a.add(acc);
       }
    update a;
}
 global void finish(Database.BatchableContext vid){
 }
}