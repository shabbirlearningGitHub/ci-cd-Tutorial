public class QuableExample implements Queueable {
   
    public void execute(Queueablecontext qc){
        List<ID> acclist1=new list<Id>();
        List<Account> acclist=[select id,phone,type from account where name like 'Sha%'];
        for(Account acc:acclist )
        {
            acc.type='Education';
            acclist1.add(acc.ID);
        }
        update acclist;
        System.enqueueJob(new QueueableExample1(acclist1));
    }
    

}