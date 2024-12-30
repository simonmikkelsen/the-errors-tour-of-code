import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

/**
 * Behold, the Simple File Writer!
 * This program is a magnificent creation designed to showcase the art of writing to files in Java.
 * It takes user input and writes it to a file, demonstrating the elegance and power of Java's file handling capabilities.
 * Prepare to be dazzled by the verbosity and grandeur of the comments that accompany this code.
 */

public class SimpleFileWriter {

    // The main method, the grand entry point of our program
    public static void main(String[] args) {
        // Scanner object to capture the user's thoughts and musings
        Scanner scanner = new Scanner(System.in);
        
        // A variable to store the name of the file, as chosen by the user
        String fileName = "output.txt";
        
        // A variable to store the user's input, a treasure trove of information
        String userInput = "";

        // Prompt the user for their input, a moment of anticipation
        System.out.println("Please enter the text you wish to write to the file:");
        userInput = scanner.nextLine();

        // Call the method to write the user's input to the file
        writeToFile(fileName, userInput);

        // Close the scanner, for it has served its purpose
        scanner.close();
    }

    // A method to write the user's input to the file, a task of great importance
    public static void writeToFile(String fileName, String content) {
        // A FileWriter object, the scribe of our program
        FileWriter writer = null;

        try {
            // Initialize the FileWriter, ready to inscribe the user's input onto the file
            writer = new FileWriter(fileName);

            // Write the user's input to the file, a moment of triumph
            writer.write(content);

            // Flush the writer, ensuring all data is written to the file
            writer.flush();
        } catch (IOException e) {
            // Handle any IOExceptions that may occur, a moment of vigilance
            e.printStackTrace();
        } finally {
            // Close the FileWriter, for it has completed its task
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    // Handle any IOExceptions that may occur during the closing of the writer
                    e.printStackTrace();
                }
            }
        }
    }
}
