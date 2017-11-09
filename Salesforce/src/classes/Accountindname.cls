public class Accountindname {
    public String industries1{get;set;}
    public String names{set;}
    List<selectOption> l=new List<selectOption>();
    public Accountindname(){
        l.add(new selectOption('Banking','vinay'));
        l.add(new selectOption('IT','Ganesh'));
        l.add(new selectOption('Power','Naveen'));
    }
    
    public List<selectOption> getnames(){
        List<selectOption> r=l;
        return r;
    }
}