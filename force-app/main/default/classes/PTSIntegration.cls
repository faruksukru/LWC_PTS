public with sharing class PTSIntegration {
    //@future(callout=true)
    public static void getRequest() {
        Http http=new Http();
        HttpRequest request = new HttpRequest();
        //request.setEndpoint('https://api.pathtosalesforce.com/customerList.php?gender=male&token=haNhCVKTofz4hASwXTu3MTBreIBYG1946aquWCSaaYofmPiSSmImOneqLrIwNiOW');
        request.setEndpoint('callout:DemoNamedAPI/customerList.php?gender=male&token=haNhCVKTofz4hASwXTu3MTBreIBYG1946aquWCSaaYofmPiSSmImOneqLrIwNiOW');
        request.setMethod('GET');
        HttpResponse response= http.send(request);
        system.debug(response.getBody());
        system.debug(response.getStatusCode());
        List<ParseForIntegration> customerList=ParseForIntegration.parse(response.getBody());
        system.debug(customerList);
       /* List<Contact> createContact= new List<Contact>();
        for (ParseForIntegration w:customerList){
            Contact cnt= new Contact();  
            cnt.FirstName=w.firstName;
            cnt.LastName=w.lastName;
            cnt.Email=w.Email;
            cnt.Phone=w.phone;
            createContact.add(cnt);            
        } 
        Database.insert(createContact,true);*/
        
    }
    // @future(callout=true)
    public static void postRequest() {
        Http http=new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token=haNhCVKTofz4hASwXTu3MTBreIBYG1946aquWCSaaYofmPiSSmImOneqLrIwNiOW');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');  
        List<Contact> createContacts = [Select id, firstName, lastName, email, phone From Contact Where firstName Like'%sukru%'];  
        List<IntegrationRequest> req = new List<IntegrationRequest>();
        for(Integer i=0;i<createContacts.size();i++){
            IntegrationRequest req1 = new IntegrationRequest();
            req1.firstName= createContacts[i].FirstName;
            req1.lastName= createContacts[i].LastName;
            req1.email= createContacts[i].Email;
            req1.phone= createContacts[i].Phone;
            req1.gender= 'Male';
            req1.status='active';
            req.Add(req1); 
        }
        request.setBody(JSON.serialize(req)); 
        HttpResponse response= http.send(request);
        system.debug(response.getBody());
        system.debug(response.getStatusCode());
        
    }
    Public static void putRequest(){
        IntegrationRequest req1 = new IntegrationRequest();
        req1.id='22';
        req1.lastName='Put API 1';
        req1.firstName='Sukru';
        req1.gender='Female';
        req1.phone='1234512345';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token=haNhCVKTofz4hASwXTu3MTBreIBYG1946aquWCSaaYofmPiSSmImOneqLrIwNiOW');
        request.setMethod('PUT');
        request.setHeader('Content-Type','application/json');
        request.setBody(JSON.serialize(req1));
        HttpResponse response = http.send(request);
        system.debug(response.getBody());
        system.debug(response.getStatusCode());
        
    }
    Public static void deleteRequest(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.pathtosalesforce.com/customer.php?id=26&token=haNhCVKTofz4hASwXTu3MTBreIBYG1946aquWCSaaYofmPiSSmImOneqLrIwNiOW');
        request.setMethod('DELETE');
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
    }
}