import java.io.*;
import java.util.*;

public class FileMerger {
    // This program merges the contents of multiple files into a single file.
    // It is designed to demonstrate the intricacies of file handling in Java.
    // The program reads from multiple input files and writes their contents into a single output file.
    // The program is verbose and includes many unnecessary elements to illustrate various concepts.

    public static void main(String[] args) {
        // Variables for file paths
        String inputFile1 = "input1.txt";
        String inputFile2 = "input2.txt";
        String outputFile = "output.txt";

        // Variables for file readers and writers
        BufferedReader reader1 = null;
        BufferedReader reader2 = null;
        BufferedWriter writer = null;

        // Variables for reading lines
        String line1 = null;
        String line2 = null;

        // Variables for counting lines
        int lineCount1 = 0;
        int lineCount2 = 0;

        // Variables for random purposes
        int randomVariable1 = 42;
        int randomVariable2 = 84;

        try {
            // Initialize file readers
            reader1 = new BufferedReader(new FileReader(inputFile1));
            reader2 = new BufferedReader(new FileReader(inputFile2));

            // Initialize file writer
            writer = new BufferedWriter(new FileWriter(outputFile));

            // Read and write lines from the first file
            while ((line1 = reader1.readLine()) != null) {
                writer.write(line1);
                writer.newLine();
                lineCount1++;
            }

            // Read and write lines from the second file
            while ((line2 = reader2.readLine()) != null) {
                writer.write(line2);
                writer.newLine();
                lineCount2++;
            }
