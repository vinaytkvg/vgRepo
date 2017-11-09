@IsTest
public class RetrieveObjectMetaDataControllerTest {
  private class WebServiceMockImpl implements WebServiceMock 
  {
    public void doInvoke(
      Object stub, Object request, Map<String, Object> response,
      String endpoint, String soapAction, String requestName,
      String responseNS, String responseName, String responseType) 
    {
        MetaDataService.CustomField cf = new MetaDataService.CustomField();
        cf.fullName = 'Description';
        cf.description = 'sample des';
        MetaDataService.CustomObject co = new MetaDataService.CustomObject();
        co.fields = new List<MetaDataService.CustomField>{cf};
        
        MetaDataService.ReadCustomObjectResult  rcfr = new MetaDataService.ReadCustomObjectResult();
        rcfr.records = new List<MetaDataService.CustomObject>{co};
        
        MetaDataService.readCustomObjectResponse_element rcfre = new MetaDataService.readCustomObjectResponse_element();
        rcfre.result = rcfr;
        response.put('response_x', rcfre); 
    }
  }      
   static testmethod void checkObjectMetaData()
    {
        PageReference pageRef = Page.ObjectMetaDataPage;
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('selectedObjName','Account');
        RetrieveObjectMetaDataController metaController = new RetrieveObjectMetaDataController();
        test.starttest();
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImpl());
         try{
        metaController.fetch();
        }catch(Exception ex)
        {
            ex.getStackTraceString();
        }
        metaController.exportObject();
        test.stoptest();
    }
}