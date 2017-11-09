global class CreateTaskUsingEmailService implements Messaging.InboundEmailHandler {
    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail inbEmail, Messaging.InboundEnvelope inbEnv) { 
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        List<Task> taskList = new List<Task>();
        String plainTxtBody = inbEmail.plainTextBody;
        System.debug('Email Sent');
        String emailAddress = inbEmail.fromAddress;
        try {
            Contact c = [SELECT Id, name, Email FROM Contact WHERE Email = :emailAddress];
            if(c != null) {
                taskList.add(new Task(
                    Description = plainTxtBody,
                    Subject = inbEmail.subject,
                    Status = 'Inbound Email',
                    Priority = 'Normal',
                    IsReminderSet = true,
                    ReminderDateTime = System.now()+1,
                    WhoId = c.Id));
             insert taskList;
                System.debug(taskList[0].Id);
            }
        }catch(QueryException qEx) {
            System.debug(qEx);
        }
        
        result.success = true;
        return result;
    }
}