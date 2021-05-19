public class SortableAccountTableController {
public class AccountWrapper{        
    @AuraEnabled
        public String message;
        @AuraEnabled
        public List<Account> accountsList;
        @AuraEnabled
        public Boolean success;
    }
    
    //Return account records and message to be displayed in toast
    @AuraEnabled
    public static AccountWrapper getAccounts(Id Accid){
        AccountWrapper accountWrapper = new AccountWrapper();
        try{
            System.debug('Accid*****************'+Accid);
            accountWrapper.accountsList = [SELECT ID,Name,AccountSource,Rating,NumberOfEmployees
                                           FROM Account where Id =: Accid
                                           ORDER BY AnnualRevenue 
                                           DESC NULLS LAST 
                                           LIMIT 50];
            System.debug('accountsList******************'+accountWrapper.accountsList);
            accountWrapper.message = 'Account records are retrieved ';
            accountWrapper.success = true;
        }
        catch(Exception e){
            accountWrapper.message = e.getMessage();
            accountWrapper.success = false;
        }
        return accountWrapper;
    }
    @AuraEnabled
    Public static List<account> getAccountrecords(String AccID){
        List<account> listofAccount = [SELECT ID,Name,AccountSource,Rating,NumberOfEmployees
                                           FROM Account where Id =: Accid
                                           ORDER BY AnnualRevenue 
                                           DESC NULLS LAST 
                                           LIMIT 50];
        System.debug('listof Accounts******'+listofAccount);
        return listofAccount;
    }

}