public class RetrieveObjectMetaDataController {
    Public transient List<FieldDefinition> lst{get;set;}
    public List<Wrapper> Wrapperlst{get;set;}
    public String selectedObject{ get; set; }
    public transient List<wrapper> standardList;
    public transient List<wrapper> customList;
    
    public RetrieveObjectMetaDataController(){
        Wrapperlst = new List<Wrapper>();
        selectedObject = ApexPages.currentPage().getParameters().get('selectedObjName');
        fetch();
    }
    
    public void fetch(){
        if(String.isNotBlank(selectedObject)) {
            standardList= new List<Wrapper>();
            customList=new List<Wrapper>();
            lst = [SELECT EntityDefinition.developerName,NamespacePrefix,EntityDefinitionId,Label,DeveloperName,DataType,MasterLabel,ControllingFieldDefinitionId,ControllingFieldDefinition.DeveloperName,ControllingFieldDefinition.Label,QualifiedApiName,IsFieldHistoryTracked,ReferenceTargetField,IsIndexed FROM FieldDefinition WHERE EntityDefinitionId =: selectedObject];
            for(FieldDefinition fd:lst){
                if((fd.QualifiedApiName.contains('__c'))||(fd.QualifiedApiName.contains('__pc')))
                {
                    customList.add(new wrapper(fd));  
                }
                else if(!fd.QualifiedApiName.contains('__c')){
                    if(!fd.QualifiedApiName.contains('__pc')){
                        standardList.add(new wrapper(fd));
                    }
                }
            }
            standardList.sort();
            customList.sort();
            Wrapperlst.addAll(standardList);
            Wrapperlst.addAll(customList);  
            try {
                MetadataService.MetadataPort service = MetaDataComponentPageController.createService();
                MetadataService.CustomObject custobj=(MetadataService.CustomObject) service.readMetadata('CustomObject', new String[] {selectedObject}).getRecords()[0];
                System.debug('debug mine '+custobj);
                if(custobj != null)
                {
                    List<MetadataService.CustomField> flds =custobj.fields;         
                    for(MetadataService.CustomField fld:flds)
                    { 
                        for(wrapper lwr:Wrapperlst)
                        {
                            if(lwr.fd.QualifiedApiName==fld.fullname)
                            {
                                lwr.description=fld.description;
                                lwr.inlineHelpText=fld.inlineHelpText;
                            }
                            
                        }
                    }
                }   
            }
            Catch(Exception e){ 
                system.debug('fail'+e.getStackTraceString());
            }            
            
            for(wrapper lwr:Wrapperlst)
            {
                if((lwr.fd.QualifiedApiName.contains('__c'))||(lwr.fd.QualifiedApiName.contains('__pc')))
                {
                    lwr.stdOrCust='Custom';
                }
                else
                {
                    lwr.stdOrCust='Standard';
                }   
            }
        }
    }    
    
    public pageReference exportObject(){
        PageReference pr = new PageReference('/apex/ObjectInformationExport');
        pr.setRedirect(false);
        return pr;
    }    
    
    public class wrapper implements Comparable{
        public FieldDefinition fd{get;set;}
        public String description{get;set;}
        public String inlineHelpText{get;set;}
        public String stdOrCust{get;set;}
        public wrapper(FieldDefinition fld){
            fd = fld;
        }
        public Integer compareTo(Object fieldCompareTo){
            wrapper compareFieldTo=(wrapper) fieldCompareTo;
            if(fd.Label< compareFieldTo.fd.Label){
                return -1;
            }
            else if(fd.Label>compareFieldTo.fd.Label){
                return 1;
            }
            else
            {
                return 0;
            }
        }
    }
}