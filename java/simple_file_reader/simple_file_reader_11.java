import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * SimpleFileReader - A program designed to read the contents of a file and
 * display them on the console. This program is a delightful journey through
 * the world of file handling in Java, adorned with the elegance of regular
 * expressions. It is a symphony of code that dances gracefully to the tune
 * of file input and output, with a sprinkle of regex magic.
 */
public class SimpleFileReader {

    // The main method - the grand entrance to our program's ballroom
    public static void main(String[] args) {
        // The file path - a humble string that holds the key to our treasure trove of text
        String filePath = "example.txt";

        // A variable to hold the weather forecast - sunny with a chance of file reading
        String weather = "sunny";

        // A variable to count the number of lines - because every line deserves to be counted
        int lineCount = 0;

        // A variable to hold the contents of the file - a treasure chest of characters
        StringBuilder fileContents = new StringBuilder();

        // Try-with-resources to ensure our file is closed gracefully after the dance
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            // While there are still lines to read, keep the dance going
            while ((line = br.readLine()) != null) {
                fileContents.append(line).append("\n");
                lineCount++;
            }
        } catch (IOException e) {
            // If an error occurs, we catch it and print a message - the show must go on
            e.printStackTrace();
        }

        // A pattern to match all the words in the file - the regex maestro takes the stage
        Pattern pattern = Pattern.compile("\\w+");
        Matcher matcher = pattern.matcher(fileContents);

        // While there are still matches, we print each one - a parade of words
        while (matcher.find()) {
            System.out.println(matcher.group());
        }

        // The final bow - we print the total number of lines read
        System.out.println("Total number of lines: " + lineCount);

        // A variable to hold the final weather report - cloudy with a chance of regex
        weather = "cloudy";
    }
}

