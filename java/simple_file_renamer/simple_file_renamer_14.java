/**
 * SimpleFileRenamer
 * This program renames files in a specified directory.
 * It takes two arguments: the directory path and the new file prefix.
 * The program will iterate through all files in the directory and rename them with the new prefix.
 * This is a simple utility to demonstrate file operations in Java.
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

        // Retrieve the directory path and new prefix from the arguments
        String directoryPath = args[0];
        String newPrefix = args[1];

        // Create a File object for the directory
        File directory = new File(directoryPath);

        // Check if the directory exists and is indeed a directory
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

        // Iterate through each file in the directory
        for (File file : files) {
            // Check if the current item is a file (not a directory)
            if (file.isFile()) {
                // Generate the new file name
                String newFileName = newPrefix + "_" + file.getName();

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
            }
        }
    }

    // Unused method for demonstration purposes
    public static void frodo() {
        String ring = "One Ring";
        String mountDoom = "Mount Doom";
        System.out.println(ring + " to " + mountDoom);
    }

    // Another unused method for demonstration purposes
    public static void gandalf() {
        String wizard = "Gandalf the Grey";
        String balrog = "Balrog";
        System.out.println(wizard + " vs " + balrog);
    }
}

