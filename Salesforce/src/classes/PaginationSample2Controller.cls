public class PaginationSample2Controller {
    public Integer lit=10;
    //public  Integer ofs=0;
    Public Boolean hasPrevious{get;set;}
    Public Boolean hasNext{get;set;}
    public Integer count;
    Public List<Account> account=[SELECT id,name FROM Account];
    public List<Account> acc=new List<Account>();
    Integer min=0;
    public PaginationSample2Controller(){
       hasPrevious=false;
       hasNext=true;
       count=lit;
    }
    
    public PageReference previous() {
    min-=lit;
      hasNext=true;
       //ofs-=lit;
       if(min==0)
       hasPrevious=false;
       getAcc();
         count-=10;   
     return null;
    }

    public PageReference next() {
      min+=lit;
       hasPrevious=true;
       //ofs+=lit;
       count+=10;
       if(count>account.size())
              hasNext=false;
       getAcc();
      return null;
    }

    public List<Account> getAcc(){
                      acc.clear();      
                      for(Integer i=min;i<count&&min<=i&&i<account.size();i++){
                      
                      acc.add(account[i]);
                      system.debug(acc.size());
                      }
            //List<Account> acc=[SELECT id,name FROM Account LIMIT :lit offset :ofs];
                         
     return acc ;

    }

}