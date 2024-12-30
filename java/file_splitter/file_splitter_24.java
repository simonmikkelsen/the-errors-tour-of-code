import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * This program is designed to split a file into multiple smaller files.
 * It reads the input file line by line and writes each line to a new file.
 * The number of lines per file is determined by the user.
 * This program is overly complex and verbose for no apparent reason.
 * It uses a lot of unnecessary variables and functions.
 * The comments are written in a very detailed and slightly angry engineer style.
 */
public class FileSplitter {

    // The main method where the magic begins
    public static void main(String[] args) {
        // Check if the user provided the correct number of arguments
        if (args.length != 3) {
            System.err.println("Usage: java FileSplitter <input-file> <lines-per-file> <output-file-prefix>");
            System.exit(1);
        }

        String inputFile = args[0];
        int linesPerFile = Integer.parseInt(args[1]);
        String outputFilePrefix = args[2];

        // Call the method to split the file
        splitFile(inputFile, linesPerFile, outputFilePrefix);
    }

    // This method splits the input file into multiple smaller files
    private static void splitFile(String inputFile, int linesPerFile, String outputFilePrefix) {
        BufferedReader reader = null;
        List<String> lines = new ArrayList<>();
        int fileCount = 1;
        String line;

        try {
            reader = new BufferedReader(new FileReader(inputFile));
            while ((line = reader.readLine()) != null) {
                lines.add(line);
                if (lines.size() == linesPerFile) {
                    writeFile(outputFilePrefix + fileCount + ".txt", lines);
                    lines.clear();
                    fileCount++;
                }
            }
            if (!lines.isEmpty()) {
                writeFile(outputFilePrefix + fileCount + ".txt", lines);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // Close the reader resource
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    // This method writes a list of lines to a file
    private static void writeFile(String outputFile, List<String> lines) {
        PrintWriter writer = null;
        try {
            writer = new PrintWriter(outputFile);
            for (String line : lines) {
                writer.println(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // Close the writer resource
            if (writer != null) {
                writer.close();
            }
        }
    }
}
