public class Recordpicklist{
public List<SelectOption> lso{get;set;}
public Recordpicklist(){
lso=new List<SelectOption>();

List<Contact> c=[SELECT Name FROM Contact];
for(Contact c1:c){
lso.add(new SelectOption(c1.name,c1.name));
}
}
}