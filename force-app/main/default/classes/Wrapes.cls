public with sharing class Wrapes {

    public Integer exp { get; set; }

    public Integer sal { get; set; }

    public Wrapper1 w1 { get; set; }
    
    Public Wrapes(){
    w1= new Wrapper1();
    w1.name='Shabbir';
    w1.age=34;
    sal=50000;
    exp=5;
    }
}