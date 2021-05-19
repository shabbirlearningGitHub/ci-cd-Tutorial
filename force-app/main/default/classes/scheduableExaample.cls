public class scheduableExaample implements Schedulable {
    
    public void execute(SchedulableContext sc){
        Map<id,Account> Ids=new Map<Id,Account>([Select id,name from account]);
    		Database.executeBatch(new BatchEExample(Ids.keyset()));
    }

}