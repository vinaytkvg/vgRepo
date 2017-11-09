public with sharing class PLPAGEs {

    public List<selectOption> getPLIST2() {
        List<selectOption> pl2= new  List<selectOption>();
        pl2.add(new selectoption('AP','ap'));
        pl2.add(new selectoption('TS','TS'));
        pl2.add(new selectoption('MP','MP'));
        pl2.add(new selectoption('TN','TN'));
        return pl2;
    }


    public String PickList2 { get; set; }

    public String PickList1 { get; set; }

    public PageReference save() {
        return null;
    }

}