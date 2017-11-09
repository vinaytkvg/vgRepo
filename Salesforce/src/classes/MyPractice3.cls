public virtual class  MyPractice3 extends MyPractice2 {
    public String str3;
    private static Integer int3 =3;
    public List<Integer> ing ;
    public void myPractice3Method()
    {  
       system.debug(str3+' --SECOND VAR :'+int3); 
    }
    
  /*  public override String sampleTest(){
       if( int1 != null )
           return '0019000001XfZfx';
       return null;
    }*/
    
   public MyPractice3(String str3)
   {
      //super();
       this.str3=str3;
   }
   
    public Void mymethod()
    {
        System.debug('ing');
        //ing = new List<Integer>{5,6,7,8,9};  
        //myMethod2(ing);
        system.debug('ing');
    }
    
    public void myMethod2(List<Integer> intL) 
    {
        intL.add(89);
    }
    
    public class MyInnerClass 
    {
        String vinay = String.valueOf(int3);
        public void innerClassMethod() 
        {
           
        }
    }
    
    public class myInInnerClass 
    {
        String varia;
    }
    
    public override void Method2()
    {
        //super.Method2();
        System.debug('myPractice3  Method2 method');
    }
    
    
}