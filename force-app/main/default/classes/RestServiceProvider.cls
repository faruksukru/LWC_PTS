@RestResource(urlMapping='/FieldContact/*')
Global class RestServiceProvider {
    @HttpGet
    Global Static List<Contact> getServicecontact(){
        RestRequest request =Restcontext.request;
        String AccountId= request.params.get('accountId');
        Account acc = [Select id, (Select id, Name FROM Contacts) From Account Where id=:accountId];
        //Integer count = acc.contacts.size();
        Return acc.contacts;
    } 
 
}