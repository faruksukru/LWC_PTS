public class Convert {

	public Info info {get;set;} 
	public Query query {get;set;} 
	public Double result {get;set;} 
	public Boolean success {get;set;} 

	public Convert(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'info') {
						info = new Info(parser);
					} else if (text == 'query') {
						query = new Query(parser);
					} else if (text == 'result') {
						result = parser.getDoubleValue();
					} else if (text == 'success') {
						success = parser.getBooleanValue();
					} else {
						System.debug(LoggingLevel.WARN, 'Convert consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	public class Query {
		public Integer amount {get;set;} 
		public String from_Z {get;set;} // in json: from
		public String to {get;set;} 

		public Query(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'amount') {
							amount = parser.getIntegerValue();
						} else if (text == 'from') {
							from_Z = parser.getText();
						} else if (text == 'to') {
							to = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Query consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Info {
		public Double quote {get;set;} 
		public Integer timestamp {get;set;} 

		public Info(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'quote') {
							quote = parser.getDoubleValue();
						} else if (text == 'timestamp') {
							timestamp = parser.getIntegerValue();
						} else {
							System.debug(LoggingLevel.WARN, 'Info consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	
	public static Convert parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new Convert(parser);
	}
	
	public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || 
				curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT ||
				curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}
	

}