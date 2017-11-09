@IsTest
public class RetrievePermissionSetsMetaDataTest {  
    private class WebServiceMockImplForPermissionSets implements WebServiceMock 
    {
        public void doInvoke(
          Object stub, Object request, Map<String, Object> response,
          String endpoint, String soapAction, String requestName,
          String responseNS, String responseName, String responseType) 
        {
            MetadataService.PermissionSetApplicationVisibility psav = new MetadataService.PermissionSetApplicationVisibility();
            psav.application = 'Sales';
            psav.visible = true;
            
            MetadataService.PermissionSetApexClassAccess psaca = new MetadataService.PermissionSetApexClassAccess();
            psaca.apexClass = 'DummyController';
            psaca.enabled = true;
            
            MetadataService.PermissionSetCustomPermissions pscp = new MetadataService.PermissionSetCustomPermissions();
            pscp.name = 'SampsleCustomPermission';
            pscp.enabled = true;
            
            MetadataService.PermissionSetExternalDataSourceAccess psedsa = new MetadataService.PermissionSetExternalDataSourceAccess();
            psedsa.externalDataSource = 'SampsleexternalDataSource';
            psedsa.Enabled = true;
            
            MetadataService.PermissionSetFieldPermissions  psfls = new MetadataService.PermissionSetFieldPermissions();
            psfls.field = 'TestFiled';
            psfls.readable = true;
            psfls.editable = true;
            
            MetadataService.PermissionSetObjectPermissions psop = new  MetadataService.PermissionSetObjectPermissions();
            psop.allowCreate = true;
            psop.allowDelete = true;
            psop.allowEdit = true;
            psop.allowRead = true;
            psop.modifyAllRecords = true;
            psop.viewAllRecords = true;
            
            MetadataService.PermissionSetApexPageAccess psapsa = new MetadataService.PermissionSetApexPageAccess();
            psapsa.apexPage =' DummyPage';
            psapsa.enabled = true;
            
            MetadataService.PermissionSetRecordTypeVisibility psrt = new MetadataService.PermissionSetRecordTypeVisibility();
            psrt.recordType = 'SampleRecordType';
            psrt.visible = true;
            
            MetadataService.PermissionSetTabSetting psta = new MetadataService.PermissionSetTabSetting();
            psta.tab = 'Testtab';
            psta.visibility = 'Testvisible';
            
            MetadataService.PermissionSetUserPermission psup = new MetadataService.PermissionSetUserPermission();
            psup.name = 'ApiEnabled';
            psup.enabled = true;
            
            MetadataService.PermissionSet mps = new MetadataService.PermissionSet();
            mps.fullName ='StoreAdmin';
            mps.applicationVisibilities = new List<MetadataService.PermissionSetApplicationVisibility>{psav};
            mps.classAccesses = new List<MetadataService.PermissionSetApexClassAccess>{psaca};
            mps.customPermissions = new List<MetadataService.PermissionSetCustomPermissions>{pscp};
            mps.description = 'Sample Permissio set Descrition';
            mps.externalDataSourceAccesses = new List<MetadataService.PermissionSetExternalDataSourceAccess>{psedsa};
            mps.fieldPermissions = new List<MetadataService.PermissionSetFieldPermissions>{psfls};
            mps.objectPermissions  = new List<MetadataService.PermissionSetObjectPermissions>{psop};
            mps.pageAccesses = new List<MetadataService.PermissionSetApexPageAccess>{psapsa};
            mps.recordTypeVisibilities = new List<MetadataService.PermissionSetRecordTypeVisibility>{psrt};
            mps.tabSettings = new List<MetadataService.PermissionSetTabSetting>{psta};
            mps.userPermissions = new list<MetadataService.PermissionSetUserPermission>{psup};
            mps.hasActivationRequired = true;
            
            MetaDataService.ReadPermissionSetResult  rpsr = new MetaDataService.ReadPermissionSetResult();
            rpsr.records = new List<MetaDataService.PermissionSet>{mps};
            
            MetaDataService.readPermissionSetResponse_element rpsre = new  MetaDataService.readPermissionSetResponse_element();
            rpsre.result = rpsr;
            response.put('response_x', rpsre); 
        }
    }
      static testmethod void testPermissionData()
    {
        PageReference pageRef = Page.PermissionSetsMetaDataInfo;
        Test.setCurrentPage(pageRef);
        ApexPages.CurrentPage().getParameters().put('permissionSetName','StoreAdmin');
        RetrievePermissionSetsMetaData metaController = new RetrievePermissionSetsMetaData();
        test.starttest();
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForPermissionSets());
        metaController.getPermissonset();
        metaController.exportPermissionSetsMetaData();
        test.stoptest();
    }   
}