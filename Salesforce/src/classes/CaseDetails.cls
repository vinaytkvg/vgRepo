public with sharing class CaseDetails {

    public List<case> getCase() {
    List<case> lc=new List<case>();
    lc=[SELECT CaseNumber,Accountid,ContactId FROM case];
        return lc;
    }

}