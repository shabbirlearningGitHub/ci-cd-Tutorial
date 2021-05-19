public class QueueableExample implements Queueable {
    
    public void execute(QueueableContext qc){
		Id ids = qc.getJobId();
        
Id AccID=[select id from Account][0].Id;
        List<Account> acclist= [select id, name from account limit5];
    id JobId = system.enqueueJob(new QueueableEample1(AccID, acclist)); 
        
        
    }

}