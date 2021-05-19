global class BatchExample implements Database.Batchable<sobject>
{
    String Query;
    global BatchExample(string st)
    {
        Query=st; 
    }
    global Database.QueryLocator start(Database.Batchablecontext bc){
        
        return Database.getQueryLocator(Query);
    }
    global void execute(Database.batchablecontext bc,List<Account> acc){
        List<account> ac=new List<account>();
        for(Account acclist : acc){
            if(acclist.name.startsWith('Sha'))
            {
                acclist.phone='897555';
                ac.add(acclist);
            }
        }
        update ac;
        
    }
    global void finish(Database.batchablecontext bc){
      
    }
   
    Public void ex()
    {
        integer c=30;
        System.debug(c);
    }
}