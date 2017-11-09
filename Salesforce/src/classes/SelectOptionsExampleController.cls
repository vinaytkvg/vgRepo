public with sharing class SelectOptionsExampleController {
    
    public PageReference sampleTest() {
        return null;
    }
    
    List<String> siblingNames = new List<String>();
    public Boolean size {
        get{
            return siblingNames.size() != 0;
        }
        set;
    }
    public List<SelectOption> getItems() {
        return new List<SelectOption> {
            new selectOption('vinay','Ganesh'),
            new selectOption('Naveen','Sai'),
            new selectOption('Saahi','Banty')
        };
    }
    
    public List<String> getSiblingNames() {
        return siblingNames;
    }
    
    public void setSiblingNames(List<String> names) {
        this.siblingNames = names;
    }
}