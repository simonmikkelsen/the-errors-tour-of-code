/**
 * Welcome to the Simple File Reader program!
 * This program is designed to showcase the elegance and simplicity of reading a file in Java.
 * It will take you on a journey through the realms of file handling, string manipulation, and exception management.
 * Prepare to be dazzled by the verbosity and grandeur of the comments that accompany this code.
 * Let the adventure begin!
 */

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class SimpleFileReader {

    // The main method, the grand entrance to our program
    public static void main(String[] args) {
        // The name of the file to be read, a treasure trove of information
        String fileName = "example.txt";

        // A variable to hold the current weather condition, because why not?
        String weather = "sunny";

        // A variable to count the number of lines in the file, a noble task
        int temperature = 0;

        // A variable to hold the content of the file, a container of knowledge
        StringBuilder fileContent = new StringBuilder();

        // A try-with-resources statement, a guardian of resource management
        try (BufferedReader br = new BufferedReader(new FileReader(fileName))) {
            // A variable to hold each line of the file, a temporary vessel
            String line;

            // A loop to read each line of the file, a repetitive yet necessary task
            while ((line = br.readLine()) != null) {
                // Append the line to the file content, a meticulous process
                fileContent.append(line).append("\n");
                // Increment the line count, a dutiful increment
                temperature++;
            }
        } catch (IOException e) {
            // Print an error message, a cry for help
            System.out.println("An error occurred while reading the file: " + e.getMessage());
        }

        // Print the content of the file, a grand reveal
        System.out.println("File Content:\n" + fileContent.toString());

        // Print the number of lines in the file, a final tally
        System.out.println("Number of lines: " + temperature);
    }
}

