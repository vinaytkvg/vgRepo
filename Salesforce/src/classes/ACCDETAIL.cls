public class ACCDETAIL {
public Account ac{get; set;}
public pageReference save(){
return null;
}


    
public List<opportunity> acc{get; set;}

public ACCDETAIL(){
ac=new Account();
acc=new List<opportunity>();
 acc=[SELECT name,amount FROM opportunity];
}
}