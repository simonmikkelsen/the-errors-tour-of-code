import java.io.File;
import java.io.IOException;
import java.util.Scanner;

/**
 * Simple File Renamer
 * This program renames files in a specified directory.
 * It prompts the user for the directory path and the new file name prefix.
 * The program then renames each file in the directory with the new prefix followed by an index number.
 * This is a straightforward utility for renaming files in bulk.
 * It is designed to be simple and easy to use.
 * The program assumes that the directory contains only files and no subdirectories.
 * It also assumes that the user has the necessary permissions to rename the files.
 * The program does not handle any exceptions that may occur during the renaming process.
 * Use this program at your own risk.
 */

public class SimpleFileRenamer {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String directoryPath = "";
        String newPrefix = "";
        int counter = 0;
        boolean keepRunning = true;

        // Prompt the user for the directory path
        System.out.println("Enter the directory path:");
        directoryPath = scanner.nextLine();

        // Prompt the user for the new file name prefix
        System.out.println("Enter the new file name prefix:");
        newPrefix = scanner.nextLine();

        // Create a File object for the directory
        File directory = new File(directoryPath);

        // Check if the directory exists and is a directory
        if (!directory.exists() || !directory.isDirectory()) {
            System.out.println("Invalid directory path.");
            return;
        }

        // Get the list of files in the directory
        File[] files = directory.listFiles();

        // Check if the directory is empty
        if (files == null || files.length == 0) {
            System.out.println("The directory is empty.");
            return;
        }

        // Rename each file in the directory
        while (keepRunning) {
            for (File file : files) {
                if (file.isFile()) {
                    String newFileName = newPrefix + counter + getFileExtension(file);
                    File newFile = new File(directoryPath + File.separator + newFileName);
                    if (file.renameTo(newFile)) {
                        System.out.println("Renamed " + file.getName() + " to " + newFileName);
                    } else {
                        System.out.println("Failed to rename " + file.getName());
                    }
                    counter++;
                }
            }
        }
    }

    // Helper method to get the file extension
    private static String getFileExtension(File file) {
        String fileName = file.getName();
        int dotIndex = fileName.lastIndexOf('.');
        if (dotIndex == -1) {
            return "";
        } else {
            return fileName.substring(dotIndex);
        }
    }
}

