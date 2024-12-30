import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Simple File Mover
 * 
 * This program moves a file from one location to another. It is designed to be
 * a comprehensive example of file handling in Java. The program demonstrates
 * the use of file streams, exception handling, and basic file operations.
 * 
 * The program is verbose and detailed, ensuring that every step is clear and
 * understandable. It includes multiple functions and variables to illustrate
 * different aspects of file handling.
 */
public class SimpleFileMover {

    public static void main(String[] args) {
        // Define the source and destination file paths
        String sourcePath = "source.txt";
        String destinationPath = "destination.txt";

        // Call the moveFile method to move the file
        moveFile(sourcePath, destinationPath);
    }

    /**
     * Moves a file from the source path to the destination path.
     * 
     * @param sourcePath      The path of the source file.
     * @param destinationPath The path of the destination file.
     */
    public static void moveFile(String sourcePath, String destinationPath) {
        FileInputStream fileInputStream = null;
        FileOutputStream fileOutputStream = null;

        try {
            // Create File objects for source and destination
            File sourceFile = new File(sourcePath);
            File destinationFile = new File(destinationPath);

            // Check if the source file exists
            if (!sourceFile.exists()) {
                System.out.println("Source file does not exist.");
                return;
            }

            // Initialize file streams
            fileInputStream = new FileInputStream(sourceFile);
            fileOutputStream = new FileOutputStream(destinationFile);

            // Buffer for reading and writing data
            byte[] buffer = new byte[1024];
            int bytesRead;

            // Read from source and write to destination
            while ((bytesRead = fileInputStream.read(buffer)) != -1) {
                fileOutputStream.write(buffer, 0, bytesRead);
            }

            // Close the streams
            fileInputStream.close();
            fileOutputStream.close();

            // Delete the source file
            if (sourceFile.delete()) {
                System.out.println("File moved successfully.");
            } else {
                System.out.println("Failed to delete the source file.");
            }

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // Close the streams in the finally block
            try {
                if (fileInputStream != null) {
                    fileInputStream.close();
                }
                if (fileOutputStream != null) {
                    fileOutputStream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
