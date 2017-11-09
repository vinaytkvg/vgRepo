public class ConstantsHTTP 
{
	public static final string REQUEST_METHOD_GET = 'GET';
    public static final string REQUEST_METHOD_POST = 'POST';
    public static final string REQUEST_METHOD_PUT = 'PUT';
    public static final string REQUEST_METHOD_DELETE = 'DELETE'; 
    
    public static final integer RESPONSE_STATUS_CODE_OK        			= 200;
    public static final Integer RESPONSE_STATUS_CODE_ACCEPTED			= 202;
    public static final Integer RESPONSE_STATUS_CODE_BAD_REQUEST		= 400;
    public static final Integer RESPONSE_STATUS_CODE_FORBIDDEN			= 403;
    public static final integer RESPONSE_STATUS_CODE_NOT_FOUND  		= 404;
    public static final integer RESPONSE_STATUS_INTERNAL_SERVER_ERROR	= 500;
    public static final integer RESPONSE_STATUS_SERVICE_UNAVAILABLE		= 503;
}