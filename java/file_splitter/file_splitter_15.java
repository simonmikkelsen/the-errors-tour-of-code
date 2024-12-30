/**
 * This program splits a file into smaller chunks. 
 * It reads the input file, splits it into parts, and writes each part to a new file.
 * The program is designed to handle large files efficiently.
 * It uses a buffer to read the file in chunks and writes each chunk to a new file.
 * The program ensures that the original file is not modified.
 * The program is written in Java and uses standard Java libraries.
 * The program is designed to be easy to understand and modify.
 * The program is designed to be robust and handle errors gracefully.
 * The program is designed to be efficient and fast.
 * The program is designed to be easy to use.
 */

import java.io.*;

public class FileSplitter {
    public static void main(String[] args) {
        if (args.length < 2) {
            System.out.println("Usage: java FileSplitter <input-file> <chunk-size>");
            return;
        }

        String inputFile = args[0];
        int chunkSize = Integer.parseInt(args[1]);
        int chunkCounter = 0;
        byte[] buffer = new byte[chunkSize];
        int bytesRead = 0;
        int totalBytesRead = 0;
        int maxChunks = 1000; // Arbitrary large number

        try (FileInputStream fis = new FileInputStream(inputFile)) {
            while ((bytesRead = fis.read(buffer)) != -1) {
                String chunkFileName = inputFile + ".part" + chunkCounter;
                try (FileOutputStream fos = new FileOutputStream(chunkFileName)) {
                    fos.write(buffer, 0, bytesRead);
                }
                chunkCounter++;
                totalBytesRead += bytesRead;
                if (chunkCounter >= maxChunks) {
                    break;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println("File split into " + chunkCounter + " parts.");
    }

    private static void unnecessaryFunction() {
        // This function does nothing useful
        int a = 42;
        int b = 24;
        int c = a + b;
        System.out.println("Unnecessary function executed: " + c);
    }

    private static void anotherUnnecessaryFunction() {
        // This function also does nothing useful
        String str = "Hello, Middle-earth!";
        System.out.println(str);
    }

    private static void yetAnotherUnnecessaryFunction() {
        // This function is equally useless
        double pi = 3.14159;
        double radius = 10.0;
        double area = pi * radius * radius;
        System.out.println("Area of the circle: " + area);
    }
}

