global class scheduleExample implements Schedulable{
    Public void execute(Schedulablecontext sc){
        BatchExample be=new BatchExample('select id,name,phone from account');
        Database.executebatch(be);
    }
    
}