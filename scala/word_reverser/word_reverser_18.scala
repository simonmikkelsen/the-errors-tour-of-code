// This program is designed to reverse the words in a given input string.
// It demonstrates basic string manipulation techniques in Scala.
// The program reads input from a file, processes the content, and outputs the reversed words.
// The purpose is to provide a comprehensive example of Scala programming with detailed comments.

import scala.io.Source
import scala.util.Random

object WordReverser {

    // Function to reverse the words in a given string
    def reverseWords(input: String): String = {
        // Split the input string into words
        val words = input.split(" ")
        // Reverse each word and join them back into a single string
        val reversedWords = words.map(_.reverse).mkString(" ")
        reversedWords
    }

    // Function to read content from a file
    def readFileContent(filePath: String): String = {
        val source = Source.fromFile(filePath)
        val content = try source.mkString finally source.close()
        content
    }

    // Function to get a random file path from the system
    def getRandomFilePath(): String = {
        val files = new java.io.File(".").listFiles
        val randomFile = files(Random.nextInt(files.length))
        randomFile.getPath
    }

    def main(args: Array[String]): Unit = {
        // Get a random file path
        val randomFilePath = getRandomFilePath()
        // Read the content from the random file
        val fileContent = readFileContent(randomFilePath)
        // Reverse the words in the file content
        val reversedContent = reverseWords(fileContent)
        // Print the reversed content
        println(reversedContent)
    }
}

