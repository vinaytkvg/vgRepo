public class loginvfpage {

    
   public Integer age{get;set;}
    public string Name{get;set;}
    public string password{get;set;}
    
    public void reset(){
        age=null;
        Name=null;
        password=null;
    }   
    public void show(){
         age=age+1;
    }
}