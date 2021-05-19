trigger phoeandfaxverifying on Account (before insert,before Update) {
    System.debug('record is wornking');
System.debug(UserInfo.getUserId());
    user u=[select id,name,ProfileId,Profile.Name from user where id=:UserInfo.getUserId() limit 1];
    if( u.Profile.Name == 'System')
    {
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate))
    {
        for(Account ac : Trigger.new)
        {
            if(ac.phone == NULL || ac.fax== NULL)
            {
                ac.addError('phone,Fax should not be Empty');
            }
        }  
        
    }
    }
   /* else
    {
        for(Account ac: Trigger.new)
        {
            ac.addError('doesnotb have permision for cusrrentuser');
            }
    }*/
}