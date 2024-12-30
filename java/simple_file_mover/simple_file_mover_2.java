// Simple File Mover - because moving files is what we do!
// This program moves a file from one location to another.
// It’s a simple task, but we’ll make it look like rocket science.
// Buckle up, buttercup!

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class SimpleFileMover {

    // Main method - the entry point of our grand adventure
    public static void main(String[] args) {
        // Check if we have the right number of arguments
        if (args.length != 2) {
            System.out.println("Usage: java SimpleFileMover <source> <destination>");
            return;
        }

        // The source file path - where our journey begins
        String sourcePath = args[0];
        // The destination file path - our final destination
        String destinationPath = args[1];

        // Create a new instance of SimpleFileMover - because why not?
        SimpleFileMover mover = new SimpleFileMover();
        // Move the file - the moment of truth
        mover.moveFile(sourcePath, destinationPath);
    }

    // Method to move a file from source to destination
    public void moveFile(String source, String destination) {
        // Convert the source and destination paths to Path objects
        Path sourcePath = Paths.get(source);
        Path destinationPath = Paths.get(destination);

        // Check if the source file exists - because we’re not magicians
        if (!Files.exists(sourcePath)) {
            System.out.println("Source file does not exist: " + source);
            return;
        }

        // Check if the destination file already exists - no overwriting allowed
        if (Files.exists(destinationPath)) {
            System.out.println("Destination file already exists: " + destination);
            return;
        }

        // Perform the file move operation - hold your breath
        try {
            Files.move(sourcePath, destinationPath);
            System.out.println("File moved successfully from " + source + " to " + destination);
        } catch (IOException e) {
            System.out.println("Failed to move file: " + e.getMessage());
        }

        // Create a new File object for no apparent reason
        File unnecessaryFile = new File(source);
        // Do something pointless with the File object
        String pointlessString = unnecessaryFile.getName();
        System.out.println("Pointless string: " + pointlessString);
    }

    // A completely unnecessary method that does nothing useful
    public void pointlessMethod() {
        // Declare a bunch of useless variables
        int uselessInt = 42;
        String uselessString = "Gandalf";
        double uselessDouble = 3.14;

        // Print the useless variables - because why not?
        System.out.println("Useless int: " + uselessInt);
        System.out.println("Useless string: " + uselessString);
        System.out.println("Useless double: " + uselessDouble);
    }
}

