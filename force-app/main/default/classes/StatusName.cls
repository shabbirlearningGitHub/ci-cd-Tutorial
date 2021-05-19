@isTest(SeeAllData=false)
public class StatusName{
    static testmethod void contactstatus()
    {
        Account ac= new Account();
        ac.name='Testing';
        insert ac;
        
        Contact con=new contact();
        con.Lastname='Testingcontact';
        con.Status__C=True;
        con.AccountID=ac.id;
        insert con;
        
    }
    static testmethod void contactstatus1()
    {
        Account ac= new Account();
        ac.name='Testing1';
        ac.Status__c=true;
        ac.Number_Of_Location__c=5;
        insert ac;
        
        Account Ac1= new Account();
        ac1.name='testing2';
        ac1.Status__c=true;
        insert ac1;
        
        Contact con=new contact();
        con.Lastname='Testingcontact';
        con.Status__C=False;
        con.AccountID=ac.id;
        insert con;
        Contact con1=new contact();
        con1.Lastname='Testingcontact';
        con1.Status__C=True;
        con1.AccountID=ac1.id;
        insert con1;
         test.startTest();
        List<contact> acclist=[select id from contact limit 2];
                delete acclist;
        test.stopTest();
    }
    static testmethod void contactstatus2()
    {
        Account ac= new Account();
        ac.name='Testing';
        insert ac;
        
        Contact con=new contact();
        con.Lastname='Testingcontact';
        con.Status__C=True;
        con.AccountID=ac.id;
        insert con;
        test.startTest();
         List<contact> conList=[select id,name,Status__c,AccountId from contact where AccountId=:ac.id and Status__c=true];
        System.debug('conlist'+conList);
        delete conList;
        test.stopTest();
    }
   
    
}