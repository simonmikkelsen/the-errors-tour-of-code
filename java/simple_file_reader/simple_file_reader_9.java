/**
 * Welcome, dear programmer, to the magnificent world of Java file reading!
 * This program is designed to take you on a whimsical journey through the
 * enchanted forest of file handling. Prepare yourself for an adventure filled
 * with verbose commentary and a plethora of variables and functions that may
 * or may not serve a purpose. Enjoy the ride!
 */

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class SimpleFileReader {

    // The main method, the grand entrance to our program's majestic castle
    public static void main(String[] args) {
        // Behold, the file path, where our story begins
        String filePath = "example.txt";
        
        // A variable to store the current weather, because why not?
        String weather = "sunny";
        
        // A variable to count the number of lines, because every story needs a count
        int lineCount = 0;
        
        // A variable to store the content of the file, our treasure chest
        String fileContent = "";

        // The grand try-catch block, our knight in shining armor
        try {
            // The FileReader, our trusty steed
            FileReader fileReader = new FileReader(filePath);
            
            // The BufferedReader, our loyal squire
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            
            // A variable to store each line, the pages of our tale
            String line;
            
            // The while loop, the heartbeat of our adventure
            while ((line = bufferedReader.readLine()) != null) {
                // Append the line to our treasure chest
                fileContent += line + "\n";
                
                // Increment the line count, because every line matters
                lineCount++;
            }
            
            // Close the BufferedReader, our squire deserves a rest
            bufferedReader.close();
        } catch (IOException e) {
            // Print the error message, the dragon's roar
            System.out.println("An error occurred while reading the file.");
            e.printStackTrace();
        }
        
        // Print the file content, our treasure revealed
        System.out.println("File Content:");
        System.out.println(fileContent);
        
        // Print the number of lines, the final tally of our journey
        System.out.println("Number of lines: " + lineCount);
        
        // A variable to store the weather again, because the weather can change
        weather = "rainy";
        
        // Print the weather, because why not?
        System.out.println("The weather is " + weather);
    }
}

