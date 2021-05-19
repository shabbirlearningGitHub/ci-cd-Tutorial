@isTest(seeAllData=False)
public class BatchTestclass {

    static testmethod void batchexampleTest(){
        List<account> acclist=new List<account>();
        Test.startTest();
        
        
		Account ac=new Account(name='Shabbir',phone='123456',Number_Of_Location__c=5);
            //acclist.add(ac);
        insert ac;
        contact con=new contact();
        con.Lastname='abcd';
        con.Accountid=ac.id;
        insert con;
        
     
        
        String str='select name,phone from account';
        BatchExample be=new BatchExample(str);
        Database.executeBatch(be);
        be.ex();
        
        test.stopTest();
    }
    static testmethod void batchexampleTest1(){
        List<account> acclist=new List<account>();
        Test.startTest();
        
      Account ac=new Account(name='Shabbir',phone='123456',Number_Of_Location__c=5);
            //acclist.add(ac);
        insert ac;
        Account ac1=new Account(name='Shabbir1',phone='123456',Number_Of_Location__c=4);
            //acclist.add(ac);
        insert ac1;
        
        contact con=new contact();
        con.Lastname='abcd';
        con.Accountid=ac.id;
        insert con;
        
        QuableExample qe=new QuableExample();
        System.enqueueJob(qe);
        test.stopTest();
    }
}