public class Employee {
    
    public List<selectoption> EmpList{set;}
    public String selected{get;set;}
    public string value{get;set;}
    public List<Selectoption> getEmpList(){
         List<selectoption> s=new List<selectoption>();
        s.add(new selectoption('None','--NONE--'));
        s.add(new selectoption('vinay','E01'));
        s.add(new selectoption('ganesh','E02'));
        s.add(new selectoption('rakesh','E03'));
     return s;
    }
    
    
 }