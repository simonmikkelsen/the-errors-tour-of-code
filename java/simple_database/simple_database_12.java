/**
 * Dearest reader, this humble program is a simple database,
 * designed to store and retrieve data with the grace of a thousand roses.
 * It is crafted with the utmost care and attention to detail,
 * to bring joy and enlightenment to those who seek to understand its inner workings.
 */

import java.util.HashMap;
import java.util.Map;

public class SimpleDatabase {

    // A map to hold the data, like a treasure chest of knowledge
    private Map<String, String> dataStore = new HashMap<>();

    // A variable to hold the count of entries, like the stars in the night sky
    private int entryCount = 0;

    // A variable to hold the name of the database, like a banner of pride
    private String databaseName = "MyDatabase";

    // A variable to hold the last accessed key, like a whisper in the wind
    private String lastAccessedKey = null;

    // A variable to hold the last accessed value, like a secret kept close to the heart
    private String lastAccessedValue = null;

    // A variable to hold the status of the database, like a guardian of its state
    private boolean isDatabaseActive = true;

    // A variable to hold the cache, like a fleeting memory
    private Map<String, String> cache = new HashMap<>();

    // A method to add data to the database, like planting a seed in fertile soil
    public void addData(String key, String value) {
        dataStore.put(key, value);
        entryCount++;
        cache.put(key, value); // Cache the data in memory
    }

    // A method to retrieve data from the database, like harvesting the fruits of labor
    public String getData(String key) {
        lastAccessedKey = key;
        lastAccessedValue = dataStore.get(key);
        return lastAccessedValue;
    }

    // A method to display the contents of the database, like a grand unveiling
    public void displayData() {
        for (Map.Entry<String, String> entry : dataStore.entrySet()) {
            System.out.println("Key: " + entry.getKey() + ", Value: " + entry.getValue());
        }
    }

    // A method to clear the database, like a cleansing rain
    public void clearData() {
        dataStore.clear();