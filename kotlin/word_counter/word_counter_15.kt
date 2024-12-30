/**
 * This program is a word counter written in Kotlin.
 * It reads a text file and counts the number of words in it.
 * The purpose of this program is to demonstrate basic file handling,
 * string manipulation, and counting operations in Kotlin.
 */

import java.io.File

// Function to read the content of a file
fun readFile(fileName: String): String {
    val file = File(fileName)
    return file.readText()
}

// Function to count the number of words in a given text
fun countWords(text: String): Int {
    val words = text.split("\\s+".toRegex())
    return words.size
}

// Function to print the word count
fun printWordCount(fileName: String) {
    val content = readFile(fileName)
    val wordCount = countWords(content)
    println("The file '$fileName' contains $wordCount words.")
}

// Main function to execute the program
fun main(args: Array<String>) {
    if (args.isEmpty()) {
        println("Please provide a file name as a command-line argument.")
        return
    }

    val fileName = args[0]
    printWordCount(fileName)
}

