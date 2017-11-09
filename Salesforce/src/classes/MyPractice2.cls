public virtual class MyPractice2 extends MyPractice1  implements MyInterface{
    public final String str2='Rakesh';
    public static Integer int2;
    static{
        int2 = 4;
        }
    
    public MyPractice2()
    {
        //super('vinay',true);      
    }
    public virtual void Method2(){
        try {
          //sampleTest();
        }
        catch(MyPractice2Exception Ex) {
           // System.debug('dmlEx');
            System.debug(ex.getLineNumber());
            System.debug(ex.getCause());
        }
        catch(Exception ex) {
            System.debug(ex.getCause());
        }
        
        finally {
           System.debug('Vinay Parent');
        }
    }
  
    public override void sampleTest() {
       /* try{
            Integer my = 1/0;
        }
        catch(Exception e) {
            throw new MyPractice2Exception('FirstException cause', e);
        }*/
        System.debug('MyPractice2 sampleTest mthod');
    } 
   
    
    public class MyPractice2Exception extends Exception {}
    public void testM() {
        System.debug('good Mypractice2');
    }
}