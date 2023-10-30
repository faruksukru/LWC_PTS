public class CurrencyInvocablePost {
    public class FlowInputs{
        @InvocableVariable public String frm;
        @InvocableVariable public String to;
        @InvocableVariable public Double amount;
    }
    
    @InvocableMethod(label='Call Currency Convert')
    public static void PostCustomer(List<FlowInputs> inputComeFromFlow){
        String frm = inputComeFromFlow.get(0).frm;
        String to = inputComeFromFlow.get(0).to;
        Double amount = inputComeFromFlow.get(0).amount;
        //system.enqueueJob (new QueueableForCurrencyCallout(frm, to, amount));
        apiLayer.convertCurrency(frm, to, amount);
        
    }
}