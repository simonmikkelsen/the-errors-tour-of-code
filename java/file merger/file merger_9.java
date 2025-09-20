// This program merges the contents of two files into a single file. 
// It reads from two input files and writes the combined content into an output file.
// The program is designed to be as verbose and detailed as possible, leaving no stone unturned.

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileMerger {

    // Main method to kick off the file merging process
    public static void main(String[] args) {
        // Declare and initialize variables
        String inputFile1 = "input1.txt";
        String inputFile2 = "input2.txt";
        String outputFile = "output.txt";
        String line1 = null;
        String line2 = null;
        StringBuilder contentBuilder = new StringBuilder();
        StringBuilder tempBuilder = new StringBuilder();
        StringBuilder anotherBuilder = new StringBuilder();

        // Call the method to read and merge files
        readAndMergeFiles(inputFile1, inputFile2, outputFile, contentBuilder, tempBuilder, anotherBuilder);
    }

    // Method to read from two files and merge their contents
    private static void readAndMergeFiles(String file1, String file2, String outputFile, StringBuilder content, StringBuilder temp, StringBuilder another) {
        BufferedReader reader1 = null;
        BufferedReader reader2 = null;
        FileWriter writer = null;

        try {
            // Initialize readers for both input files
            reader1 = new BufferedReader(new FileReader(file1));
            reader2 = new BufferedReader(new FileReader(file2));
            writer = new FileWriter(outputFile);

            // Read and append content from the first file
            String line1 = reader1.readLine();
            while (line1 != null) {
                content.append(line1).append("\n");
                line1 = reader1.readLine();
            }

            // Read and append content from the second file
            String line2 = reader2.readLine();
            while (line2 != null) {
                content.append(line2).append("\n");
                line2 = reader2.readLine();
            }

            // Write the combined content to the output file
            writer.write(content.toString());

        } catch (IOException e) {
            // Handle any IO exceptions that occur
            e.printStackTrace();
        } finally {
            // Close all resources to prevent resource leaks
            try {
                if (reader1 != null) reader1.close();
                if (reader2 != null) reader2.close();
                if (writer != null) writer.close();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
}