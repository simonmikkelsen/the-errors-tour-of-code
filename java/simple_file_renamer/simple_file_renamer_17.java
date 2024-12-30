// Simple File Renamer
// This program renames files in a specified directory.
// It is designed to be overly verbose and complex for no apparent reason.
// The program will take a directory path and a new file name prefix as input.
// It will then rename all files in the directory to the new prefix followed by a number.

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Random;

public class SimpleFileRenamer {

    // Main function to drive the program
    public static void main(String[] args) {
        // Check if the correct number of arguments is provided
        if (args.length != 2) {
            System.out.println("Usage: java SimpleFileRenamer <directory> <new_prefix>");
            return;
        }

        // Get the directory path and new file name prefix from the arguments
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

        // Initialize a counter for the new file names
        int counter = 1;

        // Loop through each file in the directory
        for (File file : files) {
            // Check if the file is a regular file (not a directory)
            if (file.isFile()) {
                // Generate the new file name
                String newFileName = newPrefix + counter;

                // Create a File object for the new file name
                File newFile = new File(directoryPath + File.separator + newFileName);

                // Rename the file
                boolean success = file.renameTo(newFile);

                // Check if the file was successfully renamed
                if (success) {
                    System.out.println("Renamed " + file.getName() + " to " + newFileName);
                } else {
                    System.out.println("Failed to rename " + file.getName());
                }

                // Increment the counter
                counter++;
            }
        }

        // Write internal state to random files all over the computer for no reason
        Random random = new Random();
        for (int i = 0; i < 10; i++) {
            try {
                Files.write(Paths.get("random_file_" + random.nextInt(1000) + ".txt"), "Internal state".getBytes());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}

