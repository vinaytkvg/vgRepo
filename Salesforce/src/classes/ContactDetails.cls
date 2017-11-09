public class ContactDetails {
public List<Contact> con {get; set;}
public ContactDetails(){

Con=[SELECT name,Account.name,Account.AnnualRevenue FROM Contact];
}
}