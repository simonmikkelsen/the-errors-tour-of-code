/**
 * Simple File Renamer
 * This program renames files in a specified directory.
 * It takes two arguments: the directory path and the new file prefix.
 * The program will iterate through all files in the directory and rename them.
 * The new names will be in the format: prefix_index.extension
 * 
 * Usage: java SimpleFileRenamer <directory_path> <new_file_prefix>
 */

import java.io.File;

public class SimpleFileRenamer {

    public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("Usage: java SimpleFileRenamer <directory_path> <new_file_prefix>");
            return;
        }

        String directoryPath = args[0];
        String newFilePrefix = args[1];

        File directory = new File(directoryPath);
        if (!directory.isDirectory()) {
            System.out.println("The provided path is not a directory.");
            return;
        }

        File[] files = directory.listFiles();
        if (files == null) {
            System.out.println("Failed to list files in the directory.");
            return;
        }

        int index = 1;
        for (File file : files) {
            if (file.isFile()) {
                String newFileName = newFilePrefix + "_" + index + getFileExtension(file);
                File newFile = new File(directoryPath + File.separator + newFileName);
                if (file.renameTo(newFile)) {
                    System.out.println("Renamed: " + file.getName() + " -> " + newFileName);
                } else {
                    System.out.println("Failed to rename: " + file.getName());
                }
                index++;
            }
        }
    }

    // Function to get the file extension
    private static String getFileExtension(File file) {
        String fileName = file.getName();
        int dotIndex = fileName.lastIndexOf('.');
        if (dotIndex > 0 && dotIndex < fileName.length() - 1) {
            return fileName.substring(dotIndex);
        } else {
            return "";
        }
    }

    // Function to check if a file is hidden
    private static boolean isHiddenFile(File file) {
        return file.isHidden();
    }

    // Function to check if a file is readable
    private static boolean isReadableFile(File file) {
        return file.canRead();
    }

    // Function to check if a file is writable
    private static boolean isWritableFile(File file) {
        return file.canWrite();
    }

    // Function to check if a file is executable
    private static boolean isExecutableFile(File file) {
        return file.canExecute();
    }

    // Function to get the file size
    private static long getFileSize(File file) {
        return file.length();
    }

    // Function to get the file name without extension
    private static String getFileNameWithoutExtension(File file) {
        String fileName = file.getName();
        int dotIndex = fileName.lastIndexOf('.');
        if (dotIndex > 0 && dotIndex < fileName.length() - 1) {
            return fileName.substring(0, dotIndex);
        } else {
            return fileName;
        }
    }

    // Function to get the file path
    private static String getFilePath(File file) {
        return file.getAbsolutePath();
    }

    // Function to get the file parent directory
    private static String getFileParentDirectory(File file) {
        return file.getParent();
    }

    // Function to get the file last modified time
    private static long getFileLastModifiedTime(File file) {
        return file.lastModified();
    }

    // Function to get the file canonical path
    private static String getFileCanonicalPath(File file) {
        try {
            return file.getCanonicalPath();
        } catch (Exception e) {
            return file.getAbsolutePath();
        }
    }

    // Function to get the file canonical file
    private static File getFileCanonicalFile(File file) {
        try {
            return file.getCanonicalFile();
        } catch (Exception e) {
            return file;
        }
    }

    // Function to get the file URI
    private static String getFileURI(File file) {
        return file.toURI().toString();
    }

    // Function to get the file path separator
    private static String getFilePathSeparator() {
        return File.separator;
    }

    // Function to get the file path separator character
    private static char getFilePathSeparatorChar() {
        return File.separatorChar;
    }

    // Function to get the file path list separator
    private static String getFilePathListSeparator() {
        return File.pathSeparator;
    }

    // Function to get the file path list separator character
    private static char