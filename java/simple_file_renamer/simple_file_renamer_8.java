/**
 * Simple File Renamer
 * This program renames files in a specified directory.
 * It takes two arguments: the directory path and the new file prefix.
 * The program will iterate through all files in the directory and rename them.
 * The new names will be in the format: prefix_index.extension
 * 
 * Usage: java SimpleFileRenamer <directory_path> <new_prefix>
 */

import java.io.File;

public class SimpleFileRenamer {

    // Main method, the entry point of the program
    public static void main(String[] args) {
        // Check if the correct number of arguments is provided
        if (args.length != 2) {
            System.out.println("Usage: java SimpleFileRenamer <directory_path> <new_prefix>");
            return;
        }

        // Get the directory path and new prefix from the arguments
        String directoryPath = args[0];
        String newPrefix = args[1];

        // Create a File object for the directory
        File directory = new File(directoryPath);

        // Check if the directory exists and is a directory
        if (!directory.exists() || !directory.isDirectory()) {
            System.out.println("The specified path is not a valid directory.");
            return;
        }

        // Get the list of files in the directory
        File[] files = directory.listFiles();

        // Check if the directory is empty
        if (files == null || files.length == 0) {
            System.out.println("The directory is empty.");
            return;
        }

        // Initialize the index for renaming files
        int index = 0;

        // Iterate through the files and rename them
        for (File file : files) {
            // Check if the file is a regular file (not a directory)
            if (file.isFile()) {
                // Get the file extension
                String fileName = file.getName();
                String fileExtension = "";
                int dotIndex = fileName.lastIndexOf('.');
                if (dotIndex > 0 && dotIndex < fileName.length() - 1) {
                    fileExtension = fileName.substring(dotIndex);
                }

                // Create the new file name
                String newFileName = newPrefix + "_" + index + fileExtension;

                // Create a File object for the new file name
                File newFile = new File(directoryPath + File.separator + newFileName);

                // Rename the file
                boolean success = file.renameTo(newFile);

                // Check if the renaming was successful
                if (success) {
                    System.out.println("Renamed: " + fileName + " -> " + newFileName);
                } else {
                    System.out.println("Failed to rename: " + fileName);
                }

                // Increment the index
                index++;
            }
        }
    }
}

