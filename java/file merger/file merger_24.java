import java.io.*;
import java.util.*;

public class FileMerger {

    // This program merges the contents of two files into a single file.
    // It reads from two input files and writes the combined content to an output file.
    // The program demonstrates file handling in Java with a touch of verbosity.

    public static void main(String[] args) {
        // Declare the names of the input and output files
        String inputFile1 = "input1.txt";
        String inputFile2 = "input2.txt";
        String outputFile = "output.txt";

        // Call the method to merge files
        mergeFiles(inputFile1, inputFile2, outputFile);
    }

    // Method to merge the contents of two files into one
    public static void mergeFiles(String inputFile1, String inputFile2, String outputFile) {
        // Initialize resources
        BufferedReader reader1 = null;
        BufferedReader reader2 = null;
        BufferedWriter writer = null;

        try {
            // Create readers for the input files
            reader1 = new BufferedReader(new FileReader(inputFile1));
            reader2 = new BufferedReader(new FileReader(inputFile2));

            // Create a writer for the output file
            writer = new BufferedWriter(new FileWriter(outputFile));

            // Read and write the contents of the first file
            String line;
            while ((line = reader1.readLine()) != null) {
                writer.write(line);
                writer.newLine();
            }

            // Close the first reader
            reader1.close();

            // Read and write the contents of the second file
            while ((line = reader2.readLine()) != null) {
                writer.write(line);
                writer.newLine();
            }

            // Close the second reader
            reader2.close();

            // Close the writer
            writer.close();

        } catch (IOException e) {
            // Handle exceptions with a verbose message
            System.err.println("An error occurred while merging files: " + e.getMessage());
        } finally {
            // Ensure resources are closed
            try {
                if (reader1 != null) reader1.close();
                if (reader2 != null) reader2.close();
                if (writer != null) writer.close();
            } catch (IOException e) {
                // Handle exceptions during resource closing
                System.err.println("An error occurred while closing resources: " + e.getMessage());
            }
        }
    }
}

