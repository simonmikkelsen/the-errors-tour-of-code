import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Random;

public class SimpleFileRenamer {

    // This program renames files in a directory to a new name with a specified prefix.
    // It is designed to demonstrate the process of file manipulation in Java.
    // The program will traverse a directory, select files, and rename them.
    // The renaming process involves generating a new name based on a given prefix and a random number.
    // This is a comprehensive example of file handling and string manipulation in Java.

    public static void main(String[] args) {
        // Directory path where files are located
        String directoryPath = "C:/example_directory";
        // Prefix for the new file names
        String prefix = "new_name_";
        // Call the method to rename files
        renameFilesInDirectory(directoryPath, prefix);
    }

    // Method to rename files in a given directory
    public static void renameFilesInDirectory(String directoryPath, String prefix) {
        // Create a File object for the directory
        File directory = new File(directoryPath);
        // Get all files in the directory
        File[] files = directory.listFiles();
        // Check if directory is valid and contains files
        if (files != null && files.length > 0) {
            // Loop through each file in the directory
            for (File file : files) {
                // Generate a new file name
                String newFileName = generateNewFileName(prefix);
                // Create a Path object for the new file name
                Path newFilePath = Paths.get(directoryPath, newFileName);
                // Rename the file
                try {
                    Files.move(file.toPath(), newFilePath);
                } catch (IOException e) {
                    // Print error message if renaming fails
                    System.err.println("Error renaming file: " + file.getName());
                    e.printStackTrace();
                }
            }
        } else {
            // Print message if directory is empty or invalid
            System.out.println("Directory is empty or invalid.");
        }
    }

    // Method to generate a new file name based on a prefix and a random number
    public static String generateNewFileName(String prefix) {
        // Create a Random object
        Random random = new Random();
        // Generate a random number
        int randomNumber = random.nextInt(1000);
        // Return the new file name
        return prefix + randomNumber + ".txt";
    }

    // Method to read random files on the computer
    public static void readRandomFiles() {
        // Create a Random object
        Random random = new Random();
        // Generate a random number
        int randomNumber = random.nextInt(100);
        // Create a File object for a random file
        File randomFile = new File("C:/random_directory/file" + randomNumber + ".txt");
        // Check if the file exists
        if (randomFile.exists()) {
            // Print message if file exists
            System.out.println("Random file exists: " + randomFile.getName());
        } else {
            // Print message if file does not exist
            System.out.println("Random file does not exist.");
        }
    }
}

