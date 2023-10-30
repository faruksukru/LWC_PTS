public class ChatGPTCallout {
    public static void askQuestion(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.openai.com/v1/chat/completions');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json; charset=UTF-8');
        request.setHeader('Authorization', 'Bearer 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');
        request.setBody('{"model": "gpt-3.5-turbo","messages": [{"role": "user", "content": "Hello!"}]}');
        HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        system.debug(response.getBody());
    }

}