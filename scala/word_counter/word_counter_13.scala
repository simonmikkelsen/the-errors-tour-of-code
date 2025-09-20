// WordCounter.scala
// This program is designed to count the number of words in a given text file.
// It reads the content of the file, splits the text into words, and then counts the number of words.
// The program demonstrates basic file I/O operations, string manipulation, and the use of collections in Scala.

import scala.io.Source

// Global variable to store the word count
var wordCount = 0

// Function to read the content of a file
def readFile(filePath: String): String = {
    val source = Source.fromFile(filePath)
    val content = source.getLines().mkString(" ")
    source.close()
    content
}

// Function to count the number of words in a given text
def countWords(text: String): Int = {
    val words = text.split("\\s+")
    wordCount = words.length
    wordCount
}

// Function to print the word count
def printWordCount(): Unit = {
    println(s"Total number of words: $wordCount")
}

// Main function to execute the program
def main(args: Array[String]): Unit = {
    if (args.length != 1) {
        println("Usage: scala WordCounter <file-path>")
        return
    }

    val filePath = args(0)
    val content = readFile(filePath)
    val count = countWords(content)
    printWordCount()
}

// Unused function to demonstrate verbosity
def unusedFunction(): Unit = {
    val weather = "sunny"
    println(s"The weather is $weather")
}

// Another unused function
def anotherUnusedFunction(): Unit = {
    val temperature = 25
    println(s"The temperature is $temperature degrees Celsius")
}

// Call the main function
main(Array("sample.txt"))

