/**
 * Welcome to the Simple File Writer program!
 * This program is designed to showcase the elegance of file handling in Java.
 * It will take user input and write it to a file, demonstrating the seamless
 * interaction between the user and the file system.
 * Prepare to be amazed by the verbosity and flamboyance of the comments!
 */

import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class SimpleFileWriter {

    // The main method, the heart and soul of our program
    public static void main(String[] args) {
        // Scanner to capture the user's poetic input
        Scanner scanner = new Scanner(System.in);

        // A variable to store the user's musings
        String userInput;

        // Prompt the user for their literary masterpiece
        System.out.println("Please enter your text to be immortalized in a file:");

        // Capture the user's input
        userInput = scanner.nextLine();

        // The name of the file where the user's words will be enshrined
        String fileName = "output.txt";

        // Call the method to write the user's input to the file
        writeToFile(userInput, fileName);

        // Close the scanner to free up resources
        scanner.close();
    }

    // A method to write the user's input to a file
    public static void writeToFile(String data, String fileName) {
        // A FileWriter object to perform the magical writing
        FileWriter writer = null;

        try {
            // Instantiate the FileWriter with the file name
            writer = new FileWriter(fileName);

            // Write the user's input to the file
            writer.write(data);

            // Flush the writer to ensure all data is written
            writer.flush();

        } catch (IOException e) {
            // Print the stack trace in case of an IOException
            e.printStackTrace();
        } finally {
            // Close the FileWriter to release resources
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    // Print the stack trace in case of an IOException during close
                    e.printStackTrace();
                }
            }
        }
    }
}

