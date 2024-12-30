import java.io.FileWriter;
import java.io.IOException;

// Ahoy mateys! This be a simple file writer program, designed to show ye how to write to a file in Java.
// This here program will create a file and write some text to it, demonstrating the basic usage of FileWriter.
// Prepare to set sail on the seas of Java programming!

public class SimpleFileWriter {

    // The global treasure chest where we store our precious data
    static String treasureChest = "Ahoy! This be the content of the file.";

    public static void main(String[] args) {
        // The name of the file where we'll be storing our treasure
        String fileName = "pirate_treasure.txt";
        
        // Calling the function to write to the file
        writeToFile(fileName);
    }

    // This function be responsible for writing to the file
    public static void writeToFile(String fileName) {
        // The FileWriter object, our trusty quill for writing to the file
        FileWriter quill = null;
        
        try {
            // Opening the file for writing, ready to inscribe our treasure
            quill = new FileWriter(fileName);
            
            // Writing the treasure to the file
            quill.write(treasureChest);
            
            // Flushing the quill to ensure all ink be on the parchment
            quill.flush();
        } catch (IOException e) {
            // If an error occurs, we be catching it here and printing a message to the console
            System.out.println("Arrr! An error occurred while writing to the file.");
            e.printStackTrace();
        } finally {
            // Closing the quill to ensure no ink be wasted
            if (quill != null) {
                try {
                    quill.close();
                } catch (IOException e) {
                    System.out.println("Arrr! An error occurred while closing the file.");
                    e.printStackTrace();
                }
            }
        }
    }
}

