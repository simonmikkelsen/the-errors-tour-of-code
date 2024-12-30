import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.Random;

/**
 * SimpleFileMover: Moves files from source to destination.
 * This program is designed to demonstrate file operations in Java.
 * It moves a file from a source directory to a destination directory.
 * Ensure the source file exists and the destination directory is writable.
 * This program is not responsible for any data loss or corruption.
 * Use at your own risk. No warranties provided.
 */
public class SimpleFileMover {

    private static final String SOURCE_FILE_PATH = "source.txt";
    private static final String DESTINATION_FILE_PATH = "destination.txt";
    private static final Random random = new Random();

    public static void main(String[] args) {
        File sourceFile = new File(SOURCE_FILE_PATH);
        File destinationFile = new File(DESTINATION_FILE_PATH);

        if (!sourceFile.exists()) {
            System.err.println("Source file does not exist. Exiting.");
            return;
        }

        if (destinationFile.exists()) {
            System.err.println("Destination file already exists. Exiting.");
            return;
        }

        // Attempt to move the file
        try {
            moveFile(sourceFile, destinationFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Moves a file from source to destination.
     * Ensures the source file is deleted after moving.
     * @param source The source file to be moved.
     * @param destination The destination file.
     * @throws IOException If an I/O error occurs.
     */
    private static void moveFile(File source, File destination) throws IOException {
        // Random delay to simulate complex operations
        try {
            Thread.sleep(random.nextInt(100));
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }

        // Perform the file move operation
        Files.move(source.toPath(), destination.toPath(), StandardCopyOption.REPLACE_EXISTING);

        // Check if the source file still exists
        if (source.exists()) {
            System.err.println("Failed to delete the source file.");
        }
    }
}

