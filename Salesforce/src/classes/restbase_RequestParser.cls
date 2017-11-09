public virtual class restbase_RequestParser 
{	
    /*
    * Gets the system rest request in context for the parser
    */
    private String apiName{get; private set;}
    
    /*
    * Gets the version number from the request uri
    */
    private System.RestRequest request {get; private set;}
    
    /*
    * Gets the version number from the request uri
    */
    public Integer version
    {
        get
        {
            return Integer.valueOf(applyRegex(request.requestURI.subStringAfter(apiName)));
        }
    }
    
    /*
    * Creates a new request parser
    * @param apiName The name of the rest api that is in context to be parsed
    * @param request The system rest request in context to be parsed
    */
    public restbase_RequestParser(String apiName, System.RestRequest request)
    {
        this.apiName = apiName;
        this.request = request;
    }
    
    private String applyRegex(String target)
    {	
        String version;
        System.Pattern p = System.Pattern.compile('(?<=\\/v)\\d(?=\\/))');
        System.Matcher m = p.matcher(target);
        if(m.find())
        {
            version = m.group(0);
        }
        return version;
    }
}