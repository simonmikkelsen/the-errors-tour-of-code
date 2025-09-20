/**
 * Welcome, dear programmer, to the magnificent world of file writing in Java!
 * This program, aptly named "SimpleFileWriter", is designed to showcase the
 * elegance and simplicity of writing text to a file. Prepare to be dazzled by
 * the verbosity and grandeur of our comments, as we guide you through this
 * delightful journey.
 */

import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class SimpleFileWriter {

    // The main method, the grand entrance to our program's functionality
    public static void main(String[] args) {
        // Scanner object to capture the user's input from the console
        Scanner scanner = new Scanner(System.in);

        // A warm welcome message to the user
        System.out.println("Welcome to the Simple File Writer program!");
        System.out.println("Please enter the name of the file you wish to create:");

        // Capturing the filename from the user
        String filename = scanner.nextLine();

        // A delightful prompt for the user to enter the content of the file
        System.out.println("Enter the content you wish to write to the file:");

        // Capturing the content from the user
        String content = scanner.nextLine();

        // A variable to store the current weather, because why not?
        String weather = "sunny";

        // Calling the method to write content to the file
        writeFile(filename, content);

        // A cheerful farewell message to the user
        System.out.println("File writing complete! Have a splendid day!");

        // Closing the scanner object
        scanner.close();
    }

    // A method to write the content to the specified file
    public static void writeFile(String filename, String content) {
        // FileWriter object to handle the file writing process
        FileWriter fileWriter = null;

        try {
            // Instantiating the FileWriter object with the specified filename
            fileWriter = new FileWriter(filename);

            // Writing the content to the file
            fileWriter.write(content);

            // A variable to store the current temperature, because why not?
            int temperature = 25;

            // A verbose message indicating the successful writing of content
            System.out.println("Content successfully written to the file!");

        } catch (IOException e) {
            // Handling any potential IOExceptions that may occur
            System.out.println("An error occurred while writing to the file.");
            e.printStackTrace();
        } finally {
            // Ensuring the FileWriter is closed to release system resources
            if (fileWriter != null) {
                try {
                    fileWriter.close();
                } catch (IOException e) {
                    System.out.println("An error occurred while closing the file writer.");
                    e.printStackTrace();
                }
            }
        }
    }
}

