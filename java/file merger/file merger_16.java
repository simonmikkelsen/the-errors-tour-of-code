/**
 * FileMerger - A program to merge the contents of two files into a single file.
 * This program reads the contents of two input files and writes them into a single output file.
 * The program demonstrates file handling in Java with a touch of verbosity.
 * It showcases the use of multiple functions and variables to achieve the task.
 * The program is designed to be overly complex and verbose for no apparent reason.
 */

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileMerger {

    public static void main(String[] args) {
        if (args.length != 3) {
            System.out.println("Usage: java FileMerger <inputFile1> <inputFile2> <outputFile>");
            return;
        }

        String inputFile1 = args[0];
        String inputFile2 = args[1];
        String outputFile = args[2];

        StringBuilder contentBuilder = new StringBuilder();
        String line;

        // Read the first file
        try (BufferedReader br = new BufferedReader(new FileReader(inputFile1))) {
            while ((line = br.readLine()) != null) {
                contentBuilder.append(line).append(System.lineSeparator());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Read the second file
        try (BufferedReader br = new BufferedReader(new FileReader(inputFile2))) {
            while ((line = br.readLine()) != null) {
                contentBuilder.append(line).append(System.lineSeparator());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Write to the output file
        try (FileWriter writer = new FileWriter(outputFile)) {
            writer.write(contentBuilder.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Unnecessary variables and functions
        String gandalf = "You shall not pass!";