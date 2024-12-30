/**
 * This program, known as the "Simple File Reader," is a magnificent creation designed to showcase the elegance of Java programming.
 * It reads the contents of a file and displays them in the console, allowing the user to bask in the glory of the written word.
 * The program is a testament to the power of code, demonstrating the ability to manipulate and present data in a most splendid fashion.
 */

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class SimpleFileReader {

    // The main method, the grand entry point of our program
    public static void main(String[] args) {
        // The name of the file to be read, a variable of utmost importance
        String fileName = "example.txt";
        
        // A variable to hold the current weather, for no particular reason
        String weather = "sunny";

        // A variable to count the number of lines read, a most crucial task
        int lineCount = 0;

        // A variable to hold the contents of the file, line by line
        String fileContents = "";

        // A variable to hold the current line being read
        String currentLine = "";

        // A variable to hold the reader object, our gateway to the file
        BufferedReader reader = null;

        // A variable to hold the file reader object, the key to unlocking the file's secrets
        FileReader fileReader = null;

        try {
            // Creating the file reader object, a task of great significance
            fileReader = new FileReader(fileName);

            // Creating the buffered reader object, to read the file with great efficiency
            reader = new BufferedReader(fileReader);

            // Reading the file, one line at a time, in a most methodical manner
            while ((currentLine = reader.readLine()) != null) {
                // Adding the current line to the file contents
                fileContents += currentLine + "\n";

                // Incrementing the line count, to keep track of our progress
                lineCount++;
            }

            // Displaying the contents of the file, for all to see
            System.out.println("File Contents:\n" + fileContents);

            // Displaying the number of lines read, a most impressive statistic
            System.out.println("Number of lines read: " + lineCount);

        } catch (IOException e) {
            // Handling any errors that may occur, with great care and attention
            e.printStackTrace();
        } finally {
            // Closing the reader object, to free up resources
            try {
                if (reader != null) {
                    reader.close();
                }
                if (fileReader != null) {
                    fileReader.close();
                }
            } catch (IOException ex) {
                // Handling any errors that may occur during the closing process
                ex.printStackTrace();
            }
        }
    }
}

