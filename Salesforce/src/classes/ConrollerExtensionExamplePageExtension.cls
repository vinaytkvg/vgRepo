public class ConrollerExtensionExamplePageExtension {
public boolean block{get;private set;}
public integer limitr=2;
public integer counter=0;
    public ConrollerExtensionExamplePageExtension(ApexPages.StandardSetController controller) {
    

    }

public ConrollerExtensionExamplePageExtension(ApexPages.StandardController st){

}
public ApexPages.StandardSetController setcon{
get{
setcon= new ApexPages.StandardSetController(Database.getQueryLocator([SELECT id,name FROM Account]));
return setcon;
}set;}




public List<Account> getAccRecords(){
List<Account> l=new List<Account>();
for(Account a:(List<Account>)setcon.getRecords()){
l.add(a);
counter++;
if(counter==limitr)
break;
}
return l;

}
   public void previousMethod(){
     
   }
public void nextMethod(){
   //getAccRecords();
   }
}