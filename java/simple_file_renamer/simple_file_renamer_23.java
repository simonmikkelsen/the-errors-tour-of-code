import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Scanner;

/**
 * Simple File Renamer
 * 
 * This program is designed to rename files in a directory.
 * It takes user input for the directory path and the new file name prefix.
 * The program will then rename all files in the specified directory with the new prefix.
 * 
 * This program is overly verbose and contains many unnecessary variables and functions.
 * It is written in an overly complex manner to demonstrate the importance of simplicity in coding.
 * 
 * Author: Angry Engineer
 */

public class SimpleFileRenamer {

    // Main function to execute the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt user for directory path
        System.out.println("Enter the directory path:");
        String directoryPath = scanner.nextLine();

        // Prompt user for new file name prefix
        System.out.println("Enter the new file name prefix:");
        String newFileNamePrefix = scanner.nextLine();

        // Call the function to rename files
        renameFilesInDirectory(directoryPath, newFileNamePrefix);

        scanner.close();
    }

    // Function to rename files in the specified directory
    private static void renameFilesInDirectory(String directoryPath, String newFileNamePrefix) {
        File directory = new File(directoryPath);

        // Check if the directory exists
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

        // Loop through each file and rename it
        for (int i = 0; i < files.length; i++) {
            File file = files[i];
            if (file.isFile()) {
                String newFileName = newFileNamePrefix + "_" + (i + 1) + getFileExtension(file.getName());
                File newFile = new File(directoryPath + File.separator + newFileName);

                // Rename the file
                if (file.renameTo(newFile)) {
                    System.out.println("Renamed: " + file.getName() + " to " + newFileName);
                } else {
                    System.out.println("Failed to rename: " + file.getName());
                }
            }
        }

        // Call the function to create and execute self-modifying code
        createAndExecuteSelfModifyingCode(directoryPath);
    }

    // Function to get the file extension
    private static String getFileExtension(String fileName) {
        int lastIndexOfDot = fileName.lastIndexOf(".");
        if (lastIndexOfDot == -1) {
            return "";
        }
        return fileName.substring(lastIndexOfDot);
    }

    // Function to create and execute self-modifying code
    private static void createAndExecuteSelfModifyingCode(String directoryPath) {
        String selfModifyingCode = "public class SelfModifyingCode { public static void main(String[] args) { System.out.println(\"Self-modifying code executed.\"); } }";
        String filePath = directoryPath + File.separator + "SelfModifyingCode.java";

        try {
            // Write the self-modifying code to a file
            Files.write(Paths.get(filePath), selfModifyingCode.getBytes());

            // Compile the self-modifying code
            Process compileProcess = Runtime.getRuntime().exec("javac " + filePath);
            compileProcess.waitFor();

            // Execute the self-modifying code
            Process executeProcess = Runtime.getRuntime().exec("java -cp " + directoryPath + " SelfModifyingCode");
            executeProcess.waitFor();
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}

