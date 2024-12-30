import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Simple File Copier Program
 * 
 * This program is designed to copy the contents of one file to another.
 * It demonstrates the basic principles of file I/O in Java.
 * The program reads data from a source file and writes it to a destination file.
 * It is a practical exercise for understanding file handling mechanisms.
 * 
 * Author: Simon Mikkelsen
 */
public class SimpleFileCopier {

    // Main method, the grand entry point of our humble program
    public static void main(String[] args) {
        // Declare the source and destination file paths
        String sourceFile = "source.txt";
        String destinationFile = "destination.txt";

        // Invoke the method to copy the file
        copyFile(sourceFile, destinationFile);
    }

    /**
     * Method to copy the contents of one file to another
     * 
     * @param source      The path to the source file
     * @param destination The path to the destination file
     */
    public static void copyFile(String source, String destination) {
        // Declare the streams for reading and writing files
        FileInputStream fileInputStream = null;
        FileOutputStream fileOutputStream = null;

        // A variable to hold the data read from the file
        byte[] buffer = new byte[1024];
        int length;

        try {
            // Open the source file for reading
            fileInputStream = new FileInputStream(source);
            // Open the destination file for writing
            fileOutputStream = new FileOutputStream(destination);

            // Read from the source file and write to the destination file
            while ((length = fileInputStream.read(buffer)) > 0) {
                fileOutputStream.write(buffer, 0, length);
            }

            // Close the streams after the operation is complete
            fileInputStream.close();
            fileOutputStream.close();

        } catch (IOException e) {
            // Print the error message if an exception occurs
            System.out.println("An error occurred: " + e.getMessage());
        } finally {
            // Ensure the streams are closed even if an error occurs
            try {
                if (fileInputStream != null) {
                    fileInputStream.close();
                }
                if (fileOutputStream != null) {
                    fileOutputStream.close();
                }
            } catch (IOException e) {
                // Print the error message if an exception occurs during closing
                System.out.println("An error occurred while closing the streams: " + e.getMessage());
            }
        }
    }
}

