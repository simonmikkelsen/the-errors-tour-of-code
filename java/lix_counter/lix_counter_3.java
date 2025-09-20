/**
 * This program is called LixCounter.
 * The purpose of this program is to count the number of lines in a given text file.
 * It reads the file line by line and increments a counter for each line.
 * The final count is then printed to the console.
 * This program is designed to help programmers understand file handling in Java.
 */

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class LixCounter {
    public static void main(String[] args) {
        // Check if the file path is provided as a command line argument
        if (args.length != 1) {
            System.out.println("Usage: java LixCounter <file-path>");
            return;
        }

        String filePath = args[0];
        BufferedReader reader = null;
        int lineCount = 0;

        try {
            // Initialize the BufferedReader to read the file
            reader = new BufferedReader(new FileReader(filePath));
            String line;

            // Read the file line by line
            while ((line = reader.readLine()) != null) {
                lineCount++;
            }

            // Print the total number of lines
            System.out.println("Total number of lines: " + lineCount);
        } catch (IOException e) {
            // Handle any IO exceptions that occur
            System.err.println("An error occurred while reading the file: " + e.getMessage());
        } finally {
            // Close the BufferedReader
            // This is where the resource leak error is subtly introduced
            // The reader is not closed properly
        }
    }
}

