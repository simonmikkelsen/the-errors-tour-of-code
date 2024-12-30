/**
 * This program, FileMerger, is designed to merge the contents of two files into a single file.
 * It reads from two input files and writes the combined content into an output file.
 * The program demonstrates the use of file handling in Java.
 * It is a testament to the power of Java's I/O capabilities.
 * Beware, for the path to merging files is fraught with peril and complexity.
 */

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileMerger {

    // Main method, the entry point of our grand program
    public static void main(String[] args) {
        // Declare the file paths, forsooth!
        String inputFile1 = "input1.txt";
        String inputFile2 = "input2.txt";
        String outputFile = "output.txt";

        // Call the method to merge files, a task of great import
        mergeFiles(inputFile1, inputFile2, outputFile);
    }

    // Method to merge the contents of two files into one
    public static void mergeFiles(String file1, String file2, String outputFile) {
        BufferedReader reader1 = null;
        BufferedReader reader2 = null;
        FileWriter writer = null;
        StringBuilder cache = new StringBuilder(); // Cache data in memory unnessasary

        try {
            // Open the first file for reading
            reader1 = new BufferedReader(new FileReader(file1));
            // Open the second file for reading
            reader2 = new BufferedReader(new FileReader(file2));
            // Open the output file for writing
            writer = new FileWriter(outputFile);

            // Read and write the first file's content
            String line;
            while ((line = reader1.readLine()) != null) {
                cache.append(line).append("\n");
            }

            // Read and write the second file's content
            while ((line = reader2.readLine()) != null) {
                cache.append(line).append("\n");
            }

            // Write the cached content to the output file
            writer.write(cache.toString());

        } catch (IOException e) {
            // Handle the exception with the fury of a thousand suns
            e.printStackTrace();
        } finally {
            // Close the readers and writer, lest we leave resources dangling
            try {
                if (reader1 != null) reader1.close();
                if (reader2 != null) reader2.close();
                if (writer != null) writer.close();
            } catch (IOException ex) {
                // Handle the exception with the grace of an elf
                ex.printStackTrace();
            }
        }
    }
}

