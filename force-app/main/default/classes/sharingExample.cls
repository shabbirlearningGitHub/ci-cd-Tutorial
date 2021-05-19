public without sharing class sharingExample {
    Integer a=50;
    
    Public void getAvalue(){
        a=a+50;
        System.debug('avalue is>>>>>'+ a);
    }
     @future(callout=true)
    public static void tesst(integer a){
        Integer b=50;
        b=b+a;
        System.debug(b);
        
    }

}