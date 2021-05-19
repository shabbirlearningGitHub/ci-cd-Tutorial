public with sharing class Add {

    public Integer cval { get; set; }

    public Integer bval { get; set; }

    public Integer aval { get; set; }

    public void Resetinput() {
    
    aval =NULL;
    bval=Null;
    cval=NULL;
    }


    public void Additionoftwonumber() {
    if(aval>0 || bval>0){
          cval=aval+bval;
       }
       else{
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Fatal,'Please enter Avalue or Bvalue'));
 
       }
       
    }

}