public with sharing class AccountTriggerHandler implements ITriggerHandler {
    //Use this variable to disable this trigger from transaction
    public static Boolean TriggerDisabled = false;
     
    //check if the trigger is disabled from transaction
    public Boolean isDisabled(){
        return TriggerDisabled;
    }
     
    public void beforeInsert(List<sObject> newList) {
         
    }
     
    public void afterInsert(List<sObject> newList , Map<Id, sObject> newMap) {
        List<contact> conlist=new List<contact>();
   
           //FutureExample.getAccount();
    for(account acc : (List<Account>) newList){
        	
        System.debug('acc.Number_Of_Location__c'+acc.Number_Of_Location__c);
        if(acc.Number_Of_Location__c !=0 || acc.Number_Of_Location__c != NULL){
            for(integer i=0;i<acc.Number_Of_Location__c;i++){
                contact con=new contact();
                con.Lastname=acc.name+i;
                con.AccountId=acc.id;
                conList.add(con);
            }
        } else{
            contact con= new contact();
            con.LastName=acc.name;
            con.phone=acc.phone;
            con.AccountId=acc.id;
            
            conlist.add(con);
        }
    }
    System.debug('conlist'+conlist);
    Database.SaveResult[] srResult=Database.insert(conList, false);
        
    for(Database.SaveResult sr : srResult){
        if(sr.isSuccess())
        {
            System.debug('sucessfull records'+sr.getId());
        }
    } 
}
     
    public void beforeUpdate(List<sObject> newList, Map<Id, sObject> newMap, List<sObject> oldList, Map<Id, sObject> oldMap) {
          
 List<Account> accList=[select id,name,Number_Of_Location__c,phone,jsonValue__c from account where id =:newMap.keySet()];
   // System.debug('Listof Accounts'+accList);
 			String JsonValue= JSON.serialize(accList);
        	System.debug(JsonValue);
        
         
    }
     
    public void afterUpdate(List<sObject> newList, Map<Id, sObject> newMap,  List<sObject> oldList, Map<Id, sObject> oldMap) {
         
    }
     
    public void beforeDelete(List<sObject> oldList , Map<Id, sObject> oldMap) {
         
    }
     
    public void afterDelete(List<sObject> oldList , Map<Id, sObject> oldMap) {
         
    }
     
    public void afterUnDelete(List<sObject> newList, Map<Id, sObject> newMap) {
         
    }
}