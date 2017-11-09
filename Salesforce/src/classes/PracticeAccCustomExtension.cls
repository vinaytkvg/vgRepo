public class PracticeAccCustomExtension
{

 public PracticeAccCustomExtension(AccountCustomController controller)
 {
  
 }
 
  public Integer totalPages
    {
      get
      {   if(totalPages==null)
          return ((setcon.getResultSize()/setcon.getPageSize())+1);
          return totalPages;
      }
    }
 public ApexPages.StandardSetController setcon
 {
   get
   { 
     if(setcon == null)
     {
         setcon = new ApexPages.StandardSetController(DataBase.getQueryLocator('SELECT id,name FROM Account'));
         setcon.setPageSize(5);
     }
    return setcon;
   }
   set;
 }
 public Integer recordssize{
     get
     {
       return setcon.getRecords().size();
     }
 }
 public List<Account> getAccountDetails()
 {
   return (List<Account>)setcon.getRecords();
 }
}