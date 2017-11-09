public class ObjectNames {
public Map<String,Schema.SobjectType> gd{get;set;}
public Set<String> Names{get;set;}
List<selectOption> options{get;set;}
public ObjectNames(){
gd=Schema.getGlobaldescribe();
names=gd.KeySet();
objpl();
}
public void objpl(){
options=new List<SelectOption>();
for(string s:names){
SelectOption so=new SelectOption(s,s);
options.add(so);
}
}
public String getlso(){
return null;
}
}