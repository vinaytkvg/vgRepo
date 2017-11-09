Public class SampleQueueableApex implements Queueable{
    
    public static integer triggerInt = 0;
    public integer instanceInt = 0;
    public void execute(QueueableContext sample) {
        System.debug(triggerInt+1);
        insert new Account(name = 'SamplEQueueableApex');
        System.debug(triggerInt + '  '+ 'JOB');
        System.debug(instanceInt+1);
    }
}