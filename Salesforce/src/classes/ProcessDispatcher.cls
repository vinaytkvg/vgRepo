public class ProcessDispatcher
{
    //PROPERTIES
    
    private List<sObject> newList;
    private Map<Id,sObject> newMap;
    private List<sObject> oldList;
    private Map<Id,sObject> oldMap;
    
    private Boolean isBefore;
    private Boolean isUpdate;
    private Boolean isInsert;
    private Boolean isDelete;
    private Boolean isUndelete;
    
    @testvisible private ProcessBase[] operations = new ProcessBase[]{};
        
    //CONSTRUCTORS
    
    /*
     * The simplest case is when this class is instatiated inside a trigger. In
     * this case, we can get all the context we need from System.Trigger
     */
    public ProcessDispatcher () {
        if (Trigger.isExecuting) {
            this(
                Trigger.new,
                Trigger.newMap,
                Trigger.old,
                Trigger.oldmap,
                Trigger.isBefore,
                Trigger.isUpdate,
                Trigger.isInsert,
                Trigger.isDelete,
                Trigger.isUndelete
            );
        } else {
            throw new ProcessDispatcherException('This ProcessDispatcher constructor is invalid when not in the context of a trigger');
        }
    }
    
    /*
     * For testing, we will need to be able to simulate appropriate context variables.
     */
    @testvisible private ProcessDispatcher (
        List<sObject> newList,
        Map<Id,sObject> newMap,
        List<sObject> oldList,
        Map<Id,sObject> oldMap,
        Boolean isBefore,
        Boolean isUpdate,
        Boolean isInsert,
        Boolean isDelete,
        Boolean isUndelete
    ) {
        this.newList = newList;
        this.newMap = newMap;
        this.oldList = oldList;
        this.oldMap = oldMap;
        this.isBefore = isBefore;
        this.isUpdate = isUpdate;
        this.isInsert = isInsert;
        this.isDelete = isDelete;
        this.isUndelete = isUndelete;
    }
    
    //METHODS
    
    /*
     * Add a list of Process implementations to the dispatcher. This method is chainable.
     */
    public void addProcesses(List<ProcessBase> operations)
    {
        for(ProcessBase operation : operations)
        {
            if(addProcess(operation))
                this.operations.add(operation);
        }
    }
    
    /*
     * Checking the individual process whether This process is enabled for the running user
     */ 
    public Boolean addProcess(ProcessBase operation)
    {
        return operation.isProcessEnabled();
    }
    
    /*
     * This method is the crux of this Process framework. The entire trigger contents are looped through once,
     * and for each record, the initialLoop() method from each registered process is called. This allows processes
     * to construct a private list of the records to be operated upon.
     * 
     * Next, the execute() method is called, so that the processes can operate on their whole list at once, outside
     * of any looping construct. This makes it easier to write code which reduces strain on limits.
     */
    public void dispatch() 
    {
        List<sObject> affectedObjects = ( isUpdate || isInsert || isUndelete ) ? newList : oldList;
        
            for (ProcessBase operation: operations) {
                operation.initialLoop(affectedObjects);
            }
        
        for (ProcessBase operation: operations)
        {
            if (operation.runProcess)
            {
                //PJW - Aware that it is bad practice to run future methods from within a loop,
                //however providing a generic way running asynchronously from a trigger may 
                //make the management of excess SOQL queries easier.
                if (operation.runAsync)
                {
                  
                }
                else
                {
                    operation.execute();
                }
            }
        }
    }
    
    //INNER CLASSES
    public class ProcessDispatcherException extends Exception{}
}