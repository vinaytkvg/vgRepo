/*
 * ProcessBase - framework class for automated processes
 * 
 * Automated processes are carried out during triggers. In the interests of code
 * encapsulation and separation-of-concerns, it is useful to group all of the code
 * for a single automated process into a single class, and for there to be a standard
 * interface in order that all triggers end up with a familiar and easily-maintained
 * structure.
 * 
 * This class provides such an interface, and is designed to work in combination with
 * ProcessDispatcher to provide a drop-
 */
public abstract class ProcessBase 
{
    @testvisible protected String processName;
    
    //Flag to allow the operation to be run from a future method
    public Boolean runAsync { get;set; }
    
    //Flag to indicate if the process should run or be bypassed
    public Boolean runProcess{ get; protected set; } 
    
    public ProcessBase()
    {   
        //Default the async flag to not run asynchronously 
        runAsync = false;
        
        //Default the run process flag to run the process, if the inital loop finds no objects to
        //run against set this to false so the the ProcessDispatcher doen't try to run the process
        //make sure that this is set when the process could run as an async process to avoid adding
        //processes to the queue that will result in no change.
        runProcess = true;
    }
    
    public Boolean isProcessEnabled()
    {
        return utl_User.isProcessEnabledForMe(processName);
    }
    
    public virtual void initialLoop(List<sObject> obj)
    {
        // Test a single sObject to see whether it is applicable to your process
        // You may have a private static list in which you store the relevant objects
    }
    
    @testVisible 
    protected virtual void logic()
    {
        // Perform the logic associated with your process. If your logic affects only
        // a subset of records, you should have stored them in a private variable inside
        // the initialLoop method.
    }
    
    public void execute()
    {
        this.logic();
        TransactionContext.processesExecuted.add(this.processName);
    }
}