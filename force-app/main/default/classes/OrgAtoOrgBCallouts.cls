public class OrgAtoOrgBCallouts {
    public static void createRecord(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:OrgAtoOrgB/services/data/v57.0/sobjects/Account');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json; charset=UTF-8');
        request.setBody('{"Name":"Account comes From ORG A", "Rating":"Hot"}');
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
    }
    public static void updateRecord(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:OrgAtoOrgB/services/data/v57.0/sobjects/Account');
        request.setMethod('PUT');
        request.setHeader('Content-Type', 'application/json; charset=UTF-8');
        request.setBody('{"id"="001Do00000GVy7NIAT","Name":"Account comes From ORG A Update", "Rating":"Cold", "Phone":"1234567890"}');
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
    }
    public static void getRecord(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:OrgAtoOrgB/services/data/v57.0/sobjects/Account/001Do00000GVy7NIAT');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        system.debug(response.getBody());
    }
    public static void deleteRecord(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:OrgAtoOrgB/services/data/v57.0/sobjects/Account/001Do00000GVy7NIAT');
        request.setMethod('DELETE');
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
    }
    public static void getRecordWebService(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:OrgAtoOrgB/services/apexrest/contact?contactId=003Do00000L0tgWIAR');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        List<Contact> listContact =(List<Contact>) JSON.deserialize(response.getBody(), List<Contact>.class);
        List<Contact> insertContacts = new List<Contact>();
        for (Contact w:listContact){
            Contact con = new Contact();
            con.FirstName=w.FirstName;
            con.LastName=w.LastName;
            con.Email=w.Email;
            con.Phone=w.Phone;
            insertContacts.Add(con);
        }
        system.debug(listContact);
        insert insertContacts;
    }
    public static void postRecordWebService(){
        List<Contact> listContact = [SELECT id, FirstName, LastName, Email, Phone FROM Contact WHERE Name Like '%RestPost%' LIMIT 2];
        List<IntegrationRequest> insertContacts = new List<IntegrationRequest>();
        for (Contact w:listContact){
            IntegrationRequest con = new IntegrationRequest();
            con.FirstName=w.FirstName;
            con.LastName=w.LastName;
            con.Email=w.Email;
            con.Phone=w.Phone;
            insertContacts.Add(con);
        } 
        system.debug(insertContacts);
        String jsonConList ='{"postRequestContacts":'+JSON.serialize(insertContacts)+'}';
        system.debug(jsonConList);
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:OrgAtoOrgB/services/apexrest/contact');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json; charset=UTF-8');
        request.setBody(jsonConList);
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
    }
    public static void deleteRecordWebService(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:OrgAtoOrgB/services/apexrest/contact?contactId=003Do00000L0tgWIAR');
        request.setMethod('DELETE');
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
    }
    public static void putRecordWebService(){
        List<Contact> listContact = [SELECT id, FirstName, LastName, Email, Phone FROM Contact WHERE Name Like '%RestPost%' LIMIT 1];
        List<IntegrationRequest> insertContacts = new List<IntegrationRequest>();
        for (Contact w:listContact){
            IntegrationRequest con = new IntegrationRequest();
            con.id='003Do00000L2jNAIAZ';
            con.FirstName=w.FirstName;
            con.LastName=w.LastName+'put';
            con.Email=w.Email;
            con.Phone=w.Phone;
            insertContacts.Add(con);
        } 
        system.debug(insertContacts);
        String jsonConList ='{"postRequestContacts":'+JSON.serialize(insertContacts)+'}';
        system.debug(jsonConList);
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:OrgAtoOrgB/services/apexrest/contact');
        request.setMethod('PUT');
        request.setHeader('Content-Type', 'application/json; charset=UTF-8');
        request.setBody(jsonConList);
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
    }
        
    public class IntegrationRequest {
        public string id;
        public String FirstName;
        public String LastName;
        public String Email;
        public String Phone;
        
    }
}