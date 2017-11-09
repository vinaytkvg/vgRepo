@isTest
public class AbstractclassTest extends Abstractclass
{
    public override void  mymethod()
    {
        //System.debug('Done');
    }
    
    static testmethod void check()
    {
        AbstractclassTest a = new AbstractclassTest();
        a.mymethod();
    }
}