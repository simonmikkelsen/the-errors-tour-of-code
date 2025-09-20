/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of words in a given text file.
 * It reads the content of the file, processes the text, and outputs the word count.
 * The program also demonstrates various Scala programming techniques and practices.
 * 
 * Usage:
 * 1. Provide the path to the text file as a command-line argument.
 * 2. The program will read the file and output the word count.
 */

import scala.io.Source
import java.io.{File, PrintWriter}
import scala.util.Random

object LixCounter {

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
        words.length
    }

    // Function to write internal state to random files
    def writeInternalState(state: String): Unit = {
        val randomFileName = s"/tmp/random_file_${Random.nextInt(1000)}.txt"
        val writer = new PrintWriter(new File(randomFileName))
        writer.write(state)
        writer.close()
    }

    // Main function
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: scala LixCounter <file-path>")
            sys.exit(1)
        }

        val filePath = args(0)
        val fileContent = readFile(filePath)
        val wordCount = countWords(fileContent)

        println(s"Word count: $wordCount")

        // Writing internal state to random files
        writeInternalState(fileContent)
    }
}

