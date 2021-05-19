public with sharing class CMLeads {

    public Lead Leads { get; set; }
    
    
    public CMLeads(){
    Leads =new Lead();
    }

    public void SaveandNew() {
        insert Leads;
        Leads =new Lead();
    }


    public void Refresh() {
     Leads =new Lead();
        
    }


    public PageReference Create() {
    insert Leads;
    PageReference pr=new PageReference ('/'+Leads.id);
    return pr;
       
    }

}