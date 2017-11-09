public class addvin 
{ 
    public PageReference cadd() {
        c=a+b;
        return null;
    }

 
    public integer b {get;set;}
    public integer a {get;set;}
    public integer c;
    
    public PageReference save() 
    {
     c=a+b;
    return null;
    }
    public integer getCadd()
    {
   
         return c;
    }
    public integer getC() 
    {
    
        return 1;
    }
   
}