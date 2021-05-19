public class wraperclassexample {
    
    public void callwrapper(){
        List<wrapperclass> lst=new List<wrapperclass>();
        List<case> lscase = [select id,caseNumber from case limit 3];
        for(case cs:lscase){
            wrapperclass obj=new wrapperclass(cs);
            lst.add(obj);
        }
        system.debug(lst.size());
        String Jsonstr = JSON.serialize(lst); 
        System.debug('Jsonstr***************'+Jsonstr);
    }
    public class wrapperclass{
        Public string caller_id {get;set;}
        public String short_description {get;set;}
        public String description {get;set;}
        public String assignment_group {get;set;}
        public wrapperclass(case x1){
            caller_id = x1.Id;
            short_description =x1.caseNumber;  
            description	 = x1.caseNumber;
            assignment_group = x1.caseNumber;
            
        }
        
    }  
    
}