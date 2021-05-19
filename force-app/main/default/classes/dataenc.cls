public Virtual class dataenc {

    integer ab=10;
    
    Public virtual void getvalue()
    {
        ab=ab+10;
        System.debug('ab>>>>>>>'+ab);
    }
    
    Public virtual void getvalue(Integer a)
    {
        ab=ab+a;
        System.debug('ab>>>>>>>'+ab);
    }
    
    Public virtual void getvalue(String str)
    {
        
        System.debug('ab>>>>>>>'+str);
    }
    
    Public virtual void getvalue(Integer a, String str)
    {
        ab=ab+a;
        System.debug('ab>>>>>>>'+ab+'string'+str);
    }

    
}