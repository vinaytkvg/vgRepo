public class SampleSelectCheckbox {
String[] countries = new String[]{};
public opportunity op{get;set;}
public String selected{get;set;}


public SampleSelectCheckbox(){
op=new Opportunity();


}
public PageReference test() {


return null;

}

public List<SelectOption> getItems() {
List<SelectOption> options = new List<SelectOption>();

options.add(new SelectOption('US','US'));
options.add(new SelectOption('CANADA','Canada'));
options.add(new SelectOption('MEXICO','Mexico'));
return options;
}
public String[] getCountries() {
return countries;
}
public void setCountries(String[] countries) {
this.countries = countries;
}
}