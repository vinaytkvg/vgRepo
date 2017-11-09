public class AccountDetails {
public List<Account> la{get;set;}
public AccountDetails(){
la=[SELECT Name,(SELECT Contact.Lastname ,contact.firstName From Account.Contacts) FROM Account];
}
}