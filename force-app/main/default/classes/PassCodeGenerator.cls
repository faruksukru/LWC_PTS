public class PassCodeGenerator {
    @invocablemethod(Label='Random Code Generator')
    public static List<string> generatePassCode(){
        String chart = '0123456789AaBbCcDd';
        String passCode ='';
        for (Integer i=0; i<6; i++){
            Integer index = integer.valueOf(system.math.random()*chart.length());
            passCode+=chart.substring(index,index+1);
            
        }
        return new List<String> {passCode};
            }
}