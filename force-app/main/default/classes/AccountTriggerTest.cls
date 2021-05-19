@isTest(seeAllData=False)
public with sharing class AccountTriggerTest {
    public AccountTriggerTest() {

    }   
      
     @TestSetup
    static void makeData(){
        TriggerSetting__c tg = new TriggerSetting__c();
        tg.isActive__c= True;
        tg.Name = 'AccountTrigger';
        insert tg;
        
    List<Account> acclist = new List<Account>();  
    Account ac = new Account();
    ac.Name='Test1';
    ac.Number_Of_Location__c=5;
    ac.phone='123456879';
    ac.Active__c = 'No';
    ac.SLA__c = 'Gold';
    ac.SLAExpirationDate__c = System.today();
    ac.SLASerialNumber__c='123456';
    acclist.add(ac);

    Account ac1 = new Account();
    ac1.Name='Test1';
    
    ac1.phone='123456879';
    ac1.Active__c = 'No';
    ac1.SLA__c = 'Gold';
    ac1.SLAExpirationDate__c = System.today();
    ac1.SLASerialNumber__c='123456';
    acclist.add(ac1);

    Insert acclist;

    contact con=new contact();
    con.AccountId = ac.Id;
    con.LastName = ac.Name;
    con.phone = ac.phone;
    insert con; 

    } 
    @IsTest
    static void methodName(){
        
        Test.startTest();
        try {
            List<Account> acclist = new List<Account>();
            Account ac1 = new Account();
            ac1.Name='Test1';
            //ac1.Number_Of_Location__c=5;
            ac1.phone='123456879';
            acclist.add(ac1);

            insert acclist;

            
        } catch (Exception e) {
            
        }
        Test.stopTest();
        
    }
    
     
}