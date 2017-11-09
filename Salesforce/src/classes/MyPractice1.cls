public virtual with sharing class MyPractice1 { 
    public String str1;
    public transient Integer ing {get;set;}
    public Static Decimal de;
	public List<String> sl;   
    public Boolean boo {get;set;}
    public Decimal int1
    {
      get
      { 
          return int1;
      }
     set;
    }
    public Boolean firstRun()
    {    
        int1 = 5.5;
        return (int1 !=null);
    }
    public MyPractice1(String s,Boolean b)
    {
       this.str1 = s;
        this.boo = b;
    }
   public MyPractice1(){}
    @testvisible String myPractice1Method(String s)
     {
         return s+':Running tests';
     }
    
    public virtual void sampleTest(){
          try {
            myPractice1Method2();
		}
        catch(UserDefException e) {
        	System.debug(e.getCause());
        }
    }
    
    public static Object myPractice1Method2()
    {   
        /*Contact c =new Contact(LastName='contactlastname',firstName='contactfirstname');
        insert c;
		try {
            Contact a=new Contact();
            insert a;
            System.debug(a.Id);
		}
        catch(Exception e) {
            System.debug(e.getCause());
        	throw new UserDefException('Account Failure', e);
        }*/
        MyInnerClass m = new MyInnerClass('vinay');
        return m;
    }
    
    public class MyInnerClass
    {
        public String sampleVariable;
        public MyInnerClass(String sampleVariable) {
            this.sampleVariable = sampleVariable;
        }
    }
    
    public class UserDefException extends Exception
    {}
}