public class DynamicCustomizableListHandler
{
 public ApexPages.StandardSetController setController;
 public set<String> selectedNames = new set<String>();
 public set<String> nonSelectedNames = new set<String>();
 public set<String> inAccessibleFields = new set<String>();
 public transient List<String> selected{get;set;}
 public transient List<String> unSelected{get;set;}
 Public PageReference savePage;
 public DynamicCustomizableListHandler(ApexPages.StandardSetController setcontroller)
 {
   this.setController = setcontroller;
   loadFieldsWithVisibility();
 }
 
 public void  loadFieldsWithVisibility()
 {
   Map<String,Schema.SObjectField> mapOfFields=Schema.SObjectType.Account.fields.getMap();
   
   for(String s : mapOfFields.keySet())
   {
       if(mapOfFields.get(s).getDescribe().isAccessible())
       {
         nonSelectedNames.add(s);
       }
       else
       {
         inAccessibleFields.add(s);
       }
   }
 }
 public List<SelectOption> getUnSelectedNames()
 {
   return selectOptionFormat(nonSelectedNames);
 }
 
 public List<SelectOption> getSelectedNames()
 {
  return selectOptionFormat(SelectedNames);
 }
 public List<SelectOption> selectOptionFormat(set<String> opts)
 {
  List<SelectOption> sel = new List<SelectOption>();
   for(String s: opts)
   {
     if(inAccessibleFields.contains(s))
     {
       sel.add(new SelectOption(s,'*'+s,false));
     }
     else
     sel.add(new SelectOption(s,s));
   }
  return sel;
 }
 
    public void doAdd() {
       moveFields(selected, selectedNames, nonSelectedNames);
    }
    public void doRemove() {
      moveFields(unselected, nonSelectedNames, selectedNames);
    }
    private void moveFields(List<String> items,Set<String> moveTo, Set<String> removeFrom) {
       for(String s: items) 
       {
        moveTo.add(s);
        removeFrom.remove(s);
       }
    }
    
    public List<String> getDisplayFields() {
    List<String> displayFields = new List<String>(selectedNames);
    displayFields.sort();
    return displayFields;
    }
    
    public PageReference customize() {
        setcontroller.reset();
        setcontroller.addFields(getDisplayFields());
        return Page.DynamicformCustomizeDynamicList;
    }
    
    public PageReference show()
    { 
      savePage = new PageReference('/apex/DynamicformDynamicbindingexample2');
      savePage.setRedirect(true);
      return savePage;
    }
}