public class PaginationSampleController {

public Decimal limitRecords { get; set; }
public Map<Id,Account> m=new Map<Id,Account>([SELECT Id,Name,AnnualRevenue,AccountNumber,(SELECT id,name,Amount FROM Opportunities) FROM Account]);
public Integer nPages{get;set;}
public String linkAcc{get;set;}
public transient Integer v{get;set;}
public  transient Integer max;
public transient Integer min;
public   List<Account> l{get;set;}
public  List<Account> ll;
public List<Account> acc{get;set;}
public PaginationSampleController(){
ll=m.values();
 
}
  public void limitMethod(){

     String s=String.valueOf(m.size()/limitRecords);
     if(s.contains('.')) 
         nPages=Integer.valueOf(s.substringBefore('.'))+1;
      else
          nPages=Integer.valueOf(s);
  }
  public void page1(){
       max=v*Integer.valueOf(limitRecords);
       min=0;
       system.debug('1 max'+max);
       l=new  List<Account>();
      if( v >npages || v <=0||v==null ){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.ERROR,'INVALID PAGE NUMBER'));

       }
      else{
        
          if(v==1){
              min=0;
              recordsMethod();
             }
             else{
                for(Integer i=1;i<v;i++){
                             min+=Integer.valueOf(limitRecords);
                             }
                            recordsMethod();
                            system.debug('2min'+min);
             }

       }
   }
   
   public void recordsMethod(){  
        for(Integer i=min;i<max;i++){
               if(i < ll.size()){
                   l.add(ll.get(i));
                 }
            System.debug(l);
         }
     }
     
    
     public void linkRecords(){
     system.debug(linkAcc);
      acc=new List<Account>();
       acc.add(m.get(linkAcc));
       system.debug(acc);
     }
}