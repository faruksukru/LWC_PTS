public class Animals {
    public List<String> animals;
    public static Animals parse(String json) {
        return (Animals) System.JSON.deserialize(json, Animals.class);
    }
}