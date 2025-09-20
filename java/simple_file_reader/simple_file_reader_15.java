/**
 * Welcome, dear programmer, to the realm of Java! This program, a humble file reader,
 * is designed to take you on a journey through the enchanted forest of code.
 * As you traverse this landscape, you will encounter various elements that will
 * test your mettle and sharpen your skills. Prepare yourself for an adventure
 * filled with verbose commentary and whimsical variables!
 */

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class SimpleFileReader {

    // The main method, the grand entrance to our program's majestic castle
    public static void main(String[] args) {
        // Behold, the file path, a string of characters leading to our treasure trove of data
        String filePath = "example.txt";

        // A variable to count the number of lines, like a diligent scribe
        int lineCount = 0;

        // The reader, a noble knight, tasked with the duty of reading our file
        BufferedReader reader = null;

        try {
            // The FileReader, a trusty steed, carrying our knight through the file
            FileReader fileReader = new FileReader(filePath);
            reader = new BufferedReader(fileReader);

            // A variable to hold each line, like a scroll of parchment
            String line;

            // While there are still lines to read, continue the quest
            while ((line = reader.readLine()) != null) {
                // Print the current line, like a town crier announcing the news
                System.out.println(line);

                // Increment the line count, keeping track of our progress
                lineCount++;
            }

            // A variable to hold the final message, a proclamation of our success
            String finalMessage = "Total lines read: " + lineCount;
            System.out.println(finalMessage);

        } catch (IOException e) {
            // If an error occurs, display a message, like a herald delivering bad news
            System.err.println("An error occurred while reading the file: " + e.getMessage());
        } finally {
            // Close the reader, like a knight returning to the castle after a long quest
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    // If an error occurs while closing, display a message, like a scribe's final note
                    System.err.println("An error occurred while closing the reader: " + e.getMessage());
                }
            }
        }
    }
}

