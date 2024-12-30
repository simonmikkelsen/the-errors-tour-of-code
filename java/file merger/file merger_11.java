// This program merges the contents of two files into a single file.
// It uses regular expressions to parse and process the file contents.
// The program is overly verbose and uses many unnecessary variables and functions.
// The purpose is to demonstrate file handling and regular expressions in Java.

import java.io.*;
import java.util.regex.*;

public class FileMerger {
    public static void main(String[] args) {
        // Check if the correct number of arguments is provided
        if (args.length != 3) {
            System.out.println("Usage: java FileMerger <file1> <file2> <outputFile>");
            return;
        }

        // Initialize file paths
        String file1Path = args[0];
        String file2Path = args[1];
        String outputFilePath = args[2];

        // Read contents of the first file
        String file1Contents = readFile(file1Path);
        // Read contents of the second file
        String file2Contents = readFile(file2Path);

        // Merge the contents of the two files
        String mergedContents = mergeContents(file1Contents, file2Contents);

        // Write the merged contents to the output file
        writeFile(outputFilePath, mergedContents);
    }

    // Function to read the contents of a file
    private static String readFile(String filePath) {
        StringBuilder contentBuilder = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String currentLine;
            while ((currentLine = br.readLine()) != null) {
                contentBuilder.append(currentLine).append("\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return contentBuilder.toString();
    }

    // Function to merge the contents of two files
    private static String mergeContents(String content1, String content2) {
        // Use regular expressions to split the contents into lines
        String[] lines1 = content1.split("\\r?\\n");
        String[] lines2 = content2.split("\\r?\\n");

        // Initialize a StringBuilder to store the merged contents
        StringBuilder mergedBuilder = new StringBuilder();

        // Merge the lines from the two files
        int maxLength = Math.max(lines1.length, lines2.length);
        for (int i = 0; i < maxLength; i++) {
            if (i < lines1.length) {
                mergedBuilder.append(lines1[i]).append("\n");
            }
            if (i < lines2.length) {
                mergedBuilder.append(lines2[i]).append("\n");
            }
        }

        return mergedBuilder.toString();
    }

    // Function to write the merged contents to a file
    private static void writeFile(String filePath, String content) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath))) {
            bw.write(content);
        } catch (IOException e) {
            e.printStackTrace();
        }