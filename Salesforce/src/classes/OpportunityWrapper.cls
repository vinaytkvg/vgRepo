public virtual class OpportunityWrapper  implements Comparable{
  public Opportunity opp;
    public OpportunityWrapper(Object o){
        opp=(Opportunity)o;
    }
    public OpportunityWrapper(){
        
    }
    
    public Integer compareTo(Object op){
       OpportunityWrapper m=new OpportunityWrapper(op);
        if(opp.Amount > m.opp.Amount)
            return 1;
        else if(opp.Amount < m.opp.Amount)
            return -1;
        else
            return 0;
    }
     public class OpportunityWrapper1{
       public String name;
       public Decimal oppAmount;
        public OpportunityWrapper1(Opportunity o){
            
            oppAmount=o.Amount;
        }
    }
    public virtual void test1(){
        system.debug('vinay');
    }
    
}
/*
 * Opportunity oppr=[SELECT id,Amount FROM Opportunity WHERE Amount=100000 LIMIT 1];
OpportunityWrapper mp=new OpportunityWrapper(oppr);
Integer i=mp.compareTo(oppr);
system.debug(i);
 */