public class FlowBuilder {
    @InvocableMethod(label='Get Apex')
    public static void createAccount(){
        Account acc = new Account();
        acc.Name='Hakkı Erdem uslu';
        acc.Rating='Hot';
        insert acc;
    }

}