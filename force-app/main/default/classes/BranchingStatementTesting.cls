public class BranchingStatementTesting {
    
    public BranchingStatementTesting(){
        String[] str= new string[]{'shabbir','hari','vijay','Azar','ali','khan','patan'};
            /*for(Integer i=0;i<str.size();i=i+2){
if(str[i] == 'ali')
{
System.debug('Ali>>>>>>'+ str[i]);
}
}*/
            /*Integer i=0;
while(i<str.size()){
if(str[i] == 'ali')
{
System.debug('Ali>>>>>>'+ str[i]);
}
i++;
}*/
            /*  integer i=0;
do { 
if(str[i] == 'ali')
{
System.debug('Ali>>>>>>'+ str[i]);
}
i++;
} while(i<str.size());*/
            
            /*  for(Integer i=0;i<str.size();I++){
if(str[i] == 'ali')
{
// break;


}
System.debug(str[i]);
}*/
  Integer i=5;
        Switch on i{
            when 1{
                System.debug('valueis'+i);
            }
            when 2{
                 System.debug('valueis'+i);
            }
            when else {
                System.debug('else Statement');
            }
        }
        
        
    }
    
    Public void comparision( Integer a,Integer b,integer c)
    {
        if(a>b)
        {
            if(a>c)
            {
                System.debug('a is a greater value');
            }
            else
                System.debug('ci s grater value');
            
        }else if(b>c) 
        {
            System.debug('b is greater value');
        } else
            System.debug('c is a greater value');
    }
    
    public void collectionExample(){
        List<Account> acclist=[Select id, name from Account limit 2];
        for(Account ac: acclist)
        {
            ac.Phone='123456';
            ac.type='Prosepect';
            update ac;
            System.debug(ac);
        }
    }
    
}