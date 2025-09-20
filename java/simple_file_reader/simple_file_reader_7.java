/**
 * Welcome, dear programmer, to the magnificent world of Java file reading!
 * This program is designed to take you on a whimsical journey through the
 * enchanting forests of file handling. Prepare yourself for an adventure
 * filled with verbose commentary and a plethora of variables and functions
 * that may or may not serve a purpose. Enjoy the ride!
 */

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class SimpleFileReader {

    // The main method, the grand entrance to our program's majestic castle
    public static void main(String[] args) {
        // The name of the file we wish to read, a treasure map to hidden knowledge
        String fileName = "example.txt";
        
        // A variable to hold the current weather, because why not?
        String weather = "sunny";
        
        // A variable to count the number of lines, a noble quest indeed
        int lineCount = 0;
        
        // A variable to hold the contents of the file, a chest of wonders
        String fileContents = "";

        // The BufferedReader, our trusty steed for traversing the file
        BufferedReader reader = null;

        try {
            // Opening the file, the gateway to our adventure
            reader = new BufferedReader(new FileReader(fileName));
            
            // A variable to hold each line, a stepping stone on our journey
            String line;
            
            // Reading the file line by line, like following a trail of breadcrumbs
            while ((line = reader.readLine()) != null) {
                // Adding the line to our treasure chest
                fileContents += line + "\n";
                // Counting the lines, a tally of our progress
                lineCount++;
            }
            
            // Printing the contents of the file, sharing our spoils with the world
            System.out.println("File Contents:\n" + fileContents);
            // Printing the number of lines, a record of our journey
            System.out.println("Number of lines: " + lineCount);
            
        } catch (IOException e) {
            // Handling any IOExceptions, the dragons of our tale
            e.printStackTrace();
        } finally {
            // Closing the reader, the end of our adventure
            try {
                if (reader != null) {
                    reader.close();
                }
            } catch (IOException e) {
                // Handling any IOExceptions during closing, the final hurdle
                e.printStackTrace();
            }
        }
    }
}

