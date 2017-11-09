public with sharing class JSRemoteController {

@RemoteAction
public static Account returnAccount(String searchName){
return [SELECT id,name FROM Account WHERE name=:searchName LIMIT 1];
}
}