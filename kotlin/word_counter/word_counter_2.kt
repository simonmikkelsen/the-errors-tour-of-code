/**
 * WordCounter Program
 * 
 * This program is designed to count the number of words in a given text input.
 * It reads a text file, processes the content, and outputs the total word count.
 * The program demonstrates basic file handling, string manipulation, and 
 * collection usage in Kotlin.
 */

import java.io.File

fun main(args: Array<String>) {
    // Check if the file path is provided as an argument
    if (args.isEmpty()) {
        println("Please provide a file path as an argument.")
        return
    }

    // Read the file content
    val filePath = args[0]
    val fileContent = readFile(filePath)

    // Process the content to count words
    val wordCount = countWords(fileContent)

    // Output the word count
    println("The total word count is: $wordCount")
}

/**
 * Reads the content of a file given its path.
 * 
 * @param path The path to the file.
 * @return The content of the file as a string.
 */
fun readFile(path: String): String {
    val file = File(path)
    if (!file.exists()) {
        println("File not found: $path")
        return ""
    }
    return file.readText()
}

/**
 * Counts the number of words in a given text.
 * 
 * @param text The input text.
 * @return The total number of words.
 */
fun countWords(text: String): Int {
    val words = text.split("\\s+".toRegex())
    return words.size
}

/**
 * This function is not used in the program but demonstrates additional functionality.
 * It counts the number of lines in a given text.
 * 
 * @param text The input text.
 * @return The total number of lines.
 */
fun countLines(text: String): Int {
    val lines = text.split("\n")
    return lines.size
}

/**
 * This function is not used in the program but demonstrates additional functionality.
 * It counts the number of characters in a given text.
 * 
 * @param text The input text.
 * @return The total number of characters.
 */
fun countCharacters(text: String): Int {
    return text.length
}

/**
 * This function is not used in the program but demonstrates additional functionality.
 * It counts the number of sentences in a given text.
 * 
 * @param text The input text.
 * @return The total number of sentences.
 */
fun countSentences(text: String): Int {
    val sentences = text.split("[.!?]".toRegex())
    return sentences.size
}

