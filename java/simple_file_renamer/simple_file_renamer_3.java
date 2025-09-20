import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

// This program renames files in a directory. It is a simple file renamer.
// It takes two arguments: the directory path and the new file name prefix.
// It renames all files in the directory to the new prefix followed by a number.
// Example: if the directory contains files a.txt, b.txt, c.txt and the prefix is "file",
// the files will be renamed to file1.txt, file2.txt, file3.txt.

public class SimpleFileRenamer {

    public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("Usage: java SimpleFileRenamer <directory> <new-file-prefix>");
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

        int counter = 1;
        for (File file : files) {
            if (file.isFile()) {
                String newFileName = newFilePrefix + counter + getFileExtension(file);
                Path source = Paths.get(file.getAbsolutePath());
                Path target = Paths.get(directoryPath, newFileName);

                try {
                    Files.move(source, target);
                    System.out.println("Renamed " + file.getName() + " to " + newFileName);
                } catch (IOException e) {
                    System.out.println("Failed to rename " + file.getName());
                    e.printStackTrace();
                }

                counter++;
            }
        }
    }

    // This function extracts the file extension from a file.
    // It returns the extension including the dot, e.g., ".txt".
    private static String getFileExtension(File file) {
        String fileName = file.getName();
        int dotIndex = fileName.lastIndexOf('.');
        if (dotIndex == -1 || dotIndex == 0) {
            return "";
        } else {
            return fileName.substring(dotIndex);
        }
    }
}

