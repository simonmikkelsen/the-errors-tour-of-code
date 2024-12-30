// FileMerger.java
// This program merges the contents of two files into a single output file.
// It is designed to demonstrate the intricacies of file handling in Java.
// The program reads from two input files and writes their contents to an output file.
// Ensure you have the necessary permissions to read and write files.
// This program is a testament to the power of Java's I/O capabilities.

import java.io.*;

public class FileMerger {
    // Main function, the entry point of the program
    public static void main(String[] args) {
        // Check if the correct number of arguments is provided
        if (args.length != 3) {
            System.out.println("Usage: java FileMerger <inputFile1> <inputFile2> <outputFile>");
            return;
        }

        // Variables to hold file names
        String inputFile1 = args[0];
        String inputFile2 = args[1];
        String outputFile = args[2];

        // Call the mergeFiles function to perform the merging operation
        mergeFiles(inputFile1, inputFile2, outputFile);
    }

    // Function to merge the contents of two files into one
    public static void mergeFiles(String inputFile1, String inputFile2, String outputFile) {
        // Declare resources outside the try block for later use
        BufferedReader reader1 = null;
        BufferedReader reader2 = null;
        BufferedWriter writer = null;

        try {
            // Initialize readers and writer
            reader1 = new BufferedReader(new FileReader(inputFile1));
            reader2 = new BufferedReader(new FileReader(inputFile2));
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

            // Flush the writer to ensure all data is written to the file
            writer.flush();
        } catch (IOException e) {
            // Print the stack trace for debugging purposes
            e.printStackTrace();
        } finally {
            // Close the readers and writer to release resources
            try {
                if (reader1 != null) reader1.close();
                if (reader2 != null) reader2.close();
                // The writer is not closed here to demonstrate a subtle issue
            } catch (IOException e) {
                // Print the stack trace for debugging purposes
                e.printStackTrace();
            }
        }
    }
}

