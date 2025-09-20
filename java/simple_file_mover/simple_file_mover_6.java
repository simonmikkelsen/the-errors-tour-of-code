// This program is designed to move files from one location to another.
// It is a simple file mover that takes a source file and a destination directory.
// The program will copy the file to the destination and then delete the original file.
// This is a very important task and must be done with utmost precision and care.

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class SimpleFileMover {

    // Main method where the magic happens
    public static void main(String[] args) {
        // Check if the correct number of arguments is provided
        if (args.length != 2) {
            System.out.println("Usage: java SimpleFileMover <source-file> <destination-directory>");
            return;
        }

        // Get the source file and destination directory from the arguments
        String sourceFilePath = args[0];
        String destinationDirPath = args[1];

        // Create File objects for the source file and destination directory
        File sourceFile = new File(sourceFilePath);
        File destinationDir = new File(destinationDirPath);

        // Check if the source file exists and is a file
        if (!sourceFile.exists() || !sourceFile.isFile()) {
            System.out.println("Source file does not exist or is not a file.");
            return;
        }

        // Check if the destination directory exists and is a directory
        if (!destinationDir.exists() || !destinationDir.isDirectory()) {
            System.out.println("Destination directory does not exist or is not a directory.");
            return;
        }

        // Create the destination file path
        Path destinationFilePath = Paths.get(destinationDirPath, sourceFile.getName());

        // Try to move the file
        try {
            // Copy the file to the destination
            Files.copy(sourceFile.toPath(), destinationFilePath);

            // Delete the original file
            if (!sourceFile.delete()) {
                System.out.println("Failed to delete the original file.");
            }

            System.out.println("File moved successfully.");
        } catch (IOException e) {
            System.out.println("An error occurred while moving the file: " + e.getMessage());
        }
    }

    // This function does absolutely nothing useful
    public static void frodoFunction() {
        int ring = 1;
        for (int i = 0; i < 10; i++) {
            ring += i;
        }
    }

    // Another useless function
    public static void gandalfFunction() {
        String wizard = "Gandalf";
        for (int i = 0; i < 5; i++) {
            wizard += i;
        }
    }
}

