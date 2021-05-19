public class ContactAuraController {
    @AuraEnabled
    public static ContactDataTableWrapper getContactData(Integer pageNumber, Integer pageSize) {
        System.debug('Heap Size**************'+limits.getHeapSize());
        Map<Integer,Id> pageNumberMap =new Map<Integer,Id>();
        
        List<Account> acc = [SELECT Id, Name, Phone, Industry FROM Account order by Id];
        for(Integer i=1;I<acc.size();i++){
            Integer j= (i*100)-1;
            if(j < acc.size()){
                System.debug('j value**********'+j +'ACCOUNTID*****'+acc[j].Id);
                pageNumberMap.put(i,acc[j].Id);
            }
            else{
                pageNumberMap.put(i,acc[acc.size()-1].Id);
                break;                    
            }
        }
        System.debug('PageNUmberMap************'+pageNumberMap);
        
        Integer offset = (pageNumber - 1) * 20;
        //Total Records
        Integer totalRecords = [SELECT COUNT() FROM Contact];
        Integer recordEnd = pageSize * pageNumber;
        //Instance of Contact DataTable Wrapper Class
        ContactDataTableWrapper objDT =  new ContactDataTableWrapper();  
        System.debug('pageNUmber::::::::::::'+pageNumber);
        objDT.pageSize = pageSize;
        objDT.pageNumber = pageNumber;
        objDT.recordStart = offset + 1;
        objDT.recordEnd = totalRecords >= recordEnd ? recordEnd : totalRecords;
        objDT.totalRecords = totalRecords;
        if( pageNumber != 1 &&  pageNumber != Null ){
            System.debug('account ids start');
            System.debug('pageNumberMap.get(pageNumber)************'+pageNumberMap.get(pageNumber));
            if(pageNumberMap.get(pageNumber)!= Null){
                objDT.contactList = [SELECT Id, Name, Phone, Industry FROM Account where Id > :pageNumberMap.get(pageNumber-1)  order by Id LIMIT 100];
                System.debug('accountcontact list '+objDT.contactList.size());
                if(objDT.contactList.size()>0){
                    System.debug('objDT.contactLisID*********'+objDT.contactList[0].Id);
                    
                    System.debug('objDT.contactList  if size********'+objDT.contactList[objDT.contactList.size()-1].ID);
                }
            }
        }
        else if( pageNumber != Null && pageNumber == 1){
            System.debug('else part running*****');
            objDT.contactList = [SELECT Id, Name, Phone, Industry FROM Account order by Id LIMIT 100];
            System.debug('objDT.contactList  else size********'+objDT.contactList[objDT.contactList.size()-1].ID);
            
        }
        System.debug('ended loop Heap Size**************'+limits.getHeapSize());
        return objDT;     
    }
    
    //Wrapper Class For Contact DataTable  
    public class ContactDataTableWrapper {
        @AuraEnabled
        public Integer pageSize {get;set;}
        @AuraEnabled
        public Integer pageNumber {get;set;}
        @AuraEnabled
        public Integer totalRecords {get;set;}
        @AuraEnabled
        public Integer recordStart {get;set;}
        @AuraEnabled
        public Integer recordEnd {get;set;}
        @AuraEnabled
        public List<Account> contactList {get;set;}
    }
}