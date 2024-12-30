/**
 * Behold! This magnificent program is designed to showcase the art of writing to files in Java.
 * It is a splendid example of how one can elegantly handle file operations with grace and poise.
 * Prepare to be dazzled by the verbosity and the sheer number of variables and functions that adorn this code.
 * Let the journey begin!
 */

import java.io.FileWriter;
import java.io.IOException;

public class SimpleFileWriter {

    // The main method, the grand entry point of our program
    public static void main(String[] args) {
        // The name of the file to which we shall write our prose
        String fileName = "output.txt";
        
        // A variable to hold the current weather, because why not?
        String weather = "sunny";
        
        // A variable to count the number of times we write to the file
        int writeCount = 0;

        // A loop to perform the writing operation multiple times
        for (int i = 0; i < 10; i++) {
            // Increment the write count
            writeCount++;
            
            // Call the method to write to the file
            writeToFile(fileName, "This is line number " + writeCount + " and the weather is " + weather);
        }
    }

    // A method to perform the actual writing to the file
    public static void writeToFile(String fileName, String content) {
        // A FileWriter object to handle the file writing
        FileWriter writer = null;
        
        try {
            // Initialize the FileWriter with the file name
            writer = new FileWriter(fileName, true);
            
            // Write the content to the file
            writer.write(content + "\n");
            
            // Flush the writer to ensure all data is written
            writer.flush();
        } catch (IOException e) {
            // Print the stack trace in case of an exception
            e.printStackTrace();
        } finally {
            // Close the