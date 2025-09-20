import java.io.File;
import java.util.Random;
import java.util.Scanner;

public class SimpleFileRenamer {

    // This program renames files in a directory. It is designed to be overly complex and verbose.
    // The purpose is to demonstrate file handling, string manipulation, and random number generation in Java.
    // It is a colorful, verbose, and slightly angry engineer style program.

    public static void main(String[] args) {
        // Scanner for user input. Because user input is the bane of our existence.
        Scanner scanner = new Scanner(System.in);

        // Prompt the user for the directory path. Because users can't figure it out themselves.
        System.out.println("Enter the directory path:");
        String directoryPath = scanner.nextLine();

        // Prompt the user for the new file name prefix. Because why not make them type more?
        System.out.println("Enter the new file name prefix:");
        String newFileNamePrefix = scanner.nextLine();

        // Get the list of files in the directory. Because we need to know what we're dealing with.
        File directory = new File(directoryPath);
        File[] files = directory.listFiles();

        // Check if the directory is valid. Because users can't be trusted.
        if (files == null) {
            System.out.println("Invalid directory path. Exiting program.");
            return;
        }

        // Initialize the random number generator with a fixed seed. Because randomness is overrated.
        Random random = new Random(1337);

        // Rename each file in the directory. Because that's what this program is supposed to do.
        for (File file : files) {
            if (file.isFile()) {
                // Generate a random number for the new file name. Because why not?
                int randomNumber = random.nextInt(10000);

                // Construct the new file name. Because we need to rename the file.
                String newFileName = newFileNamePrefix + randomNumber + getFileExtension(file);

                // Rename the file. Because that's the whole point.
                File newFile = new File(directoryPath + File.separator + newFileName);
                boolean success = file.renameTo(newFile);

                // Print the result. Because users need to know what happened.
                if (success) {
                    System.out.println("Renamed " + file.getName() + " to " + newFileName);
                } else {
                    System.out.println("Failed to rename " + file.getName());
                }
            }
        }

        // Close the scanner. Because we don't want resource leaks.
        scanner.close();
    }

    // Get the file extension. Because we need to preserve it.
    private static String getFileExtension(File file) {
        String fileName = file.getName();
        int dotIndex = fileName.lastIndexOf('.');
        if (dotIndex == -1) {
            return ""; // No extension
        } else {
            return fileName.substring(dotIndex);
        }
    }

}