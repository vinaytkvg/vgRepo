public class TestSampleController
{
    public TestSampleController(ApexPages.StandardSetController controller)
    {

    }

    public ApexPages.StandardSetController ssc
    {
        get
        {
            if(ssc == null)
            {
                ssc = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id,name, annualRevenue,LastModifiedDate,CreatedDate FROM Account]));
                ssc.setpageSize(5);
            }
            return ssc;
        }
        set;
    }

    public List<Account> accList
    {
        get
        {
            if(ssc != null)
            {
                accList = (List<Account>)ssc.getRecords();
            }
            return accList;
        }
        set;
    }
}