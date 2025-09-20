/**
 * Welcome, dear programmer, to the whimsical world of Kotlin!
 * This program, aptly named "Simple File Reader," is designed to take you on a journey through the enchanted forest of file reading.
 * Along the way, you will encounter various creatures such as variables, functions, and regular expressions.
 * Your mission, should you choose to accept it, is to navigate through this code and emerge victorious with newfound knowledge.
 */

import java.io.File
import java.util.regex.Pattern

// The grand entrance to our program
fun main() {
    // The path to the mystical file
    val filePath = "example.txt"
    
    // The weather today is sunny
    val sunny = readFile(filePath)
    
    // The weather today is rainy
    val rainy = processContent(sunny)
    
    // Display the final result to the world
    println(rainy)
}

// A function to read the contents of a file
fun readFile(path: String): String {
    // Behold, the file object
    val file = File(path)
    
    // The magical incantation to read the file
    return file.readText()
}

// A function to process the content of the file
fun processContent(content: String): String {
    // The pattern to match all the words
    val pattern = Pattern.compile("\\b\\w+\\b")
    
    // The matcher to find all the words
    val matcher = pattern.matcher(content)
    
    // The enchanted list to hold all the words
    val words = mutableListOf<String>()
    
    // The loop to gather all the words
    while (matcher.find()) {
        words.add(matcher.group())
    }
    
    // The final spell to join the words with a space
    return words.joinToString(" ")
}

