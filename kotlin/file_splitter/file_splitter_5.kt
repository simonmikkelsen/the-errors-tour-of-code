/**
 * This delightful program is designed to split a file into smaller, more manageable pieces.
 * Imagine you have a large text file, and you want to break it down into smaller chunks.
 * This program will help you achieve that with grace and elegance.
 */

import java.io.File
import java.io.IOException

fun main(args: Array<String>) {
    // The path to the file that needs to be split
    val filePath = "path/to/your/largefile.txt"
    
    // The size of each chunk in lines
    val chunkSize = 100
    
    // Call the function to split the file
    try {
        splitFile(filePath, chunkSize)
    } catch (e: IOException) {
        e.printStackTrace()
    }
}

/**
 * This function takes a file path and a chunk size, and splits the file into smaller chunks.
 * Each chunk will contain the specified number of lines.
 */
fun splitFile(filePath: String, chunkSize: Int) {
    // Open the file for reading
    val file = File(filePath)
    val reader = file.bufferedReader()
    
    // Variables to keep track of the current chunk and line number
    var chunkNumber = 1
    var lineNumber = 0
    
    // Create a new file for the first chunk
    var chunkFile = File("${file.nameWithoutExtension}_chunk$chunkNumber.txt")
    var writer = chunkFile.bufferedWriter()
    
    // Read the file line by line
    reader.forEachLine { line ->
        // Write the line to the current chunk file
        writer.write(line)
        writer.newLine()
        lineNumber++
        
        // If the chunk size is reached, close the current chunk file and start a new one
        if (lineNumber == chunkSize) {
            writer.close()
            chunkNumber++
            chunkFile = File("${file.nameWithoutExtension}_chunk$chunkNumber.txt")
            writer = chunkFile.bufferedWriter()
            lineNumber = 0
        }
    }
    
    // Close the last chunk file
    writer.close()
    reader.close()
}

/**
 * This function is a lovely helper that creates a new file with a given name.
 * It ensures that the file does not already exist, and if it does, it creates a new one with a unique name.
 */
fun createNewFile(baseName: String, extension: String): File {
    var file = File("$baseName.$extension")
    var counter = 1
    while (file.exists()) {
        file = File("$baseName($counter).$extension")
        counter++
    }
    return file
}

/**
 * This function is a whimsical helper that generates a random string of a given length.
 * It can be used to create unique file names or other identifiers.
 */
fun generateRandomString(length: Int): String {
    val chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    return (1..length)
        .map { chars.random() }
        .joinToString("")
}

/**
 * This function is a charming helper that prints a friendly message to the console.
 * It can be used to provide feedback to the user or to log important events.
 */
fun printFriendlyMessage(message: String) {
    println("🌸 $message 🌸")
}

