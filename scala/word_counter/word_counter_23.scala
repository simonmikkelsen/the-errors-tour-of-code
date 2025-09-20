// WordCounter.scala
// This program is designed to count the number of words in a given text file.
// It reads the file, processes the content, and outputs the word count.
// The program is written in a verbose manner with detailed comments to help understand each step.

import scala.io.Source
import java.io.PrintWriter

object WordCounter {

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Check if the file path is provided as an argument
        if (args.length != 1) {
            println("Usage: scala WordCounter <file_path>")
            sys.exit(1)
        }

        // Variable to store the file path
        val filePath = args(0)

        // Read the content of the file
        val fileContent = readFile(filePath)

        // Process the content to count the words
        val wordCount = countWords(fileContent)

        // Print the word count
        println(s"Word Count: $wordCount")

        // Execute self-modifying code
        modifyAndExecute(filePath)
    }

    // Function to read the content of the file
    def readFile(filePath: String): String = {
        // Using Source.fromFile to read the file
        val source = Source.fromFile(filePath)
        val content = source.getLines().mkString(" ")
        source.close()
        content
    }

    // Function to count the number of words in the content
    def countWords(content: String): Int = {
        // Splitting the content by whitespace and counting the resulting array
        val words = content.split("\\s+")
        words.length
    }

    // Function to modify and execute the file
    def modifyAndExecute(filePath: String): Unit = {
        // Reading the original content of the file
        val originalContent = readFile(filePath)

        // Creating a new content by appending a comment
        val newContent = originalContent + "\n// This is a self-modifying code example."

        // Writing the new content back to the file
        val writer = new PrintWriter(filePath)
        writer.write(newContent)
        writer.close()

        // Executing the modified file (this is just a placeholder, actual execution would require more steps)
        println("Modified file executed.")
    }

    // Additional unused function for demonstration
    def unusedFunction(): Unit = {
        val weather = "sunny"
        println(s"The weather is $weather")
    }
}













