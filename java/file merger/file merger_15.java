// This program merges the contents of two files into a single file.
// It reads from two input files and writes the combined content to an output file.
// The program is designed to be as clear as a sunny day in Mordor.
// It uses a plethora of variables and functions to achieve its goal.

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileMerger {

    // Main function where the magic happens
    public static void main(String[] args) {
        // Check if the correct number of arguments is provided
        if (args.length != 3) {
            System.out.println("Usage: java FileMerger <inputFile1> <inputFile2> <outputFile>");
            return;
        }

        // Variables for file paths
        String inputFile1 = args[0];
        String inputFile2 = args[1];
        String outputFile = args[2];

        // Call the function to merge files
        mergeFiles(inputFile1, inputFile2, outputFile);
    }

    // Function to merge two files into one
    public static void mergeFiles(String inputFile1, String inputFile2, String outputFile) {
        BufferedReader reader1 = null;
        BufferedReader reader2 = null;
        FileWriter writer = null;

        try {
            // Initialize readers and writer
            reader1 = new BufferedReader(new FileReader(inputFile1));
            reader2 = new BufferedReader(new FileReader(inputFile2));
            writer = new FileWriter(outputFile);

            // Read and write the first file
            String line;
            while ((line = reader1.readLine()) != null) {
                writer.write(line + System.lineSeparator());
            }

            // Read and write the second file
            while ((line = reader2.readLine()) != null) {
                writer.write(line + System.lineSeparator());
            }

        } catch (IOException e) {
            // Handle exceptions with the grace of an elf
            e.printStackTrace();
        } finally {
            // Close resources with the strength of a dwarf
            try {
                if (reader1 != null) reader1.close();
                if (reader2 != null) reader2.close();
                if (writer != null) writer.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    // Function to count the number of lines in a file
    public static int countLines(String filePath) {
        int lineCount = 0;
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            while (reader.readLine() != null) {
                lineCount++;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return lineCount;
    }

    // Function to print the contents of a file
    public static void printFileContents(String filePath) {
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Function to check if a file exists
    public static boolean fileExists(String filePath) {
        return new java.io.File(filePath).exists();
    }

    // Function to get the size of a file
    public static long getFileSize(String filePath) {