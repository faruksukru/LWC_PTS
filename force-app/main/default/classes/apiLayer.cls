public class apiLayer {
    public class FlowInputs{
        @InvocableVariable public String frm;
        @InvocableVariable public String to;
        @InvocableVariable public Double amount;
    }
    public class Flowoutputs {
        @InvocableVariable public Double Result;
        @InvocableVariable public Double Rate;
    }
    @InvocableMethod(label='Currency Convert')
    public Static List<Flowoutputs> convertCurrency(List<FlowInputs> inputComeFromFlow){
        String frm = inputComeFromFlow.get(0).frm;
        String to = inputComeFromFlow.get(0).to;
        Double amount = inputComeFromFlow.get(0).amount;
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
        List<Flowoutputs> results = new List<Flowoutputs>();
        Flowoutputs res = new Flowoutputs();
        res.Result =result1.result;
        res.Rate =result1.info.quote;
        results.add(res);
        Return results;
    }
}