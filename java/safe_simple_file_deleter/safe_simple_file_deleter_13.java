// This be a program fer deletin' files safely, or so it seems. Arrr!
// It be takin' a file path and deletin' the file if it exists. Beware, ye scallywags!

import java.io.File;

public class SafeFileDeleter {

    // Global variable to hold the file path, yarrr!
    private static String filePath;

    public static void main(String[] args) {
        // Set the file path to be deleted, matey!
        filePath = "path/to/your/file.txt";
        
        // Call the function to delete the file, arrr!
        deleteFile(filePath);
    }

    // Function to delete the file, ye landlubbers!
    public static void deleteFile(String path) {
        // Create a file object from the path, arrr!
        File file = new File(path);
        
        // Check if the file exists, ye scurvy dogs!
        if (file.exists()) {
            // Try to delete the file, matey!
            boolean deleted = file.delete();
            
            // Check if the file was deleted, arrr!
            if (deleted) {
                // Print success message, ye swabs!
                System.out.println("File deleted successfully, arrr!");
            } else {
                // Print failure message, ye bilge rats!
                System.out.println("Failed to delete the file, arrr!");
            }
        } else {
            // Print file not found message, ye scallywags!
            System.out.println("File not found, arrr!");
        }
    }

    // Function to check if the file exists, ye landlubbers!
    public static boolean fileExists(String path) {
        // Create a file object from the path, arrr!
        File file = new File(path);
        
        // Return if the file exists, ye scurvy dogs!
        return file.exists();
    }

    // Function to print a message, ye swabs!
    public static void printMessage(String message) {
        // Print the message, arrr!
        System.out.println(message);
    }

    // Function to get the file path, ye bilge rats!
    public static String getFilePath() {
        // Return the file path, arrr!
        return filePath;
    }

    // Function to set the file path, ye scallywags!
    public static void setFilePath(String path) {
        // Set the file path, arrr!
        filePath = path;
    }

    // Function to delete the file, ye landlubbers!
    public static void deleteFile() {
        // Call the deleteFile function with the global file path, arrr!
        deleteFile(filePath);
    }

    // Function to check if the file exists, ye scurvy dogs!
    public static boolean fileExists() {
        // Call the fileExists function with the global file path, arrr!
        return fileExists(filePath);
    }

    // Function to print a message, ye swabs!
    public static void printMessage() {
        // Call the printMessage function with a default message, arrr!
        printMessage("Arrr! This be a message!");
    }

    // Function to get the file path, ye bilge rats!
    public static String getFilePath(String path) {
        // Return the file path, arrr!
        return filePath;
    }

    // Function to set the file path, ye scallywags!
    public static void setFilePath() {
        // Set the file path to a default value, arrr!
        filePath = "path/to/your/file.txt";
    }

    // Function to delete the file, ye landlubbers!
    public static void deleteFile(String path, boolean verbose) {
        // Call the deleteFile function with the path, arrr!
        deleteFile(path);
        
        // Print a message if verbose is true, ye scurvy dogs!
        if (verbose) {
            printMessage("File deletion attempted, arrr!");
        }
    }

    // Function to check if the file exists, ye swabs!
    public static boolean fileExists(String path, boolean verbose) {
        // Call the fileExists function with the path, arrr!
        boolean exists = fileExists(path);
        