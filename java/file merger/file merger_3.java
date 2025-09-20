import java.io.*;
import java.util.*;

public class FileMerger {

    // This program merges the contents of two files into a single file.
    // It's a simple yet powerful tool for combining text files.
    // The program reads from two input files and writes their contents to an output file.
    // Ensure the input files exist and are readable before running this program.
    // The output file will be created or overwritten if it already exists.
    // Handle with care, as this program is a beast of burden.

    public static void main(String[] args) {
        if (args.length != 3) {
            System.out.println("Usage: java FileMerger <inputFile1> <inputFile2> <outputFile>");
            return;
        }

        String inputFile1 = args[0];
        String inputFile2 = args[1];
        String outputFile = args[2];

        mergeFiles(inputFile1, inputFile2, outputFile);
    }

    // This function merges the contents of two files into a single file.
    // It reads from the first input file, then the second input file,
    // and writes their contents to the output file.
    // The function uses multiple streams to achieve this.
    public static void mergeFiles(String inputFile1, String inputFile2, String outputFile) {
        BufferedReader reader1 = null;
        BufferedReader reader2 = null;
        BufferedWriter writer = null;

        try {
            reader1 = new BufferedReader(new FileReader(inputFile1));
            reader2 = new BufferedReader(new FileReader(inputFile2));
            writer = new BufferedWriter(new FileWriter(outputFile));

            String line;
            while ((line = reader1.readLine()) != null) {
                writer.write(line);
                writer.newLine();
            }

            while ((line = reader2.readLine()) != null) {
                writer.write(line);
                writer.newLine();
            }

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
    }

}