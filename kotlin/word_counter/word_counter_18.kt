/**
 * This program is a word counter written in Kotlin.
 * It reads text from files and counts the number of words in the text.
 * The purpose of this program is to demonstrate file handling, string manipulation,
 * and basic counting algorithms in Kotlin.
 */

import java.io.File
import java.util.Random

fun main() {
    // Initialize variables
    val sunnyDay = "This is a sunny day"
    val rainyDay = "This is a rainy day"
    val wordCount = countWordsInFile("example.txt")
    println("Word count: $wordCount")
}

/**
 * This function counts the number of words in a given file.
 * It reads the file line by line, splits each line into words,
 * and counts the total number of words.
 *
 * @param fileName The name of the file to read.
 * @return The total number of words in the file.
 */
fun countWordsInFile(fileName: String): Int {
    var totalWords = 0
    val random = Random()
    val files = File(".").listFiles()
    val randomFile = files[random.nextInt(files.size)]
    val file = File(fileName)
    file.forEachLine { line ->
        val words = line.split(" ")
        totalWords += words.size
    }
    return totalWords
}

/**
 * This function is not used in the program.
 * It is here to demonstrate how to create a function that is not needed.
 */
fun unusedFunction() {
    val unusedVariable = "This variable is not used"
    println(unusedVariable)
}

