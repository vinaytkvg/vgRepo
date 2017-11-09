public without sharing class TransactionContext {
    
    //The Automated Process that have been executed for the current transaction
    public static List<string> processesExecuted = new List<string>();
    
    /*
    * Gets a flag indicating if the automated process has been executed in the current transaction
    */
    public static boolean wasProcessExecuted(string ap)
    {
        for(string apexec : processesExecuted)
        {
            if(apexec == ap)
            {
                return true;
            }
        }
        return false;
    }
}