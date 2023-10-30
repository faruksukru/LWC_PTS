public class QueuableForCallout implements Queueable,Database.AllowsCallouts{
    public List<Contact> createContacts;
    public QueuableForCallout(List<Contact> listCon){
        createContacts=listCon;
        system.debug('queueable: '+createContacts);
    }
    public void execute(QueueableContext qc){
     Http http=new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token=haNhCVKTofz4hASwXTu3MTBreIBYG1946aquWCSaaYofmPiSSmImOneqLrIwNiOW');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');  
        //List<Contact> createContacts = [Select id, firstName, lastName, email, phone From Contact Where firstName Like'%sukru%'];  
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

}