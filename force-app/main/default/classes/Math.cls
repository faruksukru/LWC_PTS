public class Math {
    public class FlowInputs {
        @InvocableVariable public Integer a;
        @InvocableVariable public Integer b;
    }
    public class Flowoutputs {
        @InvocableVariable public Integer Mult;
        @InvocableVariable public Integer add1;
    }
    @InvocableMethod(label='Math Operation')
    public static List<Flowoutputs> mathOperation(List<FlowInputs> req){
        List <Flowoutputs> multply = new List <Flowoutputs>();  
        Flowoutputs multp = new Flowoutputs();
        Flowoutputs add1 = new Flowoutputs();
        multp.Mult =req[0].a*req[0].b;
        multp.add1 =req[0].a+req[0].b;
        multply.add(multp);
        return multply;
    }
}