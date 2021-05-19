public class FutureExample {
    @future
    Public static void getAccount(){
	List<Account> acclist=[select id, name from account];
        System.debug('accList'+ acclist[0]);
        
    }
    Public static void getAccounts(){
        List<Account> acclist=[select id, name from account];
        System.debug('Normal accList'+ acclist[1]);
		}
     @future(callout= true)
    public static void processRecords(List<ID> recordIds)
    {   
         // Get those records based on the IDs
         List<Account> accts = [SELECT Name FROM Account WHERE Id IN :recordIds];
         // Process records
    }
     @future(callout= true)
    public static void processRecords1(List<Id> recordIds)
    {   
         // Get those records based on the IDs
         List<Account> accts = [SELECT Name FROM Account WHERE Id IN :recordIds];
         // Process records
    }
    // Limitations: 
    //in 24 hours : either 250000 or Number_of_users * 200, which one  has a greater
    
 }