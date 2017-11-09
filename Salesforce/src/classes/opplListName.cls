public with sharing class opplListName {

    public PageReference save() {
        return null;
    }


    public PageReference edit() {
    
        return null;
    }




    public List<opportunity> getOpportunity() {
     List<opportunity> op=new List<Opportunity>();
     op=[SELECT Name,amount FROM Opportunity];
        return op;
    }

}