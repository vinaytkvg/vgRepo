public class CreateRecordInAccountNew {
    public string aname{get;set;}
    public string aphone{get;set;}
    public void submit(){
        Account a= new Account(name=aname,phone=aphone);
        insert a;
    }
    public void reset(){
        aname='ENTER ACCOUNT NAME';
        aphone='ENTER PHONE NUMBER';
    }
}