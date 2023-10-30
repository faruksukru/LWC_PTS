public class ParseForIntegration {
		public String firstName;
		public String lastName;
		public String email;
		public String phone;
		public String gender;
		public String status;

	
	public static List<ParseForIntegration> parse(String json) {
		return (List<ParseForIntegration>) System.JSON.deserialize(json, List<ParseForIntegration>.class);
	}
}