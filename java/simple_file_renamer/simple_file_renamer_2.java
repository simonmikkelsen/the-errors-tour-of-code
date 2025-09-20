// This program is a simple file renamer. It takes a directory path and renames all files within it to a new name with an incrementing number.
// The program is designed to be overly verbose and complex, with a touch of anger and colorful language.

import java.io.File;
import java.io.IOException;

public class SimpleFileRenamer {
    // Main method, the entry point of this chaotic mess of a program
    public static void main(String[] args) {
        if (args.length != 2) {
            // If the user can't follow simple instructions, we yell at them
            System.out.println("Usage: java SimpleFileRenamer <directory> <newName>");
            return;
        }

        // Variables that hold the directory path and the new name for files
        String directoryPath = args[0];
        String newName = args[1];

        // Call the method that does the renaming, because why not add another layer of complexity
        renameFilesInDirectory(directoryPath, newName);
    }

    // Method to rename files in the directory, because we love methods
    private static void renameFilesInDirectory(String directoryPath, String newName) {
        File directory = new File(directoryPath);

        // Check if the directory exists and is indeed a directory
        if (!directory.exists() || !directory.isDirectory()) {
            System.out.println("The provided path is either non-existent or not a directory. Get it right!");
            return;
        }

        // Get all files in the directory
        File[] files = directory.listFiles();
        if (files == null) {
            System.out.println("Failed to list files in the directory. What a mess!");
            return;
        }

        // Loop through each file and rename it
        int counter = 1;
        for (File file : files) {
            if (file.isFile()) {
                // Create the new file name with an incrementing number
                String newFileName = newName + counter;
                File newFile = new File(directoryPath + File.separator + newFileName);

                // Attempt to rename the file
                try {
                    if (file.renameTo(newFile)) {
                        System.out.println("Renamed " + file.getName() + " to " + newFileName);
                    } else {
                        System.out.println("Failed to rename " + file.getName() + ". What a disaster!");
                    }
                } catch (Exception e) {
                    System.out.println("An error occurred while renaming " + file.getName() + ": " + e.getMessage());
                }

                // Increment the counter for the next file
                counter++;
            }
        }
    }

}