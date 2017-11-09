public with sharing class pickListVFpage {
public String PickList {  set; }
    public String pl1 { get; set; }
    public String pl2 { get; set; }
    public PageReference save() {
        return null;
    }
public List<SelectOption> getPickList() {
        List<SelectOption> Pl = new List<SelectOption>();
        Pl.add(new SelectOption('','-None-'));
        Pl.add(new SelectOption('INDIA','India'));
        Pl.add(new SelectOption('USA','USA'));
        Pl.add(new SelectOption('United Kingdom','UK'));
        Pl.add(new SelectOption('Germany','Germany'));
        Pl.add(new SelectOption('Ireland','Ireland'));
        
        return Pl;
    }


}