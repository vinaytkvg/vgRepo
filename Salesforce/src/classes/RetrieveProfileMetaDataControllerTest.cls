@IsTest
public class RetrieveProfileMetaDataControllerTest {
    private class WebServiceMockImplForProfile implements WebServiceMock 
    {
        public void doInvoke(
          Object stub, Object request, Map<String, Object> response,
          String endpoint, String soapAction, String requestName,
          String responseNS, String responseName, String responseType) 
        {
            MetadataService.ProfileUserPermission pup = new MetadataService.ProfileUserPermission();
            pup.name = 'ApiEnabled';
            pup.enabled = true;
            
            MetadataService.ProfileApplicationVisibility pav = new MetadataService.ProfileApplicationVisibility();
            pav.application = 'Sales';
            pav.default_x = true;
            pav.visible = true;
            
            MetadataService.ProfileApexClassAccess paca = new MetadataService.ProfileApexClassAccess();
            paca.apexClass = 'DummyController';
            paca.enabled = true;
            
            MetadataService.ProfileCustomPermissions pcp = new MetadataService.ProfileCustomPermissions();
            pcp.name = 'SampleCustomPermission';
            pcp.enabled = true;
            
            MetadataService.ProfileExternalDataSourceAccess pedsa = new MetadataService.ProfileExternalDataSourceAccess();
            pedsa.externalDataSource = 'SampleexternalDataSource';
            pedsa.enabled = true;
            
            MetadataService.ProfileFieldLevelSecurity  pfls = new MetadataService.ProfileFieldLevelSecurity();
            pfls.field = 'TestFiled';
            pfls.readable = true;
            pfls.editable = true;
            
            MetadataService.ProfileLoginIpRange plir = new MetadataService.ProfileLoginIpRange();
            plir.description = 'Logged in';
            plir.endAddress = '234.345';
            plir.startAddress = '123.123';
            
            MetadataService.ProfileObjectPermissions pop = new MetadataService.ProfileObjectPermissions();
            pop.object_x = 'Account';
            pop.allowRead = true;
            
            MetadataService.ProfileApexPageAccess prop = new MetadataService.ProfileApexPageAccess();
            prop.apexPage =' DummyPage';
            prop.enabled = true;
            
            MetadataService.ProfileRecordTypeVisibility prot = new MetadataService.ProfileRecordTypeVisibility();
            prot.default_x = true;
            prot.personAccountDefault = true;
            prot.recordType = 'SampleRecordType';
            prot.visible = true;
            
            MetadataService.ProfileTabVisibility prtab = new MetadataService.ProfileTabVisibility();
            prtab.tab = 'Testtab';
            prtab.visibility = 'Testvisible';
            
            MetadataService.ProfileLayoutAssignment prassign = new MetadataService.ProfileLayoutAssignment();
            prassign.layout = 'Account Academic';
            prassign.recordType = 'SampleREcordType';
            
            MetadataService.Profile mp = new MetadataService.Profile();
            mp.fullName = 'System Administrator';
            mp.userPermissions = new List<MetadataService.ProfileUserPermission>{pup};
            mp.applicationVisibilities = new List<MetadataService.ProfileApplicationVisibility>{pav};
            mp.classAccesses = new List<MetadataService.ProfileApexClassAccess>{paca};
            mp.customPermissions = new List<MetadataService.ProfileCustomPermissions>{pcp};
            mp.externalDataSourceAccesses = new List<MetadataService.ProfileExternalDataSourceAccess>{pedsa};
            mp.fieldPermissions = new List<MetadataService.ProfileFieldLevelSecurity>{pfls};
            mp.loginIpRanges = new List<MetadataService.ProfileLoginIpRange>{plir};
            mp.objectPermissions = new List<MetadataService.ProfileObjectPermissions>{pop};
            mp.pageAccesses = new List<MetadataService.ProfileApexPageAccess>{prop};
            mp.recordTypeVisibilities = new List<MetadataService.ProfileRecordTypeVisibility>{prot};
            mp.tabVisibilities = new List<MetadataService.ProfileTabVisibility>{prtab};
            mp.layoutAssignments = new List<MetadataService.ProfileLayoutAssignment>{prassign};
            MetaDataService.ReadProfileResult  rpr = new MetaDataService.ReadProfileResult();
            rpr.records = new List<MetaDataService.Profile>{mp};
            
            MetaDataService.readProfileResponse_element rpre = new MetaDataService.readProfileResponse_element();
            rpre.result = rpr;
            response.put('response_x', rpre); 
        }
    }   
    
    static testmethod void testProfileData()
    {
        PageReference pageRef = Page.ProfileMetaDataInfo;
        Test.setCurrentPage(pageRef);
        ApexPages.CurrentPage().getParameters().put('profileName','Admin');
        RetrieveProfileMetaDataController metaController = new RetrieveProfileMetaDataController();
        metaController.selectedProfile = 'System Administrator';
        test.starttest();
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForProfile());
        metaController.getProfiles();
        metaController.exportProf();
        test.stoptest();
    }
}