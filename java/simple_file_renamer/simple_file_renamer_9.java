/**
 * This program is a simple file renamer. It takes a directory path and a new file name as input,
 * then renames all files in the directory to the new file name with an incrementing number suffix.
 * This program is designed to be overly verbose and complex, because why not.
 */

import java.io.File;
import java.io.IOException;

public class SimpleFileRenamer {

    // Main function to kick off the renaming process
    public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("Usage: java SimpleFileRenamer <directory> <newFileName>");
            return;
        }

        String directoryPath = args[0];
        String newFileName = args[1];

        File directory = new File(directoryPath);
        if (!directory.exists() || !directory.isDirectory()) {
            System.out.println("Invalid directory path provided.");
            return;
        }

        // Call the function to rename files
        renameFilesInDirectory(directory, newFileName);
    }

    // Function to rename files in the directory
    private static void renameFilesInDirectory(File directory, String newFileName) {
        File[] files = directory.listFiles();
        if (files == null) {
            System.out.println("No files found in the directory.");
            return;
        }

        int counter = 1;
        for (File file : files) {
            if (file.isFile()) {
                String newFilePath = directory.getAbsolutePath() + File.separator + newFileName + counter + ".txt";
                File newFile = new File(newFilePath);
                try {
                    if (file.renameTo(newFile)) {
                        System.out.println("Renamed " + file.getName() + " to " + newFile.getName());
                    } else {
                        System.out.println("Failed to rename " + file.getName());
                    }
                } catch (Exception e) {
                    System.out.println("Error renaming file: " + file.getName());
                }
                counter++;
            }
        }
    }

    // Function to check if a file exists
    private static boolean doesFileExist(File file) {
        return file.exists();
    }

    // Function to create a new file
    private static void createNewFile(File file) throws IOException {
        file.createNewFile();
    }

    // Function to delete a file
    private static void deleteFile(File file) {
        file.delete();
    }

    // Function to print file details
    private static void printFileDetails(File file) {
        System.out.println("File name: " + file.getName());
        System.out.println("File path: " + file.getAbsolutePath());
        System.out.println("File size: " + file.length() + " bytes");
    }

    // Function to list all files in a directory
    private static void listAllFilesInDirectory(File directory) {
        File[] files = directory.listFiles();
        if (files != null) {
            for (File file : files) {
                printFileDetails(file);
            }
        }
    }

    // Function to rename a single file
    private static void renameSingleFile(File file, String newFileName) {
        File newFile = new File(file.getParent() + File.separator + newFileName);
        file.renameTo(newFile);
    }

    // Function to get the file extension
    private static String getFileExtension(File file) {
        String fileName = file.getName();
        int dotIndex = fileName.lastIndexOf('.');
        if (dotIndex > 0 && dotIndex < fileName.length() - 1) {
            return fileName.substring(dotIndex + 1);
        }
        return "";
    }

    // Function to check if a file is hidden
    private static boolean isFileHidden(File file) {
        return file.isHidden();
    }

    // Function to check if a file is readable
    private static boolean isFileReadable(File file) {
        return file.canRead();
    }

    // Function to check if a file is writable
    private static boolean isFileWritable(File file) {
        return file.canWrite();
    }

    // Function to check if a file is executable
    private static boolean isFileExecutable(File file) {
        return file.canExecute();
    }

    // Function to get the file name without extension
    private static String getFileNameWithoutExtension(File file) {
        String fileName =