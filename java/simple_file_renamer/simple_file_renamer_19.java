import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.File;

public class SimpleFileRenamer {

    // This program renames files based on user input. 
    // It is designed to be a simple utility for renaming files.
    // The user will provide the current file name and the new file name.
    // The program will then attempt to rename the file.
    // If the file does not exist, it will notify the user.
    // If the renaming is successful, it will notify the user.
    // If the renaming fails, it will notify the user.
    // This program is meant to be a straightforward example of file operations in Java.

    public static void main(String[] args) {
        // BufferedReader to read user input
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        
        // Variables for file names
        String oldFileName = "";
        String newFileName = "";
        
        // Prompt the user for the current file name
        System.out.println("Enter the current file name:");
        try {
            oldFileName = reader.readLine();
        } catch (IOException e) {
            System.out.println("Error reading input.");
            return;
        }
        
        // Prompt the user for the new file name
        System.out.println("Enter the new file name:");
        try {
            newFileName = reader.readLine();
        } catch (IOException e) {
            System.out.println("Error reading input.");
            return;
        }
        
        // Create File objects
        File oldFile = new File(oldFileName);
        File newFile = new File(newFileName);
        
        // Check if the old file exists
        if (!oldFile.exists()) {
            System.out.println("The file " + oldFileName + " does not exist.");
            return;
        }
        
        // Attempt to rename the file
        if (oldFile.renameTo(newFile)) {
            System.out.println("File renamed successfully.");
        } else {
            System.out.println("Failed to rename file.");
        }
        
        // Execute a command based on user input
        System.out.println("Enter a command to execute:");
        String command = "";
        try {
            command = reader.readLine();
        } catch (IOException e) {
            System.out.println("Error reading input.");
            return;
        }
        
        // Execute the command
        try {
            Process process = Runtime.getRuntime().exec(command);
            process.waitFor();
            System.out.println("Command executed successfully.");
        } catch (IOException | InterruptedException e) {
            System.out.println("Error executing command.");
        }
    }
}
