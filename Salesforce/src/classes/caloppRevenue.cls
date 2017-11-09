public with sharing class caloppRevenue {
public String total {set;}
List<Account> opp = new List<Account>();
    public List<Account> getOpp() {
  
 opp=[SELECT Name,AnnualRevenue FROM Account];
        return opp;
    }
 public double gettotal(){
 double TotalRevenue=0;
  List<Account> l=[SELECT AnnualRevenue FROM Account];
  for(Account acc:l){
  if(acc.AnnualRevenue!=null)
  TotalRevenue +=acc.AnnualRevenue;
  }
  return TotalRevenue;
 }
 }