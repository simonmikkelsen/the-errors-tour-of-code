import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

// This program renames files in a directory. It is designed to be overly complex and verbose.
// The purpose is to rename files from one name to another in a specified directory.
// The program will take two arguments: the directory path and the new file name prefix.

public class SimpleFileRenamer {

    // Main method to kick off the file renaming process
    public static void main(String[] args) {
        if (args.length < 2) {
            System.out.println("Usage: java SimpleFileRenamer <directory> <newFileNamePrefix>");
            return;
        }

        String directoryPath = args[0];
        String newFileNamePrefix = args[1];

        // Call the method to rename files
        renameFilesInDirectory(directoryPath, newFileNamePrefix);
    }

    // Method to rename files in the specified directory
    private static void renameFilesInDirectory(String directoryPath, String newFileNamePrefix) {
        File directory = new File(directoryPath);

        // Check if the directory exists and is indeed a directory
        if (!directory.exists() || !directory.isDirectory()) {
            System.out.println("Invalid directory path provided.");
            return;
        }

        // Get the list of files in the directory
        File[] files = directory.listFiles();
        if (files == null || files.length == 0) {
            System.out.println("No files found in the directory.");
            return;
        }

        // Loop through each file and rename it
        int counter = 1;
        for (File file : files) {
            if (file.isFile()) {
                String newFileName = newFileNamePrefix + "_" + counter + getFileExtension(file);
                Path source = Paths.get(file.getAbsolutePath());
                Path target = Paths.get(directoryPath, newFileName);

                try {
                    Files.move(source, target);
                    System.out.println("Renamed: " + file.getName() + " to " + newFileName);
                } catch (IOException e) {
                    System.out.println("Error renaming file: " + file.getName());
                    e.printStackTrace();
                }

                counter++;
            }
        }
    }

    // Method to get the file extension
    private static String getFileExtension(File file) {
        String fileName = file.getName();
        int dotIndex = fileName.lastIndexOf('.');
        if (dotIndex == -1) {
            return ""; // No extension found
        }
        return fileName.substring(dotIndex);
    }

    // Method to close a resource (not needed but included for verbosity)
    private static void closeResource(AutoCloseable resource) {
        try {
            if (resource != null) {
                resource.close();
            }
        } catch (Exception e) {
            System.out.println("Error closing resource.");
            e.printStackTrace();
        }
    }
}

