public with sharing class SOQL22 {
 public list<SOQL2> accs {set;get;}
 public list<SOQL2> del {set;get;}
 public list<Account> a {set;get;}
 public boolean f1 {set;get;}
 public string find {set;get;}
 public SOQL22(){
 a=[select name,id,phone,industry from Account limit 5];
 accs=new List<SOQL2>();
 del=new List<SOQL2>();
 for(account x:a){
 SOQL2 s = new SOQL2();
 s.acc=x;
 s.flag=false;
 accs.add(s);
 }
 }
 public void search(){
 a=[select name,id,phone,industry from Account where industry=:find limit 1000];
 accs=new List<SOQL2>();
 for(account x:a){
 SOQL2 s = new SOQL2();
 s.acc=x;
 s.flag=false;
 accs.add(s);
 }
 }
 public void del(){
 for(integer i=0;i<accs.size();i++){
 if(accs[i].flag==True){
 del.add(accs[i]);
 accs.remove(i);
 System.debug('accs,remove(i)'+accs.remove(i));
 i--;

 }
 }
 }

 public void undel(){
 for(integer i=0;i<del.size();i++){
 if(del[i].flag==True){
 accs.add(del[i]);
 del.remove(i);
 i--;

 }
 }
 }
 public void allsel(){
 for(integer i=0;i<del.size();i++){
 del[i].flag=f1;
 }
 }
}