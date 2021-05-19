trigger NumberofLocationonaccount on Account (After insert,After Update) {
    if(Trigger.isAfter && Trigger.IsInsert){
        String str='select id,phone,name from account';
            BatchExample be=new BatchExample(str);
        Database.executeBatch(be);
        Account acc=[select id,name,Number_Of_Location__c from account where id =:Trigger.newMap.keySet()];
        List<Contact> conList=new List<contact>();
        System.debug(acc);
        System.debug(acc.Number_Of_Location__c);
        for(integer i=0;i<acc.Number_Of_Location__c;i++){
            contact con=new contact();
            con.Lastname=acc.name+i;
            con.AccountId=acc.id;
            conList.add(con);
        }
        Database.SaveResult[] srResult=Database.insert(conList, false);
        
        for(Database.SaveResult sr : srResult){
            if(sr.isSuccess())
            {
                System.debug('sucessfull records'+sr.getId());
            }
        }
    }
    if(Trigger.isUpdate)
    {
        List<Account> acc=[select id,name,Number_Of_Location__c,Phone,(select otherphone,homephone from contacts) from account where id =:Trigger.newMap.keySet()];
        List<contact> conList= new List<contact>();
        String Newvalue;
        string oldvalue;
        for(Account ac : acc){
            System.debug(Trigger.oldMap.get(ac.Id).phone);
            if(ac.phone !=Trigger.oldMap.get(ac.Id).phone)
            {
                newvalue=ac.phone;
                oldvalue=Trigger.oldMap.get(ac.Id).phone;
                for(contact con : ac.contacts){
                    con.otherphone=Trigger.oldMap.get(ac.Id).phone;
                    con.homephone=ac.Phone;
                    conList.add(con);
                    
                }
            }
        }
        Database.SaveResult[] srList=database.update(conList, false);
        List<String> toaddress= new List<string>{'shabbir.rigworld@gmail.com'};
        List<String> ccaddress= new List<string>{'shabbir.rigworld@gmail.com'};
        List<String> bccaddress= new List<string>{'shabbir.rigworld@gmail.com'};
        messaging.SingleEmailMessage mail=new messaging.SingleEmailMessage();
        mail.setToAddresses(toaddress);
        mail.setBccAddresses(bccaddress);
        mail.setCcAddresses(ccaddress);
        mail.setSenderDisplayName(userInfo.getUserName());
        mail.setReplyTo('shabbirali.sfdc@gmail.com');
        mail.setSubject('Phone value changed from'+oldvalue+'to'+Newvalue);
        mail.setHtmlBody('Phone value changed from'+oldvalue+'to'+Newvalue);
        Messaging.sendEmail(new List<messaging.SingleEmailMessage> {mail});
        
    }
}