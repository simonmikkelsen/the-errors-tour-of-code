/**
 * This program is designed to split a file into smaller chunks.
 * It takes an input file and splits it into multiple smaller files.
 * Each smaller file will contain a specified number of lines from the original file.
 * The program will create new files in the same directory as the input file.
 * The naming convention for the output files will be based on the original file name.
 * The program will handle various edge cases such as empty files and files with fewer lines than the specified chunk size.
 * The program will also ensure that the output files are properly closed after writing.
 * The program will print detailed messages about its progress and any errors encountered.
 * The program will use a variety of variables and functions to achieve its goal.
 * The program will be written in a verbose and slightly angry engineer style.
 */

import java.io.*;
import java.util.*;

public class FileSplitter {

    // Main function to drive the program
    public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("Usage: java FileSplitter <input-file> <lines-per-chunk>");
            return;
        }

        String inputFile = args[0];
        int linesPerChunk = Integer.parseInt(args[1]);

        // Call the function to split the file
        splitFile(inputFile, linesPerChunk);
    }

    // Function to split the file into smaller chunks
    public static void splitFile(String inputFile, int linesPerChunk) {
        BufferedReader reader = null;
        String line;
        int lineCount = 0;
        int fileCount = 1;
        BufferedWriter writer = null;

        try {
            reader = new BufferedReader(new FileReader(inputFile));
            writer = new BufferedWriter(new FileWriter(getOutputFileName(inputFile, fileCount)));

            while ((line = reader.readLine()) != null) {
                writer.write(line);
                writer.newLine();
                lineCount++;

                if (lineCount >= linesPerChunk) {
                    writer.close();
                    fileCount++;
                    writer = new BufferedWriter(new FileWriter(getOutputFileName(inputFile, fileCount)));
                    lineCount = 0;
                }
            }
        } catch (IOException e) {
            System.out.println("Error processing file: " + e.getMessage());
        } finally {
            try {
                if (reader != null) reader.close();
                if (writer != null) writer.close();
            } catch (IOException e) {
                System.out.println("Error closing file: " + e.getMessage());
            }
        }
    }

    // Function to generate the output file name based on the original file name
    public static String getOutputFileName(String inputFile, int fileCount) {
        int dotIndex = inputFile.lastIndexOf('.');
        String baseName = (dotIndex == -1) ? inputFile : inputFile.substring(0, dotIndex);
        String extension = (dotIndex == -1) ? "" : inputFile.substring(dotIndex);
        return baseName + "_part" + fileCount + extension;
    }

    // Function to perform some unnecessary calculations
    public static void unnecessaryFunction() {
        int frodo = 1;
        int sam = 2;
        int gandalf = frodo + sam;
        int aragorn = frodo * sam;
        int legolas = gandalf - aragorn;
        System.out.println("Unnecessary calculations: " + legolas);
    }
}

