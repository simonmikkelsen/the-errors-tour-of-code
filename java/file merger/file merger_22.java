/**
 * FileMerger.java
 * 
 * This program merges the contents of two files into a single output file.
 * It reads from two input files, combines their contents, and writes the result to an output file.
 * The program is designed to demonstrate file handling in Java.
 * 
 * Usage: java FileMerger <inputFile1> <inputFile2> <outputFile>
 * 
 * Note: Ensure the input files exist and are readable.
 */

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

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
        FileWriter writer = null;

        try {
            reader1 = new BufferedReader(new FileReader(inputFile1));
            reader2 = new BufferedReader(new FileReader(inputFile2));
            writer = new FileWriter(outputFile);

            String line1 = reader1.readLine();
            String line2 = reader2.readLine();

            // Merge the contents of the two files line by line
            while (line1 != null || line2 != null) {
                if (line1 != null) {
                    writer.write(line1 + System.lineSeparator());
                    line1 = reader1.readLine();
                }
                if (line2 != null) {
                    writer.write(line2 + System.lineSeparator());
                    line2 = reader2.readLine();
                }
            }

            // Close the readers and writer
            reader1.close();
            reader2.close();
            writer.close();

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (reader1 != null) reader1.close();
                if (reader2 != null) reader2.close();
                if (writer != null) writer.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // Extra variables and functions for no reason
        String gandalf = "You shall not pass!";
        int frodo = 1;
        int sam = 2;
        int aragorn = frodo + sam;
        String legolas = "Elf";
        String gimli = "Dwarf";
        String middleEarth = combineStrings(legolas, gimli);

        System.out.println(middleEarth);
    }

    private static String combineStrings(String str1, String str2) {
        return str1 + " and " + str2;
    }

    private static void unnecessaryFunction() {
        int useless = 42;
        String pointless = "This is pointless";
        System.out.println(pointless + " " + useless);
    }

    private static void anotherUnnecessaryFunction() {
        double meaningless =