public class DynamicAccountFieldsLister {

    public Account acc{get;set;}
 
    public DynamicAccountFieldsLister(ApexPages.StandardController controller) 
    {
        String qId =ApexPages.currentPage().getParameters().get('qid');
        if(qId != null)
        {
            String querystring='SELECT Id'+ joinItems(editableFields,',') +'FROM Account WHERE Id =:qId';
            acc = Database.query(querystring);
        }
    }
    
    public List<String> editableFields {
        get
        {
            if (editableFields == null) 
            {
                editableFields = new List<String>();
                editableFields.add('name');
                editableFields.add('Industry');
                editableFields.add('AnnualRevenue');
                editableFields.add('BillingCity');
            }
          return editableFields ;
        }
        set;
    }
    
    public static String joinItems(List<String> fieldList,String seperator)
    {
      if(fieldList == null)
           return null;
      String joinedFields;
     
      for(String s :fieldList)
      {
        joinedFields += seperator+s+' ';
      }
      return joinedFields.remove('null');
    }

}