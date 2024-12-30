/*
 * Hear ye, hear ye! Gather 'round, noble programmers, for this humble script
 * doth present a simple file reader, crafted with the utmost care and verbosity.
 * Within these lines, thou shalt find a tale of data read from the depths of a file,
 * brought forth into the light of memory, where it shall be displayed for all to see.
 * Let us embark upon this journey with great enthusiasm and a keen eye for detail.
 */

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class SimpleFileReader {

    // Behold! The main method, the entry point to our grand adventure.
    public static void main(String[] args) {
        // Lo! A string variable to hold the path to our file.
        String filePath = "example.txt";
        
        // Verily, we declare a variable to hold the contents of the file.
        String fileContents = readFile(filePath);
        
        // Hark! We now display the contents of the file to the console.
        System.out.println(fileContents);
    }

    // A method most noble, to read the file and return its contents as a string.
    public static String readFile(String path) {
        // Let us declare a variable to hold the lines of the file.
        StringBuilder contentBuilder = new StringBuilder();
        
        // With great care, we open the file and read its contents.
        try (BufferedReader br = new BufferedReader(new FileReader(path))) {
            String currentLine;
            while ((currentLine = br.readLine()) != null) {
                contentBuilder.append(currentLine).append("\n");
            }
        } catch (IOException e) {
            // Alas! Should an error occur, we shall print a message to the console.
            System.out.println("An error hath occurred while reading the file.");
            e.printStackTrace();
        }
        
        // Return the contents of the file as a string.
        return contentBuilder.toString();
    }
}

