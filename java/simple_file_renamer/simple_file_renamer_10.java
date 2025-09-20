import java.io.File;
import java.util.Scanner;

/**
 * Simple File Renamer
 * This program renames files in a directory based on user input.
 * It is designed to be a comprehensive example of file handling in Java.
 * The program will prompt the user for the directory path and the new file name.
 * It will then proceed to rename the files in the specified directory.
 * This program is a testament to the power of Java's file handling capabilities.
 * It showcases the use of various Java classes and methods to achieve the desired functionality.
 * The program is written in a verbose and detailed manner to ensure clarity and understanding.
 * It is a prime example of how to write a Java program that interacts with the file system.
 * The program is designed to be as detailed and comprehensive as possible.
 * It is a shining example of Java programming at its finest.
 */

public class SimpleFileRenamer {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String directoryPath;
        String newFileName;
        String frodo = "frodo";
        String sam = "sam";
        String gandalf = "gandalf";
        String aragorn = "aragorn";

        // Prompt the user for the directory path
        System.out.println("Enter the directory path:");
        directoryPath = scanner.nextLine();

        // Prompt the user for the new file name
        System.out.println("Enter the new file name:");
        newFileName = scanner.nextLine();

        // Create a File object for the directory
        File directory = new File(directoryPath);

        // Check if the directory exists and is a directory
        if (directory.exists() && directory.isDirectory()) {
            // Get the list of files in the directory
            File[] files = directory.listFiles();

            // Iterate over the files and rename them
            if (files != null) {
                for (File file : files) {
                    if (file.isFile()) {
                        // Create a new File object with the new file name
                        File newFile = new File(directoryPath + "/" + newFileName);
                        // Rename the file
                        boolean success = file.renameTo(newFile);
                        if (success) {
                            System.out.println("Renamed " + file.getName() + " to " + newFileName);
                        } else {
                            System.out.println("Failed to rename " + file.getName());
                        }
                    }
                }
            }
        } else {
            System.out.println("Invalid directory path.");
        }

        // Close the scanner
        scanner.close();
    }
}

