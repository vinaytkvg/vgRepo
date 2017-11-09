public class UploadFileProcessor {

    private Document documentToProcess;
    
    public UploadFileProcessor(ApexPages.StandardController controller) {
        this.documentToProcess = (Document)controller.getRecord();
        System.debug(documentToProcess);
    }
    
    public PageReference submit() {
        System.debug(documentToProcess);
        System.debug('vinay');
        if(documentToProcess.name == null) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error,'Please select a File to upload'));
        }
        return null;
    }
}