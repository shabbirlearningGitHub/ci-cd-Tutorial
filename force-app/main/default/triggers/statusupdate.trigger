trigger statusupdate on Contact (After insert,After Update,After delete,After Undelete) {
    if(Trigger.isAfter && (Trigger.isInsert || trigger.isUpdate || trigger.isUndelete)){
        set<Id> AccountIds=new set<Id>();
        for(Contact con: Trigger.new){
            AccountIds.add(con.AccountID);  
        }
        List<contact> conList=[select id,name,Status__c,AccountId from contact where AccountId=:AccountIds and Status__c=true];
        System.debug(conList);
        if(conList.size()>0){
            account ac=[select id,name,Status__c from account where id=: conList[0].AccountId];
            if(ac.Status__c != true){
                ac.Status__c=true;
                update ac;
            }
            
        }
        else 
        {
            account ac=[select id,name,Status__c from account where id=:AccountIds];
            if(ac.Status__c== true){
                ac.Status__c=false;
                update ac;
            }
            
        }
    }
    if(Trigger.isAfter && Trigger.isDelete){
        set<Id> acIds=new set<Id>();
        for(contact con:Trigger.old){
            acIds.add(con.AccountId);
        }
        List<contact> conList=[select id,name,Status__c,AccountId from contact where AccountId=:acIds and Status__c=true];
        System.debug(conList);
        if(conList.size()>0){
            account ac=[select id,name,Status__c from account where id=: conList[0].AccountId];
            ac.Status__c=true;
            update ac;
            
        }
        else 
        {
            account ac=[select id,name,Status__c from account where id=:acIds];
            if(ac.Status__c== true){
                ac.Status__c=false;
                update ac;
            }
            
        }
        
    }
}