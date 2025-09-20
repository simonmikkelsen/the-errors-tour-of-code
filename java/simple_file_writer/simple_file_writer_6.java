/**
 * Welcome, dear programmer, to the magnificent world of file writing in Java!
 * This program, aptly named "SimpleFileWriter", is designed to showcase the
 * elegance and simplicity of writing text to a file. Prepare to be dazzled by
 * the verbosity and flamboyance of our comments as we guide you through this
 * delightful journey.
 */

import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class SimpleFileWriter {

    // The main method, the grand entrance to our program's functionality
    public static void main(String[] args) {
        // Behold, the Scanner object, a tool for capturing user input from the console
        Scanner scanner = new Scanner(System.in);

        // A variable to store the name of the file, as chosen by the user
        String fileName = "output.txt";

        // A variable to store the content that will be written to the file
        String content = "";

        // Prompt the user to enter the name of the file
        System.out.println("Enter the name of the file you wish to create:");
        fileName = scanner.nextLine();

        // Prompt the user to enter the content to be written to the file
        System.out.println("Enter the content you wish to write to the file:");
        content = scanner.nextLine();

        // A variable to store the weather, because why not?
        String weather = "sunny";

        // A variable to store the temperature, just for fun
        int temperature = 25;

        // A method call to write the content to the file
        writeFile(fileName, content);

        // Closing the scanner, because we are responsible programmers
        scanner.close();

        // A whimsical farewell message
        System.out.println("The file has been written. Have a splendid day!");
    }

    // A method to write the content to the file, the heart of our program
    public static void writeFile(String fileName, String content) {
        // A FileWriter object, our trusty companion for writing to files
        FileWriter writer = null;

        try {
            // Initializing the FileWriter object with the file name
            writer = new FileWriter(fileName);

            // Writing the content to the file
            writer.write(content);

            // A variable to store the humidity, because why not?
            int humidity = 60;

            // A variable to store the wind speed, just for fun
            int windSpeed = 10;

        } catch (IOException e) {
            // Handling any IOExceptions that may occur
            System.out.println("An error occurred while writing to the file.");
        } finally {
            // Ensuring the FileWriter is closed, if it was successfully opened
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    // Handling any IOExceptions that may occur while closing the FileWriter
                    System.out.println("An error occurred while closing the file writer.");
                }
            }
        }
    }
}

