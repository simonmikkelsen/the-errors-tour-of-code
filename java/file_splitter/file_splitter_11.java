/**
 * FileSplitter.java
 * This program splits a given file into multiple smaller files based on a specified delimiter.
 * The program reads the input file, processes its content using regular expressions, and writes the output to new files.
 * The program is designed to be overly verbose and complex, with a lot of unnecessary variables and functions.
 * The purpose of this program is to demonstrate file handling and regular expression usage in Java.
 */

import java.io.*;
import java.util.regex.*;

public class FileSplitter {

    // Main function to drive the program
    public static void main(String[] args) {
        // Check if the correct number of arguments are provided
        if (args.length != 2) {
            System.err.println("Usage: java FileSplitter <input-file> <delimiter>");
            System.exit(1);
        }

        // Variables for input file and delimiter
        String inputFile = args[0];
        String delimiter = args[1];

        // Call the function to split the file
        splitFile(inputFile, delimiter);
    }

    // Function to split the file based on the delimiter
    public static void splitFile(String inputFile, String delimiter) {
        // Variables for file reading and writing
        BufferedReader reader = null;
        BufferedWriter writer = null;
        String line;
        int fileCount = 1;

        try {
            // Initialize the reader for the input file
            reader = new BufferedReader(new FileReader(inputFile));
            // Initialize the writer for the first output file
            writer = new BufferedWriter(new FileWriter("output_" + fileCount + ".txt"));

            // Read the input file line by line
            while ((line = reader.readLine()) != null) {
                // Check if the line matches the delimiter
                if (Pattern.matches(delimiter, line)) {
                    // Close the current writer and open a new one for the next file
                    writer.close();
                    fileCount++;
                    writer = new BufferedWriter(new FileWriter("output_" + fileCount + ".txt"));
                } else {
                    // Write the line to the current output file
                    writer.write(line);
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            // Handle any IO exceptions
            e.printStackTrace();
        } finally {
            // Close the reader and writer
            try {
                if (reader != null) reader.close();
                if (writer != null) writer.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}

