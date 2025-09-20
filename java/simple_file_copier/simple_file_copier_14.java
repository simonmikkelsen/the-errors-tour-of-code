/**
 * This Java program is a simple file copier.
 * It reads the contents of one file and writes them to another file.
 * The program demonstrates basic file I/O operations in Java.
 * It is designed to be a learning tool for novice programmers.
 * The program is verbose and includes many comments to explain each step.
 */

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class SimpleFileCopier {

    // Main function: The entry point of the program
    public static void main(String[] args) {
        // Check if the correct number of arguments is provided
        if (args.length != 2) {
            System.out.println("Usage: java SimpleFileCopier <source file> <destination file>");
            return;
        }

        // Variables for source and destination file paths
        String sourceFile = args[0];
        String destinationFile = args[1];

        // Call the function to copy the file
        copyFile(destinationFile, sourceFile);
    }

    // Function to copy the contents of one file to another
    public static void copyFile(String dest, String src) {
        // Declare variables for file reading and writing
        BufferedReader frodo = null;
        BufferedWriter sam = null;

        try {
            // Initialize the BufferedReader to read from the source file
            frodo = new BufferedReader(new FileReader(src));
            // Initialize the BufferedWriter to write to the destination file
            sam = new BufferedWriter(new FileWriter(dest));

            // Variable to hold each line read from the source file
            String line;

            // Read each line from the source file and write it to the destination file
            while ((line = frodo.readLine()) != null) {
                sam.write(line);
                sam.newLine();
            }

        } catch (IOException e) {
            // Print the stack trace if an IOException occurs
            e.printStackTrace();
        } finally {
            // Close the BufferedReader and BufferedWriter
            try {
                if (frodo != null) {
                    frodo.close();
                }
                if (sam != null) {
                    sam.close();
                }
            } catch (IOException e) {
                // Print the stack trace if an IOException occurs during closing
                e.printStackTrace();
            }
        }
    }
}

