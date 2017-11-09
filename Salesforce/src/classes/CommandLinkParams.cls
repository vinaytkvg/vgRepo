public with sharing class CommandLinkParams {

    public CommandLinkParams() {

    }

public ApexPages.StandardController controller{get;set;}
public String sample{get;set;}
private Contact account;
public CommandLinkParams(ApexPages.StandardController controller){

this.controller=controller;
this.account=(Contact)controller.getRecord();

}
public PageReference mymethod(){

system.debug('name'+ sample);

return null;
}

}