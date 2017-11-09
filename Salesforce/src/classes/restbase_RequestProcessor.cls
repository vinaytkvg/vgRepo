/*
* Provides common error handling and metrics for rest services and a framework
* for validation and processing
*/
public abstract class restbase_RequestProcessor
{	
    /* 
    * gets the rest context request
    */
    public System.RestRequest request 
    {	
        get
        {  
            return System.RestContext.request;
        }
   	}
    
    /*
    * Gets the RestContext response
    */
    public System.RestResponse response 
    { 
        get
        {
            return System.RestContext.response;
        }
        set;
    }
    
    /*
    * Gets the start date and time of the rest processor instantiation
    */
	public DateTime start { get; protected set; }
    
    /*
    * Constructs a new request processor that expects the request to recieve the specified type
    */
	public restbase_RequestProcessor(system.type requestObjectType)
	{
		this();
		this.requestObjectType = requestObjectType;
	}
	
    /*
    * Constructs a default new request processor that sets the start time metric
    */
	public restbase_RequestProcessor()
	{
		start = DateTime.now(); // to measure the starttime of the request
        hasDerivedRequestObjectTypes = false; //default
	}
    
    /*
    * Gets or sets a flag indicating if the processor has derived object types are allowed for the request object type
    */
    protected Boolean hasDerivedRequestObjectTypes {get; set;}
    
    /*
    * Gets or sets the type of object to be deserialized to represent the requestObject
    */
    protected System.Type requestObjectType {get; set;}
    
    /*
    * Gets the json deserialized object from the rest request body.
    * Will perform a strict deserialization based on the requestObjectType
    */
    protected Object requestObject
    {
        get
        {	if(requestObject == null && requestObjectType != null)
        	{
                try
                {
                //derived types require a 2 stage deserialization
                if(hasDerivedRequestObjectTypes)
                {
                    //not a strict deserialization, but will see if there is a derived type for the requested object
                    requestObject = System.Json.deserialize(request.requestBody.toString(), requestObjectType);
                    //gets the derived type from the request object
                    requestObjectType = getRequestDerivedType();
                    //strict deserialize as the derived type
                    requestObject = System.Json.deserializeStrict(request.requestBody.toString(), requestObjectType);
                }
                else
                    requestObject = System.Json.deserializeStrict(request.requestBody.toString(), requestObjectType);
                }
                catch(Exception ex)
                {	
                    requestObject = null;
                    response.statusCode = ConstantsHTTP.RESPONSE_STATUS_CODE_BAD_REQUEST;
                }
            }
            return requestObject;
        }
        private set;
    }
    
    /*
    * Gets or sets the object to be serialized into the json response
    */
	protected object responseObject { get;set; }
    
    /*
    * Gets the name of the api for the rest service
    */
	public abstract string getApiName();
    
    public restbase_RequestParser requestParser
    {
        get
        {
            if(requestParser == null)
            	setRequestParser();
            return requestParser;
        }
        set;
    }
    /*
    * Sets the version numbers that are supported by the rest request processor
	*/
    protected Set<Integer> getVersions()
    {
        return new Set<Integer>{1};
    }
    
    /*
    * Gets a flag indicating if the request has been made on a valid version of the interface
    */
    protected virtual Boolean getIsValidVersion()
    {
       return getVersions().contains(requestParser.version);
    }
    
    /*
	* Validates the incoming rest request
	*/
    protected virtual Boolean getIsValid()
    {
        return getIsValidVersion() && (requestObjectType == null || requestObject == null);
    }
    
     /*
    * Set the Parser to use for processing the REST request
	*/
    protected virtual void setRequestParser()
    {
        requestParser = new restbase_RequestParser(getApiName(), request);
    }
    
    /*
    * Processes the rest request providing common error handling and 
    * construction of the response
    */
    public void processRequest()
    {
        
    }
    
    /*
    * Gets the derived type for the request object
    */
    protected System.Type getRequestDerivedType()
    {
        //defaults to the request object type
        return requestObjectType;
    }
}