public class OuterClass {
 public List<Contact> c;
    public outerClass(){
    c=[SELECT name,Account.name From Contact WHERE Account.name='Advani'];
        c[0].Account=[SELECT name FROM Account WHERE name='APGENCO'];
    }
}