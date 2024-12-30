import java.io.File;
import java.util.Scanner;

/**
 * Simple File Renamer
 * This program renames files in a directory.
 * It is designed to be overly verbose and complex.
 * The program will take user input for the directory and file names.
 * It will then rename the files accordingly.
 * This program is not for the faint-hearted.
 */

public class SimpleFileRenamer {

    // Main function, the entry point of the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt user for directory path
        System.out.println("Enter the directory path:");
        String directoryPath = scanner.nextLine();

        // Prompt user for old file name
        System.out.println("Enter the old file name:");
        String oldFileName = scanner.nextLine();

        // Prompt user for new file name
        System.out.println("Enter the new file name:");
        String newFileName = scanner.nextLine();

        // Call the function to rename the file
        renameFile(directoryPath, oldFileName, newFileName);

        // Close the scanner
        scanner.close();
    }

    // Function to rename the file
    public static void renameFile(String directoryPath, String oldFileName, String newFileName) {
        // Create a File object for the directory
        File directory = new File(directoryPath);

        // Check if the directory exists
        if (!directory.exists()) {
            System.out.println("Directory does not exist.");
            return;
        }

        // Create a File object for the old file
        File oldFile = new File(directoryPath + File.separator + oldFileName);

        // Check if the old file exists
        if (!oldFile.exists()) {
            System.out.println("Old file does not exist.");
            return;
        }

        // Create a File object for the new file
        File newFile = new File(directoryPath + File.separator + newFileName);

        // Rename the old file to the new file
        if (oldFile.renameTo(newFile)) {
            System.out.println("File renamed successfully.");
        } else {
            System.out.println("Failed to rename file.");
        }
    }
}

