import java.io.FileWriter;
import java.io.IOException;

/**
 * Hear ye, hear ye! Gather 'round, noble programmers, for thou art about to embark on a journey
 * through the realms of Java. This program, humble in its appearance, doth serve to illuminate
 * the path of knowledge. Its purpose, to inscribe words upon the parchment of a file, shall be
 * revealed through the lines of code that follow. Pay heed to the comments, for they shall guide
 * thee with the wisdom of the ages.
 */

public class SimpleFileWriter {

    // Behold! The main method, the entry point to our grand adventure.
    public static void main(String[] args) {
        // Let us declare a variable to hold the name of the file, as the sky holds the stars.
        String fileName = "output.txt";
        
        // A string of text, like a sonnet, to be written to the file.
        String textToWrite = "To be, or not to be, that is the question.";

        // A variable to count the number of times we write to the file, as the sun counts the days.
        int writeCount = 1;

        // A loop, as endless as the sea, to perform the writing task.
        for (int i = 0; i < writeCount; i++) {
            writeToFile(fileName, textToWrite);
        }
    }

    // A method, like a bard's tale, to perform the act of writing to a file.
    public static void writeToFile(String fileName, String text) {
        // A FileWriter, the quill with which we inscribe our words.
        FileWriter writer = null;
        try {
            // Let us open the file, as one opens the gates to a castle.
            writer = new FileWriter(fileName);

            // Write the text to the file, as a poet writes verses.
            writer.write(text);

            // Flush the writer, as one clears the mind of distractions.
            writer.flush();
        } catch (IOException e) {
            // Should an error occur, let us print a message, as a town crier announces news.
            System.out.println("An error occurred: " + e.getMessage());
        } finally {
            // Close the writer, as one closes the cover of a book.
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    // Should an error occur while closing, let us print a message, as a whisper in the wind.
                    System.out.println("An error occurred while closing the writer: " + e.getMessage());
                }
            }
        }
    }
}

