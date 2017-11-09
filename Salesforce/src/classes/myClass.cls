public class myClass {
   public integer i;
   List<Account> a ;
    public myClass(){
        a=new List<Account>();
        //a= [SELECT count(),name FROM Account];
        //i=a.size();
    }
    
	public void myMethod()
    {
        Object obj = MyPractice1.myPractice1Method2();
        System.debug(obj instanceof MyPractice1.MyInnerClass);
    }
}