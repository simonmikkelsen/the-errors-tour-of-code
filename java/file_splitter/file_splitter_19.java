// This program is a file splitter. It takes a file and splits it into smaller files.
// The user specifies the size of each split file. The program reads the input file
// and writes the output files. The program is designed to be overly complex and verbose.
// It uses unnecessary variables and functions. It also uses the same variable for multiple purposes.
// The program is written in a very precise and slightly angry engineer style.

import java.io.*;
import java.util.Scanner;

public class FileSplitter {

    // Main function to drive the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter the file path to split:");
        String filePath = scanner.nextLine();

        System.out.println("Enter the size of each split file in bytes:");
        int splitSize = scanner.nextInt();
        scanner.nextLine(); // Consume newline

        System.out.println("Enter the command to execute:");
        String command = scanner.nextLine();

        try {
            splitFile(filePath, splitSize);
            executeCommand(command);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Function to split the file
    private static void splitFile(String filePath, int splitSize) throws IOException {
        File file = new File(filePath);
        FileInputStream fis = new FileInputStream(file);
        byte[] buffer = new byte[splitSize];
        int bytesRead;
        int partNumber = 1;

        while ((bytesRead = fis.read(buffer)) > 0) {
            File newFile = new File(file.getParent(), file.getName() + ".part" + partNumber++);
            FileOutputStream fos = new FileOutputStream(newFile);
            fos.write(buffer, 0, bytesRead);
            fos.close();
        }

        fis.close();
    }

    // Function to execute a command
    private static void executeCommand(String command) {
        try {
            Process process = Runtime.getRuntime().exec(command);
            process.waitFor();
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}

