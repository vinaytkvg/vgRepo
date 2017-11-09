public class AccountExtensionClass {
    public Account acc{get;set;}
    public List<account> accounts{get; set;}
    public AccountExtensionClass(ApexPages.StandardController controller) {
        if(ApexPages.currentPage().getParameters().get('id') == null){
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.Error,'Id is not in the url'));
        }
        controller.addFields(new List<String>{'annualRevenue','name'});
        this.acc = (account)controller.getRecord();
        accounts = new List<Account>{acc};
        System.debug(acc.annualRevenue);
    }
    
    public PageReference increaseAnnualRevenue() {
        if(acc != null) {
            acc.annualRevenue = acc.annualRevenue * 2;
            update acc;
        }
        
        return new ApexPages.StandardController(acc).view();
    }
}