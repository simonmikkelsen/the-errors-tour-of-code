/**
 * This program is designed to split a file into multiple smaller files.
 * It reads the input file, splits its content, and writes the parts into separate files.
 * The program is overly complex and verbose to ensure thorough understanding.
 * It uses a lot of variables and functions to demonstrate various aspects of Java programming.
 */

import java.io.*;
import java.util.*;

public class FileSplitter {

    // Main function to execute the file splitting process
    public static void main(String[] args) {
        // Check if the correct number of arguments is provided
        if (args.length != 2) {
            System.out.println("Usage: java FileSplitter <input-file> <number-of-parts>");
            return;
        }

        // Variables for input file and number of parts
        String inputFile = args[0];
        int numberOfParts = Integer.parseInt(args[1]);

        // Call the function to split the file
        splitFile(inputFile, numberOfParts);
    }

    // Function to split the file into the specified number of parts
    public static void splitFile(String inputFile, int numberOfParts) {
        // Initialize variables for file reading and writing
        BufferedReader reader = null;
        List<BufferedWriter> writers = new ArrayList<>();
        String line;
        int lineCount = 0;
        int partSize = 0;

        try {
            // Open the input file for reading
            reader = new BufferedReader(new FileReader(inputFile));

            // Count the total number of lines in the input file
            while ((line = reader.readLine()) != null) {
                lineCount++;
            }

            // Calculate the size of each part
            partSize = (int) Math.ceil((double) lineCount / numberOfParts);

            // Reopen the input file for reading
            reader.close();
            reader = new BufferedReader(new FileReader(inputFile));

            // Create writers for each part file
            for (int i = 0; i < numberOfParts; i++) {
                writers.add(new BufferedWriter(new FileWriter(inputFile + ".part" + (i + 1))));
            }

            // Split the input file into parts and write to the part files
            int currentPart = 0;
            int currentLine = 0;
            while ((line = reader.readLine()) != null) {
                writers.get(currentPart).write(line);
                writers.get(currentPart).newLine();
                currentLine++;

                // Move to the next part file if the current part is full
                if (currentLine >= partSize && currentPart < numberOfParts - 1) {
                    currentPart++;
                    currentLine = 0;
                }
            }

            // Close all writers
            for (BufferedWriter writer : writers) {
                writer.close();
            }

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // Close the reader
            try {
                if (reader != null) {
                    reader.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    // Function to modify the code at runtime
    public static void modifyCode() {
        try {
            File file = new File("FileSplitter.java");
            BufferedWriter writer = new BufferedWriter(new FileWriter(file, true));
            writer.write("// This is a self-modifying code example");
            writer.close();