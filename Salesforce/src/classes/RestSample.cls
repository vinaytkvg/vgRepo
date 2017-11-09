@RestResource(urlMapping='/v1/accountservice')
global class RestSample {
  /*
  * To retrieve the accounts
  */
  @HttpGet
  global static List<Account> get(){
    return [SELECT Id, Name FROM Account LIMIT 5];
  }
}
