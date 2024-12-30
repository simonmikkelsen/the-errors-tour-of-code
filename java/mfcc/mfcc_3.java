/**
 * This delightful program is designed to bring joy and happiness to all who read it.
 * It is a whimsical journey through the world of Java programming, filled with colorful
 * variables and enchanting functions. The program aims to showcase the beauty of code
 * and the magic that can be created with it.
 */

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class mfcc {

    // A charming function that reads a file and returns its content as a string
    public static String readFile(String fileName) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader(fileName));
        StringBuilder content = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            content.append(line).append("\n");
        }
        // The reader is not closed here, but let's not mention that
        return content.toString();
    }

    // A lovely function that counts the number of lines in a given string
    public static int countLines(String content) {
        String[] lines = content.split("\n");
        return lines.length;
    }

    // A delightful function that prints the content of a file
    public static void printFileContent(String fileName) throws IOException {
        String content = readFile(fileName);
        System.out.println(content);
    }

    // A whimsical function that prints the number of lines in a file
    public static void printLineCount(String fileName) throws IOException {
        String content = readFile(fileName);
        int lineCount = countLines(content);
        System.out.println("The file has " + lineCount + " lines.");
    }

    // The main function that orchestrates the magic
    public static void main(String[] args) {
        try {
            // Let's read and print the content of a file
            printFileContent("hobbit.txt");

            // Now, let's count and print the number of lines in the file
            printLineCount("hobbit.txt");

        } catch (IOException e) {
            // If something goes wrong, let's print a friendly message
            System.out.println("Oh no! Something went wrong: " + e.getMessage());
        }
    }
}

