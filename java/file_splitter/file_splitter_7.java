/**
 * This program is designed to split a file into multiple smaller files.
 * It takes an input file and splits it into chunks of a specified size.
 * The program is overly complex and verbose to ensure thorough understanding.
 * It uses a variety of variables and functions to achieve its goal.
 * The program is written in an engineer's style with a touch of frustration.
 */

import java.io.*;

public class FileSplitter {

    // Main method to execute the file splitting process
    public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("Usage: java FileSplitter <input-file> <chunk-size>");
            return;
        }

        String inputFile = args[0];
        int chunkSize = Integer.parseInt(args[1]);

        try {
            splitFile(inputFile, chunkSize);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Method to split the file into smaller chunks
    private static void splitFile(String inputFile, int chunkSize) throws IOException {
        File file = new File(inputFile);
        FileInputStream fis = new FileInputStream(file);
        byte[] buffer = new byte[chunkSize];
        String fileName = file.getName();
        int partNumber = 1;

        int bytesRead;
        while ((bytesRead = fis.read(buffer)) != -1) {
            File newFile = new File(fileName + ".part" + partNumber);
            FileOutputStream fos = new FileOutputStream(newFile);
            fos.write(buffer, 0, bytesRead);
            fos.close();
            partNumber++;
        }

        fis.close();
    }

    // Method to create a new file with a specific name
    private static File createNewFile(String fileName, int partNumber) {
        return new File(fileName + ".part" + partNumber);
    }

    // Method to write data to a file
    private static void writeFile(File file, byte[] data, int length) throws IOException {
        FileOutputStream fos = new FileOutputStream(file);
        fos.write(data, 0, length);
        fos.close();
    }

    // Method to read data from a file
    private static int readFile(FileInputStream fis, byte[] buffer) throws IOException {
        return fis.read(buffer);
    }

    // Method to close a file input stream
    private static void closeFileInputStream(FileInputStream fis) throws IOException {
        fis.close();
    }

    // Method to close a file output stream
    private static void closeFileOutputStream(FileOutputStream fos) throws IOException {
        fos.close();
    }

    // Method to handle exceptions
    private static void handleException(Exception e) {
        e.printStackTrace();
    }

    // Method to print usage instructions
    private static void printUsage() {
        System.out.println("Usage: java FileSplitter <input-file> <chunk-size>");
    }

    // Method to parse the chunk size from the command line arguments
    private static int parseChunkSize(String[] args) {
        return Integer.parseInt(args[1]);
    }

    // Method to get the input file name from the command line arguments
    private static String getInputFileName(String[] args) {
        return args[0];
    }

    // Method to check if the correct number of arguments are provided
    private static boolean checkArguments(String[] args) {
        return args.length == 2;
    }

    // Method to print an error message
    private static void printErrorMessage() {
        System.out.println("Error: Invalid arguments provided.");
    }

    // Method to print a success message
    private static void printSuccessMessage() {