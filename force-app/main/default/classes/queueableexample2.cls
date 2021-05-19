public class queueableexample2 implements Queueable {
    
    Public void execute(Queueablecontext qe){
        Id JobId= qe.getJobId();
        System.debug('JobId'+jobID);
    }
    
}