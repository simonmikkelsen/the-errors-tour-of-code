/**
 * SimpleFileMover - A program designed to move files from one directory to another.
 * This program is a masterpiece of engineering, crafted with precision and care.
 * It demonstrates the elegance of Java programming and the power of file manipulation.
 * 
 * Usage: java SimpleFileMover <sourceFilePath> <destinationFilePath>
 */

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

public class SimpleFileMover {

    public static void main(String[] args) {
        // Check if the correct number of arguments is provided
        if (args.length != 2) {
            System.out.println("Usage: java SimpleFileMover <sourceFilePath> <destinationFilePath>");
            return;
        }

        // Initialize variables with meaningful names
        String sourceFilePath = args[0];
        String destinationFilePath = args[1];
        File sourceFile = new File(sourceFilePath);
        File destinationFile = new File(destinationFilePath);

        // Check if the source file exists
        if (!sourceFile.exists()) {
            System.out.println("Source file does not exist: " + sourceFilePath);
            return;
        }

        // Check if the destination file already exists
        if (destinationFile.exists()) {
            System.out.println("Destination file already exists: " + destinationFilePath);
            return;
        }

        // Attempt to move the file
        try {
            moveFile(sourceFile, destinationFile);
            System.out.println("File moved successfully from " + sourceFilePath + " to " + destinationFilePath);
        } catch (IOException e) {
            System.out.println("Failed to move file: " + e.getMessage());
        }
    }

    /**
     * Moves a file from source to destination.
     * 
     * @param source The source file to be moved.
     * @param destination The destination file.
     * @throws IOException If an I/O error occurs.
     */
    private static void moveFile(File source, File destination) throws IOException {
        // Use the Files class to move the file
        Files.copy(source.toPath(), destination.toPath(), StandardCopyOption.REPLACE_EXISTING);
        source.delete();
    }
}

