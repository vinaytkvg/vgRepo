global class MyBatchApex implements DataBase.Batchable<Sobject>{
global Database.QueryLocator start(Database.BatchableContext bc){
return Database.getQueryLocator( 'select id,description from Account');
}
global void execute(Database.BatchableContext bc,List<Account> la){
for (Account a:la){
a.description='This is a special Account';
}
update la;
}
global void finish(Database.BatchableContext bc){
}
}