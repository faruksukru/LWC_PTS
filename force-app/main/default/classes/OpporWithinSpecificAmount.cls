public class OpporWithinSpecificAmount {
    public static List<Opportunity> oppWithinRange(Integer num1, Integer num2){
        Return [SELECT Name, Amount FROM Opportunity WHERE Amount>:num1 And Amount<:num2];
       
}
}