/**
 * This program is called WordCounter.
 * The purpose of this program is to count the number of words in a given text file.
 * It reads the content of the file, splits the content into words, and then counts the number of words.
 * The program demonstrates basic file handling, string manipulation, and exception handling in Java.
 */

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class WordCounter {

    public static void main(String[] args) {
        // Check if the user has provided a filename as an argument
        if (args.length != 1) {
            System.out.println("Usage: java WordCounter <filename>");
            return;
        }

        String filename = args[0];
        BufferedReader reader = null;

        try {
            // Initialize the BufferedReader to read the file
            reader = new BufferedReader(new FileReader(filename));
            String line;
            int wordCount = 0;

            // Read the file line by line
            while ((line = reader.readLine()) != null) {
                // Split the line into words using whitespace as the delimiter
                String[] words = line.split("\\s+");
                // Increment the word count by the number of words in the current line
                wordCount += words.length;
            }

            // Print the total word count
            System.out.println("Total number of words: " + wordCount);

        } catch (IOException e) {
            // Handle any IO exceptions that may occur
            System.err.println("Error reading the file: " + e.getMessage());
        } finally {
            // Close the BufferedReader
            // This is where the resource leak error is subtly introduced
            // The reader.close() method is not called
        }
    }
}

