public virtual class MetaDataComponentPageController {
    Public transient List<FieldDefinition> lst{get;set;}
    public List<WorkFlowItems> workFlowMetaResult {get; set;}
    public List<SelectOption> objects{get;set;}
    public String sel{ get; set; }
    public List<EmailTemplate> emailTempResult{get;set;}
    public Boolean emailPerRender {get;set;}
    public String layObj{get;set;}
    public transient List<EntityDefinition> entityDefinitionList;
    public Integer targetSizeTemplate = 10;
    public Integer countTemplate = 0;
    public Integer pageSizeTemplate = 10;
    public Boolean hasNextTemplate {get; set;}
    public Boolean hasPreviousTemplate {get; set;}
    public List<MetadataService.Layout> layoutList {get; set;}
    public List<String> layoutNamesToDisplay;
    public Integer pageSizeLayout = 10;
    public Integer targetSizeLayout = 10;
    public Integer countLayout = 0;
    public Boolean hasNextLayout {get; set;}
    public Boolean hasPreviousLayout {get; set;}
    public List<WorkFlowItems> workFlowList;
    public Integer pageSizeFlow = 10;
    public Integer targetSizeFlow = 10;
    public Integer countFlow = 0;
    public Boolean hasNextFlow {get; set;}
    public Boolean hasPreviousFlow {get; set;}
    public List<MetadataService.Flow> flowList {get; set;}
    public  Map<String, String> flowNameToStatusMap = new Map<String, String>();
    public  Map<String, Integer> flowNameToVersionMap = new Map<String, Integer>();
    public  Map<String, Integer> flowIdToVersionMap = new Map<String, Integer>();
    public Integer pageSizeProcess = 10;
    public Integer targetSizeProcess = 10;
    public Integer countProcess = 0;
    public Boolean hasNextProcess {get; set;}
    public Boolean hasPreviousProcess {get; set;}
    public Integer pageSize = 10;
    public Integer targetSize = 10;
    public Integer count = 0;
    public Boolean hasNext {get; set;}
    public Boolean hasPrevious {get; set;}
    public List<String> approvalProcessNamesList {get; set;}
    public List<MetadataService.ApprovalProcess> approvalProcessList {get; set;}
    public MetaDataComponentPageController(){
        emailPerRender = false;
        objects = new List<SelectOption>();
        List<EntityDefinition> ed =[SELECT DeveloperName,QualifiedApiName FROM EntityDefinition];
        objects.add(new SelectOption('--None--','--None--'));
        for(EntityDefinition sel: ed)
        {
            objects.add(new SelectOption(sel.QualifiedApiName,sel.QualifiedApiName));
            //readContentFields();
        }
        objects.sort();
        getEmailTemplates();
        workFlowList = new List<WorkFlowItems>();
        approvalProcessNamesList = new List<String>();
        
        if(!Test.isRunningTest()){
            getRetrieveLayoutMetadata();
            if(workFlowList.isEmpty()){
                getRetrieveWorkFLowMetaData();
            }
            getworkFlows();
            getRetrieveFlowMetadata();
            retrieveApprovalProcessNamesList();
            retrieveApprovalProcessMetaData();
        } 
    }   
    public static MetadataService.MetadataPort createService(){
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();
        service.SessionHeader = new MetadataService.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        return service;
    }
    // Profileinfo Code
    public string selectedprofile {set;get;}
    
    public List<Selectoption> getpname(){
        transient List<profile> pf1 = new List<profile>();
        List<selectoption> opt = new List<selectoption>();
        opt.add(new selectoption('','--None--'));
        pf1 =[SELECT id,name FROM profile];
        for(profile pf2 :pf1){
            opt.add(new selectoption(pf2.Name,pf2.name));
            opt.sort();       
        }   
        return opt;
    }
    
    public string permissionsetlist {set;get;}   
    public List<selectOption> getpsetname(){
        List<permissionset> pset1 = new List<permissionset>();
        List<selectoption> opt = new List<selectoption>();
        opt.add(new SelectOption('','--None--'));
        pset1 =[SELECT id,Namespaceprefix,name FROM permissionset WHERE (NOT name like 'X00e%')AND name!='SalesConsoleUser'];
        for(permissionset pset2 :pset1){
            if(pset2.Namespaceprefix!=null){
                opt.add(new selectoption(pset2.Namespaceprefix + '__' + pset2.name,pset2.Namespaceprefix + '__'+ pset2.name));
                
            }
            else
            {
                opt.add(new selectoption(pset2.Name,pset2.name));
            }
            
        }
        opt.sort();  
        return opt;
    }
    
    
    public List<EmailTemplate> emailTemplatesList
    {
        get
        {
            if(emailTemplatesList == null)
            {
                emailTemplatesList = [SELECT ApiVersion,Body,BrandTemplateId,CreatedById,CreatedDate,Description,DeveloperName,Encoding,FolderId,HtmlValue,Id,IsActive,LastModifiedById,LastModifiedDate,LastUsedDate,Markup,Name,NamespacePrefix,Owner.Name,RelatedEntityType,Subject,SystemModstamp,TemplateStyle,TemplateType,TimesUsed,UiType FROM EmailTemplate ORDER BY NAME ASC];
            }
            return emailTemplatesList;
        }
        set;
    }
    
    public void getEmailTemplates(){
        emailPerRender = true;  
        emailTempResult = new List<EmailTemplate>();
        if(emailTemplatesList != null && !emailTemplatesList.isEmpty()){
            for(Integer i = countTemplate ; i < targetSizeTemplate ; i++)
            {   
                if(i < emailTemplatesList.size())
                {
                    emailTempResult.add(emailTemplatesList[i]);
                }
            }
        }
        setNextAndPreviousTemplate();
    }
    public void getNextCountTemplate()
    {
        countTemplate = targetSizeTemplate;
        targetSizeTemplate = targetSizeTemplate + pageSizeTemplate; 
        getEmailTemplates();
    }
    
    public void getPreviousCountTemplate()
    {
        targetSizeTemplate = targetSizeTemplate - pageSizeTemplate;
        countTemplate = targetSizeTemplate - pageSizeTemplate;
        getEmailTemplates();
    }
    
    public void setNextAndPreviousTemplate()
    {
        if(countTemplate != 0 && targetSizeTemplate >= emailTemplatesList.size())
        {   
            hasNextTemplate = false;
            hasPreviousTemplate = true;
        }
        else if(countTemplate == 0)
        {
            hasPreviousTemplate = false;
            if(targetSizeTemplate < emailTemplatesList.size())
            {
            	hasNextTemplate = true;
            }
        }
        else if(targetSizeTemplate < emailTemplatesList.size())
        {
            hasNextTemplate = true;
            hasPreviousTemplate = true;
        }
    }
    public pageReference exportTemplates(){
        PageReference pageRef = new PageReference('/apex/exportEmailTemplates');
        pageRef.setRedirect(false);
        return pageRef;        
    }
    public List<SelectOption> objectList
    {
        get
        {
            if(objectList == null){
                objectList = new List<SelectOption>();
                objectList.add(new SelectOption('--None--','--None--'));
                entityDefinitionList =[SELECT DeveloperName,QualifiedApiName FROM EntityDefinition];
                for(EntityDefinition  sel: entityDefinitionList)
                {
                    objectList.add(new SelectOption(sel.QualifiedApiName,sel.QualifiedApiName));
                }
                objectList.sort();
            }
            return objectList;
        }
        set;       
    }
    public MetadataService.MetadataPort metadataService
    {
        get
        {
            if(metadataService == null)
            {
                metadataService = MetaDataComponentPageController.createService();
            }
            return metadataService;
        }
        set;
    }
    public List<String> layoutNamesList
    {
        get
        {
            if(layoutNamesList == null)
            {
                layoutNamesList = new List<String>();
                MetadataService.ListMetadataQuery listMetaQuery = new MetadataService.ListMetadataQuery();
                listMetaQuery.type_x = 'Layout';
                
                MetadataService.FileProperties[] fieldProp = (MetadataService.FileProperties[]) metadataService.listMetadata(new List<MetadataService.ListMetadataQuery>{listMetaQuery}, 40);
                
                if(fieldProp != null && !fieldProp.isEmpty())
                {
                    for(MetadataService.FileProperties flp : fieldProp)
                    {   
                        if(flp.fullName != null && !flp.fullName.startsWith('LiveChat'))
                        {
                            layoutNamesList.add(flp.fullName);
                        }
                    }
                }
                if(!layoutNamesList.isEmpty())
                {
                    layoutNamesList.sort();
                }
            }
            return layoutNamesList;
        }
        set;
    }
    
    public void getRetrieveLayoutMetadata()
    {   
        layoutList = new List<MetadataService.Layout>();
        List<MetadataService.Layout> metadataResponseOfLayouts;
        layoutNamesToDisplay = new List<String>();
        for(Integer i = countLayout ; i < targetSizeLayout ; i++)
        {   
            if(i < layoutNamesList.size())
            {
                String layOutName = layoutNamesList[i];
                Pattern p = Pattern.compile('(.*(?=(__.*__)))');
                Matcher m = p.matcher(layOutName);
                if(m.find())
                {
                    String placeHolder = layOutName.split('-')[0] +'{0}{1}{2}'+layOutName.split('-')[1];
                    String mngPkglayOutName = String.format(placeHolder,new List<String> {'-',m.group(1),'__'});
                    layoutNamesToDisplay.add(mngPkglayOutName);
                }
                else
                {
                    layoutNamesToDisplay.add(layOutName);
                }
            }
        }
        
        if(layoutNamesToDisplay!= null && !layoutNamesToDisplay.isEmpty())
        {
            metadataResponseOfLayouts = (MetadataService.Layout[]) metadataService.readMetadata('Layout', layoutNamesToDisplay).getRecords();
        }
        
        if(metadataResponseOfLayouts != null)
        {
            for(MetadataService.Layout layoutItem : metadataResponseOfLayouts)
            {   
                if(layoutItem.fullName != null)
                {
                    layoutList.add(layoutItem);       
                }
            }
        }
        setNextAndPreviousLayout();
    }
    public void getNextCountLayout()
    {
        countLayout = targetSizeLayout ;
        targetSizeLayout = targetSizeLayout + pageSizeLayout ; 
        getRetrieveLayoutMetadata();
    }
    
    public void getPreviousCountLayout()
    {
        targetSizeLayout = targetSizeLayout - pageSizeLayout ;
        countLayout = targetSizeLayout - pageSizeLayout ;
        getRetrieveLayoutMetadata();
    }
    
    public void setNextAndPreviousLayout()
    {
        if(countLayout != 0 && targetSizeLayout >= layoutNamesList.size())
        {   
            hasNextLayout = false;
            hasPreviousLayout = true;
        }
        else if(countLayout == 0)
        {
            hasPreviousLayout = false;
            if(targetSizeLayout < layoutNamesList.size())
            {
            	hasNextLayout = true;
            }
        }
        else if(targetSizeLayout < layoutNamesList.size())
        {
            hasNextLayout = true;
            hasPreviousLayout = true;
        }
    }
    
    public pageReference exportLayouts(){
        PageReference pageRef = new PageReference('/apex/LayoutsExport');
        pageRef.setRedirect(false);
        return pageRef;        
    }
    public void getworkFlows()
    {
        workFlowMetaResult = new List<WorkFlowItems>();
        for(Integer i = countFlow ; i < targetSizeFlow ; i++)
        {   
            if(i < workFlowList.size())
            {
                workFlowMetaResult.add(workFlowList[i]);
            }
        }
        setNextAndPreviousFlow();
    }
    public void getRetrieveWorkFLowMetaData(){
        HttpRequest req = new HttpRequest();
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
        req.setHeader('Content-Type', 'application/json');
        
        req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm()+'/services/data/v34.0/tooling/query/?q=Select+name,fullname,metadata+from+WorkflowRule');
        req.setMethod('GET');
        
        Http h = new Http();
        HttpResponse res = h.send(req);
        string json2 = res.getBody(); 
        WorkFlowMeta lst_workflow = (WorkFlowMeta) Json.deserialize(json2, WorkFlowMeta.class);
        workFlowList = lst_workflow.records;
        if(workFlowList != null && !workFlowList.isEmpty()){
            for(WorkFlowItems worlFlowItem : workFlowList){
                worlFlowItem.objectName = worlFlowItem.FullName.subStringBefore('.');
            }
        }
        workFlowList.sort();
    } 
    
    public pageReference exportworkflow(){
        
        PageReference pr = new PageReference('/apex/Workflowsexport');
        pr.setRedirect(false);
        return pr;
    }
    
    public class WorkFlowMeta{
        public WorkFlowItems[] records{get; set;}
        public WorkFlowMeta(WorkFlowItems[] records){
            this.records = records;
        }
    }
    
    public class WorkFlowItems implements Comparable{ 
        public String Name{get; set;}
        public String FullName{get; set;}
        public WorkFlowItemInfo metadata{get; set;}
        public String objectName {get; set; }
        
        public WorkFlowItems(String Name, String FullName, WorkFlowItemInfo metadata, String objectName){
            this.name = name;
            this.fullName = fullName;
            this.metadata = metadata;
            this.objectName = objectName;       
        }
        
        public Integer compareTo(Object fieldCompareTo){
            WorkFlowItems compareFieldTo =(WorkFlowItems) fieldCompareTo;
            if(Name<compareFieldTo.Name){
                return -1;
            }
            else if(Name>compareFieldTo.Name){
                return 1;
            }
            else{
                return 0;
            }
        }
    }
    
    public class WorkFlowItemInfo {
        public String formula{get; set;}
        public boolean active{get; set;}
        public String description{get; set;}
        public String triggerType{get; set;}
        public List<RuleCriteriaItem> criteriaItems {get; set;}
        public List<WorkFlowAction> actions {get; set;}
        public List<WorkFlowTimeTrigger> workflowTimeTriggers {get; set;}
        public WorkFlowItemInfo(String formula, boolean active, String description, String triggerType){
            this.formula = formula;
            this.active = active;
            this.description = description;
            this.triggerType = triggerType;
        }
    }
    
    public void getNextCountFlow()
    {
        countFlow = targetSizeFlow ;
        targetSizeFlow = targetSizeFlow + pageSizeFlow; 
        getworkFlows();
    }
    
    public void getPreviousCountFlow()
    {
        targetSizeFlow = targetSizeFlow - pageSizeFlow;
        countFlow = targetSizeFlow - pageSizeFlow;
        getworkFlows();
    }
    
    public void setNextAndPreviousFlow()
    {
        if(countFlow != 0 && targetSizeFlow >= workFlowList.size())
        {   
            hasNextFlow = false;
            hasPreviousFlow = true;
        }
        else if(countFlow == 0)
        {
            hasPreviousFlow = false;
            if(targetSizeFlow < workFlowList.size())
            {
            	hasNextFlow = true;
        	}
        }
        else if(targetSizeFlow < workFlowList.size())
        {
            hasNextFlow = true;
            hasPreviousFlow = true;
        }
    }
    
    
    public class WorkFlowTimeTrigger 
    {
        public List<WorkFlowAction> actions {get; set;}
    }
    
    public class WorkFlowAction
    {
        public String name {get; set;}
        public String type {get; set;}
    }
    
    public class RuleCriteriaItem
    {
        public String field {get; set;}
        public String operation {get; set;}
        public String value {get; set;}
    }
    public List<String> flowNamesList
    {
        get
        {
            if(flowNamesList == null)
            {
                flowNamesList = new List<String>();
                MetadataService.ListMetadataQuery listMetaQuery = new MetadataService.ListMetadataQuery();
                listMetaQuery.type_x = 'Flow';
                
                MetadataService.FileProperties[] fieldProp = (MetadataService.FileProperties[]) metadataService.listMetadata(new List<MetadataService.ListMetadataQuery>{listMetaQuery}, 40);
                
                if(fieldProp != null && !fieldProp.isEmpty())
                {
                    for(MetadataService.FileProperties flp : fieldProp)
                    {   
                        if(flowIdToStatus != null && flowIdToStatus.containsKey(flp.id))
                        {
                            flowNameToStatusMap.put(flp.fullName, flowIdToStatus.get(flp.id));
                            if(!flp.fullName.substringAfterLast('-').isNumeric())
                            {
                                flp.fullName = flp.fullName + '-' + flowIdToVersionMap.get(flp.id);                          
                            }
                        }
                        flowNamesList.add(flp.fullName);
                    }
                }
                
                if(!flowNamesList.isEmpty())
                {
                    flowNamesList.sort();
                }
            }
            return flowNamesList;
        }
        set;
    }
    public Map<id, String> flowIdToStatus
    {
        get
        {
            if(flowIdToStatus == null)
            {
                flowIdToStatus = new Map<id, String>();
                HttpRequest req = new HttpRequest();
                req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
                req.setHeader('Content-Type', 'application/json');
                
                req.setEndpoint(Url.getSalesforceBaseUrl().toExternalForm()+'/services/data/v40.0/tooling/query/?q=Select+ID,Status,VersionNumber+FROM+Flow');
                req.setMethod('GET');
                
                Http h = new Http();
                HttpResponse res = h.send(req);
                FlowsMetaData fmd = (FlowsMetaData)System.Json.deserialize(res.getBody(), FlowsMetaData.class);
                if(fmd != null && fmd.records != null)
                {
                    for(FlowItem fi: fmd.records)
                    {
                        flowIdToStatus.put(fi.Id, fi.Status);
                        flowIdToVersionMap.put(fi.Id, fi.VersionNumber);
                    }
                }
            }
            return flowIdToStatus;
        }
        set;
    }
    public void getRetrieveFlowMetadata()
    {
        flowList = new List<MetadataService.Flow>();
        List<MetadataService.Flow> metadataResponseOfFlows;
        List<String> flowNamesToDisplay = new List<String>();
        
        for(Integer i = countProcess ; i < targetSizeProcess ; i++)
        {   
            if(i < flowNamesList.size())
            {
                flowNamesToDisplay.add(flowNamesList[i]);
            }
        }
        
        if(flowNamesToDisplay!= null && !flowNamesToDisplay.isEmpty())
        {
            metadataResponseOfFlows = (MetadataService.Flow[]) metadataService.readMetadata('Flow', flowNamesToDisplay).getRecords();
        }
        
        if(metadataResponseOfFlows != null){
            for(MetadataService.Flow flowItem : metadataResponseOfFlows)
            {
                if(flowNameToStatusMap.containsKey(flowItem.fullName))
                {
                    flowItem.Status = flowNameToStatusMap.get(flowItem.fullName);
                }
                else if(flowNameToStatusMap.containsKey(flowItem.fullName.substringBeforeLast('-')))
                {   
                    flowItem.status = flowNameToStatusMap.get(flowItem.fullName.substringBeforeLast('-'));
                }
                flowList.add(flowItem);
            }
        }
        setNextAndPreviousProcess();
    }
    public class FlowsMetaData
    {
        public List<FlowItem> records;
        public FlowsMetaData(List<FlowItem> records)
        {
            this.records = records;
        }
    }
    
    public class FlowItem
    {
        public String id ;
        public String status;
        public Integer versionNumber;
        public FlowItem(String id, String status, Integer versionNumber)
        {
            this.id = id;
            this.status = status;
            this.versionNumber = versionNumber;
        }
    }
    
    public void getNextFlowCountProcess()
    {
        countProcess = targetSizeProcess;
        targetSizeProcess = targetSizeProcess+ pageSizeProcess; 
        getRetrieveFlowMetadata();
    }
    
    public void getPreviousFlowCountProcess()
    {
        targetSizeProcess = targetSizeProcess - pageSizeProcess;
        countProcess = targetSizeProcess - pageSizeProcess;
        getRetrieveFlowMetadata();
    }
    
    public void setNextAndPreviousProcess()
    {
        if(countProcess != 0 && targetSizeProcess >= flowNamesList.size())
        {   
            hasNextProcess = false;
            hasPreviousProcess = true;
        }
        else if(countProcess == 0)
        {
            hasPreviousProcess = false;
            if(targetSizeProcess < flowNamesList.size()){
                 hasNextProcess = true;
            }
        }
        else if(targetSizeProcess < flowNamesList.size())
        {
            hasNextProcess = true;
            hasPreviousProcess = true;
        }
    }
    
    public PageReference exportFlows()
    {
        PageReference pageRef = new PageReference('/apex/FlowsExport');
        pageRef.setRedirect(false);
        return pageRef;
    }
    public void retrieveApprovalProcessMetaData()
    {   
        approvalProcessList = new List<MetadataService.ApprovalProcess>();
        List<String> approvalNamesList = new List<String>();
        for(Integer i = count ; i < targetSize ; i++)
        {   
            if(i < approvalProcessNamesList.size())
            {
                approvalNamesList.add(approvalProcessNamesList[i]);
            }
        }
        System.debug(approvalNamesList);
        if(!approvalNamesList.isEmpty())
        {
            approvalProcessList = (MetadataService.ApprovalProcess[]) metadataService.readMetadata('ApprovalProcess', approvalNamesList).getRecords();
        }
        setNextAndPrevious();
    }
    
    public void retrieveApprovalProcessNamesList()
    { 
        MetadataService.MetadataPort service = metadataService;
        
        MetadataService.ListMetadataQuery listMetaQuery = new MetadataService.ListMetadataQuery();
        listMetaQuery.type_x = 'ApprovalProcess';
        MetadataService.ListMetadataQuery[] listMeatArr = new MetadataService.ListMetadataQuery[]{};
            listMeatArr.add(listMetaQuery);
        MetadataService.FileProperties[] fieldProp = (MetadataService.FileProperties[]) metadataService.listMetadata(listMeatArr, 40);
        if(fieldProp != null && !fieldProp.isEmpty()){
            for(MetadataService.FileProperties flp : fieldProp)
            {
                approvalProcessNamesList.add(flp.fullName);
            }
        }
    }
    
    public pageReference exportApprovals(){
        PageReference pageRef = new PageReference('/apex/exportApprovalTemplates');
        pageRef.setRedirect(false);
        return pageRef;        
    }
    
    public void getNextCount()
    {
        count = targetSize;
        targetSize = targetSize+ pageSize; 
        retrieveApprovalProcessMetaData();
    }
    
    public void getPreviousCount()
    {
        targetSize = targetSize - pageSize;
        count = targetSize - pageSize;
        retrieveApprovalProcessMetaData();
    }
    
    public void setNextAndPrevious()
    {
        if(count != 0 && targetSize >= approvalProcessNamesList.size())
        {   
            hasNext = false;
            hasPrevious = true;
        }
        else if(count == 0)
        {
            hasPrevious = false;
            if(targetSize < approvalProcessNamesList.size())
            {
                hasNext = true;
            }   
        }
        else if(targetSize < approvalProcessNamesList.size())
        {
            hasNext = true;
            hasPrevious = true;
        }
    }
}