public class OpportunityAccTriggerHandler {
  //List<Account> a=[SELECT id,name,AnnualRevenue FROM Account];
    Map<Id,Account> m=new Map<Id,Account>([SELECT id,AnnualRevenue FROM Account]);
    
    List<Account> a1;
    public void oppInsert(List<Opportunity> opp){
       for(Opportunity o:opp){
           if(o.MONTH_NUMBER1__C!=null){
              
               o.Amount=50000;
               
               system.debug('vinaykumar'+o.Amount+o.name);
           }else{
              o.MONTH_NUMBER1__C.addError('Please Provide the value',false);
               system.debug('insertfailed');}
       
          
           }
    }
    
    public void oppUpdate(List<Opportunity> newOpp,Map<id,Opportunity> oldOpp){
        
        for(Opportunity opp:newOpp){
           
            if(oldOpp.get(opp.Id).AccountId!=opp.AccountId){
                     if(opp.MONTH_NUMBER1__C!=null){
                           a1=new List<Account>();
                           Account acc=new Account();
                           acc=m.get(opp.accountId);
                           system.debug(acc);
                           acc.AnnualRevenue+=10000;
                           system.debug(acc.AnnualRevenue);
                           a1.add(acc);
                           System.debug('old'+oldOpp.get(opp.Id).AccountId);
                           system.debug('new'+opp.AccountID);
                           opp.Amount=1000000;
                       system.debug('success');
                    
                     }else{
                       opp.addError('Month value should  not be null',true);
                       system.debug('error');}
                
               }
       
        
        }try{update a1;}catch(Exception e){}
    
    }}