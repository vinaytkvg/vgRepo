@IsTest
public class MetaDataComponentPageControllerTest {
   private class WebServiceMockImplForLayout implements WebServiceMock 
    {
        public void doInvoke(
          Object stub, Object request, Map<String, Object> response,
          String endpoint, String soapAction, String requestName,
          String responseNS, String responseName, String responseType) 
        {
            if(request instanceof MetadataService.listMetadata_element)
            {
                MetadataService.FileProperties fieldProp1 = new MetadataService.FileProperties();
                fieldProp1.type_x = 'Layout';
                fieldProp1.fullName = 'TestLayout';
      
                MetaDataService.listMetadataResponse_element limdres = new MetaDataService.listMetadataResponse_element();
                limdres.result = new List<MetadataService.FileProperties>{fieldProp1};
                response.put('response_x', limdres); 
            }
            else if(request instanceof MetadataService.readMetadata_element)
            {
                MetaDataService.Layout cf1 = new MetaDataService.Layout();
                cf1.fullName = 'TestLayoutAccount';
                MetaDataService.ReadLayoutResult layoutResult = new MetaDataService.ReadLayoutResult();
                layoutResult.records = new List<MetaDataService.Layout>{cf1};
                MetaDataService.readLayoutResponse_element readLayoutResult = new MetaDataService.readLayoutResponse_element();
                readlayoutResult.result = layoutResult;
                response.put('response_x', readLayoutResult);
            }
        }
    }
    private class WebServiceMockImpl implements WebServiceMock 
    {
        public void doInvoke(
          Object stub, Object request, Map<String, Object> response,
          String endpoint, String soapAction, String requestName,
          String responseNS, String responseName, String responseType) 
        { 
            System.debug(request instanceof MetadataService.listMetadata_element);
            if(request instanceof MetadataService.listMetadata_element)
            {
                MetadataService.FileProperties fieldProp1 = new MetadataService.FileProperties();
                fieldProp1.type_x = 'ApprovalProcess';
                fieldProp1.fullName = 'TestApprovalProcess';
      
                MetaDataService.listMetadataResponse_element limdres = new MetaDataService.listMetadataResponse_element();
                limdres.result = new List<MetadataService.FileProperties>{fieldProp1};
                response.put('response_x', limdres); 
            }
            else if(request instanceof MetadataService.readMetadata_element)
            {
                MetaDataService.ApprovalProcess cf1 = new MetaDataService.ApprovalProcess();
                cf1.fullName = 'TestApprovalProcess-1';
                cf1.label = 'TestApprovalProcess';
                MetaDataService.ReadApprovalProcessResult processResult = new MetaDataService.ReadApprovalProcessResult();
                processResult.records = new List<MetaDataService.ApprovalProcess>{cf1};
                MetaDataService.readApprovalProcessResponse_element readProcessResult = new MetaDataService.readApprovalProcessResponse_element();
                readProcessResult.result = processResult;
                response.put('response_x', readProcessResult);
            }
        }
    }
    public class MockHttpResponseGenerator implements HttpCalloutMock 
    {
        MetaDataComponentPageController.WorkFlowItemInfo wfItemInfo = new MetaDataComponentPageController.WorkFlowItemInfo('Account.name <> null',
                                                               true, 'workflow description', 'onAllChnages');
        MetaDataComponentPageController.WorkFlowItems wfItem = new MetaDataComponentPageController.WorkFlowItems('TestWorkFLow', 'TestWorkFLow', null, 'Account');
        
        List<MetaDataComponentPageController.WorkFlowItems> wfs = new List<MetaDataComponentPageController.WorkFlowItems>{wfItem};
        MetaDataComponentPageController.WorkFlowMeta wf = new MetaDataComponentPageController.WorkFlowMeta(wfs);
        
        String flowJsonString = System.Json.serialize(wf);
        
        // Implement this interface method
        public HTTPResponse respond(HTTPRequest req) {
            System.debug(req.getEndPoint());
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody(flowJsonString);
            res.setStatusCode(200);
            return res;
        }
    }
    public class MockHttpResponseGeneratorForProcess implements HttpCalloutMock 
    {
        MetaDataComponentPageController.FlowItem fi1 = new MetaDataComponentPageController.FlowItem('301c0000000GNKzAAz','Active',1);
        MetaDataComponentPageController.FlowItem fi2 = new MetaDataComponentPageController.FlowItem('301c0000000GNKzAAx','Obsolete',1);
        MetaDataComponentPageController.FlowsMetaData fmd = new MetaDataComponentPageController.FlowsMetaData(new List<MetaDataComponentPageController.FlowItem>{fi1, fi2});
        
