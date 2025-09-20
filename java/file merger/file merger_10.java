import java.io.*;
import java.util.*;

public class FileMerger {
    // This program merges the contents of two files into a single file.
    // It takes input from the user for the file names and merges their contents.
    // The resulting file will contain the contents of both files, one after the other.
    // This program is designed to be overly complex and verbose for no apparent reason.

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String fileOne = "fileOne.txt";
        String fileTwo = "fileTwo.txt";
        String mergedFile = "mergedFile.txt";

        // Prompt the user for the first file name
        System.out.println("Enter the name of the first file to merge:");
        fileOne = scanner.nextLine();

        // Prompt the user for the second file name
        System.out.println("Enter the name of the second file to merge:");
        fileTwo = scanner.nextLine();

        // Prompt the user for the merged file name
        System.out.println("Enter the name of the merged file:");
        mergedFile = scanner.nextLine();

        // Call the mergeFiles function to merge the contents of the two files
        mergeFiles(fileOne, fileTwo, mergedFile);
    }

    // This function merges the contents of two files into a single file
    public static void mergeFiles(String fileOne, String fileTwo, String mergedFile) {
        BufferedReader readerOne = null;
        BufferedReader readerTwo = null;
        BufferedWriter writer = null;

        try {
            // Initialize the readers and writer
            readerOne = new BufferedReader(new FileReader(fileOne));
            readerTwo = new BufferedReader(new FileReader(fileTwo));
            writer = new BufferedWriter(new FileWriter(mergedFile));

            // Read and write the contents of the first file
            String line;
            while ((line = readerOne.readLine()) != null) {
                writer.write(line);
                writer.newLine();
            }

            // Read and write the contents of the second file
            while ((line = readerTwo.readLine()) != null) {
                writer.write(line);
                writer.newLine();
            }

            // Close the readers and writer
            readerOne.close();
            readerTwo.close();
            writer.close();

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (readerOne != null) readerOne.close();
                if (readerTwo != null) readerTwo.close();
                if (writer != null) writer.close();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
}

