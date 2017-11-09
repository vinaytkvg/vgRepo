public class testpagecontroller {
    public List<String> optionName{get;set;}
    public List<SelectOption> checkBocOptions{get;set;} 
    public Double sum {get;set;}
    public Set<String> added;
    
    public testpagecontroller() 
    {
        checkBocOptions = new List<SelectOption>{new SelectOption('vinay','vinay'), new SelectOption('ganesh','ganesh')};
        optionName = new List<String>();
        sum = 0.0;
        added = new Set<String>();
    }
    
    public void debug()
    {
        Set<String> values = new Set<String>(optionName);
        if(values.contains('vinay') && !added.contains('vinay')) {
            added.add('vinay');
            check1(true);
        }
        else if(!values.contains('vinay') && added.contains('vinay')){
            added.remove('vinay');
            check1(false);
        }
        
        if(values.contains('ganesh') && !added.contains('ganesh')) {
            added.add('ganesh');
            check1(true);
        }
        else if(!values.contains('ganesh') && added.contains('ganesh')) {
            added.remove('ganesh');
            check1(false);
        }  
    } 
    
    public void check1(Boolean value)
    {
        if(value)
        {
          sum += 10;
        }
        else
        {
            sum -= 10;
        }
    }
    
    public String str;
    public String  getStr() {
        return 'myString';
    }
    
    public String getStringMethod() {
        return str;
    }
    public String getStringMethod2() {
        if(str == null) {
            str = 'vinay';
        }
        return str;
    }
}