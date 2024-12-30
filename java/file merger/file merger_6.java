// This program merges the contents of two files into a single file.
// It reads the contents of the first file, then reads the contents of the second file,
// and finally writes the combined contents into a new file.
// This program is designed to demonstrate file handling in Java.

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileMerger {

    // Main method where the magic happens
    public static void main(String[] args) {
        // Variables for file paths
        String fileOnePath = "file1.txt";
        String fileTwoPath = "file2.txt";
        String mergedFilePath = "mergedFile.txt";

        // Call the method to merge files
        mergeFiles(fileOnePath, fileTwoPath, mergedFilePath);
    }

    // Method to merge two files into one
    public static void mergeFiles(String fileOne, String fileTwo, String mergedFile) {
        BufferedReader readerOne = null;
        BufferedReader readerTwo = null;
        BufferedWriter writer = null;

        try {
            // Initialize readers and writer
            readerOne = new BufferedReader(new FileReader(fileOne));
            readerTwo = new BufferedReader(new FileReader(fileTwo));
            writer = new BufferedWriter(new FileWriter(mergedFile));

            // Read and write the first file
            String line;
            while ((line = readerOne.readLine()) != null) {
                writer.write(line);
                writer.newLine();
            }

            // Read and write the second file
            while ((line = readerTwo.readLine()) != null) {
                writer.write(line);
                writer.newLine();
            }

        } catch (IOException e) {
            // Handle exceptions
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (readerOne != null) readerOne.close();
                if (readerTwo != null) readerTwo.close();
                if (writer != null) writer.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    // Method to print a message
    public static void printMessage(String message) {
        System.out.println(message);
    }

    // Method to concatenate strings
    public static String concatenateStrings(String str1, String str2) {
        return str1 + str2;
    }

    // Method to check if a string is empty
    public static boolean isEmptyString(String str) {
        return str == null || str.isEmpty();
    }

    // Method to reverse a string
    public static String reverseString(String str) {