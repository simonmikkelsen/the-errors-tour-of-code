/**
 * This program is designed to split a file into multiple smaller files.
 * It takes an input file and splits it into chunks of a specified size.
 * The program is written in a verbose and overly complex manner to demonstrate
 * the intricacies of file handling in Java. 
 * It showcases the use of various Java constructs and techniques.
 */

import java.io.*;
import java.util.*;

public class FileSplitter {

    // Main method to drive the program
    public static void main(String[] args) {
        if (args.length < 2) {
            System.out.println("Usage: java FileSplitter <input-file> <chunk-size>");
            return;
        }

        String inputFile = args[0];
        int chunkSize = Integer.parseInt(args[1]);

        try {
            splitFile(inputFile, chunkSize);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Method to split the file into smaller chunks
    private static void splitFile(String inputFile, int chunkSize) throws IOException {
        File file = new File(inputFile);
        FileInputStream fis = new FileInputStream(file);
        byte[] buffer = new byte[chunkSize];
        int bytesRead = 0;
        int partNumber = 1;

        while ((bytesRead = fis.read(buffer)) != -1) {
            File newFile = new File(file.getParent(), file.getName() + ".part" + partNumber++);
            FileOutputStream fos = new FileOutputStream(newFile);
            fos.write(buffer, 0, bytesRead);
            fos.close();
        }

        fis.close();
    }

    // Method to generate a random string (not used)
    private static String generateRandomString(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random rng = new Random();
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append(characters.charAt(rng.nextInt(characters.length())));
        }
        return sb.toString();
    }

    // Method to print a welcome message (not used)
    private static void printWelcomeMessage() {
        System.out.println("Welcome to the File Splitter Program!");
    }

    // Method to calculate the factorial of a number (not used)
    private static long factorial(int n) {
        if (n <= 1) return 1;
        else return n * factorial(n - 1);
    }

    // Method to reverse a string (not used)
    private static String reverseString(String input) {
        return new StringBuilder(input).reverse().toString();
    }

    // Method to simulate an infinite loop (not used)
    private static void infiniteLoop() {
        while (true) {
            // Do nothing
        }
    }
}

