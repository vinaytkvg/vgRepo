public class Profileinformation{
    public cls_attributes attributes;
    public String Id;   
    public String Name; 
    public String CreatedDate;  
    public String CreatedById;  
    public String LastModifiedDate; 
    public String LastModifiedById; 
    public cls_Description Description;
    public cls_Metadata Metadata{get;set;}
    public String FullName; 
    class cls_attributes {
        public String type; 
        public String url;  
    }
    public class cls_Description {
    }
    public class cls_Metadata {
        public cls_applicationVisibilities[] applicationVisibilities;
        public cls_classAccesses[] classAccesses;
        public boolean custom;
        public cls_customPermissions[] customPermissions;
        public cls_description description;
        public cls_externalDataSourceAccesses[] externalDataSourceAccesses;
        public cls_fieldPermissions[] fieldPermissions;
        public cls_loginHours loginHours;
        public cls_loginIpRanges[] loginIpRanges;
        public cls_objectPermissions[] objectPermissions;
        public cls_pageAccesses[] pageAccesses;
        public cls_recordTypeVisibilities[] recordTypeVisibilities;
        public cls_tabVisibilities[] tabVisibilities;
        public cls_urls urls;
        public String userLicense;  //Salesforce
        public cls_userPermissions[] userPermissions {get;set;}
    }
   public class cls_applicationVisibilities {
        public String application {get;set;}
        public Boolean default_x{get;set;}
        public Boolean visible{get;set;}
    }
    public class cls_classAccesses {
         public String apexClass{get;set;}
         public Boolean enabled{get;set;}
    }
    public class cls_customPermissions {
        public String name{get;set;}
        public Boolean enabled{get;set;}
    }
    public class cls_externalDataSourceAccesses {
         public Boolean enabled{get;set;}
         public String externalDataSource{get;set;}
    }
    public class cls_fieldPermissions {
        public Boolean editable{get;set;}
        public String field{get;set;}
        public Boolean readable{get;set;}
        public Boolean hidden{get;set;}
    }
    public class cls_loginHours {
    }
    public class cls_loginIpRanges {
        public cls_description description{get;set;}
        public String endAddress{get;set;}  //255.255.255.255
        public String startAddress{get;set;} //0.0.0.0
    }
   public class cls_objectPermissions {
       public Boolean allowCreate{get;set;}
        public Boolean allowDelete{get;set;}
        public Boolean allowEdit{get;set;}
        public Boolean allowRead{get;set;}
        public Boolean modifyAllRecords{get;set;}
        public String object_x{get;set;}
        public Boolean viewAllRecords{get;set;}
    }
    public class cls_pageAccesses {
        public String apexPage{get;set;}
        public Boolean enabled{get;set;}
    }
    public class cls_recordTypeVisibilities {
        public Boolean default_x{get;set;}
        public Boolean personAccountDefault{get;set;}
        public String recordType{get;set;}
        public Boolean visible{get;set;}
    }
    public class cls_tabVisibilities {
        public String tab{get;set;}
        public String visibility{get;set;}
    }
    public class cls_layoutAssignments {
         public String layout{get;set;}
         public String recordType{get;set;}
    }
    public class cls_urls {
    }
    public class cls_userPermissions {
        public boolean enabled {get;set;}
        public String name {get;set;} //AccessCMC
    }
  //  public static ProfileJson parse(String json){
  //      return (ProfileJson) System.JSON.deserialize(json, ProfileJson.class);
  //  }
  
}