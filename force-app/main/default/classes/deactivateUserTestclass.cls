@isTest(seeAllData = false)
public class deactivateUserTestclass {
    @testSetup
    static void setup() {
        Profile p = [SELECT Id
                     FROM Profile
                     WHERE Name = 'ContactTracing Profile'];
        
        List<User> users = new List<User>();
        for(Integer i = 0; i < 10; i++){
            users.add(new User(Alias = 'Raja' + i,
                               Email = 'Rajasekhar' + i + '@testorg.com ',
                               EmailEncodingKey = 'UTF-8',
                               LastName = 'Presley',
                               LanguageLocaleKey = 'en_US',
                               LocaleSidKey = 'en_US',
                               ProfileId = p.Id,
                               TimeZoneSidKey = 'America/Los_Angeles',
                               UserName = 'RajasekharTummala000' + i + '@testorg.com'));
        }
        insert users;
    }
    static testMethod void testBatchClass()
    {	
        User u = [select id,Name,Profile.Name from User where Profile.Name = 'ContactTracing Profile' limit 1]; 
        System.debug('User****************************'+u);
        test.startTest();
        deactivateuser deActiveUserObj = new deactivateuser();
        Database.executeBatch(deActiveUserObj);
        Test.stopTest();    
        System.assertEquals(u.Profile.Name, 'ContactTracing Profile');
        
    }
}