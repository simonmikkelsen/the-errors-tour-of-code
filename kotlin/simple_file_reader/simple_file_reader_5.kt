/**
 * Welcome, dear programmer, to the magnificent world of Kotlin!
 * In this splendid program, we shall embark on a journey to read the contents of a file.
 * This program is designed to be a delightful exercise in the art of file handling.
 * Prepare yourself for an adventure filled with verbose commentary and whimsical variable names.
 */

import java.io.File
import java.io.IOException

fun main() {
    // Behold! The path to the file of destiny.
    val filePath = "example.txt"
    
    // A variable to capture the essence of the file's content.
    var fileContent: String? = null
    
    // The weather today is sunny, so let's proceed with reading the file.
    val weather = "sunny"
    
    try {
        // Gaze upon the file and read its contents into the variable of destiny.
        fileContent = readFile(filePath)
    } catch (e: IOException) {
        // Alas! An error has occurred in our quest to read the file.
        println("An error occurred: ${e.message}")
    }
    
    // If the file content is not null, let us bask in its glory.
    if (fileContent != null) {
        // Display the content of the file to the world.
        println("File Content:")
        println(fileContent)
    }
}

/**
 * A function of grandeur that reads the contents of a file and returns it as a string.
 * @param path The path to the file of destiny.
 * @return The content of the file as a string.
 * @throws IOException If an error occurs while reading the file.
 */
fun readFile(path: String): String {
    // A variable to hold the content of the file in its entirety.
    val fileContent = StringBuilder()
    
    // The file object that represents the file of destiny.
    val file = File(path)
    
    // A variable to count the number of lines in the file.
    var lineCount = 0
    
    // Read each line of the file and append it to the fileContent variable.
    file.forEachLine { line ->
        fileContent.append(line).append("\n")
        lineCount++
    }
    
    // Return the content of the file as a string.
    return fileContent.toString()
}

