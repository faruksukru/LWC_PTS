public class PTSFuturePost {
    public class FlowInputs{
        @InvocableVariable public List<contact> listContacts;
    }
    @InvocableMethod(label='Post Customer Info')
    public static void PostCustomer(List<FlowInputs> inputComeFromFlow){
        List<Contact> listCon = inputComeFromFlow.get(0).listContacts;
        system.debug('Flow: '+listCon);
        system.enqueueJob (new QueuableForCallout(listCon));
        
    }
    
}