global class deactivateuser implements Database.Batchable<Sobject>{
    Public String query;
    
    Set<ID> userids = new set<ID>();
   global Database.querylocator start(Database.BatchableContext bc)
    {
     userids = getUserQuery();
        query = 'select id,IsActive from user where Id =:userids';
       return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc,List<User> scope)
    {
        System.debug('Scope*************'+scope);
        for(User deActiveuser : scope){
            deActiveuser.IsActive = false;
        }
        System.debug('deactive user details**************'+scope);
        try{
            update scope;
        }catch(Exception ex){
            System.debug('error message**********************'+ex.getMessage());
            System.debug('errorField***************************'+ex.getStackTraceString());
        }
        
    }
    
    global void finish(Database.BatchableContext bc)
    {
        
    }
    
    public static Set<ID> getUserQuery(){
        set<Id> uIds = new set<Id>();
        String query ;
        String profileLabel = Label.Profile_Name;
        System.debug('Profile Label************************'+ profileLabel);
        List<User> u =[select id,name,LastLoginDate from user where Profile.Name=:profileLabel AND IsActive =true ];//System.now().addHours(6)];
        System.debug('User Records********************'+u);
        if(!u.isEmpty()){
            for(User us : u){
                //System.debug('LastLoginDate.addMinutes(2)**********'+us.LastLoginDate.addMinutes(2));
                //System.debug('Current Time************'+System.now());
                if(us.LastLoginDate.addMinutes(2) <= system.now()){
                    System.debug('u.LastLoginDate.addHours(6)********************'+us.LastLoginDate.addHours(6)); 
                    uIds.add(us.Id);
                }
                
            }
        
        }
        
      List<AuthSession> aSession = [Select Id,SessionType,UsersId,Users.LastLoginDate,users.name,NumSecondsValid from AuthSession 
        WHERE UsersId =: uIds order by Users.LastLoginDate  desc];
        if(!aSession.isEmpty()){
            System.debug('a Session User details *********************'+aSession);
            for(AuthSession ase :aSession){
               uIds.remove(ase.UsersId);
            }
            System.debug('Inside asession*************'+uIds);
        }
        query = 'select id,IsActive from user where Id =:'+uIds;
        System.debug('Query*************'+query);
        return uIds;
    }
}