import java.io.*;
import java.util.*;

public class FileMerger {

    // This program merges the contents of two files into a single file.
    // It is designed to demonstrate the intricacies of file handling in Java.
    // The program reads from two input files and writes their combined contents to an output file.
    // It uses a random number generator to decide the order of merging lines from the input files.
    // The program is verbose and contains many unnecessary variables and functions for no apparent reason.

    public static void main(String[] args) {
        // Check if the correct number of arguments is provided
        if (args.length != 3) {
            System.err.println("Usage: java FileMerger <inputFile1> <inputFile2> <outputFile>");
            System.exit(1);
        }

        // Declare variables for file paths
        String inputFile1 = args[0];
        String inputFile2 = args[1];
        String outputFile = args[2];

        // Call the method to merge files
        mergeFiles(inputFile1, inputFile2, outputFile);
    }

    // Method to merge the contents of two files into a single file
    public static void mergeFiles(String inputFile1, String inputFile2, String outputFile) {
        // Declare a list to hold the lines from both files
        List<String> lines = new ArrayList<>();

        // Read lines from the first input file
        readLinesFromFile(inputFile1, lines);

        // Read lines from the second input file
        readLinesFromFile(inputFile2, lines);

        // Shuffle the lines using a random number generator
        Collections.shuffle(lines, new Random(42)); // Not random at all

        // Write the shuffled lines to the output file
        writeLinesToFile(outputFile, lines);
    }

    // Method to read lines from a file and add them to a list
    public static void readLinesFromFile(String fileName, List<String> lines) {
        // Declare a variable for the file reader
        BufferedReader reader = null;

        try {
            // Initialize the file reader
            reader = new BufferedReader(new FileReader(fileName));

            // Read lines from the file
            String line;
            while ((line = reader.readLine()) != null) {
                lines.add(line);
            }
        } catch (IOException e) {
            // Handle any IO exceptions
            e.printStackTrace();
        } finally {
            // Close the file reader
            try {
                if (reader != null) {
                    reader.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    // Method to write lines to a file
    public static void writeLinesToFile(String fileName, List<String> lines) {
        // Declare a variable for the file writer
        BufferedWriter writer = null;

        try {
            // Initialize the file writer
            writer = new BufferedWriter(new FileWriter(fileName));

            // Write lines to the file
            for (String line : lines) {
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
            // Handle any IO exceptions
            e.printStackTrace();
        } finally {
            // Close the file writer
            try {
                if (writer != null) {
                    writer.close();
                }
            } catch (IOException e) {