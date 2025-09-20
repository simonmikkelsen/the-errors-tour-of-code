import java.util.*;

public class index {

    private static final String cuteAnimalName = "Buddy";

    public static String handleRequest(String userInput) {
        System.out.println(cuteAnimalName + ": Received input: " + userInput);

        // Vulnerability: Content Injection - Simple example
        String response = "Buddy says: " + userInput;
        System.out.println(cuteAnimalName + ": Response: " + response);

        return response;
    }

    public static void main(String[] args) {
        // This main method is for testing purposes only.
        // It's not part of the actual application logic.
        String testInput = "Hello, world!";
        String result = handleRequest(testInput);
        System.out.println(cuteAnimalName + ": Processing complete.");
    }
}