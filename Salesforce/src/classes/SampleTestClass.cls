@isTest
public class SampleTestClass 
{
    public testmethod static void testingMethods()
    {  
       MyPractice1 m = new MyPractice1();
       System.assert(m.myPractice1Method('vinay').contains('Running tests'));
        MyPractice1.str1 ='testingMethod1 value';
    }
    
    public testmethod static void testmethod2()
    {
        MyPractice1 m = new MyPractice1();
        system.debug(MyPractice1.str1);
        m.myPractice1Method2();
        System.assert(MyPractice1.str1.contains('RakeshNaveensaivenkybantianjan'));
    }
}