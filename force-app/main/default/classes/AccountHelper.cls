public with sharing class AccountHelper {
    public List<Account> getAccounts() {
        return [select id,name,Industry from Account];

    }
}