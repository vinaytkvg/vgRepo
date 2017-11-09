@RestResource(urlMapping='/v2/accounts/*')
global class Rest_AccountV2 {

    @HttpGet
    global static AccountWrapper doGet(){
        RestRequest req=System.RestContext.request;
        RestResponse res=System.RestContext.response;
        AccountWrapper response=new AccountWrapper();
        String accId=req.requestURI.subString(req.requestURI.lastIndexOf('/')+1);
        if(doSearch(accId)){
            response=searchAccount(req,response,accId);
           return response;
        }else{
           response= findAccounts(response,accId);
            return response;
        }
     
    }
    global static AccountWrapper searchAccount(RestRequest rq, AccountWrapper res,String a){
       String searchTerm=rq.params.get('name');
        system.debug(searchTerm);
        if(searchTerm==null||searchTerm==''){
        res.status='404 client error';
        return res;
        }else{
             res.con=new List<Contact>();
            res.acc=[SELECT id,name,(SELECT id,name FROM Contacts) FROM Account WHERE name LIKE :'%'+searchTerm+'%'];
            
            for(Account act:res.acc){
               
                for(Contact c1:act.contacts){
                       res.con.add(c1);
                    
                }
      
             
            }
            res.status='Success';
            
            res.message='Records were Fetched';
        return res;
        }
       
    }
    global static AccountWrapper findAccounts(AccountWrapper res, String acId){
            if(acId!=null&&acId!=''){
                 res.acc=[SELECT id,name FROM Account WHERE Id=:acId];
                 res.con=[SELECT id,name FROM Contact WHERE accountId=:acId];
                 
                if(res!=null){
                    res.Status='Success';
                    return res;
                }else{
                    res.message='No Records Found : Invlaid Id';
                    res.status='404';
                    return res;
                }
                
            }
           else{
                 res.acc=null;
                 res.con=null;
                 res.Status='No Records ';
                 return res;
           }
        }
        public static Boolean doSearch( String a){
              if(a=='accounts'){
                  
                  return true;
              }
              return false;
        }
        
    global class AccountWrapper{
        
        public List<Account> acc;
        public List<Contact> con;
        public String status;
        public string message;
    }
}