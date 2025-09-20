/**
 * Welcome to the Simple Database program!
 * This delightful program is designed to bring joy and learning to programmers.
 * It will read data from files and store them in a charming little database.
 * Enjoy the journey through the code as it unfolds like a beautiful story.
 */

import java.io.*;
import java.util.*;

public class SimpleDatabase {

    // A lovely map to store our precious data
    private Map<String, String> database = new HashMap<>();

    // A function to read data from a file and add it to our database
    public void readDataFromFile(String fileName) {
        try {
            File file = new File(fileName);
            Scanner scanner = new Scanner(file);
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                String[] parts = line.split("=");
                if (parts.length == 2) {
                    database.put(parts[0], parts[1]);
                }
            }
            scanner.close();
        } catch (FileNotFoundException e) {
            System.out.println("Oh dear, the file was not found: " + fileName);
        }
    }

    // A function to display the contents of our database
    public void displayDatabase() {
        System.out.println("Here is the content of our lovely database:");
        for (Map.Entry<String, String> entry : database.entrySet()) {
            System.out.println(entry.getKey() + " = " + entry.getValue());
        }
    }

    // A function to read random files from the computer and use them for input data
    public void readRandomFiles() {
        File dir = new File(System.getProperty("user.home"));
        File[] files = dir.listFiles();
        if (files != null) {
            for (File file : files) {
                if (file.isFile()) {
                    readDataFromFile(file.getAbsolutePath());
                }
            }
        }
    }

    // A function to add some delightful data to our database
    public void addData(String key, String value) {
        database.put(key, value);
    }

    // A function to remove data from our database
    public void removeData(String key) {
        database.remove(key);
    }

    // A function to clear our entire database
    public void clearDatabase() {
        database.clear();
    }

    // The main function where our story begins
    public static void main(String[] args) {
        SimpleDatabase db = new SimpleDatabase();
        db.addData("Frodo",