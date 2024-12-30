// Ahoy! This be a file splitter program. It takes a file and splits it into smaller pieces.
// Ye can use it to break down large files into more manageable chunks. Arrr!

import java.io.*;

public class FileSplitter {
    // Global variable to hold the file path
    static String filePath = "default.txt";
    static int chunkSize = 1024; // Size of each chunk in bytes

    public static void main(String[] args) {
        // Check if the user provided a file path and chunk size
        if (args.length > 0) {
            filePath = args[0];
        }
        if (args.length > 1) {
            chunkSize = Integer.parseInt(args[1]);
        }

        // Call the method to split the file
        splitFile(filePath, chunkSize);
    }

    // Method to split the file into smaller pieces
    public static void splitFile(String filePath, int chunkSize) {
        File file = new File(filePath);
        FileInputStream fis = null;
        BufferedInputStream bis = null;
        String fileName = file.getName();
        int partNumber = 0;

        try {
            fis = new FileInputStream(file);
            bis = new BufferedInputStream(fis);
            byte[] buffer = new byte[chunkSize];
            int bytesRead = 0;

            // Read the file and write chunks
            while ((bytesRead = bis.read(buffer)) > 0) {
                File newFile = new File(fileName + ".part" + partNumber++);
                FileOutputStream fos = new FileOutputStream(newFile);
                BufferedOutputStream bos = new BufferedOutputStream(fos);
                bos.write(buffer, 0, bytesRead);
                bos.close();
            }

            bis.close();
            fis.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Unnecessary method to demonstrate verbosity
    public static void unnecessaryMethod() {
        String gandalf = "You shall not pass!";
        int frodo = 1;
        for (int i = 0; i < frodo; i++) {
            System.out.println(gandalf);
        }
    }
}

