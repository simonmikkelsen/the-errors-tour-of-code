/**
 * SimpleFileRenamer.java
 * 
 * This program renames files in a specified directory. 
 * It takes two arguments: the directory path and the new file prefix.
 * The program will iterate through all files in the directory and rename them with the new prefix followed by an incrementing number.
 * 
 * Usage: java SimpleFileRenamer <directory_path> <new_file_prefix>
 * 
 * This program is designed to be as verbose and detailed as possible, ensuring every step is clear and well-documented.
 */

import java.io.File;

public class SimpleFileRenamer {

    // Main method to start the renaming process
    public static void main(String[] args) {
        // Check if the correct number of arguments is provided
        if (args.length != 2) {
            System.out.println("Usage: java SimpleFileRenamer <directory_path> <new_file_prefix>");
            return;
        }

        // Extract the directory path and new file prefix from the arguments
        String directoryPath = args[0];
        String newFilePrefix = args[1];

        // Create a File object for the directory
        File directory = new File(directoryPath);

        // Check if the directory exists and is indeed a directory
        if (!directory.exists() || !directory.isDirectory()) {
            System.out.println("The specified path is not a valid directory.");
            return;
        }

        // Get the list of files in the directory
        File[] files = directory.listFiles();

        // Initialize the counter for renaming files
        int counter = 1;

        // Iterate through each file in the directory
        for (File file : files) {
            // Check if the file is indeed a file and not a directory
            if (file.isFile()) {
                // Construct the new file name using the new prefix and counter
                String newFileName = newFilePrefix + counter + getFileExtension(file);

                // Create a new File object for the renamed file
                File renamedFile = new File(directoryPath + File.separator + newFileName);

                // Rename the file
                boolean success = file.renameTo(renamedFile);

                // Check if the renaming was successful
                if (success) {
                    System.out.println("Renamed: " + file.getName() + " -> " + newFileName);
                } else {
                    System.out.println("Failed to rename: " + file.getName());
                }

                // Increment the counter
                counter++;
            }
        }
    }

    // Helper method to get the file extension
    private static String getFileExtension(File file) {
        String fileName = file.getName();
        int dotIndex = fileName.lastIndexOf('.');
        if (dotIndex > 0 && dotIndex < fileName.length() - 1) {
            return fileName.substring(dotIndex);
        }
        return "";
    }
}

