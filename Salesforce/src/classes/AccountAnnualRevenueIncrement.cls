public virtual class  AccountAnnualRevenueIncrement extends ProcessBase
{
    List<Account> applicableAccounts ;
    public AccountAnnualRevenueIncrement()
    {
       processName = AutomatedProcessDefinition.Account_Annual_Revenue_Increment;
       applicableAccounts = new List<Account>();
    }
    
    public override void initialLoop(List<sObject> objcts)
    {
        List<Account> acc = (List<Account>)objcts;
        for(Account a : acc)
        {
            if(a.AnnualRevenue >= 1000)
              applicableAccounts.add(a);
        }
        if(applicableAccounts.isEmpty())
             runProcess = false;
    }
    
    public override void logic()
    {
      	for(Account acc : applicableAccounts)
        {
            acc.AnnualRevenue = acc.AnnualRevenue + 1000;
        }
    }
}