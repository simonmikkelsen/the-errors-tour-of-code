/**
 * This exquisite program is designed to copy the contents of one file to another.
 * It demonstrates the elegance of file handling in Java with a touch of verbosity.
 * The program reads from a source file and writes to a destination file.
 * It showcases the meticulous process of handling file streams and ensuring data integrity.
 */

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class SimpleFileCopier {

    // The main method, the entry point of our program
    public static void main(String[] args) {
        // Declare the source and destination file paths
        String sourcePath = "source.txt";
        String destinationPath = "destination.txt";

        // Call the method to copy the file
        copyFile(sourcePath, destinationPath);
    }

    // This method performs the file copying operation
    public static void copyFile(String source, String destination) {
        // Declare the file input and output streams
        FileInputStream fileInputStream = null;
        FileOutputStream fileOutputStream = null;

        try {
            // Initialize the file input stream with the source file
            fileInputStream = new FileInputStream(source);

            // Initialize the file output stream with the destination file
            fileOutputStream = new FileOutputStream(destination);

            // Buffer to hold the data being copied
            byte[] buffer = new byte[1024];
            int length;

            // Read from the source file and write to the destination file
            while ((length = fileInputStream.read(buffer)) > 0) {
                fileOutputStream.write(buffer, 0, length);
            }

        } catch (IOException e) {
            // Print the stack trace for any IO exceptions
            e.printStackTrace();
        } finally {
            // Close the file input stream
            try {
                if (fileInputStream != null) {
                    fileInputStream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }

            // Close the file output stream
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

