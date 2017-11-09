public class ActionFunctionController {

public List<SelectOption> alphabet{get;set;}
public List<SelectOption> fruits{get;set;}
public String selected{get;set;}
SelectOption s;
 public ActionFunctionController(){
  alphabet = new List<SelectOption>();
  fruits = new List<SelectOption>();
  s = new SelectOption('--None--','--None--') ;
  alphabet.add(s);
  fruits.add(s);
  
     alphabet.add(new Selectoption('A','A'));
     alphabet.add(new Selectoption('B','B'));
     alphabet.add(new Selectoption('C','C'));  
  
  }
  public void getaddFruits(){}
  
  public void addFruits(){
  fruits.clear();
     if(selected=='A')
     fruits.add(new Selectoption('Apple','Apple'));
     else if(selected=='B')
     fruits.add(new Selectoption('Banana','Banana'));
     else if(selected=='C') 
     fruits.add(new Selectoption('cherry','Cherry'));  
   
  
  }
  
}