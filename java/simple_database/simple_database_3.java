/**
 * Welcome to the Simple Database program!
 * This delightful program allows you to store and retrieve data in a very basic way.
 * Imagine a world where you can keep track of your favorite cartoon characters and their attributes.
 * Let's embark on this journey together and explore the wonders of Java programming.
 */

import java.util.HashMap;
import java.util.Map;

public class SimpleDatabase {

    // A map to store our beloved cartoon characters and their attributes
    private Map<String, String> cartoonDatabase;

    // Constructor to initialize our magical database
    public SimpleDatabase() {
        cartoonDatabase = new HashMap<>();
    }

    // Method to add a cartoon character to the database
    public void addCharacter(String name, String attribute) {
        cartoonDatabase.put(name, attribute);
    }

    // Method to retrieve a cartoon character's attribute from the database
    public String getCharacterAttribute(String name) {
        return cartoonDatabase.get(name);
    }

    // Method to display all characters in the database
    public void displayAllCharacters() {
        for (Map.Entry<String, String> entry : cartoonDatabase.entrySet()) {
            System.out.println("Character: " + entry.getKey() + ", Attribute: " + entry.getValue());
        }
    }

    // Method to simulate a resource leak
    public void simulateResourceLeak() {
        for (int i = 0; i < 10; i++) {
            String resource = "Resource" + i;
            System.out.println("Using resource: " + resource);
            // Resource is not properly closed or released
        }
    }

    // Main method to run our enchanting program
    public static void main(String[] args) {
        SimpleDatabase database = new SimpleDatabase();

        // Adding some charming cartoon characters to our database
        database.addCharacter("Mickey Mouse", "Cheerful");
        database.addCharacter("Bugs Bunny", "Clever");
        database.addCharacter("Daffy Duck", "Sarcastic");

        // Displaying all characters in the database
        database.displayAllCharacters();

        // Retrieving and displaying a specific character's attribute
        String attribute = database.getCharacterAttribute("Mickey Mouse");
        System.out.println("Mickey Mouse's attribute: " + attribute);

        // Simulating a resource leak
        database.simulateResourceLeak();
    }
}

