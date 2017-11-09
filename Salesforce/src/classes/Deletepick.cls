public class Deletepick {
    public String PickValue { get; set; }
    public PageReference Addpick() {
         l.add(PickValue);
        return null;
    }
     public string selected { get; set; }
     public list<string> l;
     public list<SelectOption> options{get;set;}
     public Deletepick(){ 
     PickValue='Enter Pick value';
     l=new list<string>{'Hyd','Bng','Che'};
                        options=new list<SelectOption>();
                        Addpick();
                        show();
                      }
     public PageReference Deletep(){
                          options.clear();
                          for(integer i=0;i<l.size();i++){
                          if(l[i]==selected){
                          l.remove(i);}
                          }
                          show();
                          return null;
                          }
     public void show(){
             for(String s:l){
                             selectoption so=new SelectOption(s,s);
                             options.add(so);
                            }
                     }

}