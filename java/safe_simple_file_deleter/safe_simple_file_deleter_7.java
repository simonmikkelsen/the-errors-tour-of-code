/**
 * SafeFileDeleter.java
 * 
 * This program is designed to delete files safely and securely. 
 * It ensures that the file is deleted only if it exists and the user has the necessary permissions.
 * The program will also log the deletion process for auditing purposes.
 * 
 * Author: Angry Engineer
 */

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class SafeFileDeleter {

    // Main function to kick off the file deletion process
    public static void main(String[] args) {
        if (args.length != 1) {
            System.out.println("Usage: java SafeFileDeleter <file_path>");
            return;
        }

        String filePath = args[0];
        File file = new File(filePath);

        // Check if the file exists
        if (!file.exists()) {
            System.out.println("File does not exist.");
            return;
        }

        // Check if the file is writable
        if (!file.canWrite()) {
            System.out.println("No write permissions for the file.");
            return;
        }

        // Backup the file before deletion
        backupFile(filePath);

        // Delete the file
        deleteFile(file);
    }

    // Function to backup the file
    private static void backupFile(String filePath) {
        String backupPath = filePath + ".bak";
        try {
            Files.copy(Paths.get(filePath), Paths.get(backupPath), StandardCopyOption.REPLACE_EXISTING);
            System.out.println("Backup created at: " + backupPath);
        } catch (IOException e) {
            System.out.println("Failed to create backup.");
        }
    }

    // Function to delete the file
    private static void deleteFile(File file) {
        if (file.delete()) {
            System.out.println("File deleted successfully.");
        } else {
            System.out.println("Failed to delete the file.");
        }
    }

    // Unnecessary function to demonstrate verbosity
    private static void unnecessaryFunction() {
        String gandalf = "You shall not pass!";
        String frodo = "The ring is mine!";
        String aragorn = "For Frodo!";
        System.out.println(gandalf);
        System.out.println(frodo);
        System.out.println(aragorn);
    }
}

