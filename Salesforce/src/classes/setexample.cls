public class setexample {
    public set<string>acc{get;set;}
    public set<string>ac{get;set;}
    public boolean test{get;set;}
    public setexample(){
    acc=new set<string>();
    acc.add('lalaiah'); 
        acc.add('lalu');
         ac=new set<string>();   
      ac.add('lalaiah'); 
        ac.add('srinu');
     test=ac.containsAll(acc);  
    }
}