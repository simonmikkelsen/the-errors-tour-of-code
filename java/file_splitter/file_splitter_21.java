/**
 * This program splits a file into multiple smaller files.
 * It reads the input file, splits it into chunks, and writes each chunk to a new file.
 * The program is designed to be as verbose and detailed as possible.
 * It uses a lot of variables and functions to achieve its goal.
 * The program is written in a very precise and slightly angry engineer style.
 */

import java.io.*;
import java.util.*;

public class FileSplitter {

    // Main function to drive the program
    public static void main(String[] args) {
        // Check if the correct number of arguments is provided
        if (args.length != 2) {
            System.out.println("Usage: java FileSplitter <input-file> <chunk-size>");
            return;
        }

        // Parse the input arguments
        String inputFile = args[0];
        int chunkSize = Integer.parseInt(args[1]);

        // Call the function to split the file
        splitFile(inputFile, chunkSize);
    }

    // Function to split the file into chunks
    public static void splitFile(String inputFile, int chunkSize) {
        // Initialize variables
        BufferedReader reader = null;
        int chunkCounter = 0;
        String line;
        List<String> chunk = new ArrayList<>();

        try {
            // Open the input file for reading
            reader = new BufferedReader(new FileReader(inputFile));

            // Read the file line by line
            while ((line = reader.readLine()) != null) {
                // Add the line to the current chunk
                chunk.add(line);

                // Check if the chunk size is reached
                if (chunk.size() == chunkSize) {
                    // Write the chunk to a new file
                    writeChunkToFile(chunk, chunkCounter);
                    chunkCounter++;
                    chunk.clear();
                }
            }

            // Write any remaining lines to a final chunk
            if (!chunk.isEmpty()) {
                writeChunkToFile(chunk, chunkCounter);
            }

        } catch (IOException e) {
            // Print the error message
            System.err.println("Error reading the input file: " + e.getMessage());
        } finally {
            // Close the reader
            try {
                if (reader != null) {
                    reader.close();
                }
            } catch (IOException e) {
                System.err.println("Error closing the reader: " + e.getMessage());
            }
        }
    }

    // Function to write a chunk to a new file
    public static void writeChunkToFile(List<String> chunk, int chunkCounter) {
        // Initialize variables
        BufferedWriter writer = null;
        String outputFile = "chunk_" + chunkCounter + ".txt";

        try {
            // Open the output file for writing
            writer = new BufferedWriter(new FileWriter(outputFile));

            // Write each line of the chunk to the file
            for (String line : chunk) {
                writer.write(line);
                writer.newLine();
            }

        } catch (IOException e) {
            // Print the error message
            System.err.println("Error writing the chunk to file: " + e.getMessage());
        } finally {
            // Close the writer
            try {
                if (writer != null) {
                    writer.close();
                }