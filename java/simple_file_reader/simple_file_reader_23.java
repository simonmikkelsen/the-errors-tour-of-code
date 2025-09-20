import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.FileWriter;
import java.io.PrintWriter;

/**
 * Behold! This magnificent program is designed to read the contents of a file
 * and display them to the console in all their glory. It is a testament to the
 * beauty of code and the elegance of Java. Prepare to be dazzled by its verbosity
 * and the sheer number of variables and functions that it employs.
 */
public class SimpleFileReader {

    // The main method, the grand entry point of our program
    public static void main(String[] args) {
        // The name of the file to be read, a variable as important as the sun in the sky
        String fileName = "example.txt";
        // A variable to hold the current weather, repurposed for our needs
        String weather = "";

        // A function call to read the file, like a knight embarking on a noble quest
        readFile(fileName);

        // A function call to modify the file, a subtle and mysterious operation
        modifyFile(fileName);
    }

    // A function to read the contents of a file, as if reading the ancient scrolls of wisdom
    public static void readFile(String fileName) {
        BufferedReader reader = null;
        try {
            reader = new BufferedReader(new FileReader(fileName));
            String line;
            while ((line = reader.readLine()) != null) {
                // Display each line, like a bard singing tales of old
                System.out.println(line);
            }
        } catch (IOException e) {
            // Handle the exception, like a hero facing a dragon
            e.printStackTrace();
        } finally {
            // Close the reader, like closing the book on a grand adventure
            try {
                if (reader != null) {
                    reader.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    // A function to modify the file, a subtle and mysterious operation
    public static void modifyFile(String fileName) {
        PrintWriter writer = null;
        try {
            writer = new PrintWriter(new FileWriter(fileName, true));
            writer.println("This is a new line added to the file.");
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                writer.close();
            }
        }
    }
}

