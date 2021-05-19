public with sharing class SoqlEx {

    public String find { get; set; }

    public void Searchandshowrecords() {
       acc=[select name,phone,Industry from Account where name like :find ];
    }


    public List<Account> acc { get; set; }

    public SoqlEx ()
    {
    List<Account> accs=[select name,phone,Industry,(select Lastname,Email,AccountId from contacts where Accountid != NULL) from Account ];
    acc= new List<account>();
    for(Account ac: accs)
    {
     if(ac.contacts.size()>0)
     {
     acc.add(ac);
     }
    }
    
    }

}