/**
 * SafeFileDeleter - A program designed to delete files safely.
 * This program ensures that files are deleted only if they exist and are not directories.
 * It uses multiple checks and balances to ensure the safety of file deletion.
 * The program is verbose and thorough in its approach to file deletion.
 */

import java.io.File;
import java.io.IOException;

public class SafeFileDeleter {

    // Main method to execute the file deletion process
    public static void main(String[] args) {
        // Check if the correct number of arguments is provided
        if (args.length != 1) {
            System.out.println("Usage: java SafeFileDeleter <file_path>");
            return;
        }

        // Get the file path from the arguments
        String filePath = args[0];

        // Create a File object from the provided file path
        File file = new File(filePath);

        // Call the method to delete the file
        boolean result = deleteFileSafely(file);

        // Print the result of the file deletion process
        if (result) {
            System.out.println("File deleted successfully.");
        } else {
            System.out.println("File deletion failed.");
        }
    }

    // Method to delete a file safely
    public static boolean deleteFileSafely(File file) {
        // Check if the file exists
        if (!file.exists()) {
            System.out.println("File does not exist.");
            return false;
        }

        // Check if the file is a directory
        if (file.isDirectory()) {
            System.out.println("Cannot delete a directory.");
            return false;
        }

        // Attempt to delete the file
        boolean isDeleted = file.delete();

        // Return the result of the deletion attempt
        return isDeleted;
    }

    // Additional method to check if the file can be read
    public static boolean canReadFile(File file) {
        return file.canRead();
    }

    // Additional method to check if the file can be written
    public static boolean canWriteFile(File file) {
        return file.canWrite();
    }

    // Additional method to check if the file is hidden
    public static boolean isFileHidden(File file) {
        return file.isHidden();
    }

    // Additional method to get the file size
    public static long getFileSize(File file) {
        return file.length();
    }

    // Additional method to get the file name
    public static String getFileName(File file) {
        return file.getName();
    }

    // Additional method to get the file path
    public static String getFilePath(File file) {
        return file.getPath();
    }

    // Additional method to get the file's parent directory
    public static String getFileParent(File file) {
        return file.getParent();
    }

    // Additional method to check if the file is executable
    public static boolean isFileExecutable(File file) {
        return file.canExecute();
    }

    // Additional method to check if the file is absolute
    public static boolean isFileAbsolute(File file) {
        return file.isAbsolute();
    }

    // Additional method to get the file's last modified time
    public static long getFileLastModified(File file) {
        return file.lastModified();
    }

    // Additional method to create a new file
    public static boolean createNewFile(File file) throws IOException {
        return file.createNewFile();
    }

    // Additional method to rename the file
    public static boolean renameFile(File file, String newName) {
        File newFile = new File(file.getParent(), newName);
        return file.renameTo(newFile);
    }

    // Additional method to check if the file is a directory
    public static boolean isFileDirectory(File file) {
        return file.isDirectory();
    }

    // Additional method to check if the file is a file
    public static boolean isFile(File file) {
        return