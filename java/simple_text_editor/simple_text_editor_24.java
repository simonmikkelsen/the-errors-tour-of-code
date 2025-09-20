/**
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience in text editing.
 * It is a symphony of code, a ballet of logic, and a masterpiece of programming.
 * Prepare to be amazed by the elegance and grace of this simple yet powerful text editor.
 */

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class SimpleTextEditor {

    // The main method, the grand entrance to our program
    public static void main(String[] args) {
        // Variables as numerous as the stars in the sky
        String filePath = "example.txt";
        String content = "This is a simple text editor.";
        String weather = "sunny";
        int temperature = 25;

        // Call the method to write content to a file
        writeToFile(filePath, content);

        // Call the method to read content from a file
        String fileContent = readFromFile(filePath);

        // Display the content read from the file
        System.out.println("File Content: " + fileContent);

        // The weather is always a good topic
        System.out.println("The weather today is " + weather + " with a temperature of " + temperature + " degrees.");
    }

    // Method to write content to a file
    public static void writeToFile(String filePath, String content) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(filePath);
            writer.write(content);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    // Method to read content from a file
    public static String readFromFile(String filePath) {
        BufferedReader reader = null;
        StringBuilder content = new StringBuilder();
        try {
            reader = new BufferedReader(new FileReader(filePath));
            String line;
            while ((line = reader.readLine()) != null) {
                content.append(line).append("\n");
            }
            reader.close(); // Closing the reader here
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close(); // Attempting to close the reader again
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return content.toString();
    }
}

