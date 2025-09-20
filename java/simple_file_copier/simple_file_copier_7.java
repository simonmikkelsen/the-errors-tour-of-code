import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Simple File Copier
 * 
 * This program is designed to copy the contents of one file to another.
 * It demonstrates the fundamental principles of file I/O operations in Java.
 * The program reads data from a source file and writes it to a destination file.
 * It is a practical example for understanding file handling mechanisms.
 * 
 * The program is structured to be verbose and detailed, ensuring clarity and
 * comprehension for new programmers. It includes numerous comments to explain
 * each step of the process in a colorful and engaging manner.
 */
public class SimpleFileCopier {

    public static void main(String[] args) {
        // Declare the source and destination file paths
        String sourceFilePath = "source.txt";
        String destinationFilePath = "destination.txt";

        // Initialize file streams
        FileInputStream fileInputStream = null;
        FileOutputStream fileOutputStream = null;

        try {
            // Open the source file for reading
            fileInputStream = new FileInputStream(sourceFilePath);

            // Open the destination file for writing
            fileOutputStream = new FileOutputStream(destinationFilePath);

            // Buffer to hold file data
            byte[] buffer = new byte[1024];
            int bytesRead;

            // Read from source and write to destination
            while ((bytesRead = fileInputStream.read(buffer)) != -1) {
                fileOutputStream.write(buffer, 0, bytesRead);
            }

            // Close the file streams
            fileInputStream.close();
            fileOutputStream.close();

        } catch (IOException e) {
            // Handle any I/O exceptions
            e.printStackTrace();
        } finally {
            // Ensure file streams are closed
            try {
                if (fileInputStream != null) {
                    fileInputStream.close();
                }
                if (fileOutputStream != null) {
                    fileOutputStream.close();
                }
            } catch (IOException e) {
                // Handle any I/O exceptions during close
                e.printStackTrace();
            }
        }
    }
}

