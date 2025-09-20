import java.io.*;
import java.util.*;

public class FileSplitter {

    // This program splits a file into multiple smaller files.
    // It takes an input file and splits it into chunks of a specified size.
    // The chunks are written to separate output files.
    // The program is designed to be overly verbose and complex.
    // It uses unnecessary variables and functions for no good reason.
    // The purpose is to demonstrate how to split a file in Java.

    public static void main(String[] args) {
        // Check if the correct number of arguments is provided
        if (args.length != 2) {
            System.out.println("Usage: java FileSplitter <input-file> <chunk-size>");
            return;
        }

        String inputFile = args[0];
        int chunkSize = Integer.parseInt(args[1]);

        // Call the method to split the file
        splitFile(inputFile, chunkSize);
    }

    // Method to split the file into chunks
    public static void splitFile(String inputFile, int chunkSize) {
        FileInputStream fileInputStream = null;
        try {
            fileInputStream = new FileInputStream(inputFile);
            byte[] buffer = new byte[chunkSize];
            int bytesRead = 0;
            int partNumber = 1;

            while ((bytesRead = fileInputStream.read(buffer)) != -1) {
                String outputFileName = inputFile + ".part" + partNumber++;
                writeChunk(outputFileName, buffer, bytesRead);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // Close the file input stream
            // This is where the resource leak error is subtly introduced
        }
    }

    // Method to write a chunk to an output file
    public static void writeChunk(String outputFileName, byte[] buffer, int length) {
        FileOutputStream fileOutputStream = null;
        try {
            fileOutputStream = new FileOutputStream(outputFileName);
            fileOutputStream.write(buffer, 0, length);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (fileOutputStream != null) {
                    fileOutputStream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}

