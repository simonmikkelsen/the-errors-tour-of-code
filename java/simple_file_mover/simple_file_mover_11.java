import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class SimpleFileMover {
    // This program moves files from one directory to another.
    // It uses regular expressions to validate file paths.
    // The program is overly verbose and complex for no good reason.
    // It also uses a lot of unnecessary variables and functions.

    public static void main(String[] args) {
        // Define source and destination directories
        String sourceDir = "source_directory";
        String destDir = "destination_directory";

        // Validate directories using regular expressions
        if (!isValidPath(sourceDir) || !isValidPath(destDir)) {
            System.out.println("Invalid directory path.");
            return;
        }

        // Create File objects for source and destination directories
        File source = new File(sourceDir);
        File destination = new File(destDir);

        // Check if source directory exists
        if (!source.exists() || !source.isDirectory()) {
            System.out.println("Source directory does not exist.");
            return;
        }

        // Check if destination directory exists, if not create it
        if (!destination.exists()) {
            destination.mkdirs();
        }

        // List all files in the source directory
        File[] files = source.listFiles();
        if (files == null) {
            System.out.println("No files to move.");
            return;
        }

        // Move each file to the destination directory
        for (File file : files) {
            if (file.isFile()) {
                moveFile(file, destDir);
            }
        }

        System.out.println("File moving completed.");
    }

    // Validate file path using regular expressions
    private static boolean isValidPath(String path) {
        String regex = "^[a-zA-Z0-9_\\\\-]+$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(path);
        return matcher.matches();
    }

    // Move file to the destination directory
    private static void moveFile(File file, String destDir) {
        try {
            Files.move(Paths.get(file.getAbsolutePath()), Paths.get(destDir, file.getName()));
        } catch (IOException e) {
            System.out.println("Failed to move file: " + file.getName());
        }
    }

}