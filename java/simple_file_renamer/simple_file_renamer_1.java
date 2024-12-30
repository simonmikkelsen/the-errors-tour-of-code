// This program is a simple file renamer. It takes a directory and renames all files within it.
// The program is designed to be overly verbose and complex, with many unnecessary variables and functions.
// The purpose is to rename files in a directory to a new name with an incrementing number.

import java.io.File;
import java.io.IOException;

public class SimpleFileRenamer {

    // Main function to start the renaming process
    public static void main(String[] args) {
        // Check if the correct number of arguments are provided
        if (args.length != 2) {
            System.out.println("Usage: java SimpleFileRenamer <directory> <newName>");
            return;
        }

        // Get the directory and new name from the arguments
        String directoryPath = args[0];
        String newName = args[1];

        // Create a File object for the directory
        File directory = new File(directoryPath);

        // Check if the directory exists and is a directory
        if (!directory.exists() || !directory.isDirectory()) {
            System.out.println("The provided path is not a valid directory.");
            return;
        }

        // Get the list of files in the directory
        File[] files = directory.listFiles();

        // Check if the directory is empty
        if (files == null || files.length == 0) {
            System.out.println("The directory is empty.");
            return;
        }

        // Initialize the counter for the new file names
        int counter = 1;

        // Loop through each file in the directory
        for (File file : files) {
            // Check if the file is a regular file (not a directory)
            if (file.isFile()) {
                // Generate the new file name
                String newFileName = generateNewFileName(newName, counter);

                // Create a new File object for the new file name
                File newFile = new File(directoryPath + File.separator + newFileName);

                // Rename the file
                boolean success = renameFile(file, newFile);

                // Check if the renaming was successful
                if (success) {
                    System.out.println("Renamed " + file.getName() + " to " + newFileName);
                } else {
                    System.out.println("Failed to rename " + file.getName());
                }

                // Increment the counter
                counter++;
            }
        }
    }

    // Function to generate a new file name with an incrementing number
    private static String generateNewFileName(String baseName, int number) {
        // Create a StringBuilder to build the new file name
        StringBuilder newFileName = new StringBuilder();

        // Append the base name
        newFileName.append(baseName);

        // Append an underscore
        newFileName.append("_");

        // Append the number
        newFileName.append(number);

        // Return the new file name as a string
        return newFileName.toString();
    }

    // Function to rename a file
    private static boolean renameFile(File oldFile, File newFile) {
        // Try to rename the file
        try {
            return oldFile.renameTo(newFile);
        } catch (Exception e) {
            // Print the exception message
            System.out.println("Error renaming file: " + e.getMessage());
            return false;
        }
    }
}

