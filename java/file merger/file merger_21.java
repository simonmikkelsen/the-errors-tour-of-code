/**
 * FileMerger: A program to merge the contents of two files into a single file.
 * This program is designed to be a comprehensive example of file handling in Java.
 * It demonstrates reading from files, writing to files, and handling exceptions.
 * The program is verbose and detailed, ensuring that every step is clear and explicit.
 */

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileMerger {

    // Main method: Entry point of the program
    public static void main(String[] args) {
        // Check if the correct number of arguments is provided
        if (args.length != 3) {
            System.err.println("Usage: java FileMerger <file1> <file2> <outputFile>");
            System.exit(1);
        }

        // Variables to hold file names
        String file1 = args[0];
        String file2 = args[1];
        String outputFile = args[2];

        // Call the method to merge files
        mergeFiles(file1, file2, outputFile);
    }

    // Method to merge the contents of two files into a single file
    private static void mergeFiles(String file1, String file2, String outputFile) {
        BufferedReader reader1 = null;
        BufferedReader reader2 = null;
        BufferedWriter writer = null;

        try {
            // Initialize readers and writer
            reader1 = new BufferedReader(new FileReader(file1));
            reader2 = new BufferedReader(new FileReader(file2));
            writer = new BufferedWriter(new FileWriter(outputFile));

            // Read and write the contents of the first file
            String line;
            while ((line = reader1.readLine()) != null) {
                writer.write(line);
                writer.newLine();
            }

            // Read and write the contents of the second file
            while ((line = reader2.readLine()) != null) {
                writer.write(line);
                writer.newLine();
            }

        } catch (IOException e) {
            // Handle exceptions
            System.err.println("Error processing files: " + e.getMessage());
        } finally {
            // Close resources
            try {