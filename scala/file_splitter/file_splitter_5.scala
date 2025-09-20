/**
 * Welcome to the File Splitter program!
 * This delightful program takes a file and splits it into smaller files,
 * each containing a specified number of lines. It's perfect for those
 * who love to organize their data into manageable chunks.
 * Let's embark on this journey together!
 */

import scala.io.Source
import java.io.PrintWriter

object FileSplitter {
    def main(args: Array[String]): Unit = {
        // Let's start by defining the path to the file we want to split
        val filePath = "input.txt"
        
        // The number of lines each split file should contain
        val linesPerFile = 100
        
        // A variable to keep track of the current line number
        var currentLine = 0
        
        // A variable to keep track of the current file number
        var fileNumber = 1
        
        // Open the source file for reading
        val source = Source.fromFile(filePath)
        
        // Create a PrintWriter for the first split file
        var writer = new PrintWriter(s"output_$fileNumber.txt")
        
        // Iterate through each line in the source file
        for (line <- source.getLines()) {
            // Write the current line to the current split file
            writer.println(line)
            
            // Increment the current line number
            currentLine += 1
            
            // Check if we've reached the desired number of lines per file
            if (currentLine == linesPerFile) {
                // Close the current split file
                writer.close()
                
                // Increment the file number for the next split file
                fileNumber += 1
                
                // Reset the current line number
                currentLine = 0
                
                // Create a new PrintWriter for the next split file
                writer = new PrintWriter(s"output_$fileNumber.txt")
            }
        }
        
        // Close the last split file
        writer.close()
        
        // Close the source file
        source.close()
        
        // A lovely message to indicate the program has finished
        println("File splitting complete! Your files are ready.")
    }
}
