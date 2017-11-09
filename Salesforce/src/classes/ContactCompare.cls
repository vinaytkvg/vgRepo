public with sharing class ContactCompare {

    public String C { get; set; }

    public String pwd { get; set; }
    
    public integer pwd1{get;set;}

    public String userName { get; set; }
    public List<contact> con{get; set;}

   
    public PageReference Submit() {
   contact co=[select name,phone from contact WHERE phone=:pwd];
    
    if(userName==co.name){
    pagereference pg=new pagereference('/'+co.id);
    return pg;
    
    }
    else {
 
             return null;
 }
    }

public ContactCompare(){

 
}
}