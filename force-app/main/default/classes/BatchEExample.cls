public class BatchEExample implements Database.Batchable<Sobject> {
    List<Id> Ids = new List<Id>();
    Public BatchEExample(Set<Id> Ids){
        this.Ids.addAll(Ids);
    }
    
    
    Public Database.QueryLocator start(Database.BatchableContext bc){
        String sql = 'select id,Name from Account where id In :Ids';
        return Database.getQueryLocator(sql);
    }
    Public void execute(Database.BatchableContext bc,List<Account> scope){
        System.debug('getjobId()*****'+bc.getJobId());
        System.debug('getChildJobId()'+bc.getChildJobId());
        List<Account> acclist= new List<Account>();
        for( Account ac: scope){
            
            acclist.add(ac); 
            
        }
        System.debug('acclist'+acclist.size()); 
        delete acclist;
               
    }
    
    Public void finish(Database.BatchableContext bc){
        
    }
    
}