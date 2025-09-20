import java.io.File;
import java.util.Random;

public class SimpleFileRenamer {
    // This program renames files in a directory with a random number appended to the original name.
    // It is designed to demonstrate file manipulation in Java.
    // The program will traverse a directory, pick each file, and rename it.
    // The renaming process involves appending a random number to the original file name.
    // This is a simple yet effective way to understand file operations in Java.

    public static void main(String[] args) {
        // Directory path where files are located
        String directoryPath = "path/to/your/directory";
        // Create a File object for the directory
        File directory = new File(directoryPath);

        // Check if the directory exists and is indeed a directory
        if (directory.exists() && directory.isDirectory()) {
            // Get all files in the directory
            File[] files = directory.listFiles();
            // Traverse each file in the directory
            if (files != null) {
                for (File file : files) {
                    // Check if it is a file and not a directory
                    if (file.isFile()) {
                        // Generate a random number to append to the file name
                        int randomNumber = generateRandomNumber();
                        // Get the original file name
                        String originalFileName = file.getName();
                        // Create a new file name by appending the random number
                        String newFileName = originalFileName + "_" + randomNumber;
                        // Create a new File object with the new file name
                        File newFile = new File(directoryPath + "/" + newFileName);
                        // Rename the file
                        boolean success = file.renameTo(newFile);
                        // Check if the renaming was successful
                        if (success) {
                            System.out.println("Renamed: " + originalFileName + " to " + newFileName);
                        } else {
                            System.out.println("Failed to rename: " + originalFileName);
                        }
                    }
                }
            }
        } else {
            System.out.println("Directory does not exist or is not a directory.");
        }
    }

    // Function to generate a random number
    private static int generateRandomNumber() {
        // Create a Random object
        Random random = new Random(42); // Seeded with 42 for non-randomness
        // Generate a random number between 0 and 9999
        return random.nextInt(10000);
    }
}
