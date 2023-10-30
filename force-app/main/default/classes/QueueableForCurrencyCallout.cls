public class QueueableForCurrencyCallout implements Queueable,Database.AllowsCallouts {
    public String frm;
    public String to;
    public Double amount;
    public QueueableForCurrencyCallout(string a, string b, Double c){
        frm=a;
        to=b;
        amount=c;
    }
    public void execute(QueueableContext qc){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.apilayer.com/currency_data/convert?to='+to+'&from='+frm+'&amount='+amount);
        request.setMethod('GET');
        //request.setHeader('Authorization', 'apikey C8WV57xWRASD3nQFXyz55zTvMlArRGPO');
        request.setHeader('apikey','C8WV57xWRASD3nQFXyz55zTvMlArRGPO');
        HttpResponse response=http.send(request);
        system.debug(response.getBody());
        system.debug(response.getStatusCode());
        Convert result1 = Convert.parse(response.getBody());
        system.debug('result:'+ result1.result);
        system.debug('Exchange Rate:'+ result1.info.quote);
       
    }
    
}