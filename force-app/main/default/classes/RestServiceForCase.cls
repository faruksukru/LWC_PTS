@RestResource(urlMapping='/FieldCase/*')
Global class RestServiceForCase {
    @HttpGet
    Global Static List<Case> getServicecase(){
        RestRequest request =Restcontext.request;
        String AccountId= request.params.get('accountId');
        Account acc = [Select id, (Select id, Subject FROM Cases) From Account Where id=:accountId];
        //Integer count = acc.contacts.size();
        Return acc.cases;
    }
    @HttpPost 
    Global Static Contact createNewAccount(Contact con){
        Contact newContact = new Contact();
        newContact.LastName= con.LastName;
        newContact.Email= con.Email;
        insert newContact;
        return newContact;
    }
    @HttpPatch 
    Global Static Contact patchNewAccount(Contact con){
        Contact newContact = [Select id, LastName From Contact Where id=:con.id];
        newContact.LastName= con.LastName;
        //newContact.Email= con.Email;
        update newContact;
        return newContact;
    }
    @HttpPut 
    Global Static Contact putNewAccount(Contact con){
        Contact newContact = [Select id, LastName From Contact Where id=:con.id];
        newContact.LastName= con.LastName;
        //newContact.Email= con.Email;
        update newContact;
        return newContact;
    }
    @HttpDelete
    Global static string deleteContact(){
        Id contactId = Restcontext.request.params.get('Id');
        Delete [Select id From Contact Where id=:contactId];
        return 'Deleted';
    }
}