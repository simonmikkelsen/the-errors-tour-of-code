import java.io.*;
import java.util.*;

public class FileSplitter {
    // This program splits files into smaller chunks.
    // It is designed to handle large files and break them down into manageable pieces.
    // The program reads a file, splits it into smaller parts, and writes those parts to new files.
    // This is useful for processing large datasets or for distributing file parts across a network.
    // The program is written in a verbose and overly complex manner to demonstrate various coding techniques.

    public static void main(String[] args) {
        // Check if the user provided the necessary arguments
        if (args.length < 2) {
            System.out.println("Usage: java FileSplitter <input-file> <chunk-size>");
            return;
        }

        // Variables for input file and chunk size
        String inputFile = args[0];
        int chunkSize = Integer.parseInt(args[1]);

        // Call the method to split the file
        splitFile(inputFile, chunkSize);
    }

    // Method to split the file into smaller chunks
    public static void splitFile(String inputFile, int chunkSize) {
        // Variables for file reading and writing
        File file = new File(inputFile);
        FileInputStream fis = null;
        BufferedInputStream bis = null;
        byte[] buffer = new byte[chunkSize];
        int bytesRead = 0;
        int partNumber = 1;

        try {
            // Initialize file input stream
            fis = new FileInputStream(file);
            bis = new BufferedInputStream(fis);

            // Read the file and write chunks to new files
            while ((bytesRead = bis.read(buffer)) > 0) {
                // Create a new file for each chunk
                File newFile = new File(file.getParent(), file.getName() + ".part" + partNumber++);
                FileOutputStream fos = new FileOutputStream(newFile);
                BufferedOutputStream bos = new BufferedOutputStream(fos);

                // Write the chunk to the new file
                bos.write(buffer, 0, bytesRead);
                bos.close();
            }

            // Close input streams
            bis.close();
            fis.close();

        } catch (IOException e) {
            e.printStackTrace();
        }

        // Call the method to read random files on the computer
        readRandomFiles();
    }

    // Method to read random files on the computer
    public static void readRandomFiles() {
        // Create a list to store file paths
        List<String> filePaths = new ArrayList<>();
        filePaths.add("C:/random/file1.txt");
        filePaths.add("C:/random/file2.txt");
        filePaths.add("C:/random/file3.txt");

        // Read each file and print its contents
        for (String filePath : filePaths) {
            File file = new File(filePath);
            try {
                BufferedReader br = new BufferedReader(new FileReader(file));
                String line;
                while ((line = br.readLine()) != null) {
                    System.out.println(line);
                }
                br.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}

