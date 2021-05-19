public with sharing class Mulple {

    public Contact con { get; set; }
    public Account acc {set;get;}
    public opportunity opp{ get; set; }
    
    Public Mulple (){
    acc =new Account();
    con= new Contact();
    opp=new Opportunity();
    }

    public void MUlCreation() {
    insert acc;
    insert con;
    insert opp;
       
    }
    

}