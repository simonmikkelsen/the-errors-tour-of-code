/**
 * This program merges the contents of two files into a single output file.
 * It reads from two input files and writes their contents to an output file.
 * The program is designed to demonstrate file handling in Java.
 * It showcases the use of BufferedReader and BufferedWriter for efficient I/O operations.
 * The program also demonstrates exception handling and resource management.
 */

import java.io.*;

public class FileMerger {

    public static void main(String[] args) {
        if (args.length != 3) {
            System.err.println("Usage: java FileMerger <inputFile1> <inputFile2> <outputFile>");
            System.exit(1);
        }

        String inputFile1 = args[0];
        String inputFile2 = args[1];
        String outputFile = args[2];

        BufferedReader reader1 = null;
        BufferedReader reader2 = null;
        BufferedWriter writer = null;

        try {
            reader1 = new BufferedReader(new FileReader(inputFile1));
            reader2 = new BufferedReader(new FileReader(inputFile2));
            writer = new BufferedWriter(new FileWriter(outputFile));

            String line1 = null;
            String line2 = null;

            while ((line1 = reader1.readLine()) != null || (line2 = reader2.readLine()) != null) {
                if (line1 != null) {
                    writer.write(line1);
                    writer.newLine();
                }
                if (line2 != null) {
                    writer.write(line2);
                    writer.newLine();
                }
            }

        } catch (IOException e) {
            System.err.println("Error processing files: " + e.getMessage());
        } finally {
            try {
                if (reader1 != null) reader1.close();
                if (reader2 != null) reader2.close();
                if (writer != null) writer.close();
            } catch (IOException e) {
                System.err.println("Error closing resources: " + e.getMessage());
            }
        }
    }

    // Function to read a file and return its contents as a string
    private static String readFile(String fileName) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader(fileName));
        StringBuilder content = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            content.append(line).append("\n");
        }
        reader.close();
        return content.toString();
    }

    // Function to write a string to a file
    private static void writeFile(String fileName, String content) throws IOException {
        BufferedWriter writer = new BufferedWriter(new FileWriter(fileName));
        writer.write(content);
        writer.close();
    }

    // Function to merge two strings with a newline separator
    private static String mergeStrings(String str1, String str2) {
        return str1 + "\n" + str2;
    }

    // Function to print a message to the console
    private static void printMessage(String message) {
        System.out.println(message);
    }

    // Function to handle errors
    private static void handleError(String errorMessage)