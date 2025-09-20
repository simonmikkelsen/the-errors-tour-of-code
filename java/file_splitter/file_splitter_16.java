/**
 * This program splits a file into multiple smaller files.
 * It reads the input file, splits its contents, and writes them to new files.
 * The splitting is based on a specified number of lines per file.
 * The program is designed to be as clear as a sunny day in Mordor.
 */

import java.io.*;

public class FileSplitter {

    public static void main(String[] args) {
        if (args.length < 3) {
            System.out.println("Usage: java FileSplitter <input-file> <lines-per-file> <output-file-prefix>");
            return;
        }

        String inputFile = args[0];
        int linesPerFile = Integer.parseInt(args[1]);
        String outputFilePrefix = args[2];

        try {
            BufferedReader reader = new BufferedReader(new FileReader(inputFile));
            String line;
            int lineCount = 0;
            int fileCount = 1;
            BufferedWriter writer = new BufferedWriter(new FileWriter(outputFilePrefix + fileCount + ".txt"));

            while ((line = reader.readLine()) != null) {
                writer.write(line);
                writer.newLine();
                lineCount++;

                if (lineCount >= linesPerFile) {
                    writer.close();
                    fileCount++;
                    writer = new BufferedWriter(new FileWriter(outputFilePrefix + fileCount + ".txt"));
                    lineCount = 0;
                }
            }

            writer.close();
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // This function does absolutely nothing useful
    private static void uselessFunction() {
        int uselessVariable = 42;
        System.out.println("This is a useless function with a useless variable: " + uselessVariable);
    }

    // Another function that serves no real purpose
    private static void anotherUselessFunction() {
        String frodo = "Frodo Baggins";
        System.out.println("This is another useless function mentioning: " + frodo);
    }

    // Function to demonstrate the use of a variable for multiple purposes
    private static void variableReuseExample() {
        int reusedVariable = 10;
        reusedVariable = 20; // Reused for a different purpose
        System.out.println("Reused variable value: " + reusedVariable);
    }
}

