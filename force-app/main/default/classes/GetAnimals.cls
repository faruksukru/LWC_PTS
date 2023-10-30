public class GetAnimals {
    public static void getNames(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/Animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        system.debug(response.getBody());
        system.debug(response.getStatusCode());
        Map<string,List<string>> animal =(Map<string,List<string>>)JSON.deserialize(response.getBody(), List<string>.class);
        system.debug(animal);  
        Animals animals =Animals.parse(response.getBody());
        //List<String> animal =new List<String>();
        //animal.addAll(animals);        
        system.debug(animals.animals);
    }
    public static void postName(){
        Animal postAnimal = new Animal();
        postAnimal.name='Dog';
        postAnimal.eats='Meat';
        postAnimal.says='Bark';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/Animals');
        request.setMethod('POST');
        request.setBody(JSON.serialize(postAnimal));
        request.setHeader('Content-Type', 'application/json');
        HttpResponse response = http.send(request);
        system.debug(response.getBody());
        system.debug(response.getStatusCode());
    }
}