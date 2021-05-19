global class QueueableEample1 implements Queueable{
    List<Account> acc= new List<Account>();
    
  ID Ids;
    
    public QueueableEample1(ID ids, List<Account> accli) {
       acc=accli;
        this.Ids = ids;
    }
    public void execute(QueueableContext context) {
       List<Account> acclist= [select id , name from Account where Id =:Ids];
        System.debug('accli'+acc);
        System.debug('acclist'+acclist);
        //System.enqueueJob(new queueableexample2());
    }

}