/*
* Standard Error class used for transporting error messages.
* This class is used in a number of rest interfaces so please do not
* add non transient fields, instead extend from this class if additional
* data needs to be tracked
*/
global virtual with sharing class ErrorDetail
{
    /*
    * Default system error message
	*/
	public static final string CODE_SYS_ERROR = 'SYSTEM_ERROR';

    /*
    * Gets or sets the error code for the ErrorDetail
	*/
    public string code { get;set; }
    
    /*
    * Gets or sets the error message for the ErrorDetail
	*/
    public string message { get;set; }
       
    /*
    * Constructs a new ErrorDetail with the specfied error code and message
	*/
    public ErrorDetail(string code, string msg)
    {
        this.code = code;
        message = msg;
    }
}