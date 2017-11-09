public class utl_User 
{
    public Static Trigger_Deactivation__c td
    {
        get
        {
            if(td == null)
            {
                td = Trigger_Deactivation__c.getInstance();
                
                if(td != null && td.Id == null)
                   td = null;
            }
            return td;
        }
        set;
    }
        
    public static Boolean isTriggerDeactivationEnabledForAllTriggers
    {
        get
        {
            if(isTriggerDeactivationEnabledForAllTriggers == null)
                isTriggerDeactivationEnabledForAllTriggers = false;
            return isTriggerDeactivationEnabledForAllTriggers;
        }
        set;
    }
    
    public static Boolean isProcessEnabledForMe(String processName)
    {
        Automated_Process_Deactivation__c apd = Automated_Process_Deactivation__c.getInstance();
        //always active if no specific setting is available
        if(apd.Id == null)
            return true;
        
        return !(apd.Setting_Activated__c && apd.Process_Name__c.contains(processName));
    }
    
    public static  Boolean isTriggerActiveForMe(String triggerName)
    {
        if(isTriggerDeactivationEnabledForAllTriggers) return false;
        
        if(td == null) return true;
          
        return (!(td.Setting_Activated__c && td.Trigger_Names__c.contains(triggerName))); 
    }
}