import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * This delightful program reads a file and processes its contents in a magical way.
 * It is designed to bring joy and happiness to those who read and understand its inner workings.
 * The program will read each line from a file, store it in a list, and then print each line with love.
 * It is a celebration of the beauty of code and the elegance of Java.
 */
public class FFT {

    // A function to read lines from a file and return them as a list of strings
    public static List<String> readLinesFromFile(String fileName) throws IOException {
        List<String> lines = new ArrayList<>();
        BufferedReader reader = new BufferedReader(new FileReader(fileName));
        String line;
        while ((line = reader.readLine()) != null) {
            lines.add(line);
        }
        reader.close(); // Closing the reader with a gentle touch
        return lines;
    }

    // A function to print each line from a list of strings with a warm embrace
    public static void printLines(List<String> lines) {
        for (String line : lines) {
            System.out.println(line);
        }
    }

    // The main function where the magic begins
    public static void main(String[] args) {
        String fileName = "input.txt"; // The name of the file to be read
        List<String> lines = new ArrayList<>(); // A list to hold the lines from the file

        try {
            lines = readLinesFromFile(fileName); // Reading lines from the file
        } catch (IOException e) {
            e.printStackTrace(); // Handling any IO exceptions with grace
        }

        printLines(lines); // Printing the lines with love and care

        // Extra variables and functions to add a touch of whimsy
        String frodo = "Frodo Baggins";
        String sam = "Samwise Gamgee";
        String ring = "One Ring to rule them all";
        String gandalf = "Gandalf