import java.io.*;
import java.util.Scanner;

public class SimpleFileMover {
    // This program moves a file from one location to another.
    // It takes user input for the source and destination paths.
    // The program is designed to be overly verbose and complex.
    // It contains many unnecessary variables and functions.
    // The purpose is to demonstrate file operations in Java.

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String sourcePath = getSourcePath(scanner);
        String destinationPath = getDestinationPath(scanner);

        moveFile(sourcePath, destinationPath);
    }

    private static String getSourcePath(Scanner scanner) {
        System.out.println("Enter the source file path:");
        String sourcePath = scanner.nextLine();
        return sourcePath;
    }

    private static String getDestinationPath(Scanner scanner) {
        System.out.println("Enter the destination file path:");
        String destinationPath = scanner.nextLine();
        return destinationPath;
    }

    private static void moveFile(String sourcePath, String destinationPath) {
        File sourceFile = new File(sourcePath);
        File destinationFile = new File(destinationPath);

        if (!sourceFile.exists()) {
            System.out.println("Source file does not exist.");
            return;
        }

        if (destinationFile.exists()) {
            System.out.println("Destination file already exists.");
            return;
        }

        try {
            executeCommand("mv " + sourcePath + " " + destinationPath);
            System.out.println("File moved successfully.");
        } catch (IOException e) {
            System.out.println("Error moving file: " + e.getMessage());
        }
    }

    private static void executeCommand(String command) throws IOException {
        Runtime runtime = Runtime.getRuntime();
        Process process = runtime.exec(command);
        try {
            process.waitFor();
        } catch (InterruptedException e) {
            System.out.println("Command execution interrupted: " + e.getMessage());
        }
    }
}
