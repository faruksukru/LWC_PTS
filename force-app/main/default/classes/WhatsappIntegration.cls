public class WhatsappIntegration {
    public static Boolean sendTemplateMessage(string contactId){
        contact contactDetail = [Select id, phone From Contact Where Id=:contactId];
        string whatsAppNumber = '90'+contactDetail.Phone;
        system.debug('Whatsappnumber:'+whatsAppNumber);
        Http http =new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://graph.facebook.com/v17.0/105930459253127/messages');
        req.setHeader('Content-Type', 'application/json');
        req.setMethod('POST');
        req.setHeader('Authorization', 'Bearer EAADEqW43fvsBAMpdAg95Sn75SSATTpKCXnPBSg50F41uPScd2i8M62i7g7P3zGZBc06icaJnuVDCTQljMZA3kRvLbnu0UH7l7tR6yM8nekpwKp23CVMvOeop4ScWS2wNl8Nl9EbcZAOagKiYWCEt36BkFJ0mSs1nh1hgYQ0tKcPX5QWjDDZCle8VlsZAtpZA32pqrreB0rsAZDZD');
        String body = '{"messaging_product":"whatsapp", "to":"'+whatsAppNumber+'", "type":"template", "template":{"name": "hello_world", "language":{"code":"en_US"}}}';
        req.setBody(body);
        HttpResponse res =http.send(req);
        system.debug ('response:'+req.getBody());
        system.debug(res.getStatusCode());
        if(res.getStatusCode()==200){
            return true;
        }Else{
        return false;
    }
    }

}