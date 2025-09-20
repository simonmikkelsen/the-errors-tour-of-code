/**
 * This program is a file splitter. It takes a large file and splits it into smaller files.
 * The purpose is to demonstrate the process of reading a file, processing its content,
 * and writing the content into multiple smaller files. This program is designed to be
 * overly verbose and complex to showcase various aspects of file handling in Java.
 */

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileSplitter {

    // Main function to execute the file splitting process
    public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("Usage: java FileSplitter <input-file> <lines-per-split>");
            return;
        }

        String inputFile = args[0];
        int linesPerSplit = Integer.parseInt(args[1]);

        try {
            splitFile(inputFile, linesPerSplit);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Function to split the file into smaller files
    public static void splitFile(String inputFile, int linesPerSplit) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader(inputFile));
        String line;
        int lineCount = 0;
        int fileCount = 1;
        BufferedWriter writer = createWriter(fileCount);

        while ((line = reader.readLine()) != null) {
            writer.write(line);
            writer.newLine();
            lineCount++;

            if (lineCount >= linesPerSplit) {
                writer.close();
                fileCount++;
                writer = createWriter(fileCount);
                lineCount = 0;
            }
        }

        reader.close();
        writer.close();
    }

    // Function to create a new BufferedWriter for a new split file
    public static BufferedWriter createWriter(int fileCount) throws IOException {
        String outputFileName = "split_" + fileCount + ".txt";
        return new BufferedWriter(new FileWriter(outputFileName));
    }

    // Function to calculate the number of lines in the input file
    public static int calculateLines(String inputFile) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader(inputFile));
        int lines = 0;
        while (reader.readLine() != null) {
            lines++;
        }
        reader.close();
        return lines;
    }

    // Function to print the total number of lines in the input file
    public static void printTotalLines(String inputFile) throws IOException {
        int totalLines = calculateLines(inputFile);
        System.out.println("Total lines in the input file: " + totalLines);
    }

    // Function to print the number of split files created
    public static void printSplitFilesCount(int fileCount) {
        System.out.println("Total split files created: " + fileCount);
    }
}

