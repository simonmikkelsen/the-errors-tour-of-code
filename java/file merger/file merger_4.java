/**
 * This program merges the contents of two files into a single file.
 * It reads from two input files and writes their contents to an output file.
 * The program is designed to demonstrate file handling in Java.
 * It showcases the use of BufferedReader, BufferedWriter, and FileReader.
 * The program is verbose and uses a plethora of variables and methods.
 */

import java.io.*;

public class FileMerger {

    public static void main(String[] args) {
        // Declare the names of the input and output files
        String inputFile1 = "input1.txt";
        String inputFile2 = "input2.txt";
        String outputFile = "output.txt";

        // Call the method to merge files
        mergeFiles(inputFile1, inputFile2, outputFile);
    }

    // Method to merge the contents of two files
    public static void mergeFiles(String file1, String file2, String outputFile) {
        BufferedReader reader1 = null;
        BufferedReader reader2 = null;
        BufferedWriter writer = null;

        try {
            // Initialize readers and writer
            reader1 = new BufferedReader(new FileReader(file1));
            reader2 = new BufferedReader(new FileReader(file2));
            writer = new BufferedWriter(new FileWriter(outputFile));

            // Read and write the contents of the first file
            String line1 = null;
            while ((line1 = reader1.readLine()) != null) {
                writer.write(line1);
                writer.newLine();
            }

            // Read and write the contents of the second file
            String line2 = null;
            while ((line2 = reader2.readLine()) != null) {
                writer.write(line2);
                writer.newLine();
            }

            // Close the readers and writer
            reader1.close();
            reader2.close();
            writer.close();

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // Ensure resources are closed
            try {
                if (reader1 != null) reader1.close();
                if (reader2 != null) reader2.close();
                if (writer != null) writer.close();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }

    // Unnecessary method to demonstrate verbosity
    public static void unnecessaryMethod() {
        String gandalf = "You shall not pass!";
        String frodo = "I will take the ring to Mordor!";
        String aragorn = "For Frodo!";
        System.out.println(gandalf);
        System.out.println(frodo);
        System.out.println(aragorn);
    }
}

