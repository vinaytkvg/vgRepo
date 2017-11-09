public class AccountDummyController
{
    public List<Account> accounts {get; set;}
    public AccountDummyController()
    {
        accounts = new List<Account>([SELECT id,Name,AnnualRevenue,AccountNumber,Phone FROM Account LIMIT 100]);
    }
}