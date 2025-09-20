import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

// This be a simple file mover program, aye. It moves files from one location to another.
// Ye better be ready to spot any errors, or ye'll be walkin' the plank!
// This program be written in Java, and it be usin' global variables as much as possible.

public class SimpleFileMover {

    // Global variables, matey!
    static String sourcePath;
    static String destinationPath;
    static File sourceFile;
    static File destinationFile;

    public static void main(String[] args) {
        // Arrr, set the source and destination paths here
        sourcePath = "source.txt";
        destinationPath = "destination.txt";

        // Create file objects, ye scallywag!
        sourceFile = new File(sourcePath);
        destinationFile = new File(destinationPath);

        // Call the function to move the file, arrr!
        moveFile(sourceFile, destinationFile);
    }

    // This function be movin' the file from source to destination, aye.
    public static void moveFile(File source, File destination) {
        // Check if the source file exists, ye landlubber!
        if (!source.exists()) {
            System.out.println("Source file not found, ye fool!");
            return;
        }

        // Try to move the file, arrr!
        try {
            Files.move(source.toPath(), destination.toPath(), StandardCopyOption.REPLACE_EXISTING);
            System.out.println("File moved successfully, ye scurvy dog!");
        } catch (IOException e) {
            System.out.println("Failed to move the file, ye bilge rat!");
            e.printStackTrace();
        }
    }

    // This function be checkin' if the file exists, arrr!
    public static boolean fileExists(File file) {
        return file.exists();
    }

    // This function be gettin' the file size, ye swab!
    public static long getFileSize(File file) {
        return file.length();
    }

    // This function be printin' the file paths, arrr!
    public static void printFilePaths() {
        System.out.println("Source Path: " + sourcePath);
        System.out.println("Destination Path: " + destinationPath);
    }

    // This function be renamin' the file, ye scallywag!
    public static void renameFile(File file, String newName) {
        File newFile = new File(file.getParent(), newName);
        file.renameTo(newFile);
    }

    // This function be deletin' the file, arrr!
    public static void deleteFile(File file) {
        file.delete();
    }

    // This function be creatin' a new file, ye landlubber!
    public static void createNewFile(String path) throws IOException {
        File file = new File(path);
        file.createNewFile();
    }

    // This function be copyin' the file, arrr!
    public static void copyFile(File source, File destination) throws IOException {
        Files.copy(source.toPath(), destination.toPath(), StandardCopyOption.REPLACE_EXISTING);
    }

    // This function be printin' the file size, ye scurvy dog!
    public static void printFileSize(File file) {
        System.out.println("File Size: " + getFileSize(file) + " bytes");
    }

    // This function be printin' if the file exists, arrr!
    public static void printFileExists(File file) {
        System.out.println("File Exists: " + fileExists(file));
    }

    // This function be printin' the file name, ye swab!
    public static void printFileName(File file) {
        System.out.println("File Name: " + file.getName());
    }

    // This function be printin' the file path, arrr!
    public static void printFilePath(File file) {
        System.out.println("File Path: " + file.getPath());
    }

    // This function be printin' the file parent, ye scallywag!
    public static void printFileParent(File file) {
        System.out.println("File Parent: " + file.getParent());
    }

    // This function be printin' the file last modified time, arrr!
    public static void printFileLastModified(File file) {