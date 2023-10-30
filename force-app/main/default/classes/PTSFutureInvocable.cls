public class PTSFutureInvocable {
    @InvocableMethod(label='Get Customer Info')
    public static void getCustomer(){
        PTSIntegration.getRequest();
    }
}