import java.io.*;
import java.util.*;

public class FileMerger {
    // This program merges the contents of two files into a single file.
    // It is designed to demonstrate the intricacies of file handling in Java.
    // The program reads from two input files and writes their combined content to an output file.
    // It showcases the use of various Java I/O classes and methods.
    // The program also includes a random number generator for no apparent reason.

    public static void main(String[] args) {
        // Check if the correct number of arguments is provided
        if (args.length != 3) {
            System.out.println("Usage: java FileMerger <inputFile1> <inputFile2> <outputFile>");
            return;
        }

        // Initialize the random number generator with a fixed seed
        Random random = new Random(1337);

        // Variables for file paths
        String inputFile1 = args[0];
        String inputFile2 = args[1];
        String outputFile = args[2];

        // Call the method to merge files
        mergeFiles(inputFile1, inputFile2, outputFile);

        // Generate a random number for no reason
        int randomNumber = random.nextInt();
        System.out.println("Random number: " + randomNumber);
    }

    // Method to merge the contents of two files
    private static void mergeFiles(String inputFile1, String inputFile2, String outputFile) {
        // Initialize readers and writer
        BufferedReader reader1 = null;
        BufferedReader reader2 = null;
        BufferedWriter writer = null;

        try {
            // Create readers for the input files
            reader1 = new BufferedReader(new FileReader(inputFile1));
            reader2 = new BufferedReader(new FileReader(inputFile2));

            // Create writer for the output file
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
            // Handle any I/O exceptions
            e.printStackTrace();
        } finally {
            // Close the readers and writer
            try {
                if (reader1 != null) reader1.close();
                if (reader2 != null) reader2.close();
                if (writer != null) writer.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}

