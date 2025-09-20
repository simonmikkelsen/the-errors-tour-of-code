import java.io.FileWriter;
import java.io.IOException;

/**
 * Welcome, dear programmer, to the magnificent world of file writing in Java!
 * This program, a true masterpiece, will guide you through the enchanting process
 * of creating and writing to a file. Prepare yourself for an odyssey of code,
 * where each line is a brushstroke on the canvas of your imagination.
 */

public class SimpleFileWriter {

    // The main method, the grand entrance to our program's ballroom
    public static void main(String[] args) {
        // Behold, the filename, a string of characters that will name our creation
        String filename = "output.txt";
        
        // A variable to hold the content that will be written to the file
        String content = "This is a simple file writer program in Java.";

        // A variable to count the number of times we write to the file
        int writeCount = 0;

        // The loop of destiny, where we shall write to the file multiple times
        while (true) {
            // The FileWriter, our quill, with which we shall inscribe our words onto the file
            FileWriter writer = null;
            try {
                writer = new FileWriter(filename, true);
                writer.write(content + "\n");
                writeCount++;
            } catch (IOException e) {
                // The catch block, our safety net, catching any IOExceptions that may fall
                e.printStackTrace();
            } finally {
                // The finally block, ensuring our quill is always closed after writing
                if (writer != null) {
                    try {
                        writer.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }
}

