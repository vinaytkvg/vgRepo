public class RoleHirarchyClass 
{
    public List<UserRole> parentRole;
    public Map<Id, UserRole> userRoles;
    public Map<Id, List<UserRole>> ParentRoleToChild;
    public RoleHirarchyClass()
    {
        parentRole = new List<UserRole>();
        ParentRoleToChild = new Map<Id, List<UserRole>>();
		userRoles = new Map<Id, UserRole>([SELECT Id, Name, ParentRoleId FROM UserRole]);
        prepareParentRoles();
    }
    
    public void prepareParentRoles()
    {
        if(userRoles != null)
        {
            for(UserRole ur : userRoles.values())
            {
                if(ur.ParentRoleId == null)
                {
                    parentRole.add(ur);
                }
                else 
                {
                    if( parentRole != null && ur.ParentRoleId == parentRole[0].Id)
                    {
                        System.debug(parentRole + '' + parentRole[0].Id);
                        System.debug(ur.ParentRoleId);
                        if(ParentRoleToChild.containsKey(ur.ParentRoleId))
                        {
                            ParentRoleToChild.get(ur.ParentRoleId).add(ur);
                        }
                        else
                        {
                            ParentRoleToChild.put(ur.ParentRoleId, new List<UserRole>{ur});
                        }
                    }
                    
                    if(ParentRoleToChild.containsKey(ur.ParentRoleId))
                    {
                        ParentRoleToChild.get(ur.ParentRoleId).add(ur);
                    }
                    else
                    {
                        ParentRoleToChild.put(ur.ParentRoleId, new List<UserRole>{ur});
                    }
                }
            }
        }
    }
    
    public List<UserRole> returnChildRoles(String parentId)
    {
       List<UserRole> roleNameList = new List<UserRole>();
       if(ParentRoleToChild.containsKey(parentId))
       {
           for(UserRole ur : ParentRoleToChild.get(parentId))
           {
               roleNameList.add(ur);
           }
       }
       return roleNameList;
    }
    
}