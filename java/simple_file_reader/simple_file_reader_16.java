/**
 * Welcome, dear programmer, to the magnificent world of Java file reading!
 * This program is designed to take you on a journey through the enchanting
 * realms of file handling, where you will learn the art of reading from a file
 * with grace and elegance. Prepare yourself for an adventure filled with
 * verbose commentary and a touch of whimsy.
 */

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class SimpleFileReader {

    // The main method, the grand entrance to our program's performance
    public static void main(String[] args) {
        // Behold, the file path, the gateway to our textual treasure
        String filePath = "example.txt";
        
        // A variable to hold the current line of text from the file
        String currentLine = null;
        
        // A variable to count the number of lines read
        int lineCount = 0;

        // The try-with-resources statement, a paragon of resource management
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            // While there are still lines to read, let us proceed with our quest
            while ((currentLine = reader.readLine()) != null) {
                // Increment the line count, for each line is a precious gem
                lineCount++;
                
                // Print the current line, sharing the treasure with the world
                System.out.println(currentLine);
                
                // A variable to hold the length of the current line
                int lineLength = currentLine.length();
                
                // Print the length of the current line, for knowledge is power
                System.out.println("Line length: " + lineLength);
                
                // Reuse the currentLine variable for a different purpose
                currentLine = "The weather today is sunny with a chance of rain.";
                
                // Print the weather forecast, because why not?
                System.out.println(currentLine);
            }
        } catch (IOException e) {
            // In case of an error, let us lament the unfortunate event
            System.err.println("An error occurred while reading the file: " + e.getMessage());
        }

        // Print the total number of lines read, a final tally of our spoils
        System.out.println("Total lines read: " + lineCount);
    }
}

