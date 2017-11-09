public class FindViewState {
 Public Account acc{get;private set;}
 
 public FindViewState()
 {
  String id = ApexPages.CurrentPage().getParameters().get('accId');
  if(!String.isEmpty(id))
  {
    acc=[SELECT id,name,annualRevenue FROM Account WHERE Id =:id ];
  }
 }
 
 public PageReference save()
 {
  update acc;
  PageReference p = new PageReference('https://www.google.co.in');
  return p;
 }
}