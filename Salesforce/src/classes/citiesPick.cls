public class citiesPick {

    public String getOptions() {
        return null;
    }

    string[] cities=new string[]{'NewDelhi','Hyderabad','Banglore','Chennai'};
        selectoption[] options{get;set;}
   integer i=0;
    public citiespick(){
        options=new selectoption[cities.size()];
        for(String s1:cities){
        selectoption so=new selectoption(s1,s1);
        options[i]=so;
        i=i+1;
        }
   } 
}