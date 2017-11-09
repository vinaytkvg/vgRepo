public with sharing class MakeReadOnly {
   
            private final opportunity oppo; 
       public MakeReadOnly(ApexPages.StandardSetController controller) { 
        this.oppo = (opportunity)Controller.getRecord();
         }
         
      
}