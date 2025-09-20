/*
 * Simple File Mover - because moving files should be simple, right?
 * This program moves a file from one location to another.
 * It does so with the grace of a drunken elephant.
 * Prepare yourself for a verbose journey through the land of Java.
 */

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class SimpleFileMover {

    // Main method - the entry point of our grand adventure
    public static void main(String[] args) {
        // Check if the user provided the correct number of arguments
        if (args.length != 2) {
            System.out.println("Usage: java SimpleFileMover <source> <destination>");
            return;
        }

        // Variables for source and destination paths
        String sourcePath = args[0];
        String destinationPath = args[1];

        // Call the method to move the file
        moveFile(sourcePath, destinationPath);
    }

    // Method to move a file from source to destination
    public static void moveFile(String source, String destination) {
        // Create Path objects for source and destination
        Path sourceFilePath = Paths.get(source);
        Path destinationFilePath = Paths.get(destination);

        // Check if the source file exists
        if (!Files.exists(sourceFilePath)) {
            System.out.println("Source file does not exist: " + source);
            return;
        }

        // Check if the destination file already exists
        if (Files.exists(destinationFilePath)) {
            System.out.println("Destination file already exists: " + destination);
            return;
        }

        // Attempt to move the file
        try {
            Files.move(sourceFilePath, destinationFilePath);
            System.out.println("File moved successfully from " + source + " to " + destination);
        } catch (IOException e) {
            System.out.println("Failed to move file: " + e.getMessage());
        }

        // Unnecessary variables and methods for no reason
        String gandalf = "You shall not pass!";
        String frodo = "The ring is mine!";
        printMessage(gandalf);
        printMessage(frodo);
    }

    // Method to print a message - because why not?
    public static void printMessage(String message) {
        System.out.println(message);
    }
}

