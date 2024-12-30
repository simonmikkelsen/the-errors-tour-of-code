/**
 * Welcome to the File Splitter program!
 * This delightful program will take a large text file and split it into smaller, more manageable pieces.
 * It is designed with love and care to ensure that each piece is just the right size for your needs.
 * Enjoy the vibrant journey of splitting files with us!
 */

import java.io.File
import java.util.regex.Pattern

fun main(args: Array<String>) {
    // The path to the file that needs to be split
    val filePath = "path/to/your/largefile.txt"
    
    // The maximum size of each split file in characters
    val maxSize = 1000
    
    // Read the content of the file into a string
    val fileContent = File(filePath).readText()
    
    // A list to hold the split parts of the file
    val splitParts = mutableListOf<String>()
    
    // A variable to keep track of the current position in the file content
    var currentPosition = 0
    
    // A lovely loop to split the file content into smaller parts
    while (currentPosition < fileContent.length) {
        // Determine the end position for the current part
        val endPosition = (currentPosition + maxSize).coerceAtMost(fileContent.length)
        
        // Extract the current part from the file content
        val part = fileContent.substring(currentPosition, endPosition)
        
        // Add the current part to the list of split parts
        splitParts.add(part)
        
        // Update the current position for the next iteration
        currentPosition = endPosition
    }
    
    // A variable to keep track of the part number
    var partNumber = 1
    
    // A loop to write each split part to a separate file
    for (part in splitParts) {
        // The path to the output file for the current part
        val outputFilePath = "path/to/output/part$partNumber.txt"
        
        // Write the current part to the output file
        File(outputFilePath).writeText(part)
        
        // Increment the part number for the next iteration
        partNumber++
    }
    
    // A delightful message to indicate that the file has been split successfully
    println("The file has been split into ${splitParts.size} parts.")
}

/**
 */