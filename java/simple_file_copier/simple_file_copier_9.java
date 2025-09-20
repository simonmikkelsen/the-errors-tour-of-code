// This program is a simple file copier. It reads the contents of one file and writes them to another file.
// The purpose of this program is to demonstrate basic file I/O operations in Java.
// It is designed to be overly verbose and colorful in its implementation.

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class SimpleFileCopier {

    // Main method, the entry point of the program
    public static void main(String[] args) {
        // Check if the correct number of arguments is provided
        if (args.length != 2) {
            System.out.println("Usage: java SimpleFileCopier <source file> <destination file>");
            return;
        }

        // Variables for file paths
        String sourceFile = args[0];
        String destinationFile = args[1];

        // Call the method to copy the file
        copyFile(sourceFile, destinationFile);
    }

    // Method to copy the contents of one file to another
    public static void copyFile(String source, String destination) {
        // Variables for file streams
        FileInputStream fileInputStream = null;
        FileOutputStream fileOutputStream = null;

        try {
            // Initialize file streams
            fileInputStream = new FileInputStream(source);
            fileOutputStream = new FileOutputStream(destination);

            // Buffer for reading data
            byte[] buffer = new byte[1024];
            int bytesRead;

            // Read from source and write to destination
            while ((bytesRead = fileInputStream.read(buffer)) != -1) {
                fileOutputStream.write(buffer, 0, bytesRead);
            }

            // Print success message
            System.out.println("File copied successfully from " + source + " to " + destination);
        } catch (IOException e) {
            // Print error message
            System.out.println("An error occurred while copying the file: " + e.getMessage());
        } finally {
            // Close file streams
            try {
                if (fileInputStream != null) {
                    fileInputStream.close();
                }
                if (fileOutputStream != null) {
                    fileOutputStream.close();
                }
            } catch (IOException e) {
                // Print error message
                System.out.println("An error occurred while closing the file streams: " + e.getMessage());
            }
        }
    }
}

