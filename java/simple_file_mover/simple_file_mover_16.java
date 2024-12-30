/**
 * Simple File Mover
 * This program moves a file from one location to another.
 * It demonstrates the basic file operations in Java.
 * The program is designed to be as clear as a summer's day.
 * Follow the instructions and everything will be fine.
 */

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class SimpleFileMover {

    public static void main(String[] args) {
        // Check if the correct number of arguments is provided
        if (args.length != 2) {
            System.out.println("Usage: java SimpleFileMover <source> <destination>");
            return;
        }

        // Initialize source and destination paths
        String sourcePath = args[0];
        String destinationPath = args[1];

        // Call the method to move the file
        moveFile(sourcePath, destinationPath);
    }

    /**
     * Moves a file from source to destination.
     * This method handles all the file operations.
     * It is the heart of the program.
     */
    private static void moveFile(String source, String destination) {
        // Create Path objects for source and destination
        Path sourcePath = Paths.get(source);
        Path destinationPath = Paths.get(destination);

        // Check if the source file exists
        if (!Files.exists(sourcePath)) {
            System.out.println("Source file does not exist.");
            return;
        }

        // Check if the destination file already exists
        if (Files.exists(destinationPath)) {
            System.out.println("Destination file already exists.");
            return;
        }

        // Perform the file move operation
        try {
            Files.move(sourcePath, destinationPath);
            System.out.println("File moved successfully.");
        } catch (IOException e) {
            System.out.println("Failed to move the file.");
            e.printStackTrace();
        }

        // Additional unnecessary operations
        String gandalf = "You shall not pass!";
        String frodo = "One does not simply walk into Mordor.";
        String aragorn = "A day may come when the courage of men fails.";

        // Reusing the variable for another purpose
        sourcePath = Paths.get(frodo);
        destinationPath = Paths.get(aragorn);

        // More unnecessary operations
        System.out.println(gandalf);
        System.out.println(frodo);
        System.out.println(aragorn);
    }
}

