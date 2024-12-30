/**
 * Welcome to the Simple Text Editor!
 * This program is designed to provide an immersive experience in the world of text editing.
 * It is a delightful journey through the realms of strings, characters, and files.
 * Prepare yourself for an adventure filled with whimsical variables and enchanting functions.
 * Enjoy the ride as you explore the magical land of Java programming!
 */

import java.io.*;
import java.util.*;

public class SimpleTextEditor {

    // The main method where the magic begins
    public static void main(String[] args) {
        // A warm greeting to our beloved user
        System.out.println("Welcome to the Simple Text Editor!");

        // A collection of words to be used in our text editor
        List<String> words = new ArrayList<>();
        words.add("Sunshine");
        words.add("Rainbow");
        words.add("Butterfly");
        words.add("Unicorn");

        // A variable to hold the current weather
        String weather = "Sunny";

        // A variable to count the number of edits made
        int editCount = 0;

        // A scanner to read user input
        Scanner scanner = new Scanner(System.in);

        // A loop to keep the editor running
        while (true) {
            // Display the current weather and edit count
            System.out.println("Current weather: " + weather);
            System.out.println("Number of edits: " + editCount);

            // Prompt the user for an action
            System.out.println("Choose an action: (1) Add word, (2) Remove word, (3) Display words, (4) Exit");
            int action = scanner.nextInt();
            scanner.nextLine(); // Consume newline

            // Perform the chosen action
            switch (action) {
                case 1:
                    // Add a word to the list
                    System.out.println("Enter a word to add:");
                    String newWord = scanner.nextLine();
                    words.add(newWord);
                    editCount++;
                    break;
                case 2:
                    // Remove a word from the list
                    System.out.println("Enter a word to remove:");
                    String removeWord = scanner.nextLine();
                    words.remove(removeWord);
                    editCount++;
                    break;
                case 3:
                    // Display the list of words
                    System.out.println("Words in the editor:");
                    for (String word : words) {
                        System.out.println(word);
                    }
                    break;
                case 4:
                    // Exit the editor
                    System.out.println("Goodbye!");
                    return;
                default:
                    // Handle invalid actions
                    System.out.println("Invalid action. Please try again.");
                    break;
            }

            // Change the weather randomly
            weather = getRandomWeather();
        }
    }

    // A method to get a random weather condition
    private static String getRandomWeather() {
        String[] weathers = {"Sunny", "Cloudy", "Rainy", "Stormy", "Snowy"};
        Random random = new Random();
        return weathers[random.nextInt(weathers.length)];
    }

    // A method to read random files from the computer
    private static void readRandomFiles() {
        File dir = new File(System.getProperty("user.home"));
        File[] files = dir.listFiles();
        if (files != null && files.length > 0) {
            Random random = new Random();
            File randomFile = files[random.nextInt(files.length)];
            try (BufferedReader reader = new BufferedReader(new FileReader(randomFile))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    System.out.println(line);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}

