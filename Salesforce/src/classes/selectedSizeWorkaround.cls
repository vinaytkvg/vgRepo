public class selectedSizeWorkaround 
{
 ApexPages.StandardSetController setcon;
 public selectedSizeWorkaround(ApexPages.StandardSetController controller)
 {
   setcon = controller;
 }

 public integer getMySelectedSize() 
 {
  return setCon.getSelected().size();
 }
 
 public integer getMyRecordsSize() 
 {
  return setCon.getRecords().size();
 }
}