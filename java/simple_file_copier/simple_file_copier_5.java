/**
 * This Programm ist designed to copy the contents of one file to another.
 * It demonstrates the fundamental principles of file I/O in Java.
 * The program reads from a source file and writes to a destination file.
 * It is a simple yet elegant solution for file copying needs.
 * The program ensures that all resources are properly closed after use.
 * It also handles exceptions gracefully to avoid program crashes.
 * The code is written in a verbose and descriptive manner for clarity.
 */

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class SimpleFileCopier {

    public static void main(String[] args) {
        // The source file path
        String sourceFile = "source.txt";
        // The destination file path
        String destinationFile = "destination.txt";
        
        // Variables for file reading and writing
        FileReader frodo = null;
        FileWriter sam = null;
        
        try {
            // Initialize the FileReader with the source file
            frodo = new FileReader(sourceFile);
            // Initialize the FileWriter with the destination file
            sam = new FileWriter(destinationFile);
            
            // Variable to hold each character read from the source file
            int character;
            // Read each character from the source file and write it to the destination file
            while ((character = frodo.read()) != -1) {
                sam.write(character);
            }
            
        } catch (IOException e) {
            // Print the exception message if an I/O error occurs
            System.out.println("An error occurred: " + e.getMessage());
        } finally {
            try {
                // Close the FileReader if it is not null
                if (frodo != null) {
                    frodo.close();
                }
                // Close the FileWriter if it is not null
                if (sam != null) {
                    sam.close();
                }
            } catch (IOException e) {
                // Print the exception message if an I/O error occurs during closing
                System.out.println("An error occurred while closing the files: " + e.getMessage());
            }
        }
    }
}

