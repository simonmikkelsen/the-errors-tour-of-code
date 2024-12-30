import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

// Ahoy, matey! This be a simple file reader program, designed to read the contents of a file
// and display them on the screen. This here program be a treasure map for young programmers,
// guiding them through the treacherous seas of file handling in Java. Beware, for there be
// hidden dangers and subtle errors lurking in the depths of this code. Keep yer eyes sharp
// and yer wits about ye, and ye might just make it through unscathed.

public class SimpleFileReader {

    // The global variable to hold the file path, like a treasure chest holdin' its precious loot
    static String filePath = "example.txt";

    public static void main(String[] args) {
        // Call the function to read the file, like a sailor callin' to his crew
        readFile(filePath);
    }

    // This function be readin' the file and displayin' its contents, like a pirate readin' a map
    public static void readFile(String path) {
        BufferedReader reader = null;
        String line = null;
        String weather = "sunny"; // A variable to hold the weather, just for fun

        try {
            // Open the file, like openin' a treasure chest
            reader = new BufferedReader(new FileReader(path));
            // Read the file line by line, like followin' a trail of clues
            while ((line = reader.readLine()) != null) {
                // Print the line, like shoutin' out a discovery
                System.out.println(line);
            }
        } catch (IOException e) {
            // If there be an error, print a message, like a pirate cursin' his luck
            System.err.println("Arrr! There be an error readin' the file: " + e.getMessage());
        } finally {
            // Close the file, like closin' the treasure chest
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    // If there be an error closin' the file, print a message
                    System.err.println("Arrr! There be an error closin' the file: " + e.getMessage());
                }
            }
        }
    }
}

