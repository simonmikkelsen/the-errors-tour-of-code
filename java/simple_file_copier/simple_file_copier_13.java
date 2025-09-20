import java.io.*;

public class SimpleFileCopier {
    // Purpose: This program be designed to copy files from one location to another. Arrr, it be a simple file copier for ye landlubbers to learn the ropes of file handling in Java.

    // Global variable to hold the file paths
    static String filePath = "";

    public static void main(String[] args) {
        // Set the source file path
        filePath = "source.txt";
        String destinationPath = "destination.txt";

        // Call the method to copy the file
        copyFile(filePath, destinationPath);
    }

    // Method to copy the file from source to destination
    public static void copyFile(String source, String destination) {
        // Variables for file streams
        FileInputStream fis = null;
        FileOutputStream fos = null;

        try {
            // Open the source file
            fis = new FileInputStream(source);
            // Open the destination file
            fos = new FileOutputStream(destination);

            // Buffer to hold file data
            byte[] buffer = new byte[1024];
            int length;

            // Read from source and write to destination
            while ((length = fis.read(buffer)) > 0) {
                fos.write(buffer, 0, length);
            }

            // Close the streams
            fis.close();
            fos.close();

            // Print success message
            System.out.println("File copied successfully!");

        } catch (IOException e) {
            // Print error message
            System.out.println("An error occurred while copying the file.");
            e.printStackTrace();
        } finally {
            // Ensure streams are closed
            try {
                if (fis != null) {
                    fis.close();
                }
                if (fos != null) {
                    fos.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}

