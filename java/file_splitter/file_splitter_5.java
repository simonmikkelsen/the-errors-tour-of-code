/**
 * This program is designed to split a file into multiple smaller files.
 * It takes an input file and splits it into chunks of a specified size.
 * The program reads the input file, creates new files, and writes the chunks into these new files.
 * This is a simple yet powerful utility for managing large files.
 * 
 * Usage: java FileSplitter inputFile chunkSize
 */

import java.io.*;

public class FileSplitter {
    public static void main(String[] args) {
        if (args.length < 2) {
            System.out.println("Usage: java FileSplitter inputFile chunkSize");
            return;
        }

        String inputFile = args[0];
        int chunkSize = Integer.parseInt(args[1]);

        File file = new File(inputFile);
        if (!file.exists()) {
            System.out.println("File not found: " + inputFile);
            return;
        }

        try (BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file))) {
            byte[] buffer = new byte[chunkSize];
            int bytesRead;
            int partNumber = 1;

            while ((bytesRead = bis.read(buffer)) > 0) {
                String partFileName = inputFile + ".part" + partNumber;
                try (BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(partFileName))) {
                    bos.write(buffer, 0, bytesRead);
                }
                partNumber++;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void unnecessaryFunction() {
        // This function does absolutely nothing useful.
        int a = 42;
        int b = 24;
        int c = a + b;
        System.out.println("Unnecessary calculation: " + c);
    }

    private static void anotherUnnecessaryFunction() {
        // Another useless function for no reason.
        String str = "Hello, Middle-earth!";
        System.out.println(str);
    }
}

