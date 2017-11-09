public with sharing class MYSOQLPARCTICE1 {
public List<Account> vin{get;set;}
public MYSOQLPARCTICE1(){
	vin=[SELECT Name,Phone FROM Account ORDER BY Name ASC NULLS LAST];
	
}
}