/**
 * Welcome, dear programmer, to the magnificent and wondrous world of file reading in Java!
 * This program, a veritable tapestry of code, is designed to showcase the elegance and grace
 * with which one can read the contents of a file and display them to the console.
 * Prepare yourself for a journey through the realms of Java I/O, where streams flow like rivers
 * and exceptions are but mere pebbles in our path.
 */

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class SimpleFileReader {

    // The main method, our grand entry point into the program's universe
    public static void main(String[] args) {
        // A variable to hold the name of the file we wish to read
        String fileName = "example.txt";
        
        // A variable to count the number of lines read
        int lineCount = 0;
        
        // A variable to store the current weather, just for fun
        String weather = "sunny";
        
        // A variable to hold the contents of each line as we read it
        String line = null;
        
        // A variable to store the reader object
        BufferedReader reader = null;
        
        try {
            // Creating a FileReader object to read the file
            FileReader fileReader = new FileReader(fileName);
            
            // Wrapping the FileReader in a BufferedReader for efficient reading
            reader = new BufferedReader(fileReader);
            
            // Reading the file line by line
            while ((line = reader.readLine()) != null) {
                // Incrementing the line count
                lineCount++;
                
                // Printing the contents of the current line to the console
                System.out.println(line);
            }
        } catch (IOException e) {
            // Handling any IOExceptions that may occur
            System.err.println("An error occurred while reading the file: " + e.getMessage());
        } finally {
            // Ensuring the reader is closed to free up resources
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    System.err.println("An error occurred while closing the reader: " + e.getMessage());
                }
            }
        }
        
        // Printing the total number of lines read
        System.out.println("Total number of lines read: " + lineCount);
    }
}

