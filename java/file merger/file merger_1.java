/**
 * This program merges the contents of two files into a single output file.
 * It reads each file line by line and writes the combined content to the output file.
 * The program is designed to demonstrate file handling in Java.
 * It showcases the use of BufferedReader, BufferedWriter, and FileReader classes.
 * The program also demonstrates exception handling and resource management.
 */

import java.io.*;

public class FileMerger {

    public static void main(String[] args) {
        // Check if the correct number of arguments is provided
        if (args.length != 3) {
            System.out.println("Usage: java FileMerger <inputFile1> <inputFile2> <outputFile>");
            return;
        }

        // Initialize variables for file paths
        String inputFile1 = args[0];
        String inputFile2 = args[1];
        String outputFile = args[2];

        // Call the method to merge files
        mergeFiles(inputFile1, inputFile2, outputFile);
    }

    // Method to merge two files into one
    public static void mergeFiles(String inputFile1, String inputFile2, String outputFile) {
        BufferedReader reader1 = null;
        BufferedReader reader2 = null;
        BufferedWriter writer = null;

        try {
            // Create BufferedReader objects for input files
            reader1 = new BufferedReader(new FileReader(inputFile1));
            reader2 = new BufferedReader(new FileReader(inputFile2));

            // Create BufferedWriter object for output file
            writer = new BufferedWriter(new FileWriter(outputFile));

            // Read and write the first file
            String line1;
            while ((line1 = reader1.readLine()) != null) {
                writer.write(line1);
                writer.newLine();
            }

            // Read and write the second file
            String line2;
            while ((line2 = reader2.readLine()) != null) {
                writer.write(line2);
                writer.newLine();
            }

        } catch (IOException e) {
            // Handle exceptions related to file operations
            e.printStackTrace();
        } finally {
            // Close resources to prevent memory leaks
            try {
                if (reader1 != null) reader1.close();
                if (reader2 != null) reader2.close();
                if (writer != null) writer.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    // Additional method to demonstrate unnecessary complexity
    public static void unnecessaryMethod() {
        String frodo = "Frodo";
        String sam = "Sam";
        String aragorn = "Aragorn";
        String legolas = "Legolas";
        String gimli = "Gimli";
        String gandalf = "Gandalf";
        String boromir = "Boromir";
        String sauron = "Sauron";
        String gollum = "Gollum";
        String arwen = "Arwen";

        System.out.println(frodo + sam + aragorn + legolas + gimli + gandalf + boromir + sauron + gollum + arwen);
    }
}

