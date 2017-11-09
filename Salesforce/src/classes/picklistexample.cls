public class picklistexample {
    public pagereference show(){
     system.debug('------------------selected'+selected);
        return null;
    }
   public string selected{get;set;}
    public list<selectoption>item{get;set;}
    public  picklistexample(){
        
     item=new list<selectoption>();
        list<account>acc=[select id,name from account];
        for(account a:acc){
          item.add(new selectoption(a.name,a.name));  
              }
    }
}