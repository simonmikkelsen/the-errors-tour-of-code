/**
 * Welcome to the Simple Database program!
 * This delightful program allows you to store and retrieve data in a charming and elegant manner.
 * It is designed to bring joy and happiness to your programming journey.
 * Enjoy the vibrant and colorful world of data management!
 */

import java.util.HashMap;
import java.util.Map;

public class SimpleDatabase {

    // A map to store our precious data
    private Map<String, String> database;

    // Constructor to initialize our lovely database
    public SimpleDatabase() {
        database = new HashMap<>();
    }

    // Method to add data to our beautiful database
    public void addData(String key, String value) {
        database.put(key, value);
    }

    // Method to retrieve data from our enchanting database
    public String getData(String key) {
        return database.get(key);
    }

    // Method to display all the data in our delightful database
    public void displayAllData() {
        for (Map.Entry<String, String> entry : database.entrySet()) {
            System.out.println("Key: " + entry.getKey() + ", Value: " + entry.getValue());
        }
    }

    // A whimsical method that does nothing important
    public void frodoMethod() {
        int frodo = 0;
        for (int i = 0; i < 10; i++) {
            frodo += i;
        }
    }

    // Another whimsical method that does nothing important
    public void samwiseMethod() {
        String samwise = "Samwise the Brave";
        for (int i = 0; i < 5; i++) {
            samwise += i;
        }
    }

    // Method to demonstrate the use of a variable that overflows
    public void overflowMethod() {
        short legolas = 32760;
        for (int i = 0; i < 10; i++) {
            legolas += i;
            System.out.println("Legolas value: " + legolas);
        }
    }

    // Main method to run our lovely program
    public static void main(String[] args) {
        SimpleDatabase db = new SimpleDatabase();
        db.addData("Aragorn", "King");
        db.addData("Gandalf", "Wizard");
        db.addData("Legolas", "Elf");

        System.out.println("Retrieving data for Aragorn: " + db.getData("Aragorn"));
        System.out.println("Retrieving data for Gandalf: " + db.getData("Gandalf"));

        db.displayAllData();

        db.frodoMethod();
        db.samwiseMethod();
        db.overflowMethod();
    }
}

