trigger pricediscount on Book__c (before insert,before Update) {
    if(Trigger.isBefore && (Trigger.isInsert))
    {
        for(Book__c b: Trigger.new)
        {
            if(b.Price__c!= Null)
                b.Price__c= (b.Price__c-b.Price__c * 0.1);
        }
    }
    if(Trigger.isBefore && Trigger.isUpdate)
    {
        for(Book__c b: Trigger.new){
            if((b.Price__c!=trigger.oldmap.get(b.id).Price__c) && b.Price__c!=NULL)
            {
                b.Price__c= (b.Price__c-b.Price__c * 0.1);
            }
            
        }
    }
    
}