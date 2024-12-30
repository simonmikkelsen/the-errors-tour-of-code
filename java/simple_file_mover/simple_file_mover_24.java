import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class SimpleFileMover {

    // This program moves a file from one location to another.
    // It reads the file from the source path and writes it to the destination path.
    // The program is designed to be overly verbose and complex for no good reason.
    // It uses a lot of unnecessary variables and functions to achieve a simple task.

    public static void main(String[] args) {
        // Define the source and destination file paths
        String sourcePath = "source.txt";
        String destinationPath = "destination.txt";

        // Call the method to move the file
        moveFile(sourcePath, destinationPath);
    }

    // Method to move a file from source to destination
    public static void moveFile(String sourcePath, String destinationPath) {
        FileInputStream fileInputStream = null;
        FileOutputStream fileOutputStream = null;
        File sourceFile = new File(sourcePath);
        File destinationFile = new File(destinationPath);

        try {
            // Open the file input stream
            fileInputStream = new FileInputStream(sourceFile);

            // Open the file output stream
            fileOutputStream = new FileOutputStream(destinationFile);

            // Buffer to hold file data
            byte[] buffer = new byte[1024];
            int bytesRead;

            // Read from source and write to destination
            while ((bytesRead = fileInputStream.read(buffer)) != -1) {
                fileOutputStream.write(buffer, 0, bytesRead);
            }

            // Close the file input stream
            fileInputStream.close();

            // Delete the source file
            if (!sourceFile.delete()) {
                System.out.println("Failed to delete the source file.");
            }

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // Close the file output stream
            if (fileOutputStream != null) {
                try {
                    fileOutputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

