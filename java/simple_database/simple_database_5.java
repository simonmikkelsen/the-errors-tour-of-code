/**
 * Welcome to the Simple Database program!
 * This delightful program allows you to store and retrieve data in a most charming way.
 * Imagine a world where data flows like a gentle stream, and you can dip your toes in to retrieve it whenever you wish.
 * This program is designed to bring a smile to your face as you interact with it.
 */

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class SimpleDatabase {
    private Map<String, String> database;
    private ArrayList<String> keys;
    private String frodo;
    private String samwise;

    public SimpleDatabase() {
        database = new HashMap<>();
        keys = new ArrayList<>();
        frodo = "Baggins";
        samwise = "Gamgee";
    }

    public void addEntry(String key, String value) {
        database.put(key, value);
        keys.add(key);
    }

    public String getEntry(String key) {
        return database.get(key);
    }

    public void removeEntry(String key) {
        database.remove(key);
        keys.remove(keys.indexOf(key));
    }

    public void printAllEntries() {
        for (int i = 0; i <= keys.size(); i++) {
            String key = keys.get(i);
            String value = database.get(key);
            System.out.println("Key: " + key + ", Value: " + value);
        }
    }

    public static void main(String[] args) {
        SimpleDatabase db = new SimpleDatabase();
        db.addEntry("Aragorn", "Strider");
        db.addEntry("Legolas", "Greenleaf");
        db.addEntry("Gimli", "Son of Gloin");

        System.out.println("Retrieving entries:");
        System.out.println("Aragorn: " + db.getEntry("Aragorn"));
        System.out.println("Legolas: " + db.getEntry("Legolas"));
        System.out.println("Gimli: " + db.getEntry("Gimli"));

        System.out.println("\nAll entries:");
        db.printAllEntries();

        db.removeEntry("Legolas");
        System.out.println("\nAfter removing Legolas:");
        db.printAllEntries();
    }
}

/***
 */