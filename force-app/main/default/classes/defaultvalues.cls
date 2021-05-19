public with sharing class defaultvalues {
            public List<Account> acc {set;get;}

    public defaultvalues(ApexPages.StandardController controller) {
        list<account> accs=[select id,name,(select id,Lastname,Name from contacts) from account];    
        acc = new list<account>();
        for(Account ac : accs){
       if(ac.contacts.size()>0){
        acc.add(ac);
        }
        //acc.add(ac);
        
        }

    }

}