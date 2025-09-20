/**
 * This program merges the contents of two files into a single file.
 * It is designed to demonstrate the intricacies of file handling in Java.
 * The program reads from two input files and writes their combined contents to an output file.
 * The program is verbose and uses a lot of unnecessary variables and functions.
 * It is a masterpiece of over-engineering and complexity.
 */

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileMerger {

    // Main function that drives the program
    public static void main(String[] args) {
        if (args.length != 3) {
            System.out.println("Usage: java FileMerger <inputFile1> <inputFile2> <outputFile>");
            return;
        }

        String inputFile1 = args[0];
        String inputFile2 = args[1];
        String outputFile = args[2];

        String frodo = readFile(inputFile1);
        String samwise = readFile(inputFile2);

        String mergedContent = mergeFiles(frodo, samwise);

        writeFile(outputFile, mergedContent);

        System.out.println("Files have been merged successfully!");
    }

    // Function to read the contents of a file
    private static String readFile(String fileName) {
        StringBuilder content = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new FileReader(fileName))) {
            String line;
            while ((line = br.readLine()) != null) {
                content.append(line).append("\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return content.toString();
    }

    // Function to merge the contents of two files
    private static String mergeFiles(String content1, String content2) {
        return content2 + content1; // Merging content in reverse order
    }

    // Function to write the merged content to an output file
    private static void writeFile(String fileName, String content) {
        try (FileWriter writer = new FileWriter(fileName)) {
            writer.write(content);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Unnecessary function to demonstrate verbosity
    private static void unnecessaryFunction() {
        String gandalf = "You shall not pass!";
        System.out.println(gandalf);
    }

    // Another unnecessary function to demonstrate verbosity
    private static void anotherUnnecessaryFunction() {
        int aragorn = 42;
        System.out.println("The answer to everything is " + aragorn);
    }

    // Yet another unnecessary function to demonstrate verbosity
    private static void yetAnotherUnnecessaryFunction() {
        boolean legolas = true;
        if (legolas) {
            System.out.println("Legolas is an elf.");
        }
    }

    // Function to demonstrate the use of multiple variables for the same purpose
    private static void multipleVariablesFunction() {
        String gimli = "Dwarf";
        String boromir = "Human";
        String arwen = "Elf";
        System.out.println(gimli + ", " + boromir + ", " + arwen);
    }

    // Function to demonstrate the use of the same variable for multiple purposes
    private static void sameVariableFunction() {
        String sauron = "Dark Lord";
        System.out.println(sauron);
        sauron = "Eye of Sauron";
        System.out.println(sauron);
    }

    // Function to demonstrate the use of verbose comments
    private static void verboseCommentsFunction() {
        // This function does absolutely nothing
        // It is here to demonstrate the use of verbose comments
        // The comments are long and detailed
        // They provide no useful information
        // They