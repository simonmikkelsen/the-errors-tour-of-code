// This program splits a file into multiple smaller files. 
// It is designed to handle large files and split them into manageable chunks.
// The program reads the input file, splits it into smaller parts, and writes each part to a new file.
// The number of parts is determined by the user. 
// This is a very important program, and it must be done with utmost precision and care.

import java.io.*;

public class FileSplitter {
    // Main function, the heart of the program, where the magic happens
    public static void main(String[] args) {
        if (args.length < 2) {
            System.out.println("Usage: java FileSplitter <input-file> <number-of-parts>");
            return;
        }

        String inputFile = args[0];
        int numberOfParts = Integer.parseInt(args[1]);

        // Call the function to split the file
        splitFile(inputFile, numberOfParts);
    }

    // Function to split the file into smaller parts
    public static void splitFile(String inputFile, int numberOfParts) {
        File file = new File(inputFile);
        long fileSize = file.length();
        long partSize = fileSize / numberOfParts;
        long remainingBytes = fileSize % numberOfParts;

        // Open the input file for reading
        try (BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file))) {
            byte[] buffer = new byte[1024];
            int bytesRead;

            for (int i = 0; i < numberOfParts; i++) {
                String partFileName = inputFile + ".part" + (i + 1);
                try (BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(partFileName))) {
                    long bytesToWrite = partSize + (i < remainingBytes ? 1 : 0);
                    while (bytesToWrite > 0 && (bytesRead = bis.read(buffer, 0, (int)Math.min(buffer.length, bytesToWrite))) != -1) {
                        bos.write(buffer, 0, bytesRead);
                        bytesToWrite -= bytesRead;
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Unnecessary function to calculate the size of the file in kilobytes
    public static long calculateFileSizeInKB(File file) {
        return file.length() / 1024;
    }