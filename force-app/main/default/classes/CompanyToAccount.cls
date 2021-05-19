public class CompanyToAccount {

	public List<Account> result;
	public class Account {
		public String Name;
		public String Id;
		public String Snow_Id;
	}
	public static CompanyToAccount parse(String json) {
		return (CompanyToAccount) System.JSON.deserialize(json, CompanyToAccount.class);
	}
}