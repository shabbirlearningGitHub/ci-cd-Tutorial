public class QueueableExample1 implements Queueable {
    set<ID> acclist=new set<ID>();
    Public QueueableExample1(list<ID> ids)
    {
        for(ID i:ids ){
            acclist.add(i);
        }
    }
    
    Public Void execute(QueueableContext bc)
    {
        System.debug('acclist'+acclist);
        List<contact> listofcontacts=new list<contact>();
        list<contact> conlist=[select id, fax from contact where accountID=:acclist];
        for(contact con:conlist){
            con.fax='987564';
            listofcontacts.add(con);
        }
        System.debug('listofcontacts'+listofcontacts);
        update listofcontacts;
    }
    
}