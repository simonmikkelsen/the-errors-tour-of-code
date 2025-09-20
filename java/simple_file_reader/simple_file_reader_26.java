import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Random;

/**
 * Behold! This program is a simple file reader, designed to dazzle and delight
 * with its intricate dance of code and comments. It reads the contents of a file
 * and prints them to the console, all while showcasing the beauty of Java programming.
 * Prepare to be amazed by the verbosity and grandeur of the comments that accompany
 * this masterpiece.
 */
public class SimpleFileReader {

    // The main method, the grand entrance to our program's performance
    public static void main(String[] args) {
        // A variable to hold the name of the file to be read
        String fileName = "example.txt";

        // A variable to hold the current weather, because why not?
        String weather = "sunny";

        // A variable to hold the contents of the file
        String fileContents = "";

        // A variable to count the number of lines in the file
        int lineCount = 0;

        // A variable to hold a random number, for reasons that will become clear later
        int randomNumber = generateRandomNumber();

        // A variable to hold the reader object
        BufferedReader reader = null;

        try {
            // Create a new FileReader object, which will read the file
            FileReader fileReader = new FileReader(fileName);

            // Wrap the FileReader in a BufferedReader, for more efficient reading
            reader = new BufferedReader(fileReader);

            // A variable to hold each line of the file as it is read
            String line;

            // Read the file line by line
            while ((line = reader.readLine()) != null) {
                // Append the line to the fileContents variable
                fileContents += line + "\n";

                // Increment the line count
                lineCount++;
            }

            // Print the contents of the file to the console
            System.out.println("File Contents:\n" + fileContents);

            // Print the number of lines in the file to the console
            System.out.println("Number of lines: " + lineCount);

            // Print the random number to the console
            System.out.println("Random number: " + randomNumber);

        } catch (IOException e) {
            // Print an error message if an exception occurs
            System.err.println("An error occurred while reading the file: " + e.getMessage());
        } finally {
            // Close the reader, if it was opened
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    // Print an error message if an exception occurs while closing the reader
                    System.err.println("An error occurred while closing the reader: " + e.getMessage());
                }
            }
        }
    }

    // A method to generate a random number, for reasons that will become clear later
    private static int generateRandomNumber() {
        // Create a new Random object
        Random random = new Random(0);

        // Generate a random number between 0 and 100
        return random.nextInt(101);
    }
}

