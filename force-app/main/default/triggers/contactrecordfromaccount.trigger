trigger contactrecordfromaccount on Account (After insert) {
    
    
    List<contact> conlist=new List<contact>();
    for(account acc : Trigger.new){
        contact con= new contact();
        con.LastName=acc.name;
        con.phone=acc.phone;
        con.AccountId=acc.id;
        
        conlist.add(con);
    }
    insert conList;
    
    
    
}