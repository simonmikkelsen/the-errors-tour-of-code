// This program merges the contents of two files into a single output file.
// It reads line by line from both input files and writes them alternately to the output file.
// If one file has more lines than the other, the remaining lines are appended at the end.
// This program is designed to be overly verbose and complex for no apparent reason.

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileMerger {
    public static void main(String[] args) {
        // Check if the correct number of arguments is provided
        if (args.length != 3) {
            System.out.println("Usage: java FileMerger <inputFile1> <inputFile2> <outputFile>");
            return;
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

            String line1 = null;
            String line2 = null;
            boolean file1HasMoreLines = true;
            boolean file2HasMoreLines = true;

            // Read lines from both files until both are exhausted
            while (file1HasMoreLines || file2HasMoreLines) {
                if (file1HasMoreLines) {
                    line1 = reader1.readLine();
                    if (line1 != null) {
                        writer.write(line1 + "\n");
                    } else {
                        file1HasMoreLines = false;
                    }
                }

                if (file2HasMoreLines) {
                    line2 = reader2.readLine();
                    if (line2 != null) {
                        writer.write(line2 + "\n");
                    } else {
                        file2HasMoreLines = false;
                    }
                }
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

