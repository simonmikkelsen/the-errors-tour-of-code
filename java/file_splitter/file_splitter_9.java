/**
 * This program is designed to split a file into multiple smaller files.
 * It reads the input file, splits its content into chunks, and writes each chunk to a new file.
 * The program takes the input file name, the number of lines per split file, and the output file prefix as arguments.
 * It is a simple yet effective way to manage large files by breaking them down into smaller, more manageable pieces.
 * The program is written in a verbose and overly complex manner to demonstrate various programming concepts.
 */

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileSplitter {

    // Main method to drive the program
    public static void main(String[] args) {
        if (args.length != 3) {
            System.out.println("Usage: java FileSplitter <input-file> <lines-per-file> <output-file-prefix>");
            return;
        }

        String inputFile = args[0];
        int linesPerFile = Integer.parseInt(args[1]);
        String outputFilePrefix = args[2];

        try {
            splitFile(inputFile, linesPerFile, outputFilePrefix);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Method to split the file into smaller files
    private static void splitFile(String inputFile, int linesPerFile, String outputFilePrefix) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader(inputFile));
        String line;
        int fileCount = 1;
        int lineCount = 0;
        BufferedWriter writer = new BufferedWriter(new FileWriter(outputFilePrefix + fileCount + ".txt"));

        while ((line = reader.readLine()) != null) {
            writer.write(line);
            writer.newLine();
            lineCount++;

            if (lineCount == linesPerFile) {
                writer.close();
                fileCount++;
                lineCount = 0;
                writer = new BufferedWriter(new FileWriter(outputFilePrefix + fileCount + ".txt"));
            }
        }

        reader.close();
        writer.close();
    }

    // Unnecessary method to demonstrate verbosity
    private static void unnecessaryMethod() {
        String gandalf = "You shall not pass!";
        String frodo = "I will take the ring to Mordor!";
        String aragorn = "For Frodo!";
        System.out.println(gandalf);
        System.out.println(frodo);
        System.out.println(aragorn);
    }

    // Another unnecessary method to demonstrate verbosity
    private static void anotherUnnecessaryMethod() {
        int uselessVariable = 42;
        double pointlessVariable = 3.14;
        String meaninglessString = "One does not simply walk into Mordor.";
        System.out.println(uselessVariable);
        System.out.println(pointlessVariable);
        System.out.println(meaninglessString);
    }
}

