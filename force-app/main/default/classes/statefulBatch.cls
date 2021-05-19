global class statefulBatch implements Database.Batchable<sObject>, Database.Stateful{
    
    global final String Query;
    global integer Summary;
    
    global statefulBatch(String q)
    {
        Query=q;
        Summary = 0;
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
        for(sObject s : scope){
            Summary = Integer.valueOf(s.get('total__c'))+Summary;
            System.debug(Summary);
        }
        
        
    }
    
    global void finish(Database.BatchableContext BC){
        Account ac=new Account();
        ac.name='testfrom Batch';
        ac.total__c=Summary;
        insert ac;
    }
}