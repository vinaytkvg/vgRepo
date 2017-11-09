public class picklist {

    public PageReference action() {
        return null;
    }

    public String options { set; }
    public string dishes{get;set;}
   
    public List<selectOption> getoptions(){
    List<selectOption>  l=new List<selectOption>();
    l.add(new selectOption('pulihora','1'));
    l.add(new selectOption('garelu','2'));
    l.add(new selectOption('bajji','3'));
    l.add(new selectOption('payasam','4'));
    
    return l;
    
    }

}