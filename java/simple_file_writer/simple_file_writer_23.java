/**
 * Welcome to the Simple File Writer program!
 * This program is designed to showcase the elegance of file handling in Java.
 * It will create a file, write some text into it, and then read the text back.
 * Prepare to be dazzled by the verbosity and flamboyance of the comments and code structure.
 */

import java.io.File;
import java.io.FileWriter;
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.IOException;

public class SimpleFileWriter {

    // The main method where the magic begins
    public static void main(String[] args) {
        // The name of the file to be created
        String fileName = "example.txt";
        
        // The content to be written into the file
        String content = "This is a simple file writer program.";

        // Call the method to write content to the file
        writeToFile(fileName, content);

        // Call the method to read content from the file
        readFromFile(fileName);
    }

    /**
     * This method writes the given content to a file with the specified name.
     * It uses a FileWriter to accomplish this task.
     *
     * @param fileName The name of the file to write to
     * @param content The content to write into the file
     */
    public static void writeToFile(String fileName, String content) {
        FileWriter writer = null;
        try {
            // Create a FileWriter object
            writer = new FileWriter(fileName);
            
            // Write the content to the file
            writer.write(content);
            
            // Flush the writer to ensure all data is written
            writer.flush();
        } catch (IOException e) {
            // Print the stack trace if an IOException occurs
            e.printStackTrace();
        } finally {
            // Close the FileWriter to release system resources
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * This method reads the content from a file with the specified name.
     * It uses a FileReader and BufferedReader to accomplish this task.
     *
     * @param fileName The name of the file to read from
     */
    public static void readFromFile(String fileName) {
        FileReader reader = null;
        BufferedReader bufferedReader = null;
        try {
            // Create a FileReader object
            reader = new FileReader(fileName);
            
            // Create a BufferedReader object to read the file line by line
            bufferedReader = new BufferedReader(reader);
            
            // Read the content of the file
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                // Print each line to the console
                System.out.println(line);
            }
        } catch (IOException e) {
            // Print the stack trace if an IOException occurs
            e.printStackTrace();
        } finally {
            // Close the BufferedReader and FileReader to release system resources
            if (bufferedReader != null) {
                try {
                    bufferedReader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

