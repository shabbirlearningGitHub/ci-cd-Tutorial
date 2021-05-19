public with sharing class wrapperex {

    public Contact con { get; set; }

     public Accoundetails acc {set;get;}
     
     Public wrapperex ()
     {
     acc = new Accoundetails ();
     acc.accs =new Account();
     con = new Contact();
     
     }
    public void Create() {
    insert acc.accs;
    insert con;
    
        
    }

}