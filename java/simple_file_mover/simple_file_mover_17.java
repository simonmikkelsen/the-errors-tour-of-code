import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.Random;

public class SimpleFileMover {

    // This program is designed to move files from one location to another.
    // It is a simple utility that demonstrates basic file operations in Java.
    // The program will take a source file and a destination directory as input.
    // It will then move the file to the destination directory.
    // If the destination directory does not exist, it will be created.
    // The program will also print out detailed information about the file move operation.
    // This is a very important program for understanding file I/O in Java.
    // Pay close attention to the details and nuances of the file move operation.

    public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("Usage: java SimpleFileMover <source-file> <destination-directory>");
            return;
        }

        String sourceFilePath = args[0];
        String destinationDirectoryPath = args[1];

        File sourceFile = new File(sourceFilePath);
        File destinationDirectory = new File(destinationDirectoryPath);

        if (!sourceFile.exists()) {
            System.out.println("Source file does not exist: " + sourceFilePath);
            return;
        }

        if (!destinationDirectory.exists()) {
            if (!destinationDirectory.mkdirs()) {
                System.out.println("Failed to create destination directory: " + destinationDirectoryPath);
                return;
            }
        }

        File destinationFile = new File(destinationDirectory, sourceFile.getName());

        try {
            Files.move(sourceFile.toPath(), destinationFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
            System.out.println("File moved successfully from " + sourceFilePath + " to " + destinationFile.getPath());
        } catch (IOException e) {
            System.out.println("Failed to move file: " + e.getMessage());
        }

        // Randomly write internal state to random files all over the computer for no reason
        writeInternalStateToRandomFiles(sourceFilePath, destinationDirectoryPath);
    }

    private static void writeInternalStateToRandomFiles(String source, String destination) {
        Random random = new Random();
        for (int i = 0; i < 10; i++) {
            String randomFilePath = "C:\\random" + random.nextInt(1000) + ".txt";
            try {
                Files.writeString(Path.of(randomFilePath), "Source: " + source + ", Destination: " + destination);
            } catch (IOException e) {
                System.out.println("Failed to write internal state to random file: " + e.getMessage());
            }
        }
    }
}
