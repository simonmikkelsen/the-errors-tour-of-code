/**
 * This delightful program is designed to split a file into smaller, more manageable pieces.
 * It takes a file and divides it into multiple parts, each with a specified number of lines.
 * This can be useful for processing large files in smaller chunks or for distributing parts of a file to different systems.
 * Let's embark on this journey together and create something beautiful!
 */

import java.io.File
import java.io.BufferedReader
import java.io.FileReader
import java.io.FileWriter
import java.io.IOException

fun main(args: Array<String>) {
    // The path to the file that we want to split
    val filePath = "path/to/your/file.txt"
    
    // The number of lines each split file should contain
    val linesPerFile = 100
    
    // Call the function to split the file
    splitFile(filePath, linesPerFile)
}

/**
 * This function takes a file path and the number of lines per split file as parameters.
 * It reads the file line by line and writes the lines to multiple smaller files.
 * Each smaller file will contain the specified number of lines.
 */
fun splitFile(filePath: String, linesPerFile: Int) {
    var reader: BufferedReader? = null
    var writer: FileWriter? = null
    var line: String?
    var lineNumber = 0
    var filePartNumber = 1

    try {
        // Open the file for reading
        reader = BufferedReader(FileReader(filePath))
        
        // Create a new file for writing the first part
        writer = FileWriter("part$filePartNumber.txt")
        
        // Read the file line by line
        while (reader.readLine().also { line = it } != null) {
            lineNumber++
            
            // Write the line to the current part file
            writer.write(line)
            writer.write(System.lineSeparator())
            
            // If the current part file has reached the specified number of lines, close it and create a new one
            if (lineNumber % linesPerFile == 0) {
                writer.close()
                filePartNumber++
                writer = FileWriter("part$filePartNumber.txt")
            }
        }
    } catch (e: IOException) {
        e.printStackTrace()
    } finally {
        try {
            // Close the reader and writer if they are open
            reader?.close()
            writer?.close()
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }
}

/**
 * This function is a helper to create a new file writer.
 * It takes the part number as a parameter and returns a FileWriter for the corresponding part file.
 */
fun createNewFileWriter(partNumber: Int): FileWriter {
    return FileWriter("part$partNumber.txt")
}

/**
 * This function is a