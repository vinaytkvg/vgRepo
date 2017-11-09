public class productpro {

    public String enter { get; set; }
    public Decimal Total { get; set; }
    public integer quantity{get;set;}
    public Decimal price{get;set;}
    public PageReference element() {
       Total=(quantity*price);      
        return null;
    }
    public String proName { get; set; }
}