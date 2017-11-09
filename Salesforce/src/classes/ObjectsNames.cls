public class ObjectsNames {
public Map<String,Schema.SobjectType> gd{get;set;}
public Set<String> Names{get;set;}
 public List<SelectOption> options{get;set;}
public ObjectsNames(){
gd=Schema.getGlobaldescribe();
names=gd.KeySet();

objpl();
}
public void objpl(){
options=new List<SelectOption>();
for(string s:names){
Schema.DescribeSobjectResult result=gd.get(s).getDescribe();
            if(result.isCustom()){
SelectOption so=new SelectOption(s,s);
options.add(so);
}
}
}
}