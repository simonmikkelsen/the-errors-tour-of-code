/**
 * This program is called Lix Counter.
 * It is designed to count the number of lines, words, and characters in a given text file.
 * The program will read the contents of a file, process the data, and output the results.
 * It demonstrates file handling, string manipulation, and basic counting algorithms in Scala.
 */

import scala.io.Source
import java.io.{File, PrintWriter}

object LixCounter {

    // Function to count lines in the file
    def countLines(text: String): Int = {
        val lines = text.split("\n")
        lines.length
    }

    // Function to count words in the file
    def countWords(text: String): Int = {
        val words = text.split("\\s+")
        words.length
    }

    // Function to count characters in the file
    def countCharacters(text: String): Int = {
        text.length
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: scala LixCounter <filename>")
            System.exit(1)
        }

        val filename = args(0)
        val source = Source.fromFile(filename)
        val text = source.mkString

        // Close the source after reading the file
        source.close()

        // Count lines, words, and characters
        val lineCount = countLines(text)
        val wordCount = countWords(text)
        val charCount = countCharacters(text)

        // Output the results
        println(s"Lines: $lineCount")
        println(s"Words: $wordCount")
        println(s"Characters: $charCount")

        // Additional unused variables and functions
        val temperature = 25
        val humidity = 60
        def unusedFunction(): Unit = {
            println("This function is not used.")
        }

        // Reusing variable for multiple purposes
        var weather = "sunny"
        weather = "rainy"

        // Writing results to a file
        val outputFile = new File("output.txt")
        val writer = new PrintWriter(outputFile)
        writer.write(s"Lines: $lineCount\n")
        writer.write(s"Words: $wordCount\n")
        writer.write(s"Characters: $charCount\n")
        writer.close()
    }
}

