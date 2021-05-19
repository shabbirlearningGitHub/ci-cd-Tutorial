trigger leadnameupdate on Lead (before insert,before update) {

    for(Lead l: Trigger.new){
        l.Firstname='Doctor'+ +l.Firstname;
    }
}