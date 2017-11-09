public class RetrievePermissionSetsMetaData {    
    public String selectedPermissionSet {get; set;}
    public List<fromJSON.cls_PermissionSetApplicationVisibility> applivisible{get;set;}
    public List<fromJSON.cls_PermissionSetApexClassAccess> clsaccs{get;set;}
    public List<fromJSON.cls_PermissionSetCustomPermissions> psetcust{get;set;}
    public List<fromJSON.cls_PermissionSetExternalDataSourceAccess> persetexdaso {get;set;}
    public List<fromJSON.cls_PermissionSetFieldPermissions> persetfldper {get;set;}
    public List<fromJSON.cls_PermissionSetObjectPermissions> persetobjper {get;set;}
    public List<fromJSON.cls_PermissionSetApexPageAccess> persetapxpg {get;set;}
    public List<fromJSON.cls_PermissionSetRecordTypeVisibility> persetrecvis {get;set;}
    public List<fromJSON.cls_PermissionSetTabSetting> persettabset {get;set;}
    public List<fromJSON.cls_PermissionSetUserPermission> persetuper {get;set;}
    
    public RetrievePermissionSetsMetaData(){
        selectedPermissionSet = ApexPages.CurrentPage().getParameters().get('permissionSetName');
        getPermissonset();
    }
    
    public void getPermissonset(){
        if(selectedPermissionSet != null){
            try{
                MetadataService.MetadataPort service = new MetadataService.MetadataPort();
                service.SessionHeader = new MetadataService.SessionHeader_element();
                service.SessionHeader.sessionId = UserInfo.getSessionId();
                list<String> lstFullNames = new list<String>();
                lstFullNames.add(selectedPermissionSet);
                
                MetadataService.PermissionSet[] permissonsets = (MetadataService.PermissionSet[])service.readMetadata('PermissionSet',lstFullNames ).getRecords();
                
                applivisible = new List<fromJSON.cls_PermissionSetApplicationVisibility>();
                clsaccs = new List<fromJSON.cls_PermissionSetApexClassAccess>();
                psetcust = new List<fromJSON.cls_PermissionSetCustomPermissions>();
                persetexdaso = new List<fromJSON.cls_PermissionSetExternalDataSourceAccess>();
                persetfldper= new List<fromJSON.cls_PermissionSetFieldPermissions>();
                persetobjper = new List<fromJSON.cls_PermissionSetObjectPermissions>();
                persetapxpg = new List<fromJSON.cls_PermissionSetApexPageAccess>();
                persetrecvis = new List<fromJSON.cls_PermissionSetRecordTypeVisibility>();
                persettabset = new List<fromJSON.cls_PermissionSetTabSetting>();
                persetuper = new List<fromJSON.cls_PermissionSetUserPermission>();
                
                for(MetadataService.PermissionSet pes:permissonsets){
                    
                    integer avisi = pes.applicationVisibilities!=null?pes.applicationVisibilities.size():0;
                    integer psetacl = pes.classAccesses!=null?pes.classAccesses.size():0;
                    integer psetcup = pes.customPermissions!=null?pes.customPermissions.size():0;
                    integer exdre = pes.externalDataSourceAccesses!=null?pes.externalDataSourceAccesses.size():0;
                    integer fper = pes.fieldPermissions!=null?pes.fieldPermissions.size():0;
                    integer obp = pes.objectPermissions!=null?pes.objectPermissions.size():0;
                    integer app = pes.pageAccesses!=null?pes.pageAccesses.size():0;
                    integer recv = pes.recordTypeVisibilities!=null?pes.recordTypeVisibilities.size():0;
                    integer tbs = pes.tabSettings!=null?pes.tabSettings.size():0;
                    integer upr = pes.userPermissions!=null?pes.userPermissions.size():0;
                    
                    
                    //Application visibility
                    for(integer i=0;i<avisi;i++){
                        fromJSON.cls_PermissionSetApplicationVisibility avs = new fromJSON.cls_PermissionSetApplicationVisibility();
                        avs.application = pes.applicationVisibilities[i].application;
                        avs.visible = pes.applicationVisibilities[i].visible;
                        applivisible.add(avs);                  
                    }
                    
                    //ApexClass Access
                    for(integer i=0;i<psetacl;i++){
                        fromJSON.cls_PermissionSetApexClassAccess pca = new fromJSON.cls_PermissionSetApexClassAccess();
                        pca.apexClass = pes.classAccesses[i].apexClass;
                        pca.enabled = pes.classAccesses[i].Enabled;
                        clsaccs.add(pca);                  
                    }
                    
                    //PermissionSetCustomPermissions
                    for(integer i=0;i<psetcup;i++){
                        fromJSON.cls_PermissionSetCustomPermissions pscp = new fromJSON.cls_PermissionSetCustomPermissions();
                        pscp.name = pes.customPermissions[i].name;
                        pscp.enabled = pes.customPermissions[i].Enabled;
                        psetcust.add(pscp);                  
                    }
                    
                    //PermissionSetExternalDataSourceAccess
                    for(integer i=0;i<exdre;i++){
                        fromJSON.cls_PermissionSetExternalDataSourceAccess pseda = new fromJSON.cls_PermissionSetExternalDataSourceAccess();
                        pseda.externalDataSource = pes.externalDataSourceAccesses[i].externalDataSource ;
                        pseda.enabled = pes.externalDataSourceAccesses[i].enabled;
                        persetexdaso.add(pseda);                  
                    }
                    
                    //PermissionSetFieldPermissions
                    for(integer i=0;i<fper;i++){
                        fromJSON.cls_PermissionSetFieldPermissions psetfpe = new fromJSON.cls_PermissionSetFieldPermissions();
                        psetfpe.field = pes.fieldPermissions[i].field;
                        psetfpe.editable = pes.fieldPermissions[i].editable;
                        psetfpe.readable = pes.fieldPermissions[i].readable;
                        persetfldper.add(psetfpe);                  
                    }
                    
                    //PermissionSetObjectPermissions
                    for(integer i=0;i<obp;i++){
                        fromJSON.cls_PermissionSetObjectPermissions psetobp = new fromJSON.cls_PermissionSetObjectPermissions();
                        // psetobp.object= pes.objectPermissions[i].object;
                        psetobp.allowCreate= pes.objectPermissions[i].allowCreate;
                        psetobp.allowDelete= pes.objectPermissions[i].allowDelete;
                        psetobp.allowEdit= pes.objectPermissions[i].allowEdit;
                        psetobp.allowRead= pes.objectPermissions[i].allowRead;
                        psetobp.modifyAllRecords= pes.objectPermissions[i].modifyAllRecords;
                        psetobp.viewAllRecords= pes.objectPermissions[i].viewAllRecords;                       
                        persetobjper.add(psetobp);                  
                    }
                    
                    //PermissionSetApexPageAccess
                    for(integer i=0;i<app;i++){
                        fromJSON.cls_PermissionSetApexPageAccess psacs = new fromJSON.cls_PermissionSetApexPageAccess();
                        psacs.apexPage = pes.pageAccesses[i].apexPage;
                        psacs.enabled = pes.pageAccesses[i].enabled;
                        persetapxpg.add(psacs);                  
                    }
                    
                    //PermissionSetRecordTypeVisibility
                    for(integer i=0;i<recv;i++){
                        fromJSON.cls_PermissionSetRecordTypeVisibility psrtv = new fromJSON.cls_PermissionSetRecordTypeVisibility();
                        psrtv.recordType = pes.recordTypeVisibilities[i].recordType;
                        psrtv.visible = pes.recordTypeVisibilities[i].visible;
                        persetrecvis.add(psrtv);                  
                    }
                    
                    //PermissionSetTabSetting
                    for(integer i=0;i<tbs;i++){
                        fromJSON.cls_PermissionSetTabSetting psts = new fromJSON.cls_PermissionSetTabSetting();
                        psts.tab= pes.tabSettings[i].tab;
                        psts.visibility= pes.tabSettings[i].visibility;
                        persettabset.add(psts);                  
                    }
                    
                    //PermissionSetUserPermission
                    for(integer i=0;i<upr;i++){
                        fromJSON.cls_PermissionSetUserPermission psup = new fromJSON.cls_PermissionSetUserPermission();
                        psup.name= pes.userPermissions[i].name;
                        psup.enabled= pes.userPermissions[i].enabled;
                        persetuper.add(psup);                  
                    }
                    
                }
            }
            catch(Exception ex) {
                System.debug('Permission '+ex.getMessage());
            } 
        }     
    } 
     
    public pageReference exportPermissionSetsMetaData(){
        PageReference pr = new PageReference('/apex/permissionsetinfoexport');
        pr.setRedirect(false);
        return pr;
    }      
}