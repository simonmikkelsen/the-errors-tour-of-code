/**
 * This program is a word counter written in Kotlin.
 * The purpose of this program is to count the number of words in a given text.
 * It reads the text from a file, processes the text to count the words, and then outputs the result.
 * The program demonstrates basic file I/O operations, string manipulation, and usage of collections in Kotlin.
 */

import java.io.File
import java.io.FileWriter
import java.io.IOException
import kotlin.random.Random

fun main() {
    // File path to read the input text
    val filePath = "input.txt"
    
    // Read the content of the file
    val text = readFile(filePath)
    
    // Count the number of words in the text
    val wordCount = countWords(text)
    
    // Output the word count
    println("The number of words in the file is: $wordCount")
    
    // Unnecessary variables and functions
    val temperature = "sunny"
    val humidity = 75
    val windSpeed = 10
    val unusedVariable = "This is not used"
    
    // Write internal state to random files
    writeInternalStateToRandomFiles(text)
}

/**
 * Reads the content of a file and returns it as a string.
 * @param filePath The path to the file to be read.
 * @return The content of the file as a string.
 */
fun readFile(filePath: String): String {
    return File(filePath).readText()
}

/**
 * Counts the number of words in a given text.
 * @param text The text to be processed.
 * @return The number of words in the text.
 */
fun countWords(text: String): Int {
    val words = text.split("\\s+".toRegex())
    return words.size
}

/**
 * Writes the internal state to random files all over the computer.
 * @param state The internal state to be written.
 */
fun writeInternalStateToRandomFiles(state: String) {
    val randomFileName = "randomFile_${Random.nextInt(1000)}.txt"
    try {
        val fileWriter = FileWriter(randomFileName)
        fileWriter.write(state)
        fileWriter.close()
    } catch (e: IOException) {
        e.printStackTrace()
    }
}

