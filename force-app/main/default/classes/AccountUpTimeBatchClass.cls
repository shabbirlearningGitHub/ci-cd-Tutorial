global class AccountUpTimeBatchClass implements Database.Batchable<Sobject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return database.getQueryLocator('select id, name,Business_Hours__c from Account where Business_Hours__c != Null');
    }
    
    global void execute(database.BatchableContext bc, List<Account> Scope){
        Integer previousMonth = date.today().month()-1;
        Map<Id,String> BusinessHoursMap = new Map<Id,String>();
        Map<String,Decimal> dayHoursMap = new Map<String,Decimal>();
        Map<String,BusinessHours> BusinessHoursdata = new Map<String,BusinessHours>();
        
        for(BusinessHours bhours : [Select Id,Name,SundayStartTime, MondayStartTime, TuesdayStartTime,
                                    WednesdayStartTime, ThursdayStartTime, FridayStartTime,
                                    SaturdayStartTime, SundayEndTime, MondayEndTime,TuesdayEndTime,
                                    WednesdayEndTime, ThursdayEndTime, FridayEndTime,SaturdayEndTime
                                    From BusinessHours Where IsDefault=true]){
                                        
                                        BusinessHoursdata.put(bhours.Id,bhours);
                                    }
        
        System.debug('BusinessHoursdata******************************'+BusinessHoursdata);
        
        for(Account ac: Scope){
            BusinessHoursMap.put(ac.Id,ac.Business_Hours__c);           
        }
        System.debug('BusinessHoursMap *******'+BusinessHoursMap);
        for(String ids :BusinessHoursMap.values()){
            System.debug('ids******************'+ids);
            System.debug('ids******************'+BusinessHoursdata.get(ids));
            BusinessHours bhrs = BusinessHoursdata.get(ids);
            System.debug('bhrs*************'+bhrs);
            
            Decimal mStartValue = convertTimetoDecimal(bhrs.MondayStartTime);
            Decimal mendValue = convertTimetoDecimal(bhrs.MondayEndTime);
            dayHoursMap.put('Mon',(mendValue-mStartValue));
            
            Decimal tStartValue = convertTimetoDecimal(bhrs.TuesdayStartTime);
            Decimal tendValue = convertTimetoDecimal(bhrs.TuesdayEndTime);
            dayHoursMap.put('Tue',(tendValue-tStartValue));
            
            Decimal wedStartValue = convertTimetoDecimal(bhrs.WednesdayStartTime);
            Decimal wedendValue = convertTimetoDecimal(bhrs.WednesdayEndTime);
            dayHoursMap.put('Wed',(wedendValue-wedStartValue));
            
            Decimal thrStartValue = convertTimetoDecimal(bhrs.ThursdayStartTime);
            Decimal threndValue = convertTimetoDecimal(bhrs.ThursdayEndTime);
            dayHoursMap.put('Thu',(threndValue-thrStartValue));
            
            Decimal friStartValue = convertTimetoDecimal(bhrs.FridayStartTime);
            Decimal friendValue = convertTimetoDecimal(bhrs.FridayEndTime);
            dayHoursMap.put('Fri',(friendValue-friStartValue));
            
            Decimal satStartValue = convertTimetoDecimal(bhrs.SaturdayStartTime);
            Decimal satendValue = convertTimetoDecimal(bhrs.SaturdayEndTime);
            dayHoursMap.put('Sat',(satendValue-satStartValue));
            
            Decimal sunStartValue = convertTimetoDecimal(bhrs.SundayStartTime);
            Decimal sunendValue = convertTimetoDecimal(bhrs.SundayEndTime);
            dayHoursMap.put('Sun',(sunendValue-sunStartValue));
        }
        System.debug('dayhours*****************'+dayHoursMap);
        
        DateTime StartingDay = DateTime.newInstance(System.today().year(),System.today().month()-1,System.today().day());
        System.debug('previousMonth startdate'+StartingDay);
        DateTime endDays = System.today();
        Integer days = Date.valueOf(StartingDay).daysBetween(Date.valueOf(endDays));
        System.debug('Integer value ***'+days);    
        Boolean isWithin;  
        Decimal ExceptedUpTime = 0;
        List<Account_Uptime__c> accountupdatetimerecords = new List<Account_Uptime__c>();
        
        for(Account ac: Scope){
            for( integer i=0;i<days;i++){
                isWithin= BusinessHours.isWithin(ac.Business_Hours__c, StartingDay);
                if(isWithin == True){
                    String dayOfWeek = StartingDay.format('E');
                    System.debug('wek'+dayOfWeek);
                    System.debug('dayHoursMap.get(dayOfWeek)'+dayHoursMap.get(dayOfWeek));
                    ExceptedUpTime = ExceptedUpTime + dayHoursMap.get(dayOfWeek);
                    StartingDay = StartingDay.addDays(1);
                }else{
                    StartingDay = StartingDay.addDays(1);
                }
            }
            System.debug('ExceptedUpTime**********************'+ExceptedUpTime);
            if(ExceptedUpTime > 0){
                Account_Uptime__c aUpdate = new Account_Uptime__c();
                aUpdate.Account__c = ac.Id;
                aUpdate.Expected_Uptime__c = ExceptedUpTime;
                aUpdate.Run_Time__c = System.now();
                accountupdatetimerecords.add(aUpdate);
                
            }
        }
        try{
            insert accountupdatetimerecords;
        }catch(Exception ex){
            System.debug('Exception Message***************'+ex.getMessage());
        }
        
    }
    global void finish(Database.BatchableContext bc){
        
    }
    
    Public static Decimal convertTimetoDecimal(Time inputValue){
        String startTime = String.valueOf(inputValue);
        Integer hour = Integer.valueOf(startTime.left(2)); 
        Integer minute = Integer.valueOf(startTime.substringBetween(':',':')); 
        DateTime myDT = DateTime.newInstance(Date.today(), Time.newInstance(hour, minute, 0, 0)); // only care about hour and minute
        String myDate = myDT.format('HH.mm');
        Decimal convertvalue = Decimal.valueOf(myDate);
        System.debug('mydate*****'+myDate);
        return convertvalue;
    }
}