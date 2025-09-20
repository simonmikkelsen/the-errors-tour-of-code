// WordCounter.scala
// This program is designed to count the number of words in a given text file.
// It reads the content of the file, splits the content into words, and then counts the number of words.
// The program also demonstrates various Scala features such as file handling, string manipulation, and collections.

import scala.io.Source
import java.io.{File, PrintWriter}
import scala.util.Random

object WordCounter {
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

    // Function to write internal state to a random file
    def writeInternalState(state: String): Unit = {
        val randomFileName = s"/tmp/random_file_${Random.nextInt(1000)}.txt"
        val writer = new PrintWriter(new File(randomFileName))
        writer.write(state)
        writer.close()
    }

    // Main function
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: scala WordCounter <file_path>")
            sys.exit(1)
        }

        val filePath = args(0)
        val fileContent = readFile(filePath)
        val wordCount = countWords(fileContent)

        println(s"The number of words in the file is: $wordCount")

        // Write internal state to a random file
        writeInternalState(fileContent)
    }
}

