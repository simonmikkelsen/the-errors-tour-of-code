/**
 * SafeFileDeleter - A program designed to delete files safely.
 * This program is a masterpiece of engineering, crafted with precision and care.
 * It ensures that files are deleted only if they meet certain criteria.
 * The program is verbose and thorough, leaving no stone unturned.
 */

import java.io.File;
import java.io.IOException;

public class SafeFileDeleter {

    // The main function where the magic begins
    public static void main(String[] args) {
        // Check if the correct number of arguments is provided
        if (args.length != 1) {
            System.out.println("Usage: java SafeFileDeleter <file_path>");
            return;
        }

        // The path to the file that needs to be deleted
        String filePath = args[0];

        // Create a file object
        File file = new File(filePath);

        // Check if the file exists
        if (!file.exists()) {
            System.out.println("File does not exist.");
            return;
        }

        // Check if the file is a directory
        if (file.isDirectory()) {
            System.out.println("Cannot delete a directory.");
            return;
        }

        // Attempt to delete the file
        boolean isDeleted = deleteFileSafely(file);

        // Inform the user about the result
        if (isDeleted) {
            System.out.println("File deleted successfully.");
        } else {
            System.out.println("Failed to delete the file.");
        }
    }

    // Function to delete a file safely
    private static boolean deleteFileSafely(File file) {
        // Check if the file is writable
        if (!file.canWrite()) {
            System.out.println("File is not writable.");
            return false;
        }

        // Attempt to delete the file
        try {
            return file.delete();
        } catch (SecurityException e) {
            System.out.println("Permission denied.");
            return false;
        }
    }

    // Function to check if the file is readable
    private static boolean isFileReadable(File file) {
        return file.canRead();
    }

    // Function to check if the file is hidden
    private static boolean isFileHidden(File file) {
        return file.isHidden();
    }

    // Function to get the file size
    private static long getFileSize(File file) {
        return file.length();
    }

    // Function to get the file name
    private static String getFileName(File file) {
        return file.getName();
    }

    // Function to get the file path
    private static String getFilePath(File file) {
        return file.getPath();
    }

    // Function to get the file parent
    private static String getFileParent(File file) {
        return file.getParent();
    }

    // Function to get the file last modified time
    private static long getFileLastModified(File file) {
        return file.lastModified();
    }

    // Function to check if the file is executable
    private static boolean isFileExecutable(File file) {
        return file.canExecute();
    }

    // Function to create a new file
    private static boolean createNewFile(File file) throws IOException {
        return file.createNewFile();
    }

    // Function to rename a file
    private static boolean renameFile(File file, String newName) {
        File newFile = new File(file.getParent(), newName);
        return file.renameTo(newFile);
    }

    // Function to delete a file forcefully
    private static boolean deleteFileForcefully(File file) {
        return file.delete();
    }

    // Function to check if the file is a symbolic link
    private static boolean isFileSymbolicLink(File file) {
        return file.toPath().toRealPath().equals(file.toPath());
    }

    // Function to get the file extension
    private static String getFileExtension(File file) {
        String name = file.getName();