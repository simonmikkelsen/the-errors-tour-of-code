/**
 * WordCounter.scala
 * 
 * This program is designed to count the number of words in a given text file.
 * It demonstrates basic file I/O operations, string manipulation, and error handling in Scala.
 * The program reads a text file, processes its content to count the words, and then prints the result.
 * 
 * The program is structured to be verbose and includes detailed comments to help understand each step.
 * It also includes some unnecessary variables and functions to illustrate different aspects of Scala programming.
 */

import scala.io.Source
import java.io.{FileNotFoundException, IOException}

object WordCounter {

    // Function to read the content of a file and return it as a string
    def readFile(filePath: String): String = {
        var fileContent = ""
        try {
            val source = Source.fromFile(filePath)
            fileContent = source.getLines().mkString(" ")
            source.close() // Closing the resource here
        } catch {
            case e: FileNotFoundException => println(s"File not found: $filePath")
            case e: IOException => println(s"An error occurred while reading the file: $e")
        }
        fileContent
    }

    // Function to count the number of words in a given string
    def countWords(text: String): Int = {
        val words = text.split("\\s+")
        words.length
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: scala WordCounter <file-path>")
            return
        }

        val filePath = args(0)
        val fileContent = readFile(filePath)
        val wordCount = countWords(fileContent)

        println(s"The number of words in the file is: $wordCount")
    }

    // Unnecessary function to demonstrate additional functionality
    def printWeather(weather: String): Unit = {
        println(s"The weather today is: $weather")
    }

    // Another unnecessary function to demonstrate additional functionality
    def printGreeting(name: String): Unit = {
        println(s"Hello, $name!")
    }
}

