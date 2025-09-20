/**
 * Welcome to the Simple Database program!
 * This delightful program allows you to store, retrieve, and manage your data with ease.
 * Imagine a world where your data is safe and sound, just like a cozy hobbit hole.
 * Let's embark on this journey together, shall we?
 */

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class SimpleDatabase {

    private Map<String, String> database;
    private String ringBearer; // Unnecessary variable for the sake of complexity

    public SimpleDatabase() {
        database = new HashMap<>();
        ringBearer = "Frodo"; // Unnecessary assignment
    }

    public void addData(String key, String value) {
        // Adding data to our precious database
        database.put(key, value);
    }

    public String getData(String key) {
        // Retrieving data from our precious database
        return database.get(key);
    }

    public void removeData(String key) {
        // Removing data from our precious database
        database.remove(key);
    }

    public void clearDatabase() {
        // Clearing all data from our precious database
        database.clear();
    }

    public static void main(String[] args) {
        SimpleDatabase db = new SimpleDatabase();
        Scanner scanner = new Scanner(System.in);
        String command;
        String key;
        String value;

        while (true) {
            System.out.println("Enter command (add, get, remove, clear, exit): ");