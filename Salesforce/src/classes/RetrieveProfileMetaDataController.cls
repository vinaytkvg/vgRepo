public class RetrieveProfileMetaDataController {
    public string selectedProfile {get; set;}
    public List<Profileinformation.cls_userPermissions> userPerLst {get;set;}
    public List<Profileinformation.cls_applicationVisibilities> appvisible {get;set;}
    public List<Profileinformation.cls_classAccesses> clsaccess {get;set;}
    public List<Profileinformation.cls_customPermissions> custpermi {get;set;}
    public List<Profileinformation.cls_externalDataSourceAccesses> Extdasour {get;set;}
    public List<Profileinformation.cls_fieldPermissions> Fldper {get;set;}
    public List<Profileinformation.cls_loginIpRanges> logipran {get;set;}
    public List<Profileinformation.cls_objectPermissions> Objpermi {get;set;}
    public List<Profileinformation.cls_pageAccesses> pageacce {get;set;}
    public List<Profileinformation.cls_recordTypeVisibilities> rectypvisi {get;set;}
    public List<Profileinformation.cls_tabVisibilities> Tabvisi {get;set;}
    public List<Profileinformation.cls_layoutAssignments> layoutAssign {get;set;}
    public map<string,string> stdProf= new map<string,string>{'System Administrator'=>'Admin','Standard User'=>'Standard','Marketing User'=>'MarketingProfile',
        'Contract Manager'=>'ContractManager','Solution Manager'=>'SolutionManager','Read Only'=>'ReadOnly',
        'High Volume Customer Portal'=>'HighVolumePortal'};
            
    public RetrieveProfileMetaDataController() {
        selectedProfile = ApexPages.CurrentPage().getParameters().get('profileName');
        getProfiles();
    }
    
    public void getProfiles(){
        if(selectedProfile != null){
            try {         
                MetadataService.MetadataPort service = new MetadataService.MetadataPort();
                service.SessionHeader = new MetadataService.SessionHeader_element();
                service.SessionHeader.sessionId = UserInfo.getSessionId();
                list<String> lstFullNames = new list<String>();        
                if(stdProf.containsKey(selectedprofile)){
                    lstFullNames.add(stdProf.get(selectedprofile));
                }
                else{
                    lstFullNames.add(selectedprofile);
                }
                MetadataService.Profile[] profiles = (MetadataService.Profile[])service.readMetadata('Profile', lstFullNames ).getRecords();
                
                
                userPerLst = new List<Profileinformation.cls_userPermissions>(); 
                appvisible = new List<Profileinformation.cls_applicationVisibilities>();
                clsaccess = new List<Profileinformation.cls_classAccesses>();
                custpermi= new List<Profileinformation.cls_customPermissions>();
                Extdasour = new List<Profileinformation.cls_externalDataSourceAccesses>();
                Fldper = new List<Profileinformation.cls_fieldPermissions>();
                logipran = new List<Profileinformation.cls_loginIpRanges>(); 
                Objpermi = new List<Profileinformation.cls_objectPermissions>();
                pageacce= new List<Profileinformation.cls_pageAccesses>(); 
                rectypvisi = new List<Profileinformation.cls_recordTypeVisibilities>();
                Tabvisi =new List<Profileinformation.cls_tabVisibilities>();
                layoutAssign = new List<Profileinformation.cls_layoutAssignments>();
                
                for(MetadataService.Profile pf:profiles){
                    
                    integer uper = pf.userPermissions!=null?pf.userPermissions.size():0;
                    integer max = pf.applicationVisibilities!=null?pf.applicationVisibilities.size():0;
                    integer maxclsv = pf.classAccesses!=null?pf.classAccesses.size():0;
                    integer maxcusp = pf.customPermissions!=null?pf.customPermissions.size():0;
                    integer exds = pf.externalDataSourceAccesses!=null?pf.externalDataSourceAccesses.size():0;
                    integer fldp = pf.fieldPermissions!=null?pf.fieldPermissions.size():0;
                    integer loip = pf.loginIpRanges!=null?pf.loginIpRanges.size():0;
                    integer objpe = pf.objectPermissions!=null?pf.objectPermissions.size():0;
                    integer Paac = pf.pageAccesses!=null?pf.pageAccesses.size():0;
                    integer Recv = pf.recordTypeVisibilities!=null?pf.recordTypeVisibilities.size():0;
                    integer tabv = pf.tabVisibilities!=null?pf.tabVisibilities.size():0;
                    integer layoutAssignment = pf.layoutAssignments!=null?pf.layoutAssignments.size():0;
                    
                    //User Permissions
                    for(integer i=0;i<uper ;i++){
                        Profileinformation.cls_userPermissions Usper = new  Profileinformation.cls_userPermissions();
                        Usper.name = pf.userPermissions[i].name;
                        Usper.enabled = pf.userPermissions[i].enabled;
                        userPerLst.add(Usper);       
                    }
                    
                    //applicationVisibilities
                    for(integer i=0;i<max;i++){
                        Profileinformation.cls_applicationVisibilities objP = new  Profileinformation.cls_applicationVisibilities();
                        objP.application = pf.applicationVisibilities[i].application;
                        objp.default_x = pf.applicationVisibilities[i].default_x;
                        objp.visible = pf.applicationVisibilities[i].visible;
                        appvisible.add(objp);       
                    }
                    
                    //classAccess
                    for(integer i=0;i<maxclsv;i++){
                        Profileinformation.cls_classAccesses clsacc = new  Profileinformation.cls_classAccesses();
                        clsacc.apexClass= pf.classAccesses[i].apexClass;
                        clsacc.enabled = pf.classAccesses[i].enabled;
                        clsaccess.add(clsacc);  
                    }
                    
                    //custom Premissions
                    for(integer i=0;i<maxcusp;i++){
                        Profileinformation.cls_customPermissions cusp = new Profileinformation.cls_customPermissions();
                        cusp.name = pf.customPermissions[i].name;
                        cusp.enabled = pf.customPermissions[i].enabled;
                        custpermi.add(cusp);  
                    }
                    //externalDataSourceAccesses
                    for(integer i=0;i<exds ;i++){
                        Profileinformation.cls_externalDataSourceAccesses exdasc = new  Profileinformation.cls_externalDataSourceAccesses();
                        exdasc.externalDataSource= pf.externalDataSourceAccesses[i].externalDataSource;
                        exdasc.enabled = pf.externalDataSourceAccesses[i].enabled;
                        Extdasour.add(exdasc);  
                    }
                    //FieldPermissions
                    for(integer i=0;i<fldp ;i++){
                        Profileinformation.cls_fieldPermissions fper= new  Profileinformation.cls_fieldPermissions();
                        fper.field= pf.fieldPermissions[i].field;
                        fper.editable= pf.fieldPermissions[i].editable;
                        fper.readable= pf.fieldPermissions[i].readable;
                        // fper.hidden= pf.fieldPermissions[i].hidden;
                        Fldper.add(fper);  
                    }
                    //Login Ip Ranges
                    for(integer i=0;i<loip;i++){
                        Profileinformation.cls_loginIpRanges Ipr= new  Profileinformation.cls_loginIpRanges();
                        // Ipr.description= pf.loginIpRanges[i].description;
                        Ipr.endAddress= pf.loginIpRanges[i].endAddress;
                        Ipr.startAddress= pf.loginIpRanges[i].startAddress;
                        logipran.add(Ipr);  
                    }
                    //Object Permissions
                    for(integer i=0;i<objpe;i++){
                        Profileinformation.cls_objectPermissions obp= new  Profileinformation.cls_objectPermissions();
                        obp.allowCreate= pf.objectPermissions[i].allowCreate;
                        obp.allowEdit= pf.objectPermissions[i].allowEdit;
                        obp.allowDelete= pf.objectPermissions[i].allowDelete;
                        obp.allowRead= pf.objectPermissions[i].allowRead;
                        obp.object_x= pf.objectPermissions[i].object_x;
                        obp.viewAllRecords= pf.objectPermissions[i].viewAllRecords;
                        obp.modifyAllRecords= pf.objectPermissions[i].modifyAllRecords;
                        Objpermi.add(obp);  
                    }  
                    //PageAccess
                    for(integer i=0;i<Paac;i++){
                        Profileinformation.cls_pageAccesses Pacc= new  Profileinformation.cls_pageAccesses();
                        Pacc.apexPage= pf.pageAccesses[i].apexPage;
                        Pacc.enabled= pf.pageAccesses[i].enabled;
                        pageacce.add(Pacc);  
                    }  
                    //RecordTypeVisibilities
                    for(integer i=0;i<Recv;i++){
                        Profileinformation.cls_recordTypeVisibilities Revisi= new  Profileinformation.cls_recordTypeVisibilities();
                        Revisi.recordType= pf.recordTypeVisibilities[i].recordType;
                        Revisi.personAccountDefault= pf.recordTypeVisibilities[i].personAccountDefault;
                        Revisi.default_x= pf.recordTypeVisibilities[i].default_x;
                        Revisi.visible= pf.recordTypeVisibilities[i].visible;
                        rectypvisi.add(Revisi);  
                    }  
                    //Tab Visibilities
                    for(integer i=0;i<tabv;i++){
                        Profileinformation.cls_tabVisibilities Tavisi= new  Profileinformation.cls_tabVisibilities();
                        Tavisi.tab= pf.tabVisibilities[i].tab;
                        Tavisi.visibility= pf.tabVisibilities[i].visibility;
                        Tabvisi.add(Tavisi);  
                    }
                    //Layout Assignments
                    for(integer i=0;i<layoutAssignment;i++){
                        Profileinformation.cls_layoutAssignments profileAssign = new Profileinformation.cls_layoutAssignments();
                        profileAssign.layout = pf.layoutAssignments[i].layout;
                        profileAssign.recordType = pf.layoutAssignments[i].recordType;
                        layoutAssign.add(profileAssign);
                    }
                } 
            }
            catch(Exception ex) {
                System.debug('Permission '+ex.getMessage());
            }    
        }
    }
    
    public pageReference exportProf(){
        PageReference pr = new PageReference('/apex/profilesinfoexport');
        pr.setRedirect(false);
        return pr;
    }
}