        String flowJsonString = System.Json.serialize(fmd);
        
        // Implement this interface method
        public HTTPResponse respond(HTTPRequest req) {
            System.debug(req.getEndPoint());
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody(flowJsonString);
            res.setStatusCode(200);
            return res;
        }
    }
    private class WebServiceMockImplForProcess implements WebServiceMock 
    {
        public void doInvoke(
          Object stub, Object request, Map<String, Object> response,
          String endpoint, String soapAction, String requestName,
          String responseNS, String responseName, String responseType) 
        { 
            System.debug(request instanceof MetadataService.listMetadata_element);
            if(request instanceof MetadataService.listMetadata_element)
            {
                MetadataService.FileProperties fieldProp1 = new MetadataService.FileProperties();
                fieldProp1.type_x = 'Flow';
                fieldProp1.fullName = 'TestFlow';
                fieldProp1.id = '301c0000000GNKzAAz';
                
                MetadataService.FileProperties fieldProp2 = new MetadataService.FileProperties();
                fieldProp2.type_x = 'Flow';
                fieldProp2.fullName = 'TestFlowobsolete-1';
                fieldProp2.id = '301c0000000GNKzAAx';
                
                MetaDataService.listMetadataResponse_element limdres = new MetaDataService.listMetadataResponse_element();
                limdres.result = new List<MetadataService.FileProperties>{fieldProp1,fieldProp2};
                response.put('response_x', limdres); 
            }
            else if(request instanceof MetadataService.readMetadata_element)
            {
                MetaDataService.Flow cf1 = new MetaDataService.FLow();
                cf1.fullName = 'TestFlow-1';
                cf1.label = 'TestFlow';
                MetaDataService.Flow cf2 = new MetaDataService.FLow();
                cf2.fullName = 'TestFlowobsolete-1';
                cf2.label = 'TestFlow';
                MetaDataService.ReadFlowResult flowResult = new MetaDataService.ReadFlowResult();
                flowResult.records = new List<MetaDataService.Flow>{cf1, cf2};
                MetaDataService.readFlowResponse_element readFlowResult = new MetaDataService.readFlowResponse_element();
                readFlowResult.result = flowResult;
                response.put('response_x', readFlowResult);
            }
        }
    }       
    static String permissionSetName;  
    static testmethod void checkObjectMetaData()
    {
        MetaDataComponentPageController metaController = new MetaDataComponentPageController();
        metaController.sel = 'Account';
        metaController.selectedprofile = 'System Administrator';
        metaController.getpname();
        metaController.permissionsetlist = 'StoreAdmin';
        metaController.getpsetname();
        metaController.getNextCountTemplate();
        metaController.getPreviousCountTemplate();
        metaController.exportTemplates();
        metaController.layObj = 'Account';
        List<SelectOption> options = metaController.objectList;
    }
    static testmethod void testLayoutData()
    {
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForLayout());
        MetaDataComponentPageController metaController = new MetaDataComponentPageController();
        test.starttest();
        metaController.getRetrieveLayoutMetadata();
        metaController.getNextCountLayout();
        metaController.getPreviousCountLayout();
        metaController.exportLayouts();
        test.stoptest();
    }
      static testmethod void retrieveMetadataInfo()
    {
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImpl());
        MetaDataComponentPageController metaController = new MetaDataComponentPageController();
        metaController.retrieveApprovalProcessNamesList();
        metaController.retrieveApprovalProcessMetaData();
        metaController.targetSize = 1;
        metaController.pageSize = 1;
        metaController.getNextCount();
        metaController.getPreviousCount();
        metaController.setNextAndPrevious();
        metaController.exportApprovals();
    }
    static testmethod void testWorkFlowData()
    {
        System.Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        MetaDataComponentPageController metaController = new MetaDataComponentPageController();
        metaController.getRetrieveWorkFLowMetaData();
        metaController.getNextCountFlow();
        metaController.getPreviousCountFlow();
        metaController.setNextAndPreviousFlow();
        metaController.exportworkflow();
    }
    static testmethod void retrieveMetadataInfoForProcess()
    {
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGeneratorForProcess());
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImplForProcess());
        MetaDataComponentPageController metaController = new MetaDataComponentPageController();
        metaController.getRetrieveFlowMetadata();
        System.assertEquals(metaController.flowIdToStatus.isEmpty(), false);
        metaController.targetSize = 1;
        metaController.pageSize = 1;
        metaController.getNextFlowCountProcess();
        metaController.getPreviousFlowCountProcess();
        metaController.exportFlows();
    }   
}