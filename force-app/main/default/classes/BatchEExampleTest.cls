@isTest
Private class BatchEExampleTest {
    
    @testSetup
    Static void TestData(){
        List<Account> acclist= new List<Account>();
        Account ac= new Account();
        ac.name='shabbirTest';
        acclist.add(ac);
        Test.startTest();
        Insert acclist;
        Test.stopTest();
        System.assertEquals(1, acclist.size());
    }
    
    @isTest
    static void TestMethod1(){
        Test.startTest();
        Map<ID,Account> acc= new Map<ID,Account>([select id, name from account]);
        Database.executeBatch(new BatchEExample(acc.keyset()));
        test.stopTest();
    }
    @isTest
    static void TestMethod2(){
        Test.startTest();
        Id acId=[select id,name from account][0].Id;
        Map<ID,Account> acc= new Map<ID,Account>([select id, name from account]);
        System.enqueueJob(new QueueableEample1(acId,acc.values()));
        test.stopTest();
    } 
    
    
